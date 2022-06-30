//
//  DetailsViewController.h
//  Instagram
//
//  Created by Mitchel Igolimah on 6/29/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (strong, nonatomic) IBOutlet UILabel *captionLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
