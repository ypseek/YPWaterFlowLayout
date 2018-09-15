//
//  YPCollectionViewCell.m
//  YPWaterFlowLayout
//
//  Created by 余鹏 on 2018/9/14.
//  Copyright © 2018年 seek. All rights reserved.
//

#import "YPCollectionViewCell.h"
#import <UIImageView+WebCache.h>
@interface YPCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YPCollectionViewCell
- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
    [self.imageView sd_setImageWithURL:imageURL];
}
@end
