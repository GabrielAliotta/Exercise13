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
@synthesize currentElement;
@synthesize dataString;

-(void)dealloc{ 
	[tweets release];
    [dataString release];
    [currentElement release];
	[super dealloc]; 
} 

-(void) startLoadingTweets{ 
	self.tweets = [[[NSMutableArray alloc] init] autorelease]; 
	NSString *twitter = @"https://twitter.com/statuses/public_timeline.rss"; 
	NSURL *xmlURL = [NSURL URLWithString:twitter];
    NSXMLParser *xmlParser = [[[NSXMLParser alloc] initWithContentsOfURL:xmlURL] autorelease]; 
	xmlParser.delegate = self; 
	[xmlParser parse];
} 

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
	self.currentElement = [elementName copy]; 
	if ([elementName isEqualToString:@"title"]) { 
		self.dataString = [[[NSMutableString alloc] init] autorelease]; 
	}
    
} 

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{ 
	
	if ([currentElement isEqualToString:@"title"]) 
		[dataString appendString:string]; 
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName{ 
	if ([elementName isEqualToString:@"title"]) { 
		[tweets addObject: dataString]; 
	} 
} 

@end
