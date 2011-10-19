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

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

@end

#endif
