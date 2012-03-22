//
//  TwitterTimeLine.h
//  Exercise13
//
//  Created by Gabriel Aliotta on 3/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TwitterTimeLine : NSObject <NSXMLParserDelegate> {
    
}

@property (nonatomic, retain) NSMutableArray *tweets;
@property (nonatomic, retain) NSMutableString *dataString; 
@property (nonatomic, retain) NSString *currentElement;

-(void) startLoadingTweets;

@end
