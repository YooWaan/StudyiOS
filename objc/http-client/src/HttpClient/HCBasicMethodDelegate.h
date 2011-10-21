#ifndef HCBASICCONTENTSDELEGATE_H
#define HCBASICCONTENTSDELEGATE_H

#import "HCMethodDelegate.h"

@interface HCBasicMethodDelegate : NSObject <HCMethodDelegate> {
  HCMethodState methodState;
  NSInteger httpStatus;
  NSError* ns_error;
  NSInteger errorCode;
  NSString* errorMessage;
  ResponseHandler responseHandler;
}

-(id) initWithHandler:(ResponseHandler)handler;

/*
-(void)handleData:(NSURLConnection *)connection didReceiveData:(NSData *)data;
-(void)handleFinishLoading:(NSURLConnection *)connection;
*/

@end

#endif
