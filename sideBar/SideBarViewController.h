//
//  SideBarViewController.h
//  mielseno
//
//  Created by sense on 16/1/28.
//  Copyright © 2016年 sense. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SideBarViewController;

@protocol SideBarDelegate <NSObject>

@optional
- (void)sidebar:(SideBarViewController *)sidebar willShowOnScreenAnimated:(BOOL)animatedYesOrNo;
- (void)sidebar:(SideBarViewController *)sidebar didShowOnScreenAnimated:(BOOL)animatedYesOrNo;
- (void)sidebar:(SideBarViewController *)sidebar willDismissFromScreenAnimated:(BOOL)animatedYesOrNo;
- (void)sidebar:(SideBarViewController *)sidebar didDismissFromScreenAnimated:(BOOL)animatedYesOrNo;
- (void)sidebar:(SideBarViewController *)sidebar didTapItemAtIndex:(NSUInteger)index;
- (void)sidebar:(SideBarViewController *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index;

@end

@interface SideBarViewController : UIViewController

@property (nonatomic,retain) NSMutableDictionary *selectedIndex;

@property (nonatomic, weak) id <SideBarDelegate> delegate;

//- (instancetype)initWithcells:(NSArray *)cells;

- (void)show;
- (void)showAnimated:(BOOL)animated;
- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated;

- (void)dismiss;
- (void)dismissAnimated:(BOOL)animated;

@end
