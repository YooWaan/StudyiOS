//
// ARC.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:24:07 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __ARC_H_
#define __ARC_H_

#if __has_feature(objc_arc)
#define AUTORELEASE(A) A
#define RETAIN(A) A
#define RELEASE(A) 
#define ARC_ON
#else
#define AUTORELEASE(A) [A autorelease]
#define RETAIN(A) [A retain]
#define RELEASE(A) [A release]
#define ARC_OFF
#endif


#endif
