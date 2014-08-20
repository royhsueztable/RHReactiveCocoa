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

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

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
    RAC(self.outputLabel, text) = self.inputTextField.rac_textSignal;
}

@end
