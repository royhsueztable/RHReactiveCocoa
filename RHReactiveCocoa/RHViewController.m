//
//  RHViewController.m
//  RHReactiveCocoa
//
//  Created by Roy Hsu on 2014/8/19.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "RHViewController.h"
#import <ReactiveCocoa.h>

@interface RHViewController ()

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *enterButton;

@end

@implementation RHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self setup];
}

- (void)setup
{    
    RAC(self.enterButton, enabled) = [RACSignal combineLatest:@[self.passwordTextField.rac_textSignal, self.confirmPasswordTextField.rac_textSignal] reduce:^(NSString *password, NSString *confirmPassword) {
        if (password.length == 0) {
            return @(NO);
        }
        return @([password isEqualToString:confirmPassword]);
    }];
}

@end
