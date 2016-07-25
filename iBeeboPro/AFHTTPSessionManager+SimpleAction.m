//
//  AFHTTPSessionManager+SimpleAction.m
//  CCF
//
//  Created by WDY on 16/1/15.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "AFHTTPSessionManager+SimpleAction.h"
#import "NSString+Extensions.h"

@implementation AFHTTPSessionManager(SimpleAction)


-(void)GETWithURL:(NSURL *)url requestCallback:(RequestCallback)callback{

    [self GET:[url absoluteString] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSString *orgHtml = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSString *html = [orgHtml replaceUnicode];
        callback(YES, html);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(NO, @"网络异常");
    }];
}

-(void)POSTWithURL:(NSURL *)url parameters:(id)parameters requestCallback:(RequestCallback)callback{
    [self POST:[url absoluteString] parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *html = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] replaceUnicode];
        callback(YES,html);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(NO, @"网络异常");
    }];
}

-(void)POSTWithURL:(NSURL *)url parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block requestCallback:(RequestCallback)callback{

    
    [self POST:[url absoluteString] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *html = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] replaceUnicode];
        callback(YES, html);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"AFHTTPSessionManager+SimpleAction POSTWithURL  %@", error);
        callback(NO, @"网络异常");
    }];
}



-(void)GETWithURLString:(NSString *)url requestCallback:(RequestCallback)callback{
    NSURL * nsurl = [NSURL URLWithString:url];
    [self GETWithURL:nsurl requestCallback:callback];
}


-(void)POSTWithURLString:(NSString *)url parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block requestCallback:(RequestCallback)callback{
    NSURL * nsurl = [NSURL URLWithString:url];
    
    [self POSTWithURL:nsurl parameters:parameters constructingBodyWithBlock:block requestCallback:callback];
}


-(void)POSTWithURLString:(NSString *)url parameters:(id)parameters requestCallback:(RequestCallback)callback{
    NSURL * nsurl = [NSURL URLWithString:url];
    [self POSTWithURL:nsurl parameters:parameters requestCallback:callback];
}

@end
