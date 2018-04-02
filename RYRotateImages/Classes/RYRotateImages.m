//
//  FDAlbumRotate.m
//  FDIAlbumAnimation
//
//  Created by Jovi on 2018/4/1.
//  Copyright © 2018 . All rights reserved.
//

#import "RYRotateImages.h"
#import "RYRotateImageView.h"

@interface RYRotateImages ()

@property (nonatomic, strong) NSMutableArray <UIImage *>*imgList;
@property (nonatomic, strong) NSMutableArray <RYRotateImageView *>*rotateImglist;
@property (nonatomic, assign) CGFloat interval;

@property (nonatomic, assign) NSInteger currentIndex;   //当前最前面的页面id
@property (nonatomic, strong) NSTimer *animationTimer;

@end

@implementation RYRotateImages


- (instancetype)initWithFrame:(CGRect)frame photos:(NSArray *)photos timeInterval:(CGFloat)seconds
{
    if (self = [super init])
    {
        _interval = seconds;
        
    }
    
    self.view = [[UIView alloc] initWithFrame:frame];
    self.view.backgroundColor = [UIColor clearColor];
    self.imgList = [NSMutableArray arrayWithArray:photos];
    
    self.view.layer.shadowColor = [UIColor grayColor].CGColor;
    self.view.layer.shadowRadius = 15.f;
    self.view.layer.shadowOpacity = 0.8f;
    self.view.layer.shadowOffset = CGSizeMake(0, 5);

    return self;
}


- (void)startAnimation
{
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:self.interval
                                                           target:self
                                                         selector:@selector(nextAnimation)
                                                         userInfo:nil
                                                          repeats:YES];
    [self.animationTimer fire];
}

- (void)nextAnimation
{
    if (self.imgList.count < 1)
    {
        NSLog(@"img list con't be nil");
    }
    
    //如果之前取到最后一个了，那么从头开始获取
    if (self.currentIndex == self.imgList.count)
    {
        self.currentIndex = 0;
    }
    
    UIImage *newImage = [self.imgList objectAtIndex:self.currentIndex];

    RYRotateImageView *rotateImgView = [[RYRotateImageView alloc] initWithImage:newImage
                                                                                   onView:self.view
                                                                            animationTime:0.6];
     [self.rotateImglist addObject:rotateImgView];
     
     [self.rotateImglist enumerateObjectsUsingBlock:^(RYRotateImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj nextStep];
    }];
    
    self.currentIndex += 1;
}

- (void)appendImage:(UIImage *)image
{
    if (!image)
        return;
    
    [self.imgList addObject:image];
}

- (void)dealloc
{
    [self.animationTimer invalidate];
}

#pragma mark - selector

- (NSMutableArray <RYRotateImageView *>*)rotateImglist
{
    if (!_rotateImglist)
    {
        _rotateImglist = [NSMutableArray array];
    }
    
    return _rotateImglist;
}

@end



























