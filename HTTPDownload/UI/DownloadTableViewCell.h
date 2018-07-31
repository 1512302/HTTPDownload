//
//  DownloadTableViewCell.h
//  HTTPDownload
//
//  Created by CPU11367 on 7/30/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadTableViewCell : UITableViewCell

@property (strong, nonatomic, readwrite) UILabel *nameFileLable;

@property (strong, nonatomic, readwrite) UIButton *resumeDownloadButton;

@property (strong, nonatomic, readwrite) UIButton *pauseDownloadButton;

@property (strong, nonatomic, readwrite) UIButton *cancelDownloadButton;

@property (strong, nonatomic, readwrite) UIProgressView *downloadProgressView;

@end
