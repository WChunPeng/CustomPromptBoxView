//
//  SHCartPromptBox.h
//  wxdoctor-d
//
//  Created by wangChunPeng on 16/7/1.
//  Copyright © 2016年 muguike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHCartPromptBox : UIView

typedef void(^CPPromptDoneBlock)(SHCartPromptBox *cartPromptBoxView);
typedef void(^CPPromptCancelBlock)(SHCartPromptBox *cartPromptBoxView);

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (nonatomic, copy)CPPromptDoneBlock doneBlock;
@property (nonatomic, copy)CPPromptDoneBlock cancelBlock;


+ (void)cartPromptBoxViewWithMessageTitle:(NSString *)messageTitle
                            SureLableText:(NSString *)sureLableText
                           WithController:(UIViewController *)controller
                              DoneHandler:(CPPromptDoneBlock)doneBlock
                            Cancelhandler:(CPPromptCancelBlock)cancelBlock;


@end
