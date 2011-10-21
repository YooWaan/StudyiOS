#import "HCBasicMethodDelegate.h"

@interface HCBasicMethodDelegate ()

-(void) runCustomizeURLRequest:(NSURLRequest*) request;

-(void) runHandleResponse:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response;

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data;

-(void) runFinishLoading:(NSURLConnection *)connection;

-(void) runHandleError:(NSURLConnection *)connection didFailWithError:(NSError *)error;

@end

@implementation HCBasicMethodDelegate

-(id) init {
  if ((self = [super init]) != nil) {
	methodState = HCMethodInitialized;
	httpStatus = -1;
	ns_error = nil;
	errorCode = -1;
	errorMessage = nil;
	responseHandler = nil;
  }
  return self;
}

-(id) initWithHandler:(ResponseHandler)handler {
  if ((self = [self init]) != nil) {
	responseHandler = [handler copy];
  }
  return self;
}

-(void) dealloc {
  if (ns_error != nil) {
	[ns_error release];
  }
  if (errorMessage != nil) {
	[errorMessage release];
  }
  if (responseHandler != nil) {
	[responseHandler release];
  }
  [super dealloc];
}

#pragma mark -
#pragma mark HCMethodCondition

-(HCMethodState) status {
  return methodState;
}

-(NSInteger) HttpStatus {
  return httpStatus;
}

-(NSError*) error {
  return ns_error;
}

-(NSInteger) errorCode {
  return errorCode;;
}

-(NSString*) errorMessage {
  return errorMessage;
}

-(id) ResponseContents {
  return nil;
}

#pragma mark -
#pragma mark HCHttpMethod

-(void) customizeURLRequest:(NSURLRequest*) request {
  [self runCustomizeURLRequest:request];
}

-(void) runCustomizeURLRequest:(NSURLRequest*)request {
  // NOOP
}

#pragma mark -
#pragma mark HCResponseHandle

-(void) onFinishMethodExecuting {
  //NSLog(@"onFinish %@", responseHandler);
  if (responseHandler != nil) {
	if (ns_error == nil) {
	  responseHandler([self ResponseContents], ns_error);
	} else {
	  responseHandler(nil, ns_error);
	}
  }
}

#pragma mark -
#pragma mark HCHttpMethodDelegate

-(void)handleResponse:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  methodState = HCMethodRunning;
  NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
  httpStatus = [httpResponse statusCode];
  [self runHandleResponse:connection didReceiveResponse:httpResponse];
}

-(void) runHandleResponse:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response {
  // NOOP
}

-(void)handleData:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [self runHandle:connection didReceiveData:data];
}

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data{
  // NOOP
}

-(void)handleFinishLoading:(NSURLConnection *)connection {
  methodState = HCMethodDone;
  [self runFinishLoading: connection];
}

-(void) runFinishLoading:(NSURLConnection *)connection {
  [self onFinishMethodExecuting];
}

-(void)handleError:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  [self runHandleError:connection didFailWithError:error];
}

-(void) runHandleError:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  [ns_error autorelease];
  ns_error = [error retain];
  [self onFinishMethodExecuting];
}

@end
