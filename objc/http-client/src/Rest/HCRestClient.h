#ifndef HCRESTCLIENT_H
#define HCRESTCLIENT_H

#import "HCHttpClient.h"

#import "HCRestSession.h"
#import "HCXMLToDictionaryDelegate.h"

typedef enum hcAuthenticationState {
  kHCSuccessAuthentication = 1,
  kHCFailedAuthentication  = 2,
  kHCAlreadyLogin          = 3,
  kHCAlreadyLogout         = 4
} HCAuthenticationState;


@interface HCRestClient : HCHttpClient
{

}

-(HCAuthenticationState) login;

-(HCAuthenticationState) logout;

@end

#endif
