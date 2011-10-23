#import "HCRestClient.h"

@interface HCRestClient ()

-(HCDataContentsDelegate*) contentsDelegate:(HCMethodDelegateType)type withResponseHandler:(ResponseHandler)handler;

@end

@implementation HCRestClient

-(HCAuthenticationState) login {
  return kHCFailedAuthentication;
}

-(HCAuthenticationState) logout {
  return kHCFailedAuthentication;
}

-(HCDataContentsDelegate*) contentsDelegate:(HCMethodDelegateType) type withResponseHandler:(ResponseHandler)handler {
  switch (type) {
  case HCDataContentDelegate:
	return [[[HCDataContentsDelegate alloc] initWithHandler:handler] autorelease];
  case HCFileContentDelegate:
	return [[[HCFileContentsDelegate alloc] initWithHandler:handler] autorelease];
  }
  return nil;
}

#pragma mark GET METHOD

-(void) get:(NSString*)path withResponseHandler:(ResponseHandler)handler {
  HCGetMethod* method = [[[HCGetMethod alloc]
						   initWithPathAndDelegate:path
								withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						  ] autorelease];
  [self communicate:method];
}

#pragma mark POST METHOD

-(void) post:(NSString*)path withResponseHandler:(ResponseHandler)handler {
  HCPostMethod* method = [[[HCPostMethod alloc]
							initWithPathAndDelegate:path
								 withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						   ] autorelease];
  [self communicate:method];
}

-(void) post:(NSString*)path withBodyStream:(NSInputStream*)bodystream withResponseHandler:(ResponseHandler)handler {
  HCPostMethod* method = [[[HCPostMethod alloc]
							initWithPathAndDelegate:path
								 withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						   ] autorelease];
  [method setBodyStream:bodystream];
  [self communicate:method];
}

-(void) post:(NSString*)path withBodyData:(NSData*)bodyData withResponseHandler:(ResponseHandler)handler {
  HCPostMethod* method = [[[HCPostMethod alloc]
							initWithPathAndDelegate:path
								 withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						   ] autorelease];
  [method setBody:bodyData];
  [self communicate:method];
}

-(void) post:(NSString*)path queryParameters:(NSDictionary*)parameters withResponseHandler:(ResponseHandler)handler {
  HCPostMethod* method = [[[HCPostMethod alloc]
							initWithPathAndDelegate:path
								 withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						   ] autorelease];
  [method addParameters:parameters];
  [self communicate:method];
}

#pragma mark PUT METHOD

-(void) put:(NSString*)path withResponseHandler:(ResponseHandler)handler {
  HCPutMethod* method = [[[HCPutMethod alloc]
							initWithPathAndDelegate:path
								 withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						   ] autorelease];
  [self communicate:method];
}

-(void) put:(NSString*)path withBodyStream:(NSInputStream*)bodystream withResponseHandler:(ResponseHandler)handler {
  HCPutMethod* method = [[[HCPutMethod alloc]
							initWithPathAndDelegate:path
								 withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						   ] autorelease];
  [method setBodyStream:bodystream];
  [self communicate:method];
}

-(void) put:(NSString*)path withBodyData:(NSData*)bodyData withResponseHandler:(ResponseHandler)handler {
  HCPutMethod* method = [[[HCPutMethod alloc]
							initWithPathAndDelegate:path
								 withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						   ] autorelease];
  [method setBody:bodyData];
  [self communicate:method];
}

-(void) put:(NSString*)path queryParameters:(NSDictionary*)parameters withResponseHandler:(ResponseHandler)handler {
  HCPutMethod* method = [[[HCPutMethod alloc]
							initWithPathAndDelegate:path
								 withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						   ] autorelease];
  [method addParameters:parameters];
  [self communicate:method];
}

#pragma mark DELETE METHOD

-(void) delete:(NSString*)path withResponseHandler:(ResponseHandler)handler {
  HCDeleteMethod* method = [[[HCDeleteMethod alloc]
						   initWithPathAndDelegate:path
								withMethodDelegate:[self contentsDelegate:HCDataContentDelegate withResponseHandler:handler]
						  ] autorelease];
  [self communicate:method];
}



@end
