//
//  PhotoViewController.m
//  Instagram
//
//  Created by Mitchel Igolimah on 6/28/22.
//

#import "PhotoViewController.h"
#import "Parse/Parse.h"
#import "Post.h"
#import "SceneDelegate.h"
#import "HomeViewController.h"

@interface PhotoViewController ()  <UITextFieldDelegate>
@property (strong, nonatomic)UIImage *postimage;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UITextField *captionField;

@end

@implementation PhotoViewController 
- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Do any additional setup after loading the view.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    UIImage *resizedImage = [self resizeImage:originalImage withSize:CGSizeMake(300, 300)];
        self.photoImageView.image = resizedImage;
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)ImageViewDidTap:(UITapGestureRecognizer *)sender {
    NSLog(@"Picture tapped");
    
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    // The Xcode simulator does not support taking pictures, so let's first check that the camera is indeed supported on the device before trying to present it.
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}


- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
- (IBAction)didTapShare:(id)sender {
        
    [Post postUserImage: self.photoImageView.image withCaption:self.captionField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
            if(error != nil){
                NSLog(@"User share failed: %@", error.localizedDescription);
               
            } else {
                NSLog(@"User successfully shared post");
                [self dismissViewControllerAnimated:YES completion:nil];
            }
    }];
}

- (IBAction)didTapClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end

