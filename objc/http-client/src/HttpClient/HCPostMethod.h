//
// HCPostMethod.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 15:25:34 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __HCPOSTMETHOD_H_
#define __HCPOSTMETHOD_H_

#import "HCBasicMethod.h"

@interface HCPostMethod : HCBasicMethod

@property (nonatomic, assign) NSData* bodyData;
@property (nonatomic, assign) NSInputStream* bodyStream;

@end

#endif
