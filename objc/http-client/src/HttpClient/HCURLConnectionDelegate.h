#ifndef HCURLCONNECTIONDELEGATE_H
#define HCURLCONNECTIONDELEGATE_H

#import <Foundation/NSObject.h>
#import <Foundation/NSURLConnection.h>
#import <Foundation/NSURLResponse.h>
#import <Foundation/NSData.h>

#import "HCContentsDelegate.h"

@interface HCURLConnectionDelegate : NSObject <NSURLConnectionDelegate> {

  id <HCContentsDelegate> contentsDelegate;

}

-(id) initWithContentsDelegate:(id <HCContentsDelegate>) delegate;

@end

#endif
