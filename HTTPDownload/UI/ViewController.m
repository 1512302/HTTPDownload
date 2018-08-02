//
//  ViewController.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/30/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "ViewController.h"
#import "DownloadTableViewObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)downloadButtonTouchUpInside:(id)sender {
    NSString *url = _urlInputTextField.text;
    _urlInputTextField.text = @"";
    if (url.length > 0) {
        DownloadTableViewObject *cellObject = [DownloadTableViewObject new];
        cellObject.title = url;
        cellObject.progressString = @"Pending";
        [_downloadTableView addCell:cellObject];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Download";
//
    [self loadData];
    [self loadUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    NSMutableArray *historyDownload = [NSMutableArray new];
    _downloadTableView.cellObjects = historyDownload;
}

- (void)loadUI {
    
}



@end
