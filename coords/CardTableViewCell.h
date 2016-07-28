//
//  CardTableViewCell.h
//  coords
//
//  Created by yoonwonsang on 2016. 7. 26..
//  Copyright © 2016년 yoonwonsang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cardprofileImg;

@property (weak, nonatomic) IBOutlet UIImageView *cardContentImg;

@property (weak, nonatomic) IBOutlet UILabel *cardLikeCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *cardNicknameLabel;

@property (weak, nonatomic) IBOutlet UIView *cardView;

- (IBAction)cardLikeBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *replyIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyIDLabel2;
@property (weak, nonatomic) IBOutlet UILabel *replyTextLabel2;

@end
