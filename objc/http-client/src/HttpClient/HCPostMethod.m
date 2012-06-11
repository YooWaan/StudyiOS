//
// HCPostMethod.m -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 15:25:55 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "HCPostMethod.h"

#import <Foundation/Foundation.h>

#import "ARC.h"

@implementation HCPostMethod

@synthesize bodyData, bodyStream;

-(id) init {
  if ((self = [super init]) != nil) {
	self.useBody = YES;
  }
  return self;
}

 
-(NSString*) name {
  return HC_HTTP_METHOD_POST;
}

-(NSURLRequest*) URLRequest:(HCSession*) session {
  NSMutableURLRequest* request = (NSMutableURLRequest*)[super URLRequest:session];
  if (self.bodyData != nil) {
	[request setHTTPBody:self.bodyData];
	[request addValue:[[NSNumber numberWithInt:[self.bodyData length]] stringValue] forHTTPHeaderField:@"Content-Length"];
  }
  if (self.bodyStream != nil) {
	[request setHTTPBodyStream:self.bodyStream];
  }

  if (self.useBody && self.bodyData == nil && [requestParameters count] != 0) {
	NSMutableString* params = [NSMutableString string];
	[self appendParameterString:params];
	NSData* data = [params dataUsingEncoding:NSUTF8StringEncoding];
	[request setHTTPBody:data];
	[request addValue:[[NSNumber numberWithInt:[data length]] stringValue] forHTTPHeaderField:@"Content-Length"];
  }

  return request;
}

@end
