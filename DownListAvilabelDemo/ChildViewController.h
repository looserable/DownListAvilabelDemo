//
//  ChildViewController.h
//  DownListAvilabelDemo
//
//  Created by john on 16/4/12.
//  Copyright © 2016年 jhon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectDelegate <NSObject>

- (void)selectIndex:(NSInteger)index;

@end

@interface ChildViewController : UIViewController

@property (nonatomic,copy)NSArray * titleArray;
@property (nonatomic,assign)CGRect frame;
@property (nonatomic,assign)id <SelectDelegate>delegate;

- (void)hideViewController;

@end
