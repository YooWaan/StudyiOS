#ifndef CONTENTSDELEGATE_H
#define CONTENTSDELEGATE_H

#import <Foundation/Foundation.h>

@protocol HCContentsDelegate <NSObject>

@required

-(void)handleData:(NSURLConnection *)connection didReceiveData:(NSData *)data;

-(void)handleFinishLoading:(NSURLConnection *)connection;

@end

#endif
