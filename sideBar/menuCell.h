//
//  menuCell.h
//  mielseno
//
//  Created by sense on 16/2/4.
//  Copyright © 2016年 sense. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface menuCell : UITableViewCell

@property (nonatomic,retain) UIImageView *image0;
@property (nonatomic,retain) UILabel *labelEnglish;
@property (nonatomic,retain) UILabel *labelChinese;
@property (nonatomic,retain) UIImageView *image1;


//- (void)sendModel:(model *)model;
- (void)sendData:(CGRect)frame;
- (void)sendBigData:(CGRect)frame;

- (void)showOriginAnimated:(BOOL)animated;
- (void)hideOriginAnimated:(BOOL)animated;

- (void)showSideAnimated:(BOOL)animated;
- (void)hideSideAnimated:(BOOL)animated;

@end
