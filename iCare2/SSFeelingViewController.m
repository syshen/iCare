//
//  SSFeelingViewController.m
//  iCare2
//
//  Created by Shen Steven on 3/9/13.
//  Copyright (c) 2013 syshen. All rights reserved.
//

#import "SSFeelingViewController.h"
#import "SSConversationViewController.h"
#import "SSHeaderCell.h"
#import "SSBodyCell.h"

@interface SSFeelingViewController ()  <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SSFeelingViewController


- (id) initWithImageName:(NSString*)imageName {

  self = [super initWithNibName:nil bundle:nil];
  if (self) {
    self.imageName = imageName;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  }
  return self;
}


- (void)viewDidLoad
{
  [super viewDidLoad];
  
  UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
  flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
  flowlayout.minimumInteritemSpacing = 0.0f;
  flowlayout.minimumLineSpacing = 0.0f;
  
  self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowlayout];
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
  self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  [self.collectionView registerClass:[SSHeaderCell class] forCellWithReuseIdentifier:@"header"];
  [self.collectionView registerClass:[SSBodyCell class] forCellWithReuseIdentifier:@"body"];
  
  [self.collectionView reloadData];
  [self.view addSubview:self.collectionView];
    
  self.button = [UIButton buttonWithType:UIButtonTypeCustom];
  self.button.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);
  [self.button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
  [self.button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:self.button];
  [self.view bringSubviewToFront:self.button];
  
}


- (void) didShowView {
//  [self.scrollView scrollRectToVisible:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height+144) animated:NO];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) buttonPressed:(id)sender {

  SSConversationViewController *conv = [[SSConversationViewController alloc] initWithNibName:nil bundle:nil];
  
  self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//  self.modalPresentationStyle = UIModalPresentationFullScreen;
  
  [self presentViewController:conv animated:YES completion:nil];
  
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  if (indexPath.row == 0) {
    
    SSHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"header" forIndexPath:indexPath];
    NSString *name = [NSString stringWithFormat:@"%@Header", self.imageName];
    cell.imageView.image = [UIImage imageNamed:name];
    return cell;
  } else {
    SSBodyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"body" forIndexPath:indexPath];
    NSString *name = [NSString stringWithFormat:@"%@Body", self.imageName];

    cell.imageView.image = [UIImage imageNamed:name];
    return cell;
  }
  return nil;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 0) {
    return CGSizeMake(320, 120);
  } else {
    CGRect frame = [UIScreen mainScreen].bounds;
    return CGSizeMake(320, frame.size.height);
  }
}

@end
