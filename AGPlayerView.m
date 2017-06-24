//
//  AGPlayerView.m
//  AGPlayer
//
//  Created by 吴书敏 on 16/7/14.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGPlayerView.h"
#import "NSString+time.h"
#import "RotationScreen.h"
#import "Masonry.h"

#define RGBColor(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]

@interface AGPlayerView () {
    BOOL _isIntoBackground; // 是否在后台
    BOOL _isShowToolbar; // 是否显示工具条
    BOOL _isSliding; // 是否正在滑动
    AVPlayerItem *_playerItem;
    AVPlayerLayer *_playerLayer;
    NSTimer *_timer;
    id _playTimeObserver; // 观察者
}

@property(strong, nonatomic) IBOutlet UIView *mainView;
@property(strong, nonatomic) IBOutlet UIView *playerView;

@property(strong, nonatomic) IBOutlet UIView *downView;
@property(strong, nonatomic) IBOutlet UILabel *beginLabel;
@property(strong, nonatomic) IBOutlet UILabel *endLabel;
@property(strong, nonatomic) IBOutlet UISlider *playProgress;
@property(strong, nonatomic) IBOutlet UIProgressView *loadedProgress; // 缓冲进度条
@property(strong, nonatomic) IBOutlet UIButton *rotationButton;

@property(strong, nonatomic) IBOutlet UIButton *playerFullScreenButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end

@implementation AGPlayerView
- (void)dealloc {
    [self removeObserveAndNOtification];
    [_player removeTimeObserver:_playTimeObserver]; // 移除playTimeObserver
}

- (void)removeObserveAndNOtification {
    [_player replaceCurrentItemWithPlayerItem:nil];
    [_playerItem removeObserver:self forKeyPath:@"status"];
    [_playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [_player removeTimeObserver:_playTimeObserver];
    _playTimeObserver = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// xib 加载完成后 与 fileOwner 建立连接调用
- (void)awakeFromNib {
    [super awakeFromNib];
    // slider
    self.playProgress.value = 0.0;
    [self.playProgress setThumbImage:[UIImage imageNamed:@"icmpv_thumb_light"] forState:(UIControlStateNormal)];
    // 设置progress
    self.loadedProgress.progress = 0.0;
}


// xib 加载时调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // set
        self.mainView = [[[NSBundle mainBundle] loadNibNamed:@"AGPlayerView" owner:self options:nil] lastObject];
        [self addSubview:self.mainView];

        // setAVPlayer
        self.player = [[AVPlayer alloc] init];
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
        [self.playerView.layer addSublayer:_playerLayer];

        // bringFront
        [self.playerView bringSubviewToFront:_downView];
        [self.playerView bringSubviewToFront:_playProgress];

        // setPortraintLayout
        [self setPortarintLayout];

        NSLog(@"%d %.2f %.2f", __LINE__, self.playerView.bounds.size.width, self.playerView.bounds.size.height);
    }
    return self;
}

#pragma mark-
#pragma mark 横竖屏约束

- (void)setPortarintLayout {
    _isLandscape = NO;

    // 不隐藏工具条
    [self portraitShow];
    // hideInspector
    [self layoutIfNeeded];
}

// 显示工具条
- (void)portraitShow {
    _isShowToolbar = YES; // 显示工具条置为 yes

    _bottomConstraint.constant = 0;
    // 约束动画
    [UIView animateWithDuration:0.1 animations:^{
        [self layoutIfNeeded];
    }                completion:^(BOOL finished) {
    }];

    // 显示状态条
    [[UIApplication sharedApplication] setStatusBarHidden:NO animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:(UIStatusBarStyleLightContent)];
}

- (void)portraitHide {
    _isShowToolbar = NO; // 显示工具条置为 no

    _bottomConstraint.constant = -(self.downView.frame.size.height);;
    // 约束动画
    [UIView animateWithDuration:0.1 animations:^{
        [self layoutIfNeeded];
    }                completion:^(BOOL finished) {
    }];

    // 隐藏状态条
    [[UIApplication sharedApplication] setStatusBarHidden:YES animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:(UIStatusBarStyleLightContent)];
}

#pragma mark-
#pragma mark inspectorView 动画

- (void)inspectorViewShow {
    // 约束动画
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }                completion:^(BOOL finished) {
        [self performSelector:@selector(inspectorViewHide) withObject:nil afterDelay:1]; // 0.2秒后隐藏
    }];
}

