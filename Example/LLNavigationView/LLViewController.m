//
//  LLViewController.m
//  LLNavigationView
//
//  Created by LOLITA0164 on 12/18/2019.
//  Copyright (c) 2019 LOLITA0164. All rights reserved.
//

#import "LLViewController.h"
#import "AViewController.h"

@interface LLViewController ()

@end

@implementation LLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    AViewController* ctrl = [AViewController new];
    [self presentViewController:ctrl animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
