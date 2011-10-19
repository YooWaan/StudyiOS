#import "HCFileContentsDelegate.h"


@implementation HCFileContentsDelegate


-(id) initWithFilepath:(NSString*) path {
  if ((self = [super init]) != nil) {
	filePath = [[path copy] autorelease];
  }
  return self;
}


-(void) dealloc {
  [filePath release];
  [super dealloc];
}

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data{
  [data writeToFile:filePath atomically:YES];
}

-(NSString*) filepath {
  return filePath;
}

-(NSInputStream*) inputstream {
  return [NSInputStream inputStreamWithFileAtPath:filePath];
}

-(NSData*) load {
  return [NSData dataWithContentsOfFile:filePath];
}

@end
