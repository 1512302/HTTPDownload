//
//  TableViewModel.h
//  HTTPDownload
//
//  Created by CPU11367 on 8/1/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewModel : UITableView <UITableViewDataSource>

@property (strong, nonatomic, readonly) NSMutableArray *cellObjects;

@end
