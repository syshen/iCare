//
//  SSConversationViewController.m
//  iCare2
//
//  Created by Shen Steven on 3/9/13.
//  Copyright (c) 2013 syshen. All rights reserved.
//

#import "SSConversationViewController.h"

@interface SSConversationViewController ()

@property (nonatomic, strong) UISwipeGestureRecognizer *swipe;

@end

@implementation SSConversationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiped:)];
  self.swipe.direction = UISwipeGestureRecognizerDirectionDown;
  
  UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MSG"]];
  [self.view addSubview:imageView];
  
  [self.view addGestureRecognizer:self.swipe];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) swiped:(UISwipeGestureRecognizer*)swipeRecogr {
  
  [self dismissViewControllerAnimated:YES completion:nil];
  
}

@end
