//
//  ViewController.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/30/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "ViewController.h"
#import "DownloadTableViewObject.h"
#import "AFDownloadManager.h"

@interface ViewController ()

@property (strong, nonatomic) DownloadManagerModel *downloadManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Download";
    
    [self loadCore];
    [self loadData];
    [self loadUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadCore {
    _downloadManager = [AFDownloadManager new];
}

- (void)loadData {
    NSMutableArray *historyDownload = [NSMutableArray new];
    _downloadTableView.cellObjects = historyDownload;
}

- (void)loadUI {
    
}

- (IBAction)downloadButtonTouchUpInside:(id)sender {
    NSString *url = _urlInputTextField.text;
    _urlInputTextField.text = @"";
    if (url.length > 0) {
        DownloadTableViewObject *cellObject = [DownloadTableViewObject new];
        cellObject.title = url;
        cellObject.progressString = @"Pending";
        [_downloadTableView addCell:cellObject];
        
        [_downloadManager downloadWithURL:url completion:^(DownloadObjectModel *downloadObject, NSError *error) {
            cellObject.downloadManager = downloadObject;
            downloadObject.delegate = cellObject;
        }];
        
    }
}




@end
