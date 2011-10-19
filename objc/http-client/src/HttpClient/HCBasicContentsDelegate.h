#ifndef HCBASICCONTENTSDELEGATE_H
#define HCBASICCONTENTSDELEGATE_H

#import <Foundation/NSObject.h>
#import <Foundation/NSURLConnection.h>
#import <Foundation/NSData.h>

#import "HCContentsDelegate.h"

@interface HCBasicContentsDelegate : NSObject <HCContentsDelegate>

-(void)handleData:(NSURLConnection *)connection didReceiveData:(NSData *)data;

-(void)handleFinishLoading:(NSURLConnection *)connection;

@end

#endif
