
#import <Foundation/NSDictionary.h>

#import "XMLContentsDelegate.h"


@implementation XMLContentsDelegate

- (id)init {
  self = [super init];
  parseText = NO;
  return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

}

- (void)parser:(NSXMLParser *)parser foundCharacters: (NSString*)aString{
  if (parseText) {
	textData = aString;
  }
}

- (void)prepareText {
  parseText = YES;
  textData = nil;
}

- (void)clearText {
  parseText = NO;
  textData = nil;
}

- (BOOL)hasFoundText {
  if (parseText && textData != nil) {
	return YES;
  }
  return NO;
}

@end
