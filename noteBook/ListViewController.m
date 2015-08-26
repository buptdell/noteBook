//
//  ListViewController.m
//  noteBook
//
//  Created by 王长旭 on 15/8/26.
//  Copyright (c) 2015年 王长旭. All rights reserved.
//

#import "ListViewController.h"
#import "ViewController.h"
@implementation ListViewController{
    ViewController * _viewController;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.navigationItem.title = @"记事本列表";
    
    
    _name = [NSMutableArray arrayWithObjects:@"1", @"2",@"3",@"4",@"5",nil];
    _content = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    _viewController = [storyboard instantiateViewControllerWithIdentifier:@"editNoteBook"];
//    self.navi.title = @"记事本列表";
    
    
//    _viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editNoteBook"];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellId = @"cellId";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    NSUInteger rowNo = indexPath.row;
    
    cell.textLabel.text = _name[rowNo];
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    //    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    cell.detailTextLabel.text = _content[rowNo];
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _name.count;
}

-(void)tableView:(UITableView*) tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSInteger rowNo = indexPath.row;
    //    NSLog(@"123");
    
    _viewController.name = _name[rowNo];
    _viewController.content = _content[rowNo];
    _viewController.rowNo = rowNo;
    [self.navigationController pushViewController:_viewController animated:YES];
}


-(BOOL) prefersStatusBarHidden{
    return true;
}

@end
