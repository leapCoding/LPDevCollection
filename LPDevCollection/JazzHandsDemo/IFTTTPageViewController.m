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
//page3
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UIImageView *fries;
@property (nonatomic, strong) UIImageView *pizza;
@property (nonatomic, strong) UIImageView *ticket;

@end

@implementation IFTTTPageViewController

- (NSUInteger)numberOfPages {
    // Tell the scroll view how many pages it should have
    return 3;
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
    self.label2.numberOfLines = 0;
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label2.text = [NSString stringWithFormat:@"But you don’t want to feel\nlike you’re wasting money."];
    [self.contentView addSubview:self.label2];
    
    self.cash3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cash3"]];
    [self.contentView addSubview:self.cash3];
    
    self.cash2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cash3"]];
    [self.contentView addSubview:self.cash2];
    
    self.cash1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cash3"]];
//    [self.contentView addSubview:self.cash1];
    
    self.wallet = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wallet"]];
    [self.contentView addSubview:self.wallet];

    //page3
    self.label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, 75)];
    self.label3.textColor = [UIColor whiteColor];
    self.label3.numberOfLines = 0;
    self.label3.textAlignment = NSTextAlignmentCenter;
    self.label3.text = [NSString stringWithFormat:@"And you probably make a lot\nof unnecessary purchases."];
    [self.contentView addSubview:self.label3];
    self.fries = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fries"]];
    [self.contentView addSubview:self.fries];
    
    self.pizza = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pizza"]];
    [self.contentView addSubview:self.pizza];
    
    self.ticket = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ticket"]];
    [self.contentView addSubview:self.ticket];
    
}

- (void)configureAnimations {
    [self configureBubbleAndDotsAnimations];
    [self configureMoneyAnimations];
    [self configureJunkItemsAnimations];;
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
    
//    NSLayoutConstraint *buddle = [NSLayoutConstraint constraintWithItem:self.buddle attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:80];
//    [self.contentView addConstraint:buddle];
//    IFTTTConstraintMultiplierAnimation *ll = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView constraint:buddle attribute:IFTTTLayoutAttributeHeight referenceView:self.contentView];
//    [ll addKeyframeForTime:0 multiplier:80];
//    [ll addKeyframeForTime:0.5 multiplier:0];
//    [self.animator addAnimation:ll];

    
    IFTTTTranslationAnimation *buddleMoveAnimation = [IFTTTTranslationAnimation animationWithView:self.buddle];
    [buddleMoveAnimation addKeyframeForTime:0 translation:CGPointMake(kWindowWidth / 2 -120, 80)];
    [buddleMoveAnimation addKeyframeForTime:0.6 translation:CGPointMake(kWindowWidth / 2-120, -80)];
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
    
    [self.cash3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.scrollView).multipliedBy(0.3);
        make.width.equalTo(self.scrollView).multipliedBy(0.3);
    }];
     [self keepView:self.cash3 onPages:@[@(.45), @(.6), @(1.1), @(1)] atTimes:@[@(0), @(.5), @(1), @(2)]];
    
    NSLayoutConstraint *cash3layout = [NSLayoutConstraint constraintWithItem:self.cash3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self.contentView addConstraint:cash3layout];
    
    IFTTTConstraintMultiplierAnimation *mm = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView constraint:cash3layout attribute:IFTTTLayoutAttributeHeight referenceView:self.contentView];
    [mm addKeyframeForTime:0 multiplier:-0.2];
    [mm addKeyframeForTime:0.5 multiplier:0.33];
    [self.animator addAnimation:mm];
    
    [self.cash2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.scrollView).multipliedBy(0.3);
        make.width.equalTo(self.scrollView).multipliedBy(0.3);
    }];
    [self keepView:self.cash2 onPages:@[@(.45), @(.6), @(0.75), @(1.05), @(1)] atTimes:@[@(0), @(.5), @(0.7), @(1), @(2)]];
    
    NSLayoutConstraint *cash2layout = [NSLayoutConstraint constraintWithItem:self.cash2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self.contentView addConstraint:cash2layout];
    
    IFTTTConstraintMultiplierAnimation *mm2 = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView constraint:cash2layout attribute:IFTTTLayoutAttributeHeight referenceView:self.contentView];
    [mm2 addKeyframeForTime:0 multiplier:-0.2];
    [mm2 addKeyframeForTime:0.5 multiplier:0.33];
    [self.animator addAnimation:mm2];
    
    IFTTTRotationAnimation *cash2tanslation = [IFTTTRotationAnimation animationWithView:self.cash2];
    [cash2tanslation addKeyframeForTime:0.5 rotation:0];
    [cash2tanslation addKeyframeForTime:0.7 rotation:11];
    [self.animator addAnimation:cash2tanslation];

}

