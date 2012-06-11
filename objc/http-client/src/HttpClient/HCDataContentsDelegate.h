//
// HCDataContentsDelegate.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 15:13:02 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __HCDATACONTENTSDELEGATE_H_
#define __HCDATACONTENTSDELEGATE_H_

#import "HCBasicMethodDelegate.h"

@interface HCDataContentsDelegate : HCBasicMethodDelegate
{
 @protected
  NSMutableData* contentsData;
}

-(NSData*) contents;

@end

#endif