- (void)inspectorViewHide {
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }                completion:^(BOOL finished) {

    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _playerLayer.frame = self.bounds;
}

#pragma mark- sizeClass 横竖屏约束

// sizeClass 横竖屏切换时，执行
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    // 横竖屏切换时重新添加约束
    CGRect bounds = [UIScreen mainScreen].bounds;
    [_mainView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@(0));
        make.width.equalTo(@(bounds.size.width));
        make.height.equalTo(@(bounds.size.height));
    }];
    // 横竖屏判断
    if (self.traitCollection.verticalSizeClass != UIUserInterfaceSizeClassCompact) { // 竖屏
        [self.rotationButton setImage:[UIImage imageNamed:@"ic_screen_small"] forState:(UIControlStateNormal)];
    } else { // 横屏
        [self.rotationButton setImage:[UIImage imageNamed:@"ic_screen_large"] forState:(UIControlStateNormal)];

    }

    // iPhone 6s 6                      6sP  6p
    // 竖屏情况下 compact * regular     compact * regular
    // 横屏情况下 compact * compact     regular * compact
    // 以 verticalClass 来判断横竖屏
    //    NSLog(@"horizontal %ld", (long)self.traitCollection.horizontalSizeClass);
    //    NSLog(@"vertical %ld", (long)self.traitCollection.verticalSizeClass); //
}


#pragma mark-
#pragma mark 横竖屏切换

- (IBAction)rotationAction:(id)sender {
    if ([RotationScreen isOrientationLandscape]) { // 如果是横屏，
        [RotationScreen forceOrientation:(UIInterfaceOrientationPortrait)]; // 切换为竖屏
    } else {
        [RotationScreen forceOrientation:(UIInterfaceOrientationLandscapeRight)]; // 否则，切换为横屏
    }
}


- (void)checkRotation {

}


- (void)updatePlayerWithURL:(NSURL *)url {
    _playerItem = [AVPlayerItem playerItemWithURL:url]; // create item
    [_player replaceCurrentItemWithPlayerItem:_playerItem]; // replaceCurrentItem
    [self addObserverAndNotification]; // 添加观察者，发布通知
}

/**
 *  添加观察者 、通知 、监听播放进度
 */
- (void)addObserverAndNotification {
    [_playerItem addObserver:self forKeyPath:@"status" options:(NSKeyValueObservingOptionNew) context:nil]; // 观察status属性， 一共有三种属性
    [_playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil]; // 观察缓冲进度
    [self monitoringPlayback:_playerItem]; // 监听播放
    [self addNotification]; // 添加通知
}

// 观察播放进度
- (void)monitoringPlayback:(AVPlayerItem *)item {
    __weak typeof(self) WeakSelf = self;

    __block BOOL isSliding = _isSliding;
    // 播放进度, 每秒执行30次， CMTime 为30分之一秒
    _playTimeObserver = [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, (int32_t) 30.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        if (_touchMode != TouchPlayerViewModeHorizontal) {
            // 当前播放秒
            float currentPlayTime = (float) item.currentTime.value / item.currentTime.timescale;
            // 更新slider, 如果正在滑动则不更新
            if (!isSliding) {
                [WeakSelf updateVideoSlider:currentPlayTime];
            }
        } else {
            return;
        }
    }];
}

// 更新滑动条
- (void)updateVideoSlider:(float)currentTime {
    self.playProgress.value = currentTime;
    self.beginLabel.text = [NSString convertTime:currentTime];
}

#pragma mark-
#pragma mark 添加通知

- (void)addNotification {
    // 播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    // 前台通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterForegroundNotification) name:UIApplicationWillEnterForegroundNotification object:nil];
    // 后台通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackgroundNotification) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)enterForegroundNotification {

}

- (void)enterBackgroundNotification {
    [self pause];
}

- (void)playbackFinished:(NSNotification *)notification {
    NSLog(@"视频播放完成通知");
    _playerItem = [notification object];
    // 是否无限循环
    [_playerItem seekToTime:kCMTimeZero]; // 跳转到初始
//    [_player play]; // 是否无限循环
}

