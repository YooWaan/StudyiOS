#ifndef HCBASICMETHOD_H
#define HCBASICMETHOD_H

#import <Foundation/Foundation.h>

#import "HCMethodDelegate.h"
#import "HCHttpMethod.h"

@interface HCBasicMethod : NSObject <HCHttpMethod>
{
 @protected
  NSString* pathForRequest;
  id <HCMethodDelegate> methodDelegate;
  NSMutableDictionary* requestParameters;
}

-(id)initWithPathAndDelegate:(NSString*)path withMethodDelegate:(id <HCMethodDelegate>) delegate;

-(void)executeMethod:(HCSession*) session asynchronous:(BOOL) async;

-(NSURLRequest*) URLRequest:(HCSession*) session;

-(BOOL) useBody;

@end

#endif
