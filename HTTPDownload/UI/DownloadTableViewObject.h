//
//  DownloadTableViewObject.h
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "CellObjectModel.h"

@interface DownloadTableViewObject : CellObjectModel

@property (readwrite, nonatomic, strong) NSString *title;

@property (readwrite, nonatomic, strong) NSString *progressString;

@property (readwrite, nonatomic) float progress;

@property (readwrite, nonatomic) BOOL isPersen;

- (instancetype)init;

@end
