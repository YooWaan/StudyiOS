#ifndef HCMETHODRESULT_H
#define HCMETHODRESULT_H

#import <Foundation/Foundation.h>

typedef enum hcMethodState {
  HCMethodInitialized = 0,
  HCMethodRunning = 1,
  HCMethodDone = 2
} HCMethodState;


@protocol HCMethodCondition <NSObject>

@required

-(HCMethodState)status;
-(NSInteger) HttpStatus;

-(NSError*) error;
-(NSInteger) errorCode;
-(NSString*) errorMessage;

-(id) ResponseContents;

@end

#endif
