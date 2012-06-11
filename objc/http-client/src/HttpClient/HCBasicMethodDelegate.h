//
// HCBasicMethodDelegate.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:55:38 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __HCBASICMETHODDELEGATE_H_
#define __HCBASICMETHODDELEGATE_H_

#import "HCHttpMethod.h"

@interface HCBasicMethodDelegate : NSObject <HCMethodDelegate>

@property (nonatomic, retain) ResponseHandler responseHandler;

-(id) initWithHandler:(ResponseHandler)handler;

@end

#endif
