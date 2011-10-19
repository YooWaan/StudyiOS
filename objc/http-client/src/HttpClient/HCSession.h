#ifndef HCSESSION_H
#define HCSESSION_H

#import <Foundation/Foundation.h>

@interface HCSession : NSObject
{
 @protected
  NSMutableDictionary* sessionHeader;
}

@property (nonatomic, readonly) BOOL secure;
@property (nonatomic, readonly, copy) NSString* host;
@property (nonatomic, readonly) NSUInteger port;
@property (nonatomic, readonly, copy) NSString* contextpath;


-(BOOL) hasSession;
-(BOOL) expireSession;
-(NSDictionary*) headers;
-(void) setHeader:(NSString*) name headerValue:(NSString*) value;
-(NSString*) header:(NSString*) name;

@end

#endif
