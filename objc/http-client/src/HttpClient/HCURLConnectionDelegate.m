#import "HCURLConnectionDelegate.h"

@implementation HCURLConnectionDelegate

-(id) initWithContentsDelegate:(id <HCContentsDelegate>) delegate {
  self = [super init];
  if (self != nil) {
	contentsDelegate = delegate;
  }
  return self;
}

/*
-(void) dealloc {
  contentsDelegate = nil;
  [super dealloc];
}
*/

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  


}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [contentsDelegate handleData:connection didReceiveData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
  [contentsDelegate handleFinishLoading: connection];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {

}


@end
