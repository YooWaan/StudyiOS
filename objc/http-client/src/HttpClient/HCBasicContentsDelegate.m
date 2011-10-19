#import "HCBasicContentsDelegate.h"

@interface HCBasicContentsDelegate ()

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data;

-(void) runFinishLoading:(NSURLConnection *)connection;

@end

@implementation HCBasicContentsDelegate

-(void)handleData:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [self runHandle:connection didReceiveData:data];
}

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data{
  // NOOP
}

-(void)handleFinishLoading:(NSURLConnection *)connection {
  [self runFinishLoading: connection];
}

-(void) runFinishLoading:(NSURLConnection *)connection {
  // NOOP
}

@end
