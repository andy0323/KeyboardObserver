//
//  QBaseViewController.m
//  KeyboardManager
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController.h"
#import "QBaseKeyboardManager.h"

@interface QBaseViewController ()<QBaseKeyboardManagerDelegate, UIScrollViewDelegate>
{
    QBaseKeyboardManager *_keyboardManager;
    
    UITextView *_tv;
}
@end

@implementation QBaseViewController

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_tv resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _keyboardManager = [[QBaseKeyboardManager alloc] init];
    
    [_keyboardManager keyboardHeightChanged:^(NSInteger keyboardHeight) {
        NSLog(@"%d", keyboardHeight);
    }];
    
    _keyboardManager.delegate = self;
    
    _tv = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, 280, 60)];
    _tv.layer.borderColor = [[UIColor blackColor] CGColor];
    _tv.layer.borderWidth = 1.0f;
    
    [self.view addSubview:_tv];
    
    _keyboardManager = nil;
}

- (void)keyboardManager:(QBaseKeyboardManager *)keyboardManager keyboardHeightDidChanged:(NSInteger)keyboardHeight
{
    NSLog(@"%d", keyboardHeight);
}

@end
