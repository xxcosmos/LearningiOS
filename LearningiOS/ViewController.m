//
//  ViewController.m
//  LearningiOS
//
//  Created by 张啸宇 on 2019/11/26.
//  Copyright © 2019 xiaoyuu. All rights reserved.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>

@end

@implementation ViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    //    UIView *view = [[UIView alloc] init];
    //    view.backgroundColor = [UIColor greenColor];
    //    view.frame = CGRectMake(100, 100, 100, 100);
    //    [self.view addSubview:view];
    //
    //    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    //    [view addGestureRecognizer:tapGesture];
}

//- (void)pushController{
//    UIViewController *viewController = [[UIViewController alloc] init];
//    viewController.view.backgroundColor = [UIColor blackColor];
//    viewController.navigationItem.title = @"Title";
//
//    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"RightTitle" style:UIBarButtonItemStylePlain target:self action:nil];
//    [self.navigationController pushViewController:viewController animated:YES];
//
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GTDetailViewController *controller = [[GTDetailViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate =self;
    }
    [cell layoutTableViewCell];
    return cell;
}
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    NSLog(@"hellllllll");
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(20, 20);
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return true;
}

- (void)updateFocusIfNeeded {
    
}

@end
