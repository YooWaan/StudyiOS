//
// HCConnectionDelegate.h -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:42:13 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __HCCONNECTIONDELEGATE_H_
#define __HCCONNECTIONDELEGATE_H_

#import <Foundation/NSObject.h>
#import <Foundation/NSURLConnection.h>

#import "HCHttpMethod.h"

@interface HCConnectionDelegate : NSObject <NSURLConnectionDelegate>

@property (nonatomic) BOOL ignoreCertificateCheck;
@property (nonatomic, assign) id <HCContentsDelegate> contentsDelegate;

-(id) initWithContentsDelegate:(id <HCContentsDelegate>) delegate;

@end


#endif
