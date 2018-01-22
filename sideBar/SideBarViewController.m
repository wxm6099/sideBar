//
//  SideBarViewController.m
//  mielseno
//
//  Created by sense on 16/1/28.
//  Copyright © 2016年 sense. All rights reserved.
//

#import "SideBarViewController.h"
#import "Constant.h"
#import "menuCell.h"



@interface SideBarViewController ()<UITableViewDataSource,UITableViewDelegate>

//@property (nonatomic,retain) UIView *sideView;
@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSMutableArray *array1;
@property (nonatomic,retain) NSMutableArray *array2;

//@property (nonatomic, assign) CGFloat width;

//@property (nonatomic,retain) NSMutableDictionary *selectedIndex;

@end

@implementation SideBarViewController

static SideBarViewController *rn_frostedMenu;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 由于引入origin,这里的selectedIndex被origin附上初值, 所以把这里的初始化注掉
//    self.selectedIndex = [NSMutableDictionary dictionary];
//     [self.selectedIndex setObject:[NSNumber numberWithInt:1] forKeyedSubscript:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    [dic1 setObject:@"All Lingeries" forKey:@"English"];
    [dic1 setObject:@"所有场景" forKey:@"Chinese"];
    [dic1 setObject:[UIImage imageNamed:@"ALL_Lingeries"] forKey:@"img"];
    
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    [dic2 setObject:@"Date Collection" forKey:@"English"];
    [dic2 setObject:@"约会" forKey:@"Chinese"];
    [dic2 setObject:[UIImage imageNamed:@"Data_Collection"] forKey:@"img"];
    
    NSMutableDictionary *dic3 = [NSMutableDictionary dictionary];
    [dic3 setObject:@"Daily Bra" forKey:@"English"];
    [dic3 setObject:@"日常" forKey:@"Chinese"];
    [dic3 setObject:[UIImage imageNamed:@"Daily_Bra"] forKey:@"img"];
    
    NSMutableDictionary *dic4 = [NSMutableDictionary dictionary];
    [dic4 setObject:@"Leisure Wear" forKey:@"English"];
    [dic4 setObject:@"居家" forKey:@"Chinese"];
    [dic4 setObject:[UIImage imageNamed:@"Leisure_Wear"] forKey:@"img"];
    
    NSMutableDictionary *dic5 = [NSMutableDictionary dictionary];
    [dic5 setObject:@"Banquet Dress" forKey:@"English"];
    [dic5 setObject:@"宴会" forKey:@"Chinese"];
    [dic5 setObject:[UIImage imageNamed:@"Banquet_Dress"] forKey:@"img"];
    
    NSMutableDictionary *dic6 = [NSMutableDictionary dictionary];
    [dic6 setObject:@"Gym Suit" forKey:@"English"];
    [dic6 setObject:@"运动" forKey:@"Chinese"];
    [dic6 setObject:[UIImage imageNamed:@"Gym_Suit"] forKey:@"img"];
    
    self.array1 = [NSMutableArray arrayWithObjects:dic1,dic2,dic3,dic4,dic5,dic6,nil];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(-280*SCREEN_WIDTH/375, 0, 280*SCREEN_WIDTH/375, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    
    [_tableView registerClass:[menuCell class] forCellReuseIdentifier:@"menu"];
    [_tableView setScrollEnabled:NO];
    _tableView.separatorColor = [UIColor colorWithWhite:0.5 alpha:0.6];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIImageView *imageO = [[UIImageView alloc]initWithFrame:_tableView.frame];
    imageO.image = [UIImage imageNamed:@"background"];
    _tableView.backgroundView = imageO;
    
    _tableView.layer.shadowColor = [UIColor colorWithRed:19/255.0f green:0/255.0f blue:53/255.0f alpha:0.3].CGColor;
    _tableView.layer.shadowOpacity = 0.8;
//    _tableView.layer.shadowRadius = 2.0;
    _tableView.layer.shadowOffset = CGSizeMake(3, 3);
    _tableView.clipsToBounds = false;
    
    // 适配iOS 11 的 self-sizing默认开启
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    

    [self.view addSubview:self.tableView];
}

- (void)layoutSubviews
{
//    int width = self.view.frame.size.width * 2 / 3;
//    CGFloat x = self.parentViewController.view.bounds.size.width - width : 0;
}

