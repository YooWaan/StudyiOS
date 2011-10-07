#ifndef XMLCONTENTSDELEGATE_H
#define XMLCONTENTSDELEGATE_H

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSXMLParser.h>
#import <Foundation/NSDictionary.h>

@interface XMLContentsDelegate : NSObject {
@protected
  NSString* textData;
  BOOL parseText;
}

- (void)parser:(NSXMLParser *)parser
  didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
  attributes:(NSDictionary *)attributeDict;

- (void)parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName;

- (void)parser:(NSXMLParser *)parser
  foundCharacters:(NSString *)aString;

- (void) prepareText;
- (void) clearText;
- (BOOL) hasFoundText;

@end

#endif
