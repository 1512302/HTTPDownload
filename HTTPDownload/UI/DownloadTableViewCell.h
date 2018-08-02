//
//  DownloadTableViewCell.h
//  HTTPDownload
//
//  Created by CPU11367 on 7/30/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "TableViewCellModel.h"

@interface DownloadTableViewCell : TableViewCellModel

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end
