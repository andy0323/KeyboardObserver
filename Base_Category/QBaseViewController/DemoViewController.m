//
//  DemoViewController.m
//  QBaseViewController
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()
{
    UITextView *_tv;
}
@end

@implementation DemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tv = [[UITextView alloc] initWithFrame:CGRectMake(20, 50, 280, 50)];
    _tv.layer.borderColor = [[UIColor blackColor] CGColor];
    _tv.layer.borderWidth = 1.0f;
    [self.view addSubview:_tv];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_tv resignFirstResponder];
}

- (void)keyboardHeightCallback:(CGFloat)keyboardHeight
{
    NSLog(@"%f", keyboardHeight);
}

@end
