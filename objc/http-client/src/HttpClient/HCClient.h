//
// HCClient.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 15:36:37 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __HCCLIENT_H_
#define __HCCLIENT_H_

#import "HCHttpMethod.h"

@interface HCClient : NSObject
{
 @protected
  HCSession* activeSession;
}

@property (nonatomic, readonly) HCSession* session;

-(id) initWithSession:(HCSession*)clientSession;

-(void) communicate:(id <HCHttpMethod>) withMethod;

-(void) communicateInBackground:(id <HCHttpMethod>) withMethod;

@end

#endif
