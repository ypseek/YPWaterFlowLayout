//
//  YPImage.m
//  YPWaterFlowLayout
//
//  Created by 余鹏 on 2018/9/14.
//  Copyright © 2018年 seek. All rights reserved.
//

#import "YPImage.h"

@implementation YPImage

+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic {
    YPImage *image = [[YPImage alloc] init];
    image.imageURL = [NSURL URLWithString:imageDic[@"img"]];
    image.imageW = [imageDic[@"w"] floatValue];
    image.imageH = [imageDic[@"h"] floatValue];
    return image;
}

@end
