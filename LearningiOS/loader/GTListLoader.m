//
//  GTListLoader.m
//  LearningiOS
//
//  Created by 张啸宇 on 2019/11/30.
//  Copyright © 2019 xiaoyuu. All rights reserved.
//

#import "GTListLoader.h"

@implementation GTListLoader
- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {
    NSString *urlString = @"http://www.wust.edu.cn";
    NSURL *listURL = [NSURL URLWithString:urlString];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        NSError *jsonError;
        __unused id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSLog(@"dd");
        NSMutableArray *listItemArray = @[].mutableCopy;
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (finishBlock) {
                               finishBlock(error == nil, listItemArray.copy);
                           }
                       });
    }];
    [dataTask resume];
}

@end
