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

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@property (weak, nonatomic) IBOutlet UIButton *resumeButton;

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
    [self updateState];
    return true;
}

- (IBAction)cencelButtonTouch:(id)sender {
    id view = [self superview];
    
    while (view && [view isKindOfClass:[UITableView class]] == NO) {
        view = [view superview];
    }
    DownloadTableView *tableView = view;
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Cancel" message:@"Do you want cancel download this file?" preferredStyle:UIAlertControllerStyleAlert];
    
    __weak __typeof(self) weakSelf = self;
    UIAlertAction* exitAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [weakSelf.cellObject.downloadManager cancel];
        [tableView removeCell:self.cellObject];
    }];
    
    UIAlertAction* comebackAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    
    [alert addAction:exitAction];
    [alert addAction:comebackAction];
    UIViewController *viewCotroller = [UIApplication sharedApplication].windows[0].rootViewController;
    [viewCotroller presentViewController:alert animated:YES completion:nil];
}

- (IBAction)pauseButtonTouch:(id)sender {
    [_cellObject pause];
}

- (IBAction)resumeButtonTouch:(id)sender {
    [_cellObject resume];
}

- (void)updateState {
    if (_cellObject) {
        switch (_cellObject.state) {
            case DownloadStateDownloading:
                [self resumeState];
                break;
            case DownloadStatePause:
                [self pauseState];
                break;
            case DownloadStateComplete:
                [_progressView setHidden:YES];
            default:
                [self noDownloadState];
                break;
        }
        self.backgroundColor = [_cellObject getColorBackgroud];
    }
    
}

- (void)pauseState {
    [_pauseButton setHidden:YES];
    [_resumeButton setHidden:NO];
}

- (void)resumeState {
    [_pauseButton setHidden:NO];
    [_resumeButton setHidden:YES];
}

- (void)noDownloadState {
    [_resumeButton setHidden:YES];
    [_pauseButton setHidden:YES];
}

@end
