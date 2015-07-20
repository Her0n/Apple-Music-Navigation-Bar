//
//  ALDNavigationController.m
//  NavigationDemo
//
//  Created by Yifei Zhou on 7/18/15.
//  Copyright (c) 2015 Aladdin Inc. All rights reserved.
//

#import "ALDNavigationController.h"
#import "UINavigationController+Block.h"
#import "NewViewController.h"
#import <objc/runtime.h>

static char kNavigationBarKey;

@interface ALDNavigationController ()

@end

@implementation ALDNavigationController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated {
  NSLog(@"pushViewController:animated:");

  UIViewController *topVC = [self.viewControllers lastObject];
  if ([viewController isKindOfClass:[NewViewController class]]) {
    if (topVC.navigationController.navigationBar &&
        !topVC.navigationController.navigationBarHidden) {
      // add navigation bar
      CGRect rect = self.navigationBar.frame;
      UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:rect];
      rect.origin = CGPointMake(0, -20);
      rect.size.height += 20;
      [[bar valueForKey:@"_backgroundView"] setFrame:rect];
      [bar setShadowImage:[self.navigationBar.shadowImage copy]];
      [topVC.view addSubview:bar];
      [[self.navigationBar valueForKey:@"_backgroundView"] setAlpha:0];
      objc_setAssociatedObject(topVC, &kNavigationBarKey, bar,
                               OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
  }
  [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
  NSLog(@"popViewControllerAnimated:");

  UIViewController *topVC = [self.viewControllers lastObject];
  if ([topVC isKindOfClass:[NewViewController class]]) {
    if ([self.viewControllers count] >= 2) {
      UINavigationBar *bar = objc_getAssociatedObject(
          [self.viewControllers objectAtIndex:[self.viewControllers count] - 2],
          &kNavigationBarKey);
      [super popViewControllerAnimated:animated
                          onCompletion:^{
                            [self.navigationBar setShadowImage:nil];
                            [self.navigationBar
                                setBackgroundImage:nil
                                     forBarMetrics:UIBarMetricsDefault];
                            [[self.navigationBar valueForKey:@"_backgroundView"]
                                setAlpha:1];
                            [bar removeFromSuperview];
                          }];
      return topVC;
    }
  }
  return [super popViewControllerAnimated:animated];
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

@end
