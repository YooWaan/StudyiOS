#import "HCBasicXMLDelegate.h"

@implementation HCBasicXMLDelegate

- (id)init {
  if ((self = [super init]) != nil) {
	parseText = NO;
	textData = nil;
  }
  return self;
}

-(void) dealloc {
  if (textData != nil) {
	[textData release];
	textData = nil;
  }
  [super dealloc];
}

- (void)parser:(NSXMLParser *)parser foundCharacters: (NSString*)aString{
  if (parseText) {
	textData = [aString copy];
	//NSLog(@"characters ---> %@", aString);
  }
}

- (void)prepareText {
  parseText = YES;
  if (textData != nil) {
	[textData release];
  }
}

- (void)clearText {
  parseText = NO;
  [textData release];
  textData = nil;
}

- (BOOL)hasFoundText {
  if (parseText && textData != nil) {
	return YES;
  }
  return NO;
}


@end
