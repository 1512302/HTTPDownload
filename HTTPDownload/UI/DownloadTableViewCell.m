//
//  DownloadTableViewCell.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/30/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "DownloadTableViewCell.h"
#import "DownloadTableViewObject.h"
#import "DownloadTableView.h"

@interface DownloadTableViewCell()

@end

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
    if (self.cellObject) {
        self.cellObject.cell = nil;
    }
    object.cell = self;
    self.cellObject = object;
    return true;
}

- (IBAction)cencelButtonTouch:(id)sender {
    id view = [self superview];
    
    while (view && [view isKindOfClass:[UITableView class]] == NO) {
        view = [view superview];
    }
    DownloadTableView *tableView = view;
    
    [tableView removeCell:self.cellObject];
    
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Cancel" message:@"Do you want cancel download this file?" preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* exitAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
//        [tableView removeCell:self.cellObject];
//    }];
//    
//    UIAlertAction* comebackAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
//    
//    [alert addAction:exitAction];
//    [alert addAction:comebackAction];
//    UIViewController *viewCotroller = [UIApplication sharedApplication].windows[0].rootViewController;
//    [viewCotroller presentViewController:alert animated:YES completion:nil];
}



- (IBAction)resumeButtonTouch:(id)sender {
    _progressView.progress += 0.05;
    
}




@end
