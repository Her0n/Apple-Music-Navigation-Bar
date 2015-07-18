//
//  NewViewController.m
//  NavigationDemo
//
//  Created by Yifei Zhou on 7/18/15.
//  Copyright (c) 2015 Aladdin Inc. All rights reserved.
//

#import "NewViewController.h"

#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#endif

@interface NewViewController ()

@property(readonly) UINavigationBar *navigationBar;
@property(strong, nonatomic) UIImageView *headerView;

@end

@implementation NewViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  //    self.view.backgroundColor = [UIColor redColor];
  self.title = @"Bad";
  self.headerView =
      [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
  self.headerView.image = [UIImage imageNamed:@"Nico"];
  self.headerView.contentMode = UIViewContentModeScaleAspectFill;
  [self.view addSubview:self.headerView];
}

- (void)dealloc {
  self.headerView = nil;
}

- (void)viewWillAppear:(BOOL)animated {
  NSLog(@"%@ viewWillAppear:", NSStringFromClass([self class]));
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
  NSLog(@"%@ viewDidAppear:", NSStringFromClass([self class]));
  [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UINavigationBar *)navigationBar {
  return [self.navigationController navigationBar];
}

@end
