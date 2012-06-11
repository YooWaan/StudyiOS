//
// HCBasicMethodDelegate.m -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:56:28 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "HCBasicMethodDelegate.h"

#import "ARC.h"

@interface HCBasicMethodDelegate ()

-(void) runCustomizeURLRequest:(NSMutableURLRequest*) request withSession:(HCSession*)session ;

-(void) runHandleResponse:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response;

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data;

-(void) runFinishLoading:(NSURLConnection *)connection;

-(void) runHandleError:(NSURLConnection *)connection didFailWithError:(NSError *)error;

@end

@implementation HCBasicMethodDelegate

@synthesize state, HttpStatus, httpError, errorCode, errorMessage, headerFields, responseHandler;

-(id) init {
  if ((self = [super init]) != nil) {
	self.state = HCMethodInitialized;
	self.HttpStatus = -1;
	self.httpError = nil;
	self.errorCode = -1;
	self.errorMessage = nil;
	self.responseHandler = nil;
	headerFields = nil;
  }
  return self;
}

-(id) initWithHandler:(ResponseHandler)handler {
  if ((self = [self init]) != nil) {
	self.responseHandler = [handler copy];
  }
  return self;
}

#ifdef ARC_OFF
-(void) dealloc {
  self.httpError = nil;
  self.errorMessage = nil;
  self.responseHandler = nil;
  if (headerFields) {
	[headerFields release];
  }
  [super dealloc];
}
#endif


-(id) ResponseContents {return nil;}


#pragma mark -
#pragma mark HCHttpMethod

-(void) customizeURLRequest:(NSMutableURLRequest*)request withSession:(HCSession*)session {
  [self runCustomizeURLRequest:request withSession:session];
}

-(void) runCustomizeURLRequest:(NSMutableURLRequest*)request withSession:(HCSession*)session {
  // NOOP
}

#pragma mark -
#pragma mark HCResponseHandle

-(void) onFinishMethodExecuting {
  //NSLog(@"onFinish %@", responseHandler);
  if (responseHandler != nil) {
	if (self.httpError == nil) {
	  responseHandler([self ResponseContents], [self headerFields], [self HttpStatus], self.httpError);
	} else {
	  responseHandler(nil, [self headerFields],  [self HttpStatus], self.httpError);
	}
  }
}

#pragma mark -
#pragma mark HCHttpMethodDelegate

-(void)handleResponse:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  self.state = HCMethodRunning;
  NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
  self.HttpStatus = [httpResponse statusCode];
  headerFields = RETAIN([httpResponse allHeaderFields]);
  [self runHandleResponse:connection didReceiveResponse:httpResponse];
}

-(void) runHandleResponse:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response {
  // NOOP
}

-(void)handleData:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [self runHandle:connection didReceiveData:data];
}

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data{
  // NOOP
}

-(void)handleFinishLoading:(NSURLConnection *)connection {
  self.state = HCMethodDone;
  [self runFinishLoading: connection];
}

-(void) runFinishLoading:(NSURLConnection *)connection {
  [self onFinishMethodExecuting];
}

-(void)handleError:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  [self runHandleError:connection didFailWithError:error];
}

-(void) runHandleError:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  self.httpError = error;
  [self onFinishMethodExecuting];
}

@end
