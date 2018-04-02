//
//  FDAlbumRotateImageView.h
//  FDIAlbumAnimation
//
//  Created by Jovi on 2018/4/2.
//  Copyright © 2018 . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RYRotateImageView : UIImageView

- (instancetype)initWithImage:(UIImage *)image onView:(UIView *)view animationTime:(CGFloat)nimationTime;

- (void)nextStep;

@end


NS_ASSUME_NONNULL_END
