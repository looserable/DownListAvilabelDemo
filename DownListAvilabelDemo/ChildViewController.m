//
//  ChildViewController.m
//  DownListAvilabelDemo
//
//  Created by john on 16/4/12.
//  Copyright © 2016年 jhon. All rights reserved.
//

#import "ChildViewController.h"

#define CELL_HEIGHT 30
#define MAX_VIEW_HEIGHT _titleArray.count * CELL_HEIGHT * 5
#define TABLE_VIEW_HEIGHT _titleArray.count * CELL_HEIGHT

@interface ChildViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * myTableView;
}

@end

@implementation ChildViewController


//将本子视图从父视图上面抹去。
- (void)hideViewController{
    
    CGRect selfFrame = self.view.frame;
    CGRect tabelFrame = myTableView.frame;
    selfFrame.size.height = 0;
    tabelFrame.size.height= 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = selfFrame;
        myTableView.frame = tabelFrame;
    } completion:^(BOOL finished) {
        [self willMoveToParentViewController:nil];// 1
        [self.view removeFromSuperview];// 2
        [self removeFromParentViewController];// 3
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    
    self.view.frame = CGRectMake(_frame.origin.x, _frame.origin.y + _frame.size.height, _frame.size.width, 0);
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, 0) style:UITableViewStylePlain];
    
    [UIView animateWithDuration:0.3 animations:^{
       self.view.frame = CGRectMake(_frame.origin.x, _frame.origin.y + _frame.size.height, _frame.size.width, TABLE_VIEW_HEIGHT);
        myTableView.frame = CGRectMake(0, 0, 100, TABLE_VIEW_HEIGHT);
    }];
    
    
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorInset = UIEdgeInsetsZero;
    
    [self.view addSubview:myTableView];
    
    for (UIView * view in self.view.subviews) {
        view.backgroundColor = [UIColor clearColor];
    }
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    [self setLastCellSeperatorToLeft:cell];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_delegate && [_delegate respondsToSelector:@selector(selectIndex:)]) {
        [self hideViewController];
        [_delegate selectIndex:indexPath.row];
    }
}


-(void)setLastCellSeperatorToLeft:(UITableViewCell *)cell
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
