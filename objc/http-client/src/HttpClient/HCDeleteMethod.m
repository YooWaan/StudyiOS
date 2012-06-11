//
// HCDeleteMethod.m -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 15:36:09 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "HCDeleteMethod.h"

@implementation HCDeleteMethod

-(NSString*) name {
  return HC_HTTP_METHOD_DELETE;
}

-(BOOL) useBody {
  return NO;
}

@end
