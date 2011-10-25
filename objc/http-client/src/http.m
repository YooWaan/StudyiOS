#import <Foundation/Foundation.h>

#import "HCRestClient.h"


@interface SampleClient : HCRestClient
{
}

-(NSDictionary*) list;

@end

@implementation SampleClient

-(NSDictionary*) list {

  __block NSDictionary* list = nil;

  [self get:@"list.xml" withResponseHandler:^(id contents, NSError* err) {
		NSData* data = (NSData*)contents;
		NSXMLParser* parser = [[[NSXMLParser alloc] initWithData:data] autorelease];
		HCXMLToDictionaryDelegate* delegate = [[[HCXMLToDictionaryDelegate alloc] init] autorelease];
		[parser setDelegate:delegate];
		[parser parse];
		list = [delegate data];
	}];

  return list;
}

@end

void printDictionary(NSDictionary* data);
void printArray(NSArray* data);

void printDictionary(NSDictionary* data) {
  NSLog(@"--- PMap ---");
  NSEnumerator *enumerator = [data keyEnumerator];
  id key, value;
  while ((key = [enumerator nextObject])) {
	value = [data objectForKey:key];
	if (key == HC_XML_DICTIONARY_PARENT_KEY) {
	  //	if ([key isEqualToString:HC_XML_DICTIONARY_PARENT_KEY]) {
	  continue;
	} if ([value isKindOfClass:[NSDictionary class]]) {
	  printDictionary(value);
	} else if ([value isKindOfClass:[NSArray class]]) {
	  printArray(value);
	} else {
	  NSLog(@"%@", value);
	}
  }
}

void printArray(NSArray* data) {
  NSLog(@"--- PArray ---");
  NSEnumerator *enumerator = [data objectEnumerator];
  id anObject;
  while ((anObject = [enumerator nextObject])) {
	if ([anObject isKindOfClass:[NSDictionary class]]) {
	  printDictionary(anObject);
	} else {
	  NSLog(@"%@", anObject);
	}
  }
}

void runHttpClient() {
  HCSession* session = [[[HCSession alloc] initWithConnection:@"192.168.5.160"
												specifiedPort:80
											   webContextPath:@"/data"
												   secureFlag:NO] autorelease];

  SampleClient* client = [[[SampleClient alloc] initWithSession:session] autorelease];

  NSDictionary* list = [client list];

  printDictionary(list);
  //NSLog(@"List size ==== [%d] %@", [list count], [list description]);

  /*
  HCHttpClient* client = [[[HCHttpClient alloc] initWithSession:session] autorelease];
  HCDataContentsDelegate* delegate = [[[HCDataContentsDelegate alloc] init] autorelease];
  HCGetMethod* method = [[[HCGetMethod alloc] initWithPathAndDelegate:@"list.xml" withMethodDelegate:delegate] autorelease];
  [client communicate:method];

  NSString* str = [[[NSString alloc] initWithData:[delegate contents] encoding:NSUTF8StringEncoding] autorelease];
  NSLog(@"%@", str);
  */
}


int main(int argc, char ** argv) {
  id pool = [[NSAutoreleasePool alloc] init];

  runHttpClient();


  [pool release];
  return 0;
}
