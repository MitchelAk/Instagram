//
//  GramCell.m
//  Instagram
//
//  Created by Mitchel Igolimah on 6/29/22.
//

#import "GramCell.h"
#import "UIImageView+AFNetworking.h"
#import "Post.h"
#import "DateTools.h"

@implementation GramCell

- (void)setPost:(Post *)post {
    _post = post;
    [self.photoImage setImageWithURL:[NSURL URLWithString:post.image.url]];
     self.captionLabel.text = self.post.caption;
     self.usernameLabel.text = self.post.author.username;
     self.nameLabel.text = self.post.author.username;
     self.dateLabel.text = [post.createdAt shortTimeAgoSinceNow];
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end

