#import "HCSession.h"

@implementation HCSession

@synthesize secure;
@synthesize host;
@synthesize port;
@synthesize contextpath;


-(id) init {
  if ((self = [super init]) != nil) {
	sessionHeader = [[NSMutableDictionary alloc] init];
  }
  return self;
}

-(id) initWithConnection:(NSString*) hostName specifiedPort:(NSUInteger) portNumber webContextPath:(NSString*) context secureFlag:(BOOL) flag {
  if ((self = [self init]) != nil) {
	host = hostName;
	port = portNumber;
	contextpath = context;
	secure = flag;
  }
  return self;
}

-(id) copyWithZone:(NSZone*)zone {
  return [[[self class] allocWithZone:zone] initWithConnection:host specifiedPort:port webContextPath:contextpath secureFlag:secure];
}

-(void) dealloc {
  [host release];
  [contextpath release];
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
