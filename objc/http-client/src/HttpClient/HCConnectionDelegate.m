//
// HCConnectionDelegate.m -
//
//
//
// Created by wooyoowaan@gmail.com on Mon Jun 11 14:43:42 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "HCConnectionDelegate.h"

#import <Foundation/NSURLResponse.h>
#import <Foundation/NSData.h>

#import "ARC.h"

@implementation HCConnectionDelegate

@synthesize ignoreCertificateCheck, contentsDelegate;;

-(id) initWithContentsDelegate:(id <HCContentsDelegate>) delegate {
  self = [super init];
  if (self != nil) {
	self.contentsDelegate = delegate;
	self.ignoreCertificateCheck = NO;
  }
  return self;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  [contentsDelegate handleResponse:connection didReceiveResponse:response];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [contentsDelegate handleData:connection didReceiveData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
  [contentsDelegate handleFinishLoading: connection];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  [contentsDelegate handleError:connection didFailWithError:error];
}


//
// SSL
//
- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
  if (self.ignoreCertificateCheck) {
	NSURLProtectionSpace * protectionSpace = [challenge protectionSpace];
	NSURLCredential* credentail = [NSURLCredential credentialForTrust:[protectionSpace serverTrust]];
	[[challenge sender] useCredential:credentail forAuthenticationChallenge:challenge];
	//[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
  } else {
	[[challenge sender] performDefaultHandlingForAuthenticationChallenge: challenge];
  }
}


@end
