
/*
#import <Foundation/Foundation.h>
#import <GNUstepBase/GSConfig.h>
*/

#import <Foundation/NSObject.h>
#import <Foundation/NSURL.h>
#import <Foundation/NSURLConnection.h>
#import <Foundation/NSConnection.h>
#import <Foundation/NSURLRequest.h>
#import <Foundation/NSURLResponse.h>
#import <Foundation/NSData.h>
#import <Foundation/NSObjCRuntime.h>
#import <Foundation/NSString.h>
#import <Foundation/NSRunLoop.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSXMLParser.h>
#import <Foundation/NSError.h>

#import "HttpMethod.h"
#import "BasicMethod.h"
#import "XMLContentsDelegate.h"

@interface HttpDelegate : NSObject {
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
//- (void)connectionDidFinishLoading: (NSURLConnection *)connection;
@end

@implementation HttpDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  NSLog(@"didReceiveResponse");
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  NSLog(@"didReceiveData");

  NSString * str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

  NSLog(str);

}

/*
- (void)connectionDidFinishLoading: (NSURLConnection *)connection {
  NSLog(@"connectionDidFinishLoading");
}
*/

@end

/*!
 *
 */
@interface ListContentsDelegate : XMLContentsDelegate {
@protected
  NSMutableArray* list;
}

-(id) initWithArray:(NSArray*) array;

@end


/*!
 *
 */
@implementation ListContentsDelegate

-(id) initWithArray:(NSMutableArray*) array {
  self = [super init];
  if (self != nil) {
	list = array;
  }
  return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
  if ([elementName isEqualToString:@"item"]) {
	id item = [[NSMutableDictionary alloc] init];
	[list addObject: item];
  } else if ([elementName isEqualToString:@"id"] || [elementName isEqualToString:@"name"]) {
	[self prepareText];
  }
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
  if ([elementName isEqualToString:@"id"] || [elementName isEqualToString:@"name"]) {
	if ([self hasFoundText]) {
	  id item = [list lastObject];
	  [item setObject:textData forKey:elementName];
	}
	[self clearText];
  }
}

@end



@implementation BasicMethod

-(void) execute {

  NSLog(@"execute");

  NSURLRequest *req;
  NSURLResponse *response;
  NSError *err;
  req = [[NSURLRequest alloc]
		  initWithURL:[NSURL URLWithString:@"http://192.168.5.164/data/lst.xml"]];

  NSData* xml = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&err];

  /*
  id connection = [[NSURLConnection alloc] initWithRequest: req delegate: nil];
  if (connection == nil) {
  */
  if (xml == nil) {
	NSLog(@"execute : connection is nil");
	return;
  }
  [[NSRunLoop currentRunLoop] run];

  NSMutableArray* list = [[NSMutableArray alloc] init];
  ListContentsDelegate* listDelegate = [[ListContentsDelegate alloc] initWithArray: list];
  NSString * str = [[NSString alloc] initWithData:xml encoding:NSUTF8StringEncoding];
  NSLog(str);

  id parser = [[NSXMLParser alloc] initWithData: xml];
  [parser setDelegate: listDelegate];

  if (![parser parse]) {
	NSLog(@"Failed parse");
  }

  NSLog([NSString stringWithFormat:@"Size[%d]",[list count]]);



  /*
  HttpDelegate *delegate = [HttpDelegate alloc];
  */
}

@end
