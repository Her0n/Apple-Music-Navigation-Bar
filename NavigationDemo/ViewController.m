//
//  ViewController.m
//  NavigationDemo
//
//  Created by Yifei Zhou on 7/18/15.
//  Copyright (c) 2015 Aladdin Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) NSMutableArray *dataArray;
@property(readonly) UINavigationBar *navigationBar;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  self.dataArray = [@[ @1, @2, @3 ] mutableCopy];
  self.title = @"Good";
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

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return [self.dataArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell =
      [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:@"Cell"];
  CGRect frame = cell.frame;
  frame.origin.x += 20.0f;
  UILabel *label = [[UILabel alloc] initWithFrame:frame];
  label.text = [NSString stringWithFormat:@"%lu", (long)indexPath.row];
  [cell addSubview:label];
  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self performSegueWithIdentifier:@"Push"
                            sender:[tableView cellForRowAtIndexPath:indexPath]];
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UINavigationBar *)navigationBar {
  return [self.navigationController navigationBar];
}
@end
