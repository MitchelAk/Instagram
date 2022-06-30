//
//  DetailsViewController.m
//  Instagram
//
//  Created by Mitchel Igolimah on 6/29/22.
//

#import "DetailsViewController.h"
#import "Post.h"
#import "UIImageView+AFNetworking.h"
#import "DateTools.h"

@interface DetailsViewController ()
@property (nonatomic, strong)NSArray *postArray;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.photoImage setImageWithURL:[NSURL URLWithString:self.post.image.url]];
    self.captionLabel.text = self.post.caption;
    self.nameLabel.text = self.post.author.username;
    self.dateLabel.text = [self.post.createdAt shortTimeAgoSinceNow];
    
}

@end
