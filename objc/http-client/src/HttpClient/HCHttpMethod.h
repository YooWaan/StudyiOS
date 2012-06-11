//
// HCHttpMethod.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:09:45 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __HCHTTPMETHOD_H_
#define __HCHTTPMETHOD_H_

#import <Foundation/Foundation.h>

#import "HCSession.h"

extern NSString * const HC_HTTP_METHOD_GET;
extern NSString * const HC_HTTP_METHOD_POST;
extern NSString * const HC_HTTP_METHOD_PUT;
extern NSString * const HC_HTTP_METHOD_DELETE;


typedef enum hcMethodState {
  HCMethodInitialized = 0,
  HCMethodRunning = 1,
  HCMethodDone = 2
} HCMethodState;


typedef void (^ResponseHandler)(id, NSDictionary*, NSInteger, NSError*);

//
// Method Condition
//
@protocol HCMethodCondition <NSObject>

@property (nonatomic) HCMethodState state;
@property (nonatomic) NSInteger HttpStatus;
@property (nonatomic, copy) NSError* httpError;
@property (nonatomic) NSInteger errorCode;
@property (nonatomic, copy) NSString* errorMessage;
@property (nonatomic, readonly) id ResponseContents;
@property (nonatomic, readonly, retain) NSDictionary* headerFields;

@end


//
// Response Handle
//
@protocol HCResponseHandle <NSObject>

-(void) onFinishMethodExecuting;

@end


//
// ContentsDelegate
//
@protocol HCContentsDelegate <NSObject>

@required

-(void)handleResponse:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;

-(void)handleData:(NSURLConnection *)connection didReceiveData:(NSData *)data;

-(void)handleFinishLoading:(NSURLConnection *)connection;

-(void)handleError:(NSURLConnection *)connection didFailWithError:(NSError *)error;


@end



//
// HttpMethod Delegate
//
@protocol HCMethodDelegate <HCContentsDelegate,HCMethodCondition,HCResponseHandle>

-(void) customizeURLRequest:(NSMutableURLRequest*)request withSession:(HCSession*)session;

@end



//
// HttpMethod
//
@protocol HCHttpMethod <NSObject>

@property (nonatomic, assign) id <HCMethodDelegate> delegate;
@property (nonatomic, readonly) NSString* name;

@required

-(void) execute:(HCSession*) session;
-(void) executeAsynchronous:(HCSession*) session;

-(void) addParameters:(NSDictionary*) parameters;
-(void) addParameter:(NSString*) value parameterName:(NSString*) name;
-(void) removeParameter:(NSString*) name;
-(NSDictionary*) parameters;

@end


#endif
