//
//  DownloadTableViewCell.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/30/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "DownloadTableViewCell.h"
#import "DownloadTableViewObject.h"

@implementation DownloadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (TableViewCellModel *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCellModel *cell = [tableView dequeueReusableCellWithIdentifier:@"DownloadTableViewCell"];
    return cell;
}

- (BOOL)shouldUpdateWithObject:(id)anObject {
    if (![anObject isKindOfClass:[DownloadTableViewObject class]]) {
        return false;
    }
    DownloadTableViewObject *object = anObject;
    _titleLabel.text = object.title;
    _progressLabel.text = object.progressString;
    _progressView.progress = object.progress;
    return true;
}

@end
