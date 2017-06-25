//
//  AFHTTPSessionManager+SimpleAction.m
//
//  Created by WDY on 16/1/15.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "AFHTTPSessionManager+SimpleAction.h"
#import "NSString+Extensions.h"
#import "NSData+UTF8.h"

@implementation AFHTTPSessionManager (SimpleAction)


- (void)GETWithURL:(NSURL *)url parameters:(NSDictionary *)parameters requestCallback:(RequestCallback)callback {

    [self GET:[url absoluteString] parameters:parameters progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        NSString *orgHtml = [responseObject utf8String];
        NSString *html = [orgHtml replaceUnicode];
        
        callback(YES, html);
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        callback(NO, @"网络异常");
    }];
}

- (void)POSTWithURL:(NSURL *)url parameters:(id)parameters requestCallback:(RequestCallback)callback {
//    [self setTaskWillPerformHTTPRedirectionBlock:^NSURLRequest *(NSURLSession *session, NSURLSessionTask *task, NSURLResponse *response, NSURLRequest *request) {
//        return request;
//    }];
    [self POST:[url absoluteString] parameters:parameters progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        
        NSString *orgHtml = [responseObject utf8String];
        NSString *html = [orgHtml replaceUnicode];

        callback(YES, html);
    }  failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        callback(NO, @"网络异常");
    }];

}

- (void)POSTWithURL:(NSURL *)url parameters:(id)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData>))block requestCallback:(RequestCallback)callback {


    [self POST:[url absoluteString] parameters:parameters constructingBodyWithBlock:^(id <AFMultipartFormData> _Nonnull formData) {

    } progress:^(NSProgress *_Nonnull uploadProgress) {

    }  success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {

        NSString *orgHtml = [responseObject utf8String];
        NSString *html = [orgHtml replaceUnicode];

        callback(YES, html);

    }  failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        NSLog(@"AFHTTPSessionManager+SimpleAction POSTWithURL  %@", error);
        callback(NO, @"网络异常");
    }];
}

-(void)GETWithURLString:(NSString *)url parameters:(NSDictionary *)parameters requestCallback:(RequestCallback)callback{
//    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
//    [parameters setValue:@"2" forKey:@"styleid"];
//    [parameters setValue:@"1" forKey:@"langid"];
    NSURL *nsurl = [NSURL URLWithString:url];
    [self GETWithURL:nsurl parameters:parameters requestCallback:callback];
}

- (void)POSTWithURLString:(NSString *)url parameters:(id)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData>))block requestCallback:(RequestCallback)callback {
    NSURL *nsurl = [NSURL URLWithString:url];

    [self POSTWithURL:nsurl parameters:parameters constructingBodyWithBlock:block requestCallback:callback];
}


- (void)POSTWithURLString:(NSString *)url parameters:(id)parameters requestCallback:(RequestCallback)callback {
    NSURL *nsurl = [NSURL URLWithString:url];
    [self POSTWithURL:nsurl parameters:parameters requestCallback:callback];
}

@end
