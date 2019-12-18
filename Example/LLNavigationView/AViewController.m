//
//  AViewController.m
//  LLNavigationView_Example
//
//  Created by 骆亮 on 2019/12/18.
//  Copyright © 2019 LOLITA0164. All rights reserved.
//

#import "AViewController.h"
#import "LLNavigationView.h"

@interface AViewController () <LLNavigationViewDlegate>

@property (strong, nonatomic)LLNavigationView* navgationView;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
    
    self.navgationView = [[LLNavigationView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 64)];
    self.navgationView.tintColor = UIColor.redColor;
    [self.navgationView setTitle:@"我是标题" rightBtnText:@"右边"];
    [self.view addSubview:self.navgationView];
    self.navgationView.delegate = self;
    
}


-(void)navigationViewLeftClickEventDlegate{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
