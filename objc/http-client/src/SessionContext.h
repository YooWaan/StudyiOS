#ifndef SESSIONCONTEXT_H
#define SESSIONCONTEXT_H

#include <Foundation/NSObject.h>
#include <Foundation/NSString.h>

@interface SessionContext : NSObject
{
@protected

unsigned int port;
/*
NSString *username;
MSString *password;
*/
}


- (unsigned int) getPort;


@end

#endif
