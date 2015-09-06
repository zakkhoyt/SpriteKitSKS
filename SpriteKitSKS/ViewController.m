//
//  ViewController.m
//  
//
//  Created by Zakk Hoyt on 9/6/15.
//
//

#import "ViewController.h"
#import "SpriteView.h"

@interface ViewController ()
@property (nonatomic, strong) SpriteView *spriteView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.spriteView = [[SpriteView alloc]initWithFrame:self.view.bounds];
        self.spriteView.alpha = 0.0;
        UIWindow* currentWindow = [UIApplication sharedApplication].keyWindow;
        [currentWindow addSubview:self.spriteView];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.spriteView.alpha = 1.0;
        });
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)tapGesture:(UITapGestureRecognizer*)sender{
    CGPoint point = [sender locationInView:self.view];
    point.y = self.view.bounds.size.height - point.y;
    
    [self.spriteView renderEmojiString:@"test" startPoint:point];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
