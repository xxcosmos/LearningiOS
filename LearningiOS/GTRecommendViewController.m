//
//  GTRecommendViewController.m
//  LearningiOS
//
//  Created by 张啸宇 on 2019/11/28.
//  Copyright © 2019 xiaoyuu. All rights reserved.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation GTRecommendViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width , self.view.bounds.size.height*5);
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor blackColor],[UIColor lightTextColor],[UIColor greenColor]];
    
    for (int i = 0; i < 5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, scrollView.bounds.size.height * i, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            [view addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
                view.backgroundColor = [UIColor yellowColor];
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)];
                tapGesture.delegate = self;
                [view addGestureRecognizer:tapGesture];
                view;
            })];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    scrollView.pagingEnabled = NO;
    [self.view addSubview:scrollView];
  
}
-(void) viewClicked{
    NSLog(@"view did clicked");
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
}
@end
