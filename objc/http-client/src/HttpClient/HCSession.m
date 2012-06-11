//
// HCSession.m -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:29:46 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "HCSession.h"

#import "ARC.h"

@implementation HCSession

@synthesize ignoreCertificateCheck, timeout;


-(id) init {
  if ((self = [super init]) != nil) {
	sessionHeader = [[NSMutableDictionary alloc] init];
	self.ignoreCertificateCheck = NO;
	self.timeout = 60;
  }
  return self;
}

-(id) initWithConnection:(NSString*) hostName specifiedPort:(NSUInteger) portNumber webContextPath:(NSString*) context secureFlag:(BOOL) flag {
  if ((self = [self init]) != nil) {
	hostname = [hostName copy];
	portnumber = portNumber;
	webcontextpath = [context copy];
	secureMode = flag;
  }
  return self;
}

-(id) copyWithZone:(NSZone*)zone {
  HCSession* session = [[[self class] allocWithZone:zone] initWithConnection:hostname specifiedPort:portnumber webContextPath:webcontextpath secureFlag:secureMode];
  session.ignoreCertificateCheck = self.ignoreCertificateCheck;
  return session;
}

#ifdef ARC_OFF
-(void) dealloc {
  [hostname release];
  [webcontextpath release];
  //[sessionHeader release];
  [super dealloc];
}
#endif

-(NSString*) host {
  return hostname;
}

-(NSUInteger) port {
  return portnumber;
}

-(BOOL) secure {
  return secureMode;
}
-(NSString*) contextpath {
  return webcontextpath;
}

-(BOOL) hasSession {
  return [sessionHeader count] > 0 ? YES : NO;
}

-(BOOL) expireSession {
  if ([sessionHeader count] > 0) {
	[sessionHeader removeAllObjects];
	return YES;
  }
  return NO;
}

-(NSDictionary*) headers {
  return sessionHeader;
}

-(void) setHeader:(NSString*) name headerValue:(NSString*) value {
  [sessionHeader setObject:value forKey:name];
}

-(NSString*) header:(NSString*) name {
  return [sessionHeader objectForKey:name];
}


@end
