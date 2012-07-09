#ifndef HCRESTCLIENT_H
#define HCRESTCLIENT_H

#import "HCHttpClient.h"

#import "HCRestSession.h"
#import "HCXMLToDictionaryDelegate.h"
#import "HCAuthentication.h"

typedef enum hcMethodDelegateType {
  HCDataContentDelegateType = 1,
  HCFileContentDelegateType = 2
} HCMethodDelegateType;


@interface HCRestClient : HCClient <HCAuthentication>

#pragma mark GET METHOD

-(void) get:(NSString*)path withResponseHandler:(ResponseHandler)handler;

#pragma mark POST METHOD

-(void) post:(NSString*)path withResponseHandler:(ResponseHandler)handler;

-(void) post:(NSString*)path queryParameters:(NSDictionary*)parameters withResponseHandler:(ResponseHandler)handler;

-(void) post:(NSString*)path withBodyData:(NSData*)bodyData withResponseHandler:(ResponseHandler)handler;

-(void) post:(NSString*)path withBodyStream:(NSInputStream*)bodystream withResponseHandler:(ResponseHandler)handler;

#pragma mark PUT METHOD

-(void) put:(NSString*)path withResponseHandler:(ResponseHandler)handler;

-(void) put:(NSString*)path queryParameters:(NSDictionary*)parameters withResponseHandler:(ResponseHandler)handler;

-(void) put:(NSString*)path withBodyStream:(NSInputStream*)bodystream withResponseHandler:(ResponseHandler)handler;

-(void) put:(NSString*)path withBodyData:(NSData*)bodyData withResponseHandler:(ResponseHandler)handler;

#pragma mark DELETE METHOD

-(void) delete:(NSString*)path withResponseHandler:(ResponseHandler)handler;

@end

#endif
