#import "HCSession.h"

@implementation HCSession

@synthesize secure;
@synthesize host;
@synthesize port;
@synthesize contextpath;


-(id) init {
  if ((self = [super init]) != nil) {
	sessionHeader = [[[NSMutableDictionary alloc] init] autorelease];
  }
  return self;
}

-(void) dealloc {
  [sessionHeader release];
  [super dealloc];
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
