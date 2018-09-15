//
//  YPImage.h
//  YPWaterFlowLayout
//
//  Created by 余鹏 on 2018/9/14.
//  Copyright © 2018年 seek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YPImage : NSObject
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, assign) CGFloat imageW;
@property (nonatomic, assign) CGFloat imageH;

+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic;

@end
