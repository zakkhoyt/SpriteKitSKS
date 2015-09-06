//
//  SpriteView.m
//  
//
//  Created by Zakk Hoyt on 9/6/15.
//
//

#import "SpriteView.h"
#import "SpriteScene.h"

@interface SpriteView ()
@property (nonatomic, strong) SpriteScene *spriteScene;
@end


@implementation SpriteView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.allowsTransparency = YES;
        self.userInteractionEnabled = NO;
#if DEBUG
        self.showsFPS = YES;
        self.showsNodeCount = YES;
        self.showsQuadCount = YES;
#endif
        
        
        [[NSNotificationCenter defaultCenter] addObserverForName:@"PKPeckView" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
            NSString *string = note.userInfo[@"emoji"];
            NSValue *startPointValue = note.userInfo[@"startPoint"];
            CGPoint startPoint = startPointValue.CGPointValue;
            CGPoint invertedPoint = CGPointMake(startPoint.x, self.frame.size.height - startPoint.y);
            [self renderEmojiString:string startPoint:invertedPoint];
        }];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    if(self.spriteScene == nil){
        // Create and configure the scene.
        self.spriteScene = [SpriteScene sceneWithSize:self.bounds.size];
        self.spriteScene.scaleMode = SKSceneScaleModeAspectFill;
        //#if DEBUG
        //        self.spriteScene.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
        //#else
        self.spriteScene.backgroundColor = [UIColor clearColor];
        //#endif
        
        // Present the scene.
        [self presentScene:self.spriteScene];
    }
}


#pragma mark Public methods

-(void)renderEmojiString:(NSString*)string startPoint:(CGPoint)startPoint{
    [self.spriteScene renderEmojiString:string startPoint:startPoint];
}


@end
