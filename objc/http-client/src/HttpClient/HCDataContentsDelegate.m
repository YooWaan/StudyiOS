//
// HCDataContentsDelegate.m -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 15:13:38 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "HCDataContentsDelegate.h"

#import <Foundation/Foundation.h>

#import "ARC.h"

@implementation HCDataContentsDelegate

-(id) init {
  if ((self = [super init]) != nil) {
	contentsData = RETAIN([[NSMutableData alloc] init]);
  }
  return self;
}


#ifdef ARC_OFF
-(void) dealloc {
  [contentsData release];
  [super dealloc];
}
#endif

-(void) runHandle:(NSURLConnection *)connection didReceiveData:(NSData *)data{
  [contentsData appendData:data];
}

-(id) ResponseContents {
  return [self contents];
}

-(NSData*) contents {
  return contentsData;
}

@end
