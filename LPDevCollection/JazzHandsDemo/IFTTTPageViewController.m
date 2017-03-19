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
@property (nonatomic, strong) UILabel *label1;
//page2
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UIImageView *wallet;
@property (nonatomic, strong) UIImageView *cash3;
@property (nonatomic, strong) UIImageView *cash2;
@property (nonatomic, strong) UIImageView *cash1;

@end

@implementation IFTTTPageViewController

- (NSUInteger)numberOfPages {
    // Tell the scroll view how many pages it should have
    return 2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.1 green:0.04 blue:0.11 alpha:1];
    [self configureViews];
    [self configureAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)configureViews {
    //page1
    self.buddle = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bubble"]];
    [self.contentView addSubview:self.buddle];
    
    self.dots = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dots"]];
    [self.contentView addSubview:self.dots];
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 30)];
    self.label1.text = @"LPDevCollection";
    self.label1.textColor = [UIColor whiteColor];
    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.label1];
    
    //page2
    //PAGE 2
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 75)];
    self.label2.textColor = [UIColor whiteColor];
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label2.text = [NSString stringWithFormat:@"But you don’t want to feel\nlike you’re wasting money."];
    [self.contentView addSubview:self.label2];
    
    self.cash3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cash3"]];
//    [self.contentView addSubview:self.cash3];
    
    self.cash2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cash3"]];
//    [self.contentView addSubview:self.cash2];
    
    self.cash1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cash3"]];
//    [self.contentView addSubview:self.cash1];
    
    self.wallet = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wallet"]];
    [self.contentView addSubview:self.wallet];

    
}

- (void)configureAnimations {
    [self configureBubbleAndDotsAnimations];
    [self configureMoneyAnimations];
}

- (void)configureBubbleAndDotsAnimations {
//    buddle
    [self.buddle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(80);
        make.width.equalTo(self.view).multipliedBy(0.6);
        make.height.equalTo(self.buddle.mas_width).multipliedBy(0.86);
    }];
    
    [self.dots mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(self.buddle).multipliedBy(.25);
        make.height.lessThanOrEqualTo(self.buddle).multipliedBy(.4);
    }];
    
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView).multipliedBy(1.75);
    }];
    [self keepView:self.label1 onPages:@[@(0), @(0)]];

    
    IFTTTTranslationAnimation *buddleMoveAnimation = [IFTTTTranslationAnimation animationWithView:self.buddle];
    [buddleMoveAnimation addKeyframeForTime:0 translation:CGPointMake(kWindowWidth / 2 -120, 80)];
    [buddleMoveAnimation addKeyframeForTime:0.6 translation:CGPointMake(kWindowWidth / 2-120, 0)];
    [self.animator addAnimation:buddleMoveAnimation];
    
    IFTTTTranslationAnimation *dotsMoveAnimation = [IFTTTTranslationAnimation animationWithView:self.dots];
    [dotsMoveAnimation addKeyframeForTime:0 translation:CGPointMake(kWindowWidth / 2 - 30, kWindowHeight * .51)];
    [dotsMoveAnimation addKeyframeForTime:0.6 translation:CGPointMake(kWindowWidth / 2 - 30, kWindowWidth + 100)];
    [self.animator addAnimation:dotsMoveAnimation];
    
    IFTTTRotationAnimation *dotsRotationAnimation = [IFTTTRotationAnimation animationWithView:self.dots];
    [dotsRotationAnimation addKeyframeForTime:0 rotation:0];
    [dotsRotationAnimation addKeyframeForTime:1 rotation:-100];
    [self.animator addAnimation:dotsRotationAnimation];

    
//    [self keepView:self.buddle onPages:@[@(0)] atTimes:@[@(0)]];
    IFTTTRotationAnimation *buddleRotationAnimation = [IFTTTRotationAnimation animationWithView:self.buddle];
    [buddleRotationAnimation addKeyframeForTime:0 rotation:0];
    [buddleRotationAnimation addKeyframeForTime:1 rotation:100];
    [self.animator addAnimation:buddleRotationAnimation];
}

- (void)configureMoneyAnimations {
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView).multipliedBy(1.75);
    }];
    [self keepView:self.label2 onPages:@[@(1), @(1)]];
    
    [self.wallet mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.size.width.lessThanOrEqualTo(self.scrollView).multipliedBy(0.8);
        make.width.equalTo(self.scrollView).multipliedBy(0.7).with.priorityHigh();
        make.height.equalTo(self.scrollView).multipliedBy(0.2);
        make.centerY.equalTo(self.contentView);
    }];
    [self keepView:self.wallet onPages:@[@(1), @(.5), @(1)] atTimes:@[@(0), @(.5), @(1)]];
}

@end
