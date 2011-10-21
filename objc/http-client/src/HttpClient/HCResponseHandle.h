#ifndef HCRESPONSEHANDLE_H
#define HCRESPONSEHANDLE_H

#import <Foundation/Foundation.h>

typedef void (^ResponseHandler)(id, NSError*);

@protocol HCResponseHandle <NSObject>

-(void) onFinishMethodExecuting;

@end

#endif
