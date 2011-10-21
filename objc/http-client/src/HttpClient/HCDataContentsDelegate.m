#import "HCDataContentsDelegate.h"


@implementation HCDataContentsDelegate

-(id) init {
  if ((self = [super init]) != nil) {
	contentsData = [[NSMutableData alloc] init];
  }
  return self;
}

-(void) dealloc {
  [contentsData release];
  [super dealloc];
}

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data{
  //NSLog(@"runHandle---> %@", data);
  [contentsData appendData:data];
}

-(id) ResponseContents {
  return [self contents];
}

-(NSData*) contents {
  return contentsData;
}

@end
