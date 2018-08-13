//
//  ViewController.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/30/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "ViewController.h"
#import "DownloadCellObject.h"
#import "DownloadManager.h"

@interface ViewController ()

@property (strong, nonatomic) DownloadManager *downloadManager;

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
    _downloadManager = [DownloadManager new];
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
        DownloadCellObject *cellObject = [DownloadCellObject new];
        cellObject.title = [ViewController getNameInURL:url];
        cellObject.progressString = @"Pending...";
        [_downloadTableView addCell:cellObject];
        
        [_downloadManager createDownloadWithURLString:url completion:^(DownloadObjectModel *downloadObject, NSError *error) {
            [downloadObject addUpdateBlock:^(NSNumber * totalWrite, NSNumber * totalExpected) {
                [cellObject progressDidUpdate:[totalWrite intValue] total:[totalExpected intValue]];
            }];
            [downloadObject addCompletionBlock:^(NSURL *fileURL) {
                NSString *filePath = fileURL.absoluteString;
                if (filePath.length == 0) {
                    filePath = nil;
                }
                [cellObject downloadFinish:filePath];
            }];
            
            cellObject.downloadManager = downloadObject;
            [downloadObject resume];
        }];
        
    }
}

+ (NSString *)getNameInURL:(NSString *)url {
    int startPoint = 0;
    for (int i = 1; i < [url length]; ++i) {
        if ([url characterAtIndex:i] == '/') {
            startPoint = i + 1;
        }
    }
    return [url substringFromIndex:startPoint];
}


@end
