#import <Foundation/NSURLRequest.h>
#import <Foundation/NSURLConnection.h>

#import "HCBasicMethod.h"
#import "HCURLConnectionDelegate.h"

NSString * const HC_HTTP_METHOD_GET    = @"GET";
NSString * const HC_HTTP_METHOD_POST   = @"POST";
NSString * const HC_HTTP_METHOD_PUT    = @"PUT";
NSString * const HC_HTTP_METHOD_DELETE = @"DELETE";


NSString* HCHttpMethodURLEncode(NSString* string) {
  return [((NSString*)CFURLCreateStringByAddingPercentEscapes(
												 kCFAllocatorDefault,
												 (CFStringRef)string,
												 NULL,
												 CFSTR (";,/?:@&=+$#"),
												 kCFStringEncodingUTF8))
		   autorelease];
}


@interface HCBasicMethod ()

-(NSString*) URLString:(HCSession*) session;

-(id <NSURLConnectionDelegate>) connectionDelegate;

-(NSURLRequest*) request:(HCSession*) session;

-(BOOL) useBody;

-(void) customizeURLRequest:(NSURLRequest*) request;

@end

@implementation HCBasicMethod

-(id)initWithPathAndDelegate:(NSString*)path contentsDelegate:(id <HCContentsDelegate>) delegate {
  self = [super init];
  if (self != nil) {
	pathForRequest = path;;
	handleContentsDelegate = delegate;
	requestParameters = [[[NSMutableDictionary alloc] init] autorelease];
  }
  return self;
}

-(void) dealloc {
  [requestParameters release];
  [super dealloc];
}

-(NSString*) name {
  return nil;
}

-(BOOL) useBody {
  NSString* method = [self name];
  return ([method isEqualToString:HC_HTTP_METHOD_POST] || [method isEqualToString:HC_HTTP_METHOD_PUT]) ? YES : NO ;
}

-(void) setDelegate:(id <HCContentsDelegate>)contentsDelegate {
  handleContentsDelegate = contentsDelegate;
}

-(void) addParameter:(NSString*) value parameterName:(NSString*) name {
  [requestParameters setObject:value forKey:name];
}

-(void) removeParameter:(NSString*) name {
  [requestParameters removeObjectForKey:name];
}

-(NSDictionary*) parameters {
  return requestParameters;
}

-(void) execute:(HCSession*) session {
  NSURLRequest * request = [self request: session];
  id <NSURLConnectionDelegate> connectionDelegate = [self connectionDelegate];
  NSURLConnection* connection = [[[NSURLConnection alloc] initWithRequest:request delegate: connectionDelegate startImmediately: NO] autorelease];
  [connection start];
}

-(id <NSURLConnectionDelegate>) connectionDelegate {
  return [[[HCURLConnectionDelegate alloc] initWithContentsDelegate:handleContentsDelegate] autorelease];
}

-(NSURLRequest*) request:(HCSession*) session {
  NSMutableURLRequest* request = [[[NSMutableURLRequest alloc] init] autorelease];

  // METHOD , URL , HEADER
  [request setHTTPMethod: [self name]];
  [request setURL:[NSURL URLWithString:[self URLString: session]]];
  NSDictionary* headers = [session headers];
  NSEnumerator* enumerator = [headers keyEnumerator];
  id key;
  while ((key = [enumerator nextObject])) {
	  [request addValue:[headers objectForKey:key] forHTTPHeaderField:key];
  }

  // customize by sub class
  [self customizeURLRequest:request];

  return request;
}

-(NSString*) URLString:(HCSession*) session {
  NSMutableString* url = [[[NSMutableString alloc] init] autorelease];
  if (session.secure) {
	[url appendString:@"https://"];
  } else {
	[url appendString:@"http://"];
  }
  [url appendString:session.host];
  if (!(session.port == 80 || session.port == 443)) {
	[url appendString:@":"];
	[url appendString:session.host];
  }
  [url appendString:@"/"];
  if (session.contextpath != nil) {
	[url appendString:session.contextpath];
	[url appendString:@"/"];
  }

  [url appendString:pathForRequest];

  if (![self useBody] && [requestParameters count] > 0) {
	BOOL first = YES;
	NSEnumerator* enumerator = [requestParameters keyEnumerator];
	id key, value;
	while ((key = [enumerator nextObject])) {
	  value = [requestParameters objectForKey:key];
	  if (first) {
		[url appendString:@"?"];
		first = NO;
	  } else {
		[url appendString:@"&"];
	  }
	  [url appendString:key];
	  [url appendString:@"="];
	  [url appendString:HCHttpMethodURLEncode(value)];
	}
  }

  return url;
}

-(void) customizeURLRequest:(NSURLRequest*) request {
  // NOOP
}

@end
