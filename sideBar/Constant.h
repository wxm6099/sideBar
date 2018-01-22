//
//  Constant.h
//  mielseno
//
//  Created by sense on 16/1/24.
//  Copyright © 2016年 sense. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define SCREEN_FRAME        [UIScreen mainScreen].bounds
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
//#define SCREEN_WIDTH        CGRectGetWidth([UIScreen mainScreen].bounds)
//#define SCREEN_HEIGHT       CGRectGetHeight([UIScreen mainScreen].bounds)
#define STATUS_HEIGHT       CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
#define NAVIGATION_HEIGHT   CGRectGetHeight(self.navigationController.navigationBar.frame)
#define TABBAR_HEIGHT       CGRectGetHeight(self.tabBarController.tabBar.frame)



#define iOS8            ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#define iOS9            ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? YES : NO)
#define iOS10           ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ? YES : NO)
#define iOS11           ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0 ? YES : NO)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]
#define COLOR(R,G,B,A)  [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:A]


#define COLOR_E8EBFB        COLOR(232,235,251,1.0)
#define COLOR_797E99        COLOR(121,126,153,1.0)  // 投影的颜色
#define COLOR_50556E        COLOR(80,85,110,1.0)    /**输入字体*/
#define COLOR_9BA4D1        COLOR(155,164,209,1.0)  /**button*/
#define COLOR_B4B4CB        COLOR(180,180,203,1.0)  /**placeHolder*/
#define COLOR_FAFBFD        COLOR(250,251,253,1.0)  /**背景色*/
#define COLOR_292B38        COLOR(41,43,56,1.0)     //标题
#define COLOR_060C28_88     COLOR(6,12,40,0.88)
#define COLOR_060C28_60     COLOR(6,12,40,0.6)
#define COLOR_F3F5FF        COLOR(243,245,255,1.0)  //导航栏
#define COLOR_F8F9FA        COLOR(248,249,250,1.0)
#define COLOR_B4BFF9        COLOR(180,191,249,1.0)  //进度条
#define COLOR_FE9790        COLOR(254,151,144,1.0)  //badge
#define COLOR_B4B4CB        COLOR(180,180,203,1.0)  // 文字的颜色
#define COLOR_DFDFE3        COLOR(223,223,227,1.0)  // 线的颜色
#define COLOR_EFF1F3        COLOR(239,241,243,1.0)
#define COLOR_E5E5E5        COLOR(229,229,229,1.0)

/** #2F313A */
#define COLOR_ProgressTrack     COLOR(47,49,58,1.0)
/** #FF5487 */
#define COLOR_ProgressTint    COLOR(255,84,135,1.0)
/** #FF555D */
#define COLOR_ProgressDelete    COLOR(180,180,203,1.0)


#endif /* Constant_h */
