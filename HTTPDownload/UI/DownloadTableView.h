//
//  DownloadTableView.h
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadTableView : UITableView <UITableViewDataSource>

@property (strong, nonatomic, readonly) NSMutableArray *downloadArray;



@end
