#import "HCXMLToDictionaryDelegate.h"

NSString * const HC_XML_DICTIONARY_PARENT_KEY = @"hc:xml:dictionary:parent:key";
NSString * const HC_XML_TEXT_NODE_KEY = @"#text";

NSDictionary* HCXMLDictionaryfindParentNode(NSDictionary* target) {
  return [target objectForKey:HC_XML_DICTIONARY_PARENT_KEY];
}

@interface HCXMLToDictionaryDelegate ()

-(void) appendChildNode:(NSString*)keyName parentNode:(NSMutableDictionary*) parent childNode:(id)child;
-(void) removeChildNode:(NSString*)keyName targetNode:(NSMutableDictionary*) target ;

@end


@implementation HCXMLToDictionaryDelegate

-(id) init {
  if ((self = [super init]) != nil) {
	rootNode = [[[NSMutableDictionary alloc] init] autorelease];
	currentNode = rootNode;
  }
  return self;
}

/*
-(void) dealloc {
  [rootNode release];
  [super dealloc];
}
*/

-(NSDictionary*) data {
  return rootNode;
}

//- (void)parserDidStartDocument {}

- (void)parserDidEndDocument {
  currentNode = nil;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
  NSMutableDictionary* node = [[[NSMutableDictionary alloc] init] autorelease];
  // attribute
  if ([attributeDict count] > 0) {
	[node setDictionary:attributeDict];
  }
  //NSLog(@"StartElement --> %@", elementName);
  [self appendChildNode:elementName parentNode:currentNode childNode:node];
  [node setObject:currentNode forKey:HC_XML_DICTIONARY_PARENT_KEY];
  currentNode = node;
  //NSLog(@"findParent:%d", HCXMLDictionaryfindParentNode(node) != nil ? YES : NO);
  [self prepareText];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
  //NSLog(@"EndEL: %@", elementName);

  NSMutableDictionary* parent = (NSMutableDictionary*)HCXMLDictionaryfindParentNode(currentNode);

  //NSLog(@"Parent: %d", parent != nil ? YES : NO);

  if ([super hasFoundText]) {
	//NSLog(@"hasTextData -------: %@ [%@]", elementName, textData);

	if ([currentNode count] == 1 && currentNode != rootNode) {
	  [self removeChildNode:elementName targetNode:parent ];
	  [self appendChildNode:elementName parentNode:parent childNode:textData];
	} else {
	  [currentNode setObject:textData forKey:HC_XML_TEXT_NODE_KEY];
	}
  }
  [self clearText];
  currentNode = parent;
}

-(void) appendChildNode:(NSString*)keyName parentNode:(NSMutableDictionary*) parent childNode:(id)child {
  id value = [parent objectForKey:keyName];
  //NSLog(@"add: %@ -- %@", keyName, value);
  if (value == nil) {
	[parent setObject:child forKey:keyName];
	return;
  }

  // ARRAY
  NSMutableArray* array = nil;
  if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSMutableDictionary class]]) {
	array = [[[NSMutableArray alloc] init] autorelease];
	[array addObject:value];
	[parent setObject:array forKey:keyName];
  } else if ([value isKindOfClass:[NSMutableArray class]]) {
	array = (NSMutableArray*)value;
  }

  if (array != nil) {
	[array addObject:child];
  }
}

-(void) removeChildNode:(NSString*)keyName targetNode:(NSMutableDictionary*) target {
  id value = [target objectForKey:keyName];
  if (value != nil) {
	if ([value isKindOfClass:[NSMutableArray class]]) {
	  NSMutableArray* array = (NSMutableArray*)value;
	  [array removeLastObject];
	} else {
	  [target removeObjectForKey:keyName];
	}
  }
}

@end
