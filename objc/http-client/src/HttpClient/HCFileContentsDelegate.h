//
// HCFileContentsDelegate.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 15:19:00 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __HCFILECONTENTSDELEGATE_H_
#define __HCFILECONTENTSDELEGATE_H_

#import "HCBasicMethodDelegate.h"

@interface HCFileContentsDelegate : HCBasicMethodDelegate
{
 @protected
  NSFileHandle* fileHandle;
}

//-(id) initWithFilepath:(NSString*) path;

@property (nonatomic,assign) NSString* filepath;

-(NSInputStream*) inputstream;

-(NSData*) load;

@end


#endif
