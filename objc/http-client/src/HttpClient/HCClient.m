//
// HCClient.m -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 15:38:53 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "HCClient.h"

@implementation HCClient

-(id) initWithSession:(HCSession*) session {
  if ((self = [super init]) != nil) {
	activeSession = [session copy];
	activeSession.ignoreCertificateCheck = session.ignoreCertificateCheck;
  }
  return self;
}

#ifdef ARC_OFF
-(void) dealloc {
  [activeSession release];
  [super dealloc];
}
#endif

-(HCSession*) session {
  return activeSession;
}

-(void) communicate:(id <HCHttpMethod>) withMethod {
  [withMethod execute:activeSession];
}

-(void) communicateInBackground:(id <HCHttpMethod>) withMethod {
  [withMethod executeAsynchronous:activeSession];
}

@end
