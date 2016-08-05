//
//  CameraViewController.m
//  coords
//
//  Created by yoonwonsang on 2016. 8. 6..
//  Copyright © 2016년 yoonwonsang. All rights reserved.
//

#import "CameraViewController.h"


@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TGCameraNavigationController *navigationController = [TGCameraNavigationController newWithCameraDelegate:self];
    
    [self presentViewController:navigationController animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)takePhotoTapped:(id)sender {
    
    TGCameraNavigationController *navigationController = [TGCameraNavigationController newWithCameraDelegate:self];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}

- (IBAction)chooseExistingPhotoTapped:(id)sender {
    UIImagePickerController *pickerController = [TGAlbum imagePickerControllerWithDelegate:self];
    
    [self presentViewController:pickerController animated:YES completion:nil];
}

-(void)cameraWillTakePhoto{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

-(void)cameraDidSavePhotoAtPath:(NSURL *)assetURL{
    NSLog(@"%s album path: %@",__PRETTY_FUNCTION__, assetURL);
}

-(void)cameraDidSavePhotoWithError:(NSError *)error{
    NSLog(@"%s error: %@",__PRETTY_FUNCTION__,error);
}

#pragma - TGCameraDelegate required
-(void)cameraDidCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cameraDidTakePhoto:(UIImage *)image{
    _photoView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cameraDidSelectAlbumPhoto:(UIImage *)image{
    _photoView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    _photoView.image = [TGAlbum imageWithMediaInfo:info];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
