自己项目中用到的，现在放到github上，以便自己以后使用。
使用非常简单，直接往项目中的View文件夹里一拖
引入头文件   #import "SHCartPromptBox.h"
ViewController里面直接调  [SHCartPromptBox cartPromptBoxViewWithMessageTitle:@"是否删除"
                                         SureLableText:@"好的"
                                        WithController:self
                                               DoneHandler:^(SHCartPromptBox *cartPromptBoxView) {
                                                   NSLog(@"点击了好的");
                                               }
                                         Cancelhandler:^(SHCartPromptBox *cartPromptBoxView) {
                                             NSLog(@"点击了取消");
     }];
