#ifndef HCMETHODDELEGATE_H
#define HCMETHODDELEGATE_H

#import <Foundation/Foundation.h>

#import "HCMethodCondition.h"
#import "HCContentsDelegate.h"
#import "HCResponseHandle.h"

typedef enum hcMethodDelegateType {
  HCDataContentDelegate = 1,
  HCFileContentDelegate = 2
} HCMethodDelegateType;


@protocol HCMethodDelegate <HCContentsDelegate,HCMethodCondition,HCResponseHandle>

-(void) customizeURLRequest:(NSURLRequest*) request;

@end

#endif
