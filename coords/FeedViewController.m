//
//  FeedViewController.m
//  coords
//
//  Created by yoonwonsang on 2016. 7. 26..
//  Copyright © 2016년 yoonwonsang. All rights reserved.
//

#import "FeedViewController.h"
#import "CardTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFURLSessionManager.h>
#import <AFHTTPSessionManager.h>
#import <Foundation/Foundation.h>

@interface FeedViewController ()

@end
 
@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *err;
    
    // Card 리스트와 내요을 호출하는 URL변수 선언(JSON)
    NSURL *cardUrl = [NSURL URLWithString:@"http://yunsland.cafe24.com/test/wonsang.json"];
    
    
    //JSON 을 받아서 cardList라는 딕셔너리에 저장
    cardList = [NSJSONSerialization JSONObjectWithData: [NSData dataWithContentsOfURL: cardUrl] options:NSJSONReadingAllowFragments error: &err];
    
    // cardList 딕셔너리에서 card라는 key의 value들을 cardContents라는 array에 저장
    cardContents = [cardList objectForKey:@"card"];
    
    
    
    
    
    // Comments를 Array에 저장
    commentsArray = [cardList objectForKey:@"comments"];
    
    
    NSString *url = @"http://yunsland.cafe24.com/test/wonsang.json";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //get!!!
    [manager GET: url parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        cardContents = [responseObject objectForKey:@"card"];
        
//        NSLog(@"cardContents==== %@",cardContents);
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return cardContents.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cartTableviewCell(import CardTableViewCell.h)의 cell 생성 , Identifier는 cardTableView
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardTableView" forIndexPath:indexPath];
    
    // placeholder 이미지
    UIImage *placeholderImg = [UIImage imageNamed:@"test.jpg"];
    
    
    // 임시 딕셔너리 dicTemp를 생성하고 row는 cardContents 배열의 갯수만큼
    NSDictionary *dicTemp = [cardContents objectAtIndex:indexPath.row];
    NSMutableArray *arrReplyTemp = [dicTemp objectForKey:@"comments"];
    NSLog(@"log comments %@",arrReplyTemp);
    
    
    
 
    
    // label 생성 test
    UILabel *replyIDlabel1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 200, 25)];
    replyIDlabel1.text = [[arrReplyTemp objectAtIndex:1]objectForKey:@"replyID"];
    
    UILabel *replyContentsLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(110, 30, 200, 25)];
    replyContentsLabel1.text = [[arrReplyTemp objectAtIndex:1]objectForKey:@"replyText"];
    
    NSLog(@"cereaet label");
    [cell.replyView addSubview:replyIDlabel1];
    [cell.replyView addSubview:replyContentsLabel1];
    
    
    // dicTemp에 있는 데이터를 key로 선택하여 cell의 오브젝트에 꽂아줌
    cell.cardNicknameLabel.text = [dicTemp objectForKey:@"nickname"];
    cell.cardLikeCountLabel.text = [dicTemp objectForKey:@"likecount"];
    
    // 프로필 이미지 캐싱 & 바인딩
    [cell.cardprofileImg sd_setImageWithURL:[dicTemp objectForKey:@"profileimg"] placeholderImage:placeholderImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"blocks profileImg~ Good~ 이건 progress 안넣을거양 ㅎㅎ");
    }];
    
    // 카드 컨텐츠 이미지 캐싱 & 바인딩
    [cell.cardContentImg sd_setImageWithURL:[dicTemp objectForKey:@"cardimg"] placeholderImage:placeholderImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"blocks cardContentsImg~ Good~ progress 넣어주믄 되것구먼 ㅎㅎ");
    }];
    
   

    
    

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
