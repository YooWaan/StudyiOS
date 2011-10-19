#ifndef HCBASICMETHOD_H
#define HCBASICMETHOD_H

#import <Foundation/Foundation.h>

#import "HCContentsDelegate.h"
#import "HCHttpMethod.h"

@interface HCBasicMethod : NSObject <HCHttpMethod>
{
 @protected
  NSString* pathForRequest;
  id <HCContentsDelegate> handleContentsDelegate;
  NSMutableDictionary* requestParameters;
}

-(id)initWithPathAndDelegate:(NSString*)path contentsDelegate:(id <HCContentsDelegate>) delegate;

-(void) setDelegate:(id <HCContentsDelegate>)contentsDelegate;

-(void) execute:(HCSession*) sesssion;

@end

#endif