// cell是否为选中状态
- (BOOL)cellIsSelected:(NSIndexPath *)indexPath
{
    NSNumber *selectedIndex = [self.selectedIndex objectForKey:[self keyForIndexPath:indexPath]];
    return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
}

// 在 iOS7 时,indexPath和UIMutableIndexPath 有时会交替返回,此时以indexPath 为key的字典取值会失效,在这里把返回的indexPath 加判断并强制转换为 indexPath
- (NSIndexPath *)keyForIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath class] == [NSIndexPath class]) {
        return indexPath;
    }
    return [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
}

// cell 顶端header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self cellIsSelected:indexPath]) {
        return 157*SCREEN_HEIGHT/667;
    }
    return 102*SCREEN_HEIGHT/667;
}

// 返回cell的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array1 count];
}

// cell 重用池
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    menuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menu"];
    NSDictionary *dic = [self.array1 objectAtIndex:indexPath.row];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.labelEnglish.text = [dic objectForKey:@"English"];
    cell.labelChinese.text = [dic objectForKey:@"Chinese"];
    cell.backgroundColor = [UIColor clearColor];
    if ([self cellIsSelected:indexPath]) {
//        cell.backgroundColor = COLOR_060C28_88;
        cell.image0.image = [dic objectForKey:@"img"];
        cell.image1.image = [UIImage imageNamed:@"Enter"];
//        [cell sendData:CGRectMake(0, 0, 280*SCREEN_WIDTH/375, 157*SCREEN_HEIGHT/667)];
        [cell showSideAnimated:NO];
    }else{
//        cell.backgroundColor = COLOR_9BA4D1;
        cell.image0.image = NULL;
        cell.image1.image = NULL;
//        [cell sendData:CGRectMake(0, 0, 280*SCREEN_WIDTH/375, 102*SCREEN_HEIGHT/667)];
        [cell hideSideAnimated:NO];
    }
    
    return cell;
}

-(void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

// 点击cell 触发
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 判断 2次 的点击 是否相同 indexPath 若相同 则进入 跳转判断 若不同 则 删除 上次存入的indexPath 初始化 这个字典 ****  回来写
    
    [self.selectedIndex setObject:[[NSNumber alloc]initWithInteger:indexPath.row *10] forKey:@"rowNum"];
    if ([self.selectedIndex objectForKeyedSubscript:indexPath]) {
        
        // 若为空 则和上次 存入的 indexPath不同 即此次点击不同的cell
        // 若不为空 则和上次 存入的 indexPath 相同, 即此次点击相同的cell
        switch (indexPath.row) {
            case 0:
                // 收起 抽屉 并切换不同的 首页内容
                [self dismiss];
                break;
            case 1:
                [self dismiss];
                break;
            case 2:
                [self dismiss];
                break;
            case 3:
                [self dismiss];
                break;
            case 4:
                [self dismiss];
                break;
            case 5:
                [self dismiss];
                break;
                
            default:
                break;
        }
    } else {
        
        menuCell *cellSelect = [tableView cellForRowAtIndexPath:indexPath];
        NSArray *array = [self.selectedIndex allKeysForObject:[NSNumber numberWithInt:1]];
//        NSLog(@"array = [%@]",array);
        menuCell *cellCancel = [tableView cellForRowAtIndexPath:array[0]];
        NSDictionary *dic = [self.array1 objectAtIndex:indexPath.row];
        cellSelect.labelEnglish.text = [dic objectForKey:@"English"];
        cellSelect.labelChinese.text = [dic objectForKey:@"Chinese"];
        cellSelect.image0.image = [dic objectForKey:@"img"];
        cellSelect.image1.image = [UIImage imageNamed:@"Enter"];
        [cellSelect showSideAnimated:YES];

        [cellCancel hideSideAnimated:YES];
        
        [self.selectedIndex removeObjectForKey:@"rowNum"];
        self.selectedIndex = [NSMutableDictionary dictionary];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        BOOL isSelected = ![self cellIsSelected:indexPath];
        NSNumber *selectedIndex = [NSNumber numberWithBool:isSelected];
        [self.selectedIndex setObject:selectedIndex forKeyedSubscript:indexPath];
//        menuCell *cell = [tableView cellForRowAtIndexPath:indexPath];

//        [self.tableView reloadData];
//        [self.tableView reloadInputViews];
        
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        
    }
    
}

