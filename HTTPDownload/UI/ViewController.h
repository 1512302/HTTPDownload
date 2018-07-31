//
//  ViewController.h
//  HTTPDownload
//
//  Created by CPU11367 on 7/30/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadTableView.h"
#import "DownloadInputView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic, readonly) DownloadTableView *downloadTableView;

@property (strong, nonatomic, readonly) DownloadInputView *downloadInputView;

@end

