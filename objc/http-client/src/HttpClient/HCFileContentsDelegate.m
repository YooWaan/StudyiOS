//
// HCFileContentsDelegate.m -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 15:19:53 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "HCFileContentsDelegate.h"

#import "ARC.h"

@implementation HCFileContentsDelegate

@synthesize filepath;

-(id) initWithHandler:(ResponseHandler)handler {
  if ((self = [super initWithHandler:handler]) != nil) {
	fileHandle = nil;
  }
  return self;
}

/*
-(id) initWithFilepath:(NSString*) path {
  if ((self = [super init]) != nil) {
	filePath = [path copy];
	fileHandle = nil;
  }
  return self;
}
*/

#ifdef ARC_OFF
-(void) dealloc {
  if (fileHandle != nil) {
	[fileHandle release];
  }
  [super dealloc];
}
#endif

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data{
  if (fileHandle == nil) {
	NSFileManager* manager = [NSFileManager defaultManager];
	fileHandle = RETAIN([NSFileHandle fileHandleForWritingAtPath:self.filepath]);
	if (fileHandle == nil) {
	  [manager createFileAtPath:self.filepath contents:nil attributes:nil];
	  fileHandle = RETAIN([NSFileHandle fileHandleForWritingAtPath:self.filepath]);
	}
	if ([[NSFileManager defaultManager] fileExistsAtPath:self.filepath]) {
	  [fileHandle seekToEndOfFile];
	}
  }
  [fileHandle writeData:data];
}

-(void) runFinishLoading:(NSURLConnection *)connection {
  if (fileHandle != nil) {
	[fileHandle closeFile];
	RELEASE(fileHandle);
	fileHandle = nil;
  }
  [self onFinishMethodExecuting];
}

-(void) runHandleError:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  if (fileHandle != nil) {
	[fileHandle closeFile];
	RELEASE(fileHandle);
	fileHandle = nil;
  }
  self.httpError = error;
  [self onFinishMethodExecuting];
}

-(id) ResponseContents {
  return [self inputstream];
}

-(NSInputStream*) inputstream {
  return [NSInputStream inputStreamWithFileAtPath:self.filepath];
}

-(NSData*) load {
  return [NSData dataWithContentsOfFile:self.filepath];
}

@end
