//
//  Exercise13ViewController.h
//  Exercise13
//
//  Created by Gabriel Aliotta on 3/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TwitterTimeLine;

@interface Exercise13ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
}

@property (nonatomic, retain) TwitterTimeLine *twitterTweets;

@end
