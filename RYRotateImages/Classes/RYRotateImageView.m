//
//  FDAlbumRotateImageView.m
//  FDIAlbumAnimation
//
//  Created by Jovi on 2018/4/2.
//  Copyright © 2018 . All rights reserved.
//

#import "RYRotateImageView.h"


typedef NS_ENUM(NSInteger, FDARotateStep)
{
    FDARotateStepInit = 0,
    FDARotateStepFirst = 1,
    FDARotateStepSecond,
    FDARotateStepThree,
    FDARotateStepDisappear
};

@interface RYRotateImageView ()

@property (nonatomic, weak) UIView *fatherView;

@property (nonatomic, assign) NSInteger moveUp;

@property (nonatomic, assign) FDARotateStep currentStep;

@property (nonatomic, assign) CGFloat animationTime;

@end

@implementation RYRotateImageView

- (instancetype)initWithImage:(UIImage *)image onView:(UIView *)view animationTime:(CGFloat)nimationTime
{
    if (self = [super initWithFrame:CGRectMake(0, 15, 300.f, 300.f)])
    {
        self.image = image;
        self.animationTime = nimationTime;
        self.backgroundColor = [UIColor greenColor];
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.fatherView = view;
        self.alpha = 0;
        self.clipsToBounds = YES;
        self.layer.shadowRadius = 15.f;
        self.layer.shadowOpacity = 0.5f;
        self.layer.shadowOffset = CGSizeMake(0, 15);
        [self.fatherView addSubview:self];
        self.currentStep = FDARotateStepInit;
    }
    
    return self;
}

- (void)nextStep
{
    if (self.currentStep == FDARotateStepInit)
    {
        self.currentStep = FDARotateStepFirst;
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDuration:self.animationTime];
        self.alpha = 1;
        self.frame = CGRectMake(0, 0, 300.f, 300.f);
        [UIView commitAnimations];
    }
    
    else if (self.currentStep == FDARotateStepFirst)
    {
        self.currentStep = FDARotateStepSecond;
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDuration:self.animationTime];
        self.alpha = 0.6;
        self.frame = CGRectMake(25, - 15, 250.f, 250.f);
        [UIView commitAnimations];
    }
    else if (self.currentStep == FDARotateStepSecond)
    {
        self.currentStep = FDARotateStepThree;
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:self.animationTime];
        self.alpha = 0.4;
        self.frame = CGRectMake(50, - 30, 200.f, 200.f);
        [UIView commitAnimations];
    }
    else if (self.currentStep == FDARotateStepThree)
    {
        self.currentStep = FDARotateStepDisappear;
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:self.animationTime];
        self.alpha = 0;
        [UIView commitAnimations];
        [self removeFromSuperview];
    }
}

- (void) moveViewTo:(CGRect)frame animateTime:(CGFloat)time
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:time];
    [self setFrame:frame];
    [UIView commitAnimations];
}


@end







