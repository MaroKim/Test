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
    
    // Card 리스트와 내요을 호출하는 URL변수 선언(JSON)
    NSURL *cardUrl = [NSURL URLWithString:@"http://yunsland.cafe24.com/test/card.json"];
    
    //JSON 을 받아서 cardList라는 딕셔너리에 저장
    cardList = [NSJSONSerialization JSONObjectWithData: [NSData dataWithContentsOfURL: cardUrl] options:NSJSONReadingAllowFragments error: &err];
    
    // cardList 딕셔너리에서 card라는 key의 value들을 cardContents라는 array에 저장
    cardContents = [cardList objectForKey:@"card"];
    
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
    
    // 임시 딕셔너리 dicTemp를 생성하고 row는 cardContents 배열의 갯수만큼
    NSDictionary *dicTemp = [cardContents objectAtIndex:indexPath.row];
    
    // reply 임시 코드
    NSMutableArray *arrTempReply = [dicTemp objectForKey:@"comments"];
    NSLog(@"arrTempReply===== %@",arrTempReply);
    NSLog(@"arrTempReply index 2===== %@",[arrTempReply objectAtIndex:2]);
    

    
    // dicTemp에 있는 데이터를 key로 선택하여 cell의 오브젝트에 꽂아줌
    cell.cardNicknameLabel.text = [dicTemp objectForKey:@"nickname"];
    cell.cardLikeCountLabel.text = [dicTemp objectForKey:@"likecount"];
    cell.cardprofileImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dicTemp objectForKey:@"profileimg"]]]];
    cell.cardContentImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dicTemp objectForKey:@"cardimg"]]]];
    
    
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
