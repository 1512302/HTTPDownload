//
//  DownloadInputView.m
//  HTTPDownload
//
//  Created by CPU11367 on 7/31/18.
//  Copyright © 2018 CPU11367. All rights reserved.
//

#import "DownloadInputView.h"

@implementation DownloadInputView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.urlTextField = [UITextField new];
        self.urlTextField.placeholder = @"Typing url here";
        [self addSubview:self.urlTextField];
        
        self.downloadButton = [UIButton new];
        [self.downloadButton setTitle:@"Download" forState:UIControlStateNormal];
        [self.downloadButton setTitleColor:[UIColor blueColor]forState:UIControlStateNormal];
        [self.downloadButton setTitleColor:[UIColor grayColor]forState:UIControlStateSelected];
        [self addSubview:self.downloadButton];
        
        [self layout];
        
    }
    return self;
}

- (void)layout {
    self.downloadButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[self.downloadButton.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-5] setActive:YES];
    [[self.downloadButton.heightAnchor constraintEqualToConstant:34] setActive:YES];
    [[self.downloadButton.widthAnchor constraintEqualToConstant:86] setActive:YES];
    [[self.downloadButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:YES];
}

@end
