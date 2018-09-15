//
//  ViewController.m
//  YPWaterFlowLayout
//
//  Created by 余鹏 on 2018/9/14.
//  Copyright © 2018年 seek. All rights reserved.
//

#import "ViewController.h"
#import "YPWaterFlowLayout.h"
#import "YPCollectionViewCell.h"
#import "YPCollectionReusableView.h"
#import "YPImage.h"

static NSString *cellId = @"YPCollectionViewCell";
static NSString *reusableViewId = @"YPCollectionReusableView";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WaterFlowLayoutDelegate>

@property (nonatomic, strong) NSMutableArray<YPImage *> *images;

@end

@implementation ViewController

- (NSMutableArray *)images {
    if (!_images) {
        _images = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        NSArray *imageDics = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *imageDic in imageDics) {
            YPImage *image = [YPImage imageWithImageDic:imageDic];
            [_images addObject:image];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YPWaterFlowLayout *layout = [YPWaterFlowLayout new];
    layout.columnCount = 2;
    layout.rowMargin = 10;
    layout.columnMargin = 10;
    layout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 200);
    layout.delegate = self;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [collectionView registerNib:[UINib nibWithNibName:cellId bundle:nil] forCellWithReuseIdentifier:cellId];
    
    [collectionView registerNib:[UINib nibWithNibName:reusableViewId bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reusableViewId];
    
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        YPCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reusableViewId forIndexPath:indexPath];
        header.backgroundColor = [UIColor yellowColor];
        return header;
    }
    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.imageURL = self.images[indexPath.item].imageURL;
    return cell;
}

#pragma mark - layoutDelegate
-(CGFloat)waterFlowLayout:(YPWaterFlowLayout *)WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath {
    YPImage *image = self.images[indexPath.item];
    return image.imageH / image.imageW * width;
}

@end
