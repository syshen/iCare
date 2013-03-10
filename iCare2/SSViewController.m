//
//  SSViewController.m
//  iCare2
//
//  Created by Shen Steven on 3/9/13.
//  Copyright (c) 2013 syshen. All rights reserved.
//

#import "SSViewController.h"
#import "SSFeelingViewController.h"
#import "IRPaginatedView.h"

@interface SSViewController () <IRPaginatedViewDelegate>

@property (nonatomic, strong) IRPaginatedView *paginatedView;
@property (nonatomic, strong) NSArray *viewControllers;

@end

@implementation SSViewController {
  CGRect appFrame;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  SSFeelingViewController *vc1 = [[SSFeelingViewController alloc] initWithImageName:@"iCare"];
  SSFeelingViewController *vc2 = [[SSFeelingViewController alloc] initWithImageName:@"Dad"];
  SSFeelingViewController *vc3 = [[SSFeelingViewController alloc] initWithImageName:@"BluMom"];
  self.viewControllers = @[vc1, vc2, vc3];
  
  appFrame = [UIScreen mainScreen].bounds;
  
  self.paginatedView = [[IRPaginatedView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  self.paginatedView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  self.paginatedView.currentPage = 0;

  self.paginatedView.delegate = self;
  [self.paginatedView reloadViews];
  
  [self.view addSubview:self.paginatedView];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}


#pragma mark - IRPaginatedView Delegates
- (NSUInteger) numberOfViewsInPaginatedView:(IRPaginatedView *)paginatedView {
  
  return self.viewControllers.count;
  
}

- (UIViewController*) viewControllerForSubviewAtIndex:(NSUInteger)index inPaginatedView:(IRPaginatedView *)paginatedView {
  
  return self.viewControllers[index];
  
}

- (UIView*) viewForPaginatedView:(IRPaginatedView *)paginatedView atIndex:(NSUInteger)index {
  
  UIViewController *vc = self.viewControllers[index];
  return vc.view;
  
}



@end
