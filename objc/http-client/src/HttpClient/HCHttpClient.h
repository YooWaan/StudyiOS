#ifndef HCHTTPCLIENT_H
#define HCHTTPCLIENT_H

#import <Foundation/NSObject.h>

#import "HCHttpMethod.h"
#import "HCSession.h"
#import "HCGetMethod.h"
#import "HCPostMethod.h"
#import "HCPutMethod.h"
#import "HCDeleteMethod.h"
#import "HCDataContentsDelegate.h"
#import "HCFileContentsDelegate.h"

@interface HCHttpClient : NSObject
{
 @protected
  HCSession* activeSession;
}

-(id) initWithSession:(HCSession*)session;

-(HCSession*) session;

-(void) communicate:(id <HCHttpMethod>) withMethod;

@end

#endif
