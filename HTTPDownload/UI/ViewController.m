//
//  ViewController.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/30/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title = @"Download";
//    
//    [self loadUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadUI {
    _downloadInputView = [DownloadInputView new];
    [self.view addSubview:_downloadInputView];
    
    _downloadInputView.translatesAutoresizingMaskIntoConstraints = NO;
    [[_downloadInputView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
    [[_downloadInputView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
    [[_downloadInputView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
    [[_downloadInputView.heightAnchor constraintEqualToConstant:100] setActive:YES];
    
    
    _downloadTableView = [DownloadTableView new];
    [self.view addSubview:_downloadTableView];
    
    _downloadTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [[_downloadTableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor] setActive:YES];
    [[_downloadTableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor] setActive:YES];
    [[_downloadTableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
    [[_downloadTableView.topAnchor constraintEqualToAnchor:_downloadInputView.bottomAnchor] setActive:YES];
}



@end
