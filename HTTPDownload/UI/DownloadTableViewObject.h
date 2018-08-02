//
//  DownloadTableViewObject.h
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "CellObjectModel.h"
#import "DownloadObjectModel.h"

@class DownloadTableViewCell;

@interface DownloadTableViewObject : CellObjectModel <DownloadObjectDelegate>

@property (readwrite, nonatomic, strong) NSString *title;

@property (readwrite, nonatomic, strong) NSString *progressString;

@property (readwrite, nonatomic) float progress;

@property (readwrite, nonatomic) BOOL isPersen;

@property (readwrite, nonatomic, weak) DownloadTableViewCell *cell;

@property (readwrite, nonatomic, strong) DownloadObjectModel *downloadManager;

- (instancetype)init;

@end
