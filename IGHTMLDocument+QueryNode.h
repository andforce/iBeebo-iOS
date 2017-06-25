//
//  IGHTMLDocument+QueryNode.h
//
//  Created by 迪远 王 on 16/3/26.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import <IGHTMLQuery/IGHTMLQuery.h>

@interface IGHTMLDocument (QueryNode)

- (IGXMLNode *)queryNodeWithXPath:(NSString *)xpath;

- (IGXMLNode *)queryNodeWithClassName:(NSString *)name;

@end
