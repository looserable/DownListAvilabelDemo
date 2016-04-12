//
//  ViewController.m
//  DownListAvilabelDemo
//
//  Created by john on 16/4/12.
//  Copyright © 2016年 jhon. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"

@interface ViewController ()<SelectDelegate>
{
    UIButton * downButton;
    NSArray * _titleArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake(100, 100, 100, 50);
    [downButton setTitle:@"downList" forState:UIControlStateNormal];
    downButton.backgroundColor = [UIColor purpleColor];
    [downButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downButton addTarget:self action:@selector(downClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:downButton];
    
    
    
}

- (void)downClick:(UIButton *)sender{
    
    for (ChildViewController * vc in self.childViewControllers) {
        [self hideContentController:vc];
        return;
    }
    
    _titleArray = @[@"button1",@"button2",@"button3",@"button4"];
    ChildViewController * childVC = [[ChildViewController alloc]init];
    childVC.titleArray = _titleArray;
    childVC.frame = sender.frame;
    childVC.delegate = self;
    [self addChildViewController:childVC];
    [self.view addSubview:childVC.view];
}

//隐藏viewController
- (void) hideContentController: (ChildViewController*) content
{
    [content hideViewController];
}

- (void)selectIndex:(NSInteger)index{
    
    [downButton setTitle:_titleArray[index] forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
