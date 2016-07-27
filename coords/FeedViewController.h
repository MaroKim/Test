//
//  FeedViewController.h
//  coords
//
//  Created by yoonwonsang on 2016. 7. 26..
//  Copyright © 2016년 yoonwonsang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    NSURLSessionTask *cardImgDownloadTask;
    
    NSURL *cardRequestUrl;
    NSDictionary *cardList;
    NSArray *cardContents;
    
}


@end
