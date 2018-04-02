//
//  FDAlbumRotate.h
//  FDIAlbumAnimation
//
//  Created by Jovi on 2018/4/1.
//  Copyright © 2018 . All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RYRotateImages : UIViewController


- (instancetype)initWithFrame:(CGRect)frame photos:(NSArray <UIImage *>*)photos timeInterval:(CGFloat)seconds;

- (void)startAnimation;

- (void)appendImage:(UIImage *)image;

@end
