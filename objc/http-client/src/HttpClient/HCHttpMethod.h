#ifndef HCHTTPMETHOD_H
#define HCHTTPMETHOD_H

#import <Foundation/Foundation.h>

#import "HCMethodDelegate.h"
#import "HCSession.h"


extern NSString * const HC_HTTP_METHOD_GET;
extern NSString * const HC_HTTP_METHOD_POST;
extern NSString * const HC_HTTP_METHOD_PUT;
extern NSString * const HC_HTTP_METHOD_DELETE;

@protocol HCHttpMethod <NSObject>

@required

-(void) setDelegate:(id <HCMethodDelegate>) delegate;

-(void) execute:(HCSession*) session;
-(void) executeAsynchronous:(HCSession*) session;

-(void) addParameters:(NSDictionary*) parameters;
-(void) addParameter:(NSString*) value parameterName:(NSString*) name;
-(void) removeParameter:(NSString*) name;
-(NSDictionary*) parameters;

-(NSString*) name;

@end

#endif
