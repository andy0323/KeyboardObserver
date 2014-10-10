//
//  QBaseViewController.m
//  QBaseViewController
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController.h"
#import "QBaseViewController+KeyBoardObserver.h"

@interface QBaseViewController ()

@end

@implementation QBaseViewController

#pragma mark -
#pragma mark - 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
    [self registKeyboardNotification];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    [self removeKeyboardNotification];
}

#pragma mark -
#pragma mark - Methods Template

- (void)keyboardHeightCallback:(CGFloat)keyboardHeight
{

}

@end
