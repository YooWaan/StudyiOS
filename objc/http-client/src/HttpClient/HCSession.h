//
// HCSession.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:29:01 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __HCSESSION_H_
#define __HCSESSION_H_

#import <Foundation/Foundation.h>

@interface HCSession : NSObject <NSCopying>
{
 @protected
  NSMutableDictionary* sessionHeader;
  BOOL secureMode;
  NSString* hostname;
  NSUInteger portnumber;
  NSString* webcontextpath;
  BOOL ignoreCertificateCheck;
}

/*
@property (nonatomic, readonly) BOOL secure;
@property (nonatomic, readonly, copy) NSString* host;
@property (nonatomic, readonly) NSUInteger port;
@property (nonatomic, readonly, copy) NSString* contextpath;
*/
@property (nonatomic) BOOL ignoreCertificateCheck;
@property (nonatomic) NSTimeInterval timeout;

-(id) initWithConnection:(NSString*) hostName specifiedPort:(NSUInteger) portNumber webContextPath:(NSString*) context secureFlag:(BOOL) flag;

-(NSString*) host;
-(NSUInteger) port;
-(BOOL) secure;
-(NSString*) contextpath;

-(BOOL) hasSession;
-(BOOL) expireSession;
-(NSDictionary*) headers;
-(void) setHeader:(NSString*) name headerValue:(NSString*) value;
-(NSString*) header:(NSString*) name;

@end

#endif