- (void)configureJunkItemsAnimations {
    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView).multipliedBy(1.75);
    }];
    [self keepView:self.label3 onPages:@[@(2), @(2)]];

    
    [self.fries mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView).multipliedBy(0.33);
        make.height.equalTo(self.scrollView).multipliedBy(0.26);
        //make.centerY.equalTo(self.contentView).multipliedBy(0.53);
    }];
    [self keepView:self.fries onPages:@[@(1.1), @(1.8), @(2)] atTimes:@[@(1.3), @(2), @(3)]];
    
    IFTTTScaleAnimation *friesScaleAnimation = [IFTTTScaleAnimation animationWithView:self.fries];
    [friesScaleAnimation addKeyframeForTime:1.7 scale:0.5];
    [friesScaleAnimation addKeyframeForTime:2.0 scale:1.0];
    [self.animator addAnimation:friesScaleAnimation];
    
    IFTTTAlphaAnimation *friesFadeAnimation = [IFTTTAlphaAnimation animationWithView:self.fries];
    [friesFadeAnimation addKeyframeForTime:1.0 alpha:0.0];
    [friesFadeAnimation addKeyframeForTime:1.7 alpha:0.0];
    [friesFadeAnimation addKeyframeForTime:2.0 alpha:1.0];
    [self.animator addAnimation:friesFadeAnimation];
    
    [self.pizza mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView).multipliedBy(0.4);
        make.height.equalTo(self.scrollView).multipliedBy(0.4);
        //make.centerY.equalTo(self.contentView).multipliedBy(0.8);
    }];
    
    [self keepView:self.pizza onPages:@[@(1.45), @(2.15), @(4)] atTimes:@[@(1.3), @(2), @(3)]];
    
    IFTTTScaleAnimation *pizzaScaleAnimation = [IFTTTScaleAnimation animationWithView:self.pizza];
    [pizzaScaleAnimation addKeyframeForTime:1.5 scale:0.5];
    [pizzaScaleAnimation addKeyframeForTime:1.8 scale:1.0];
    [self.animator addAnimation:pizzaScaleAnimation];
    
    IFTTTAlphaAnimation *pizzaFadeAnimation = [IFTTTAlphaAnimation animationWithView:self.pizza];
    [pizzaFadeAnimation addKeyframeForTime:1.0 alpha:0.0];
    [pizzaFadeAnimation addKeyframeForTime:1.5 alpha:0.0];
    [pizzaFadeAnimation addKeyframeForTime:1.8 alpha:1.0];
    [self.animator addAnimation:pizzaFadeAnimation];
    
    NSLayoutConstraint *pizzaVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.pizza
                                                                               attribute:NSLayoutAttributeCenterY
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.contentView
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.f constant:0.f];
    [self.contentView addConstraint:pizzaVerticalConstraint];
    
    IFTTTConstraintMultiplierAnimation *pizzaVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView constraint:pizzaVerticalConstraint attribute:IFTTTLayoutAttributeHeight referenceView:self.contentView];
    [pizzaVerticalAnimation addKeyframeForTime:2.0 multiplier:0.4f];
    [pizzaVerticalAnimation addKeyframeForTime:3.0 multiplier:-0.6f];
    [self.animator addAnimation:pizzaVerticalAnimation];

    
    [self.ticket mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView).multipliedBy(0.42);
        make.height.equalTo(self.scrollView).multipliedBy(0.323);
        //make.centerY.equalTo(self.contentView).multipliedBy(1.2);
    }];
    
    [self keepView:self.ticket onPages:@[@(1.2), @(1.9), @(4)] atTimes:@[@(1.3), @(2), @(3)]];
    IFTTTScaleAnimation *ticketScaleAnimation = [IFTTTScaleAnimation animationWithView:self.ticket];
    [ticketScaleAnimation addKeyframeForTime:1.6 scale:0.5];
    [ticketScaleAnimation addKeyframeForTime:1.9 scale:1.0];
    [self.animator addAnimation:ticketScaleAnimation];
    
    IFTTTAlphaAnimation *ticketFadeAnimation = [IFTTTAlphaAnimation animationWithView:self.ticket];
    [ticketFadeAnimation addKeyframeForTime:1.0 alpha:0.0];
    [ticketFadeAnimation addKeyframeForTime:1.6 alpha:0.0];
    [ticketFadeAnimation addKeyframeForTime:1.9 alpha:1.0];
    [self.animator addAnimation:ticketFadeAnimation];
    
    NSLayoutConstraint *ticketVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.ticket
                                                                                attribute:NSLayoutAttributeCenterY
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.contentView
                                                                                attribute:NSLayoutAttributeTop
                                                                               multiplier:1.f constant:0.f];
    [self.contentView addConstraint:ticketVerticalConstraint];
    
    IFTTTConstraintMultiplierAnimation *ticketVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView constraint:ticketVerticalConstraint attribute:IFTTTLayoutAttributeHeight referenceView:self.contentView];
    [ticketVerticalAnimation addKeyframeForTime:2.0 multiplier:0.58f];
    [ticketVerticalAnimation addKeyframeForTime:3.0 multiplier:1.6f];
    [self.animator addAnimation:ticketVerticalAnimation];

}

@end
