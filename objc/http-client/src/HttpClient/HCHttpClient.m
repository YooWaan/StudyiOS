#import <HCHttpClient.h>
#import <HCHttpMethod.h>

#import <Foundation/NSURLRequest.h>
#import <Foundation/NSURLConnection.h>

@implementation HCHttpClient

-(id) initWithSession:(HCSession*) session {
  if ((self = [super init]) != nil) {
	activeSession = [session copy];
  }
  return self;
}

-(void) dealloc {
  [activeSession release];
  [super dealloc];
}

-(HCSession*) session {
  return activeSession;
}

-(void) communicate:(id <HCHttpMethod>) withMethod {
  [withMethod execute:activeSession];
}

@end
