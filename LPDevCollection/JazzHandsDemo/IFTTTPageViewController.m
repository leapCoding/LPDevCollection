//
//  IFTTTPageViewController.m
//  LPDevCollection
//
//  Created by Leap on 2017/3/17.
//  Copyright © 2017年 LPDev. All rights reserved.
//

#import "IFTTTPageViewController.h"

@interface IFTTTPageViewController ()

//page1
@property (nonatomic, strong) UIImageView *buddle;
@property (nonatomic, strong) UIImageView *dots;

@end

@implementation IFTTTPageViewController

- (NSUInteger)numberOfPages {
    // Tell the scroll view how many pages it should have
    return 2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self configureViews];
    [self configureAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)configureViews {
    self.buddle = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bubble"]];
    [self.contentView addSubview:self.buddle];
    
    self.buddle = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bubble"]];
    [self.contentView addSubview:self.buddle];

}

- (void)configureAnimations {
    
}

@end
