#ifndef CONTENTSDELEGATE_H
#define CONTENTSDELEGATE_H

#import <Foundation/Foundation.h>

@protocol HCContentsDelegate <NSObject>

@required

-(void)handleResponse:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;

-(void)handleData:(NSURLConnection *)connection didReceiveData:(NSData *)data;

-(void)handleFinishLoading:(NSURLConnection *)connection;

-(void)handleError:(NSURLConnection *)connection didFailWithError:(NSError *)error;


@end

#endif
