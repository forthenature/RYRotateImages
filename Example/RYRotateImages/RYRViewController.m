//
//  RYRViewController.m
//  RYRotateImages
//
//  Created by Jovi on 04/02/2018.
//  Copyright (c) 2018 Jovi. All rights reserved.
//

#import "RYRViewController.h"
#import "RYRotateImages.h"

@interface RYRViewController ()
@property (nonatomic, strong) RYRotateImages *rotateAnimation;

@end

@implementation RYRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *imageList = @[[UIImage imageNamed:@"1.jpg"],
                           [UIImage imageNamed:@"2.jpg"],
                           [UIImage imageNamed:@"3.jpg"],
                           [UIImage imageNamed:@"4.jpg"]];
    
    self.rotateAnimation = [[RYRotateImages alloc] initWithFrame:CGRectMake(20, 100, 280, 280)
                                                         photos:imageList
                                                   timeInterval:1.f];
    
    [self.view addSubview:self.rotateAnimation.view];
    
    [self.rotateAnimation startAnimation];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