#pragma mark-
#pragma mark KVO - status

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *, id> *)change context:(void *)context {
    AVPlayerItem *item = (AVPlayerItem *) object;
    if ([keyPath isEqualToString:@"status"]) {
        if (_isIntoBackground) {
            return;
        } else { // 判断status 的 状态
            AVPlayerStatus status = (AVPlayerStatus) [change[@"new"] intValue]; // 获取更改后的状态
            if (status == AVPlayerStatusReadyToPlay) {
                NSLog(@"准备播放");
                // CMTime 本身是一个结构体
                CMTime duration = item.duration; // 获取视频长度
                NSLog(@"%.2f", CMTimeGetSeconds(duration));
                // 设置视频时间
                [self setMaxDuration:(CGFloat) CMTimeGetSeconds(duration)];
                // 播放
                [self play];

            } else if (status == AVPlayerStatusFailed) {
                NSLog(@"AVPlayerStatusFailed");
            } else {
                NSLog(@"AVPlayerStatusUnknown");
            }
        }

    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSTimeInterval timeInterval = [self availableDurationRanges]; // 缓冲时间
        CGFloat totalDuration = (CGFloat) CMTimeGetSeconds(_playerItem.duration); // 总时间
        [self.loadedProgress setProgress:(float) (timeInterval / totalDuration) animated:YES];
    }
}

// 设置最大时间
- (void)setMaxDuration:(CGFloat)duration {
    self.playProgress.maximumValue = duration; // maxValue = CMGetSecond(item.duration)
    self.endLabel.text = [NSString convertTime:duration];
}

// 已缓冲进度
- (NSTimeInterval)availableDurationRanges {
    NSArray *loadedTimeRanges = [_playerItem loadedTimeRanges]; // 获取item的缓冲数组
    // discussion Returns an NSArray of NSValues containing CMTimeRanges

    // CMTimeRange 结构体 start duration 表示起始位置 和 持续时间
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue]; // 获取缓冲区域
    float startSeconds = (float) CMTimeGetSeconds(timeRange.start);
    float durationSeconds = (float) CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval result = startSeconds + durationSeconds; // 计算总缓冲时间 = start + duration
    return result;
}


#pragma mark-
#pragma mark 播放 暂停

- (IBAction)playOrStopAction:(id)sender {
    if (_isPlaying) {
        [self pause];
    } else {
        [self play];
    }

    // inspectorAnimation
    [self inspectorViewShow];
}

- (void)play {
    _isPlaying = YES;
    [_player play]; // 调用avplayer 的play方法
    [self.playerFullScreenButton setImage:[UIImage imageNamed:@"ic_pause_white_36pt"] forState:(UIControlStateNormal)];
}

- (void)pause {
    _isPlaying = NO;
    [_player pause];
    [self.playerFullScreenButton setImage:[UIImage imageNamed:@"ic_play_arrow_white_36pt"] forState:(UIControlStateNormal)];
}

#pragma mark-
#pragma mark 处理点击事件

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _touchMode = TouchPlayerViewModeNone;
}

//
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_touchMode == TouchPlayerViewModeNone) {
        if (_isLandscape) { // 如果当前是横屏
            if (_isShowToolbar) {
//                [self landscapeHide];
            } else {
//                [self landscapeShow];
            }
        } else { // 如果是竖屏
            if (_isShowToolbar) {
                [self portraitHide];
            } else {
                [self portraitShow];
            }
        }
    }
}

//
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

}


#pragma mark-
#pragma mark 滑块事件

- (IBAction)playerSliderTouchDown:(id)sender {
    [self pause];
}

- (IBAction)playerSliderTouchUpInside:(id)sender {
    _isSliding = NO; // 滑动结束
    [self play];
}

// 不要拖拽的时候改变， 手指抬起来后缓冲完成再改变
- (IBAction)playerSliderValueChanged:(id)sender {
    _isSliding = YES;
    [self pause];
    // 跳转到拖拽秒处
    // self.playProgress.maxValue = value / timeScale
    // value = progress.value * timeScale
    // CMTimemake(value, timeScale) =  (progress.value, 1.0)
    CMTime changedTime = CMTimeMakeWithSeconds(self.playProgress.value, (int32_t) 1.0);
    NSLog(@"%.2f", self.playProgress.value);
    [_playerItem seekToTime:changedTime completionHandler:^(BOOL finished) {
        // 跳转完成后做某事
    }];
}

#pragma mark-
#pragma mark 左上下滑动更改屏幕亮度

#pragma mark-
#pragma mark 右上下滑动更改声音大小

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
