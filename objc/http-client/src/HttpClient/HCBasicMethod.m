//
// HCBasicMethod.m -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:21:22 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import <Foundation/NSURLRequest.h>
#import <Foundation/NSURLConnection.h>

#import "ARC.h"
#import "HCBasicMethod.h"
#import "HCConnectionDelegate.h"

NSString * const HC_HTTP_METHOD_GET    = @"GET";
NSString * const HC_HTTP_METHOD_POST   = @"POST";
NSString * const HC_HTTP_METHOD_PUT    = @"PUT";
NSString * const HC_HTTP_METHOD_DELETE = @"DELETE";


NSString* HCHttpMethodURLEncode(NSString* string) {
  return (NSString*)CFURLCreateStringByAddingPercentEscapes(
												 kCFAllocatorDefault,
												 (CFStringRef)string,
												 NULL,
												 CFSTR (";,/?:@&=+$#"),
												 kCFStringEncodingUTF8);
}



@interface HCBasicMethod ()

-(NSString*) URLString:(HCSession*) session;

-(id <NSURLConnectionDelegate>) connectionDelegate:(HCSession*)session;

@end

@implementation HCBasicMethod

@synthesize delegate, useBody, pathForRequest;


-(id) init {
  if ((self = [super init]) != nil) {
	requestParameters = RETAIN([NSMutableDictionary dictionary]);
	self.useBody = NO;
  }
  return self;
}

-(id)initWithPathAndDelegate:(NSString*)path withMethodDelegate:(id <HCMethodDelegate>) methodDelegate {
  if ((self = [self init]) != nil) {
	self.pathForRequest = path;;
	self.delegate = methodDelegate;
  }
  return self;
}

#ifdef ARC_OFF
-(void) dealloc {
  [requestParameters release];
  self.pathForRequest = nil;
  [super dealloc];
}
#endif

-(NSString*) name {
  return nil;
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
  id <NSURLConnectionDelegate> connectionDelegate = [self connectionDelegate:session];

  //NSURLConnection* connection = [[[NSURLConnection alloc] initWithRequest:request delegate:connectionDelegate startImmediately: NO] autorelease];
  [NSURLConnection connectionWithRequest:request delegate: connectionDelegate ];

  if (!async) {
	NSRunLoop* loop = [NSRunLoop currentRunLoop];
	while (self.delegate.state != HCMethodDone && [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture] ]);
  }
}

-(id <NSURLConnectionDelegate>) connectionDelegate:(HCSession*)session {
  HCConnectionDelegate* connectionDelegate = [[HCConnectionDelegate alloc] initWithContentsDelegate:self.delegate] ;
  connectionDelegate.ignoreCertificateCheck = session.ignoreCertificateCheck;
  return connectionDelegate;
}

-(NSURLRequest*) URLRequest:(HCSession*) session {
  NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init] ;

  // METHOD , URL , HEADER
  [request setHTTPMethod: [self name]];
  [request setURL:[NSURL URLWithString:[self URLString: session]]];
  [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
  [request setTimeoutInterval:session.timeout];
  NSDictionary* headers = [session headers];
  NSEnumerator* enumerator = [headers keyEnumerator];
  id key;
  while ((key = [enumerator nextObject])) {
	  [request addValue:[headers objectForKey:key] forHTTPHeaderField:key];
  }

  // customized by sub class
  [self.delegate customizeURLRequest:request withSession:session];

  return request;
}

-(NSString*) URLString:(HCSession*) session {
    NSMutableString* url = [[NSMutableString alloc] init] ;
	if (session.secure) {
	  [url appendString:@"https://"];
	} else {
	  [url appendString:@"http://"];
	}
	NSString* str = [session host];
	[url appendString:str];
	NSUInteger port = [session port];
	if (!(port == 80 || port == 443)) {
	  [url appendString:@":"];
	  [url appendFormat:@"%d", port];
	}
	[url appendString:@"/"];
	str = [session contextpath];
	if (str != nil) {
	  [url appendString:str];
	  [url appendString:@"/"];
	}
	if (self.pathForRequest) {
	  [url appendString:pathForRequest];
	}
	if (!self.useBody && [requestParameters count] > 0) {
	  [self appendParameterString:url];
	}
  return url;
}

-(void) appendParameterString:(NSMutableString*) url {
  BOOL first = YES;
  NSEnumerator* enumerator = [requestParameters keyEnumerator];
  id key, value;
  while ((key = [enumerator nextObject])) {
	value = [requestParameters objectForKey:key];
	if (first) {
	  if (!self.useBody) {
		[url appendString:@"?"];
	  }
	  first = NO;
	} else {
	  [url appendString:@"&"];
	}

	if ([value isKindOfClass:[NSString class]]) {
	  [url appendString:HCHttpMethodURLEncode(key)];
	  [url appendString:@"="];
	  [url appendString:HCHttpMethodURLEncode(value)];
	} else if ([value isKindOfClass:[NSArray class]]) {
	  first = YES;
	  for (NSString* str in (NSArray*)value) {
		if (first) {
		  first = NO;
		} else {
		  [url appendString:@"&"];
		}
		[url appendString:HCHttpMethodURLEncode(key)];
		[url appendString:@"="];
		[url appendString:HCHttpMethodURLEncode(str)];
	  }
	  first = NO;
	}
  }
}

@end
