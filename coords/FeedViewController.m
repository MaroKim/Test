//
//  FeedViewController.m
//  coords
//
//  Created by yoonwonsang on 2016. 7. 26..
//  Copyright © 2016년 yoonwonsang. All rights reserved.
//

#import "FeedViewController.h"
#import "CardTableViewCell.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *err;
    
    NSURL *cardUrl = [NSURL URLWithString:@"http://yunsland.cafe24.com/test/card.json"];
    
    cardList = [NSJSONSerialization JSONObjectWithData: [NSData dataWithContentsOfURL: cardUrl] options:NSJSONReadingAllowFragments error: &err];
    cardContents = [cardList objectForKey:@"card"];
    
    
    
    
    
    
    
    
    
//    NSLog(@"%@",cardContents);

    
    //    cardList = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://yunsland.cafe24.com/test/card.json"]] options:NSJSONReadingAllowFragments error:&err];
    
//    NSLog(@"%@",cardList);
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return cardContents.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardTableView" forIndexPath:indexPath];
    NSDictionary *dicTemp = [cardContents objectAtIndex:indexPath.row];
    
    cell.cardNicknameLabel.text = [dicTemp objectForKey:@"nickname"];
    
    
    cell.cardLikeCountLabel.text = [dicTemp objectForKey:@"likecount"];
    
    
    cell.cardprofileImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dicTemp objectForKey:@"profileimg"]]]];
    cell.cardContentImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dicTemp objectForKey:@"cardimg"]]]];
//    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[news objectAtIndex:indexPath.row] objectForKey:@"URLOfYourImage"]]]
    
//    NSURLSessionConfiguration *sessionConfigration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfigration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
//    
//    cardImgDownloadTask = [session downloadTaskWithURL:[NSURL URLWithString:[dicTemp objectForKey:@"cardimg"]]completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
//        cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
//        NSLog(@"%@",location);
//    }];
    
    
//    cell.cardprofileImg.image = [UIImage imageNamed:@"test.jpg"];
//    cell.cardContentImg.image = [UIImage imageNamed:@"test.jpg"];
//    NSLog(@"return?:== %@",cell);
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
