#ifndef HCXMLTODICTIONARYDELEGATE_H
#define HCXMLTODICTIONARYDELEGATE_H

#import "HCBasicXMLDelegate.h"

extern NSString * const HC_XML_DICTIONARY_PARENT_KEY;
extern NSString * const HC_XML_TEXT_NODE_KEY;

NSDictionary* HCXMLDictionaryfindParentNode(NSDictionary* target);


@interface HCXMLToDictionaryDelegate : HCBasicXMLDelegate
{
  NSMutableDictionary* currentNode;
  NSMutableDictionary* rootNode;
}

-(NSDictionary*) data;

@end

#endif
