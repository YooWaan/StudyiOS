#import "HCFileContentsDelegate.h"


@implementation HCFileContentsDelegate

-(id) initWithFilepath:(NSString*) path {
  if ((self = [super init]) != nil) {
	filePath = [path copy];
	fileHandle = nil;
  }
  return self;
}


-(void) dealloc {
  [filePath release];
  [super dealloc];
}

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data{
  if (fileHandle == nil) {
	fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
	if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
	  [fileHandle seekToEndOfFile];
	}
  }
  [fileHandle writeData:data];
}

-(void) runFinishLoading:(NSURLConnection *)connection {
  if (fileHandle != nil) {
	[fileHandle closeFile];
  }
  [self onFinishMethodExecuting];
}

-(void) runHandleError:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  if (fileHandle != nil) {
	[fileHandle closeFile];
  }
  [ns_error autorelease];
  ns_error = [error retain];
  [self onFinishMethodExecuting];
}

-(id) ResponseContents {
  return [self inputstream];
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
