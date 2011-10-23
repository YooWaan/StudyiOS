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

@end

@implementation HCBasicMethod

-(id)initWithPathAndDelegate:(NSString*)path withMethodDelegate:(id <HCMethodDelegate>) delegate {
  self = [super init];
  if (self != nil) {
	pathForRequest = path;;
	methodDelegate = delegate;
	requestParameters = [[NSMutableDictionary alloc] init];
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

-(void) setDelegate:(id <HCMethodDelegate>)delegate {
  methodDelegate = delegate;
}

-(void) addParameters:(NSDictionary*) parameters {
  [requestParameters setDictionary:parameters];
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
  [self executeMethod:session asynchronous:NO];

}

-(void) executeAsynchronous:(HCSession*) session {
  [self executeMethod:session asynchronous:YES];
}

-(void)executeMethod:(HCSession*) session asynchronous:(BOOL) async {
  NSURLRequest * request = [self URLRequest: session];
  id <NSURLConnectionDelegate> connectionDelegate = [self connectionDelegate];

  //NSURLConnection* connection = [[[NSURLConnection alloc] initWithRequest:request delegate:connectionDelegate startImmediately: NO] autorelease];
  //NSURLConnection* connection = [NSURLConnection connectionWithRequest:request delegate: connectionDelegate ];
  [NSURLConnection connectionWithRequest:request delegate: connectionDelegate ];

  if (!async) {
	NSRunLoop* loop = [NSRunLoop currentRunLoop];
	while ([methodDelegate status] != HCMethodDone && [loop runMode:NSDefaultRunLoopMode beforeDate:[[NSDate distantFuture] autorelease]]);
  }
}


-(id <NSURLConnectionDelegate>) connectionDelegate {
  return [[[HCURLConnectionDelegate alloc] initWithContentsDelegate:methodDelegate] autorelease];
}

-(NSURLRequest*) URLRequest:(HCSession*) session {
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

  // customized by sub class
  [methodDelegate customizeURLRequest:request];

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

  //NSLog(@"url --> %@", url);
  return url;
}

@end
