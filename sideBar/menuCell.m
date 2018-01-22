//
//  menuCell.m
//  mielseno
//
//  Created by sense on 16/2/4.
//  Copyright © 2016年 sense. All rights reserved.
//

#import "menuCell.h"
#import "Constant.h"


@implementation menuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.image0 = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.image0.image = nil;
        self.image0.alpha = 0;
        [self.contentView addSubview:self.image0];
        
        self.labelEnglish = [[UILabel alloc]initWithFrame:CGRectZero];
        self.labelEnglish.textColor = COLOR_50556E;
        self.labelEnglish.font = [UIFont systemFontOfSize:17];
        self.labelEnglish.backgroundColor = [UIColor clearColor];
        self.labelEnglish.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.labelEnglish];
        
        self.labelChinese = [[UILabel alloc]initWithFrame:CGRectZero];
        self.labelChinese.font = [UIFont systemFontOfSize:14];
        self.labelChinese.textColor = COLOR_50556E;
        self.labelChinese.backgroundColor = [UIColor clearColor];
        self.labelChinese.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.labelChinese];
        
        self.image1 = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.image1.image = nil;
        self.image1.alpha = 0;
        [self.contentView addSubview:self.image1];
        
    }
    return self;
}

- (void)sendData:(CGRect)frame
{
    self.image0.frame = frame;

    self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
    self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
    self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);
}

- (void)sendBigData:(CGRect)frame
{
    self.image0.frame = frame;
    self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
    self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
    self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);
}

//- (void)sendModel:(Model *)model
//{
//    [self.aview setimageWithUrl:model.photo_path placeHolder:@"1.jpg"];
//    self.label.text = [NSString stringWithFormat:@"    $%@", model.price];
//    [self.button setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
//    [self.button setTitle:[NSString stringWithFormat:@"%@", model.like_count] forState:UIControlStateNormal];
//}

- (void)showOriginAnimated:(BOOL)animated{
    
    if (animated) {
        
        //        self.image0.transform = CGAffineTransformMake(2, 0, 0, 2, 0, 0);
        [UIView animateWithDuration:0.7
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:4
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.image0.alpha = 1;
                             //                           self.image0.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
                             
                             CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 157*SCREEN_HEIGHT/667);
                             self.image0.frame = frame;
                             self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
                             self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
                             self.image1.alpha = 1;
                             self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);
                             
                         }
                         completion:^(BOOL finished) {
                         }];
    } else {
        
        self.image0.alpha = 1;
        self.image0.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 157*SCREEN_HEIGHT/667);
        self.image0.frame = frame;
        self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
        self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
        self.image1.alpha = 1;
        self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);
    }
    
}
- (void)hideOriginAnimated:(BOOL)animated{
    
    if (animated) {
        
        [UIView animateWithDuration:0.7
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:4
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.image0.alpha = 0;
                             //                             self.image0.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
                             CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 102*SCREEN_HEIGHT/667);
                             self.image0.frame = frame;
                             self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
                             self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
                             self.image1.alpha = 0;
                             self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);
                             
                         }
                         completion:^(BOOL finished) {
                             
                         }];
    } else {
        self.image0.alpha = 0;
        //        self.image0.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 102*SCREEN_HEIGHT/667);
        self.image0.frame = frame;
        self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
        self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
        self.image0.alpha = 0;
        self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);
    }
}

- (void)showSideAnimated:(BOOL)animated{
    
    if (animated) {
        
        //        self.image0.transform = CGAffineTransformMake(2, 0, 0, 2, 0, 0);
        [UIView animateWithDuration:0.5
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:4
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.image0.alpha = 1;
                             //                           self.image0.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
                             CGRect frame = CGRectMake(0, 0, 280*SCREEN_WIDTH/375, 157*SCREEN_HEIGHT/667);
                             self.image0.frame = frame;
                             self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
                             self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
                             self.image1.alpha = 1;
                             self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);
                             }
                         completion:^(BOOL finished) {
        }];
    } else {
        
        self.image0.alpha = 1;
        //        self.image0.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
        CGRect frame = CGRectMake(0, 0, 280*SCREEN_WIDTH/375, 157*SCREEN_HEIGHT/667);
        self.image0.frame = frame;
        self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
        self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
        self.image1.alpha = 1;
        self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);

    }

}
- (void)hideSideAnimated:(BOOL)animated{
    
    if (animated) {
        
        [UIView animateWithDuration:0.5
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:4
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.image0.alpha = 0;
                             //                             self.image0.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
                             CGRect frame = CGRectMake(0, 0, 280*SCREEN_WIDTH/375, 102*SCREEN_HEIGHT/667);
                             self.image0.frame = frame;
                             self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
                             self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
                             self.image1.alpha = 0;
                             self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);
                         }
                         completion:^(BOOL finished) {
                             
                         }];
    } else {
        self.image0.alpha = 0;
        //        self.image0.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
        
        CGRect frame = CGRectMake(0, 0, 280*SCREEN_WIDTH/375, 102*SCREEN_HEIGHT/667);
        self.image0.frame = frame;
        self.labelEnglish.frame = CGRectMake(0, 85*frame.size.height/314,frame.size.width, 65*frame.size.height/314);
        self.labelChinese.frame = CGRectMake(0, 160*frame.size.height/314, frame.size.width, 55*frame.size.height/314);
        self.image1.alpha = 0;
        self.image1.frame = CGRectMake(frame.size.width/2 - 11, 240*frame.size.height/314, 22*frame.size.width/314, 22*frame.size.width/314);
    }

}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
