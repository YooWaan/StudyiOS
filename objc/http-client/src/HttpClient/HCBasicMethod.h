//
// HCBasicMethod.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:20:17 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __HCBASICMETHOD_H_
#define __HCBASICMETHOD_H_

#import <Foundation/Foundation.h>

#import "HCHttpMethod.h"
#import "HCSession.h"

NSString* HCHttpMethodURLEncode(NSString* string);

@interface HCBasicMethod : NSObject <HCHttpMethod>
{
  @protected
  NSMutableDictionary* requestParameters;
}

@property (nonatomic) BOOL useBody;
@property (nonatomic, retain) NSString* pathForRequest;

-(id)initWithPathAndDelegate:(NSString*)path withMethodDelegate:(id <HCMethodDelegate>) methodDelegate;

-(void)executeMethod:(HCSession*) session asynchronous:(BOOL) async;

-(NSURLRequest*) URLRequest:(HCSession*) session;

-(void) appendParameterString:(NSMutableString*) url;

@end


#endif
