//
//  LoginViewController.h
//  coords
//
//  Created by yoonwonsang on 2016. 8. 10..
//  Copyright © 2016년 yoonwonsang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate,UIPageViewControllerDelegate>{
    NSString *resultData;
}


@property (weak, nonatomic) IBOutlet UITextField *emailInputLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordInputLabel;

- (IBAction)loginButtonAction:(id)sender;

@end

