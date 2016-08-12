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
    NSURLSessionTask *cardprofileImgDownloadTask;
    
    NSURL *cardRequestUrl;
    NSDictionary *cardList;
    NSMutableArray *cardContents;
    NSDictionary *testCard;
    NSMutableArray *commentsArray;
    
    NSString *userID;
}
@property (strong, nonatomic) NSString *userID;

@end
