#import "HCPostMethod.h"


@implementation HCPostMethod

-(id) init {
  if ((self = [super init]) != nil) {
	bodyData = nil;
	bodyStream = nil;
  }
  return self;
}

-(void) dealloc {
  bodyData = nil;
  bodyStream = nil;
  [super dealloc];
}

-(NSString*) name {
  return HC_HTTP_METHOD_PUT;
}

-(BOOL) useBody {
  return NO;
}

-(void) setBody:(NSData*) data {
  bodyData = data;
}

-(void) setBodyStream:(NSInputStream*) stream {
  bodyStream = stream;
}

-(NSURLRequest*) URLRequest:(HCSession*) session {
  NSMutableURLRequest* request = (NSMutableURLRequest*)[super URLRequest:session];
  if (bodyData != nil) {
	[request setHTTPBody:bodyData];
  }
  if (bodyStream != nil) {
	[request setHTTPBodyStream:bodyStream];
  }
  return request;
}

@end
