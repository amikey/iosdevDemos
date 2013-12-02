//
//  CSNetManager.h
//  commSupport
//
//  Created by easelin on 12-1-17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LITE_VERSION

@class CSNetManager;

@protocol CSNetManagerHttpDelegate<NSObject>
@optional
- (void)csnetManagerHttpConnectFailed:(NSString*)url requestType:(NSString*)str requestID:(int)reqID;
- (void)csnetManagerHttpReceiveTimeOut:(NSString*)url requestType:(NSString*)str requestID:(int)reqID;
- (void)csnetManagerHttpReceiveData:(NSString*)url data:(NSData*)data encoding:(NSStringEncoding)encoding requestType:(NSString*)str requestID:(int)reqID;
@end

@interface CSNetManager : NSObject
{
@private
	NSTimeInterval _defaultNetworkTimeOut;
	NSUInteger _defaultRetryCountOnTimeOut;
	NSUInteger _maxHttpCurrentOperationCount;
	NSUInteger _currHttpCurrentOperationCount;
	NSMutableArray * _requestArray;
}
// return a singleton
+ (id)sharedManager;
// setter/getter the net time out, default is 10s
@property (nonatomic) NSTimeInterval defaultNetworkTimeOut;
// setter/getter the retry count when time out(so the total timeout is count*timeout), default is 0
@property (nonatomic) NSUInteger defaultRetryCountOnTimeOut;
// http max operation setting, default is 4
- (void)setMaxHttpCurrentOperationCount:(NSUInteger)count;
// ====
// http interface
// ====
- (BOOL)httpPost:(NSString*)url data:(NSData*)data httpHeader:(NSDictionary*)dic requestType:(NSString*)str requestID:(int)reqID delegate:(id<CSNetManagerHttpDelegate>)d;
- (void)cancelHttpRequest:(NSString*)str requestID:(int)reqID delegate:(id<CSNetManagerHttpDelegate>)d;
- (void)cancelHttpRequest:(NSString *)str delegate:(id<CSNetManagerHttpDelegate>)d;
- (void)cancelAllHttpRequest;

#pragma mark -more http interface begin

#if !defined (LITE_VERSION)
- (BOOL)httpGet:(NSString*)url requestType:(NSString*)str requestID:(int)reqID delegate:(id<CSNetManagerHttpDelegate>)d;
// URLEncodedPostFormat
- (BOOL)httpFormPost:(NSString*)url forms:(NSDictionary*)forms httpHeader:(NSDictionary*)headers requestType:(NSString*)str requestID:(int)reqID delegate:(id<CSNetManagerHttpDelegate>)d;
// MultipartFormDataPostFormat
- (BOOL)httpFormPost:(NSString*)urlStr inputData:(NSData*)data inputName:(NSString*)name otherForms:(NSDictionary*)forms httpHeader:(NSDictionary*)headers requestType:(NSString*)str requestID:(int)reqID delegate:(id<CSNetManagerHttpDelegate>)d;
#endif

#pragma mark -more http interface end

@end
