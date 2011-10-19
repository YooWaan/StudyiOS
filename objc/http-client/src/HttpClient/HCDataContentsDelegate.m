#import "HCDataContentsDelegate.h"


@implementation HCDataContentsDelegate

-(id) init {
  if ((self = [super init]) != nil) {
	contentsData = [[NSData alloc] init];
  }
  return self;
}

-(void) dealloc {
  [contentsData release];
  [super dealloc];
}

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data{
  [contentsData appendData:data];
}

-(NSData*) contents {
  return contentsData;
}

@end
