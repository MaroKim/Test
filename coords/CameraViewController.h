//
//  CameraViewController.h
//  coords
//
//  Created by yoonwonsang on 2016. 8. 6..
//  Copyright © 2016년 yoonwonsang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TGCameraViewController.h>

@interface CameraViewController : UIViewController <TGCameraDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>



- (IBAction)takePhotoTapped:(id)sender;
- (IBAction)chooseExistingPhotoTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@end
