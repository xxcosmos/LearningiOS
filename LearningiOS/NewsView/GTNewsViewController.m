//
//  GTNewsViewController.m
//  LearningiOS
//
//  Created by 张啸宇 on 2019/11/26.
//  Copyright © 2019 xiaoyuu. All rights reserved.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteButtonView.h"

/// 自解释的注释
@interface GTNewsViewController ()<UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>
@property(nonatomic, strong, readwrite)UITableView *tableView;
@property(nonatomic, strong, readwrite)NSMutableArray *dataArray;

@end

@implementation GTNewsViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataArray = @[].mutableCopy;
        for (int i = 0; i<20; i++) {
            [_dataArray addObject:@(i)];
        }
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page.png"];
    }
    return self;
}
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
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

/// 方法的注释
/// @param tableView you should know what it means
/// @param indexPath just the index path
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
    GTDeleteButtonView *deleteButtonView = [[GTDeleteButtonView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    //循环引用
    __weak typeof (self) wself = self;
    [deleteButtonView showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof (self)strongSelf = wself;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(20, 20);
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return true;
}


@end
