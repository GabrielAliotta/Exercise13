//
//  TwitterTimeLine.m
//  Exercise13
//
//  Created by Gabriel Aliotta on 3/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TwitterTimeLine.h"


@implementation TwitterTimeLine

@synthesize tweets; 
NSXMLParser *xmlParser; 
NSMutableString *dataString; 
NSString *currentElement;

//-(void)dealloc{ 
//	[tweets release]; 
//	[super dealloc]; 
//} 

-(void) startLoadingTweets{ 
	tweets = [[NSMutableArray alloc] init]; 
	NSString *twitter = @"https://twitter.com/statuses/public_timeline.rss"; 
	NSURL *xmlURL = [NSURL URLWithString:twitter]; 
	xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL]; 
	xmlParser.delegate = self; 
	[xmlParser parse]; 
} 

- (void) parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
   namespaceURI:(NSString *)namespaceURI 
  qualifiedName:(NSString *)qName 
     attributes:(NSDictionary *)attributeDict{ 
	[dataString release]; 
	dataString = nil; 
	currentElement = [elementName copy]; 
	if ([elementName isEqualToString:@"title"]) { 
		dataString = [[NSMutableString alloc] init]; 
	} 
} 

- (void)parser:(NSXMLParser *)parser 
foundCharacters:(NSString *)string{ 
	
	if ([currentElement isEqualToString:@"title"]) 
		[dataString appendString:string]; 
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName{ 
	if ([elementName isEqualToString:@"title"]) { 
		[tweets addObject: dataString]; 
	} 
} 

@end
