//
//  LoginViewController.m
//  coords
//
//  Created by yoonwonsang on 2016. 8. 10..
//  Copyright © 2016년 yoonwonsang. All rights reserved.
//

#import "LoginViewController.h"
#import <AFURLSessionManager.h>
#import <AFNetworking.h>
#import "FeedViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize emailInputLabel,passwordInputLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    emailInputLabel.delegate = self;
    passwordInputLabel.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"MainFeedViewNavi"]) {
//        UIViewController *controller = (UIViewController *)segue.destinationViewController;
//        controller.delegate = self;
        
//        FeedViewController *vc = [segue destinationViewController];
//        [vc setUserID:emailInputLabel.text];
    }
}


- (IBAction)loginButtonAction:(id)sender {
    
    if ([[self.emailInputLabel text] isEqualToString:@""] || [[self.passwordInputLabel text]isEqualToString:@""]) {
        [self alertStatus :@"이메일 또는 비밀번호를 입력해주세요." :@"확인"];
    } else {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    NSString *reqID = emailInputLabel.text;
    NSString *reqPassword = passwordInputLabel.text;
    
    
    // 요청할 url
    NSString *url = @"http://localhost:3333/coords/login/";
    // 파라미터
    NSDictionary *parameters = @{@"login_id": reqID, @"password": reqPassword};
     
    //메니져를 통해 리퀘스트를 날릴 url과 쿼리를 설정
    [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:parameters error:nil];
    
    [manager POST:url
      parameters:parameters
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
//             NSLog(@"responseObject는: %@", responseObject);
             NSInteger resultCode = [[responseObject objectForKey:@"resultCode"]integerValue];
             NSString *resultMessage = [responseObject objectForKey:@"resultMessage"];
             
             [self alertStatus :resultMessage :@"확인"];
             NSLog(@"%ld",(long)resultCode);
             
             if (resultCode==0) {
                 //Segue 진행
                 NSLog(@"리절트 코드 0  이 확실하오!");
                 [self performSegueWithIdentifier:@"MainFeedViewNavi" sender:sender];
                 
            }
 
             
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"%@", error);
             [self alertStatus :@"서버 접속 장애" :@"확인"];
         }];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void) alertStatus:(NSString *)msg :(NSString *)title  {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
                                      
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"UIAlertAction handelr");
        
      
        
    }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
                                      
  }

@end
    
