#ifndef HCSESSION_H
#define HCSESSION_H

#import <Foundation/Foundation.h>

@interface HCSession : NSObject <NSCopying>
{
 @protected
  NSMutableDictionary* sessionHeader;
  BOOL secure;
  NSString* host;
  NSUInteger port;
  NSString* contextpath;
}

@property (nonatomic, readonly) BOOL secure;
@property (nonatomic, readonly, copy) NSString* host;
@property (nonatomic, readonly) NSUInteger port;
@property (nonatomic, readonly, copy) NSString* contextpath;

-(id) initWithConnection:(NSString*) hostName specifiedPort:(NSUInteger) portNumber webContextPath:(NSString*) context secureFlag:(BOOL) flag;

-(BOOL) hasSession;
-(BOOL) expireSession;
-(NSDictionary*) headers;
-(void) setHeader:(NSString*) name headerValue:(NSString*) value;
-(NSString*) header:(NSString*) name;

@end

#endif
