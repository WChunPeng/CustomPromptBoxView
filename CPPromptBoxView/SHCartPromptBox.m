//
//  SHCartPromptBox.m
//  wxdoctor-d
//
//  Created by wangChunPeng on 16/7/1.
//  Copyright © 2016年 muguike. All rights reserved.
//

#import "SHCartPromptBox.h"
#import "AppDelegate.h"

#define TagOfBlackView 417


@interface SHCartPromptBox()
@property (nonatomic, strong) UIViewController *presentViewController;

@end

@implementation SHCartPromptBox
static SHCartPromptBox *_shareActionView = nil;

+ (void)cartPromptBoxViewWithMessageTitle:(NSString *)messageTitle
                            SureLableText:(NSString *)sureLableText
                           WithController:(UIViewController *)controller
                              DoneHandler:(CPPromptDoneBlock)doneBlock
                            Cancelhandler:(CPPromptCancelBlock)cancelBlock;

{
    _shareActionView = [[[NSBundle mainBundle] loadNibNamed:@"SHCartPromptBox" owner:nil options:nil] objectAtIndex:0];
    _shareActionView.titleLable.text = messageTitle;
    [_shareActionView.sureButton setTitle:sureLableText forState:UIControlStateNormal];
    _shareActionView.presentViewController = controller;
    _shareActionView.doneBlock = doneBlock;
    _shareActionView.cancelBlock = cancelBlock;
    [_shareActionView showWithAnimation];
}
- (IBAction)sureButtonClick:(UIButton *)sender
{
    [self dismissWithAnimation];
    if (self.doneBlock ) {
        self.doneBlock(self);
    }
    
}
- (IBAction)cancelButtonClick:(UIButton *)sender
{
    if (self.cancelBlock ) {
        self.cancelBlock(self);
    }
    [self dismissWithAnimation];
}

- (void)showWithAnimation
{
    UIView *blackView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    blackView.backgroundColor = [UIColor darkGrayColor];
    blackView.alpha = 0;
    blackView.tag = TagOfBlackView;
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appdelegate.window addSubview:blackView];
    [appdelegate.window addSubview:_shareActionView];

    
    self.center = self.presentViewController.view.center;
    
    __weak __typeof(&*self)weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        blackView.alpha = 0.4;
        weakSelf.center = self.presentViewController.view.center;
    }];
}

- (void)dismissWithAnimation
{
    __weak __typeof(&*self)weakSelf = self;
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIView *blackView = [appdelegate.window viewWithTag:TagOfBlackView];
    
    [UIView animateWithDuration:0.25 animations:^{
        blackView.alpha = 0;
        weakSelf.center = CGPointMake(weakSelf.frame.size.width/2, weakSelf.presentViewController.view.bounds.size.height + weakSelf.frame.size.height/2);
    } completion:^(BOOL finished) {
        [blackView removeFromSuperview];
        [weakSelf removeFromSuperview];
    }];
}

@end