// 点击 空白 让菜单消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 点击空白 抽屉滑出 但不刷新页面
    [self dismissForSpaceAnimated:YES completion:nil];
}

- (void)showInViewController:(UIViewController *)controller animated:(BOOL)animated
{
    if (rn_frostedMenu != nil) {
        [rn_frostedMenu dismissViewControllerAnimated:NO completion:nil];
    }
    
    rn_frostedMenu = self;
    
    [self rn_addToParentViewController:controller callingAppearanceMethods:YES];
//    self.view.frame = controller.view.bounds;
    
//    CGRect contentFrame = self.view.bounds;
//    contentFrame.origin.x = _width;
//    contentFrame.size.width = _width;
    
    void (^animations)() = ^{
        self.tableView.frame = CGRectMake(0, 0, 280*SCREEN_WIDTH/375, SCREEN_HEIGHT);
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        if (finished && [self.delegate respondsToSelector:@selector(sidebar:didShowOnScreenAnimated:)]) {
            [self.delegate sidebar:self didShowOnScreenAnimated:animated];
        }
    };

    if (animated) {
        [UIView animateWithDuration:0.25
                              delay:0
                            options:kNilOptions
                         animations:animations completion:completion];
    }else{
        animations();
        completion(YES);
    }
}

- (void)showAnimated:(BOOL)animated
{
    UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (controller.presentedViewController != nil) {
        controller = controller.presentedViewController;
    }
    [self showInViewController:controller animated:animated];
}

- (void)show
{
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    
    [self showAnimated:YES];
}

- (void)dismiss {
    [self dismissAnimated:YES completion:nil];
}

- (void)dismissAnimated:(BOOL)animated {
    [self dismissAnimated:animated completion:nil];
}

- (void)dismissAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    void (^completionBlock)(BOOL) = ^(BOOL finished){
        [self rn_removeFromParentViewControllerCallingAppearanceMethods:YES];
        
        if ([self.delegate respondsToSelector:@selector(sidebar:didDismissFromScreenAnimated:)]) {
            [self.delegate sidebar:self didDismissFromScreenAnimated:YES];
        }
        
        rn_frostedMenu = nil;
        
        if (completion) {
            completion(finished);
        }
    };
    
    if ([self.delegate respondsToSelector:@selector(sidebar:willDismissFromScreenAnimated:)]) {
        [self.delegate sidebar:self willDismissFromScreenAnimated:YES];
    }
    
    if (animated) {
//        CGRect contentFrame = self.tableView.frame;
        
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.tableView.frame = CGRectMake(-280, 0, 280*SCREEN_WIDTH/375, SCREEN_HEIGHT);
//                             self.tableView.alpha = 0;
                         }
                         completion:completionBlock];
    }
    else {
        completionBlock(YES);
    }
}

- (void)dismissForSpaceAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    void (^completionBlock)(BOOL) = ^(BOOL finished){
        [self rn_removeFromParentViewControllerCallingAppearanceMethods:YES];
        
        rn_frostedMenu = nil;
        
        if (completion) {
            completion(finished);
        }
    };
    if (animated) {
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.tableView.frame = CGRectMake(-280, 0, 280*SCREEN_WIDTH/375, SCREEN_HEIGHT);
//                             self.tableView.alpha = 0;
                         }
                         completion:completionBlock];
    }
    else {
        completionBlock(YES);
    }
}

- (void)rn_addToParentViewController:(UIViewController *)parentViewController callingAppearanceMethods:(BOOL)callAppearanceMethods {
    if (self.parentViewController != nil) {
        [self rn_removeFromParentViewControllerCallingAppearanceMethods:callAppearanceMethods];
    }
    
    if (callAppearanceMethods) [self beginAppearanceTransition:YES animated:NO];
    [parentViewController addChildViewController:self];
    [parentViewController.view addSubview:self.view];
    [self didMoveToParentViewController:self];
    if (callAppearanceMethods) [self endAppearanceTransition];
}

- (void)rn_removeFromParentViewControllerCallingAppearanceMethods:(BOOL)callAppearanceMethods {
    if (callAppearanceMethods) [self beginAppearanceTransition:NO animated:NO];
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    if (callAppearanceMethods) [self endAppearanceTransition];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
