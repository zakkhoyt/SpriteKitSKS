//
//  SpriteScene.m
//  
//
//  Created by Zakk Hoyt on 9/6/15.
//
//

#import "SpriteScene.h"

@implementation SpriteScene

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

#pragma mark Public methods
-(void)renderEmojiString:(NSString*)string startPoint:(CGPoint)startPoint{
    NSLog(@"point: %@", NSStringFromCGPoint(startPoint));
    NSLog(@"size: %@", NSStringFromCGSize(self.frame.size));
    
    SKLabelNode *emojiNode = [SKLabelNode labelNodeWithText:string];
    emojiNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    emojiNode.fontColor = [UIColor redColor];
    emojiNode.fontName = @"Didot-Bold";
    emojiNode.fontSize = 40;
    
    SKSpriteNode *emojiNodeBackground = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor]
                                                                     size:CGSizeMake(emojiNode.frame.size.width, emojiNode.frame.size.height)];
    emojiNodeBackground.position = startPoint;
    [self addChild:emojiNodeBackground];
    [emojiNodeBackground addChild:emojiNode];
    
    
    SKAction *moveUp = [SKAction moveByX:0 y:self.view.bounds.size.width duration:2.0];
    SKAction *backgroundGroup = [SKAction group:@[moveUp]];
    [emojiNodeBackground runAction:backgroundGroup completion:^{
        SKAction *fadeAction = [SKAction fadeOutWithDuration:0.3];
        [emojiNodeBackground runAction:fadeAction completion:^{
            [emojiNodeBackground removeFromParent];
        }];
    }];
    
    // Add some randomness to the rotation
    NSUInteger value = arc4random() % 60;
    value += 70; // 70 .. 130
    CGFloat attenuation = value / 100.0; // 0.7 .. 1.3
    
    SKAction *oneRevolution = [SKAction rotateByAngle:-M_PI*2*attenuation duration:2.0];
    SKAction *group = [SKAction group:@[oneRevolution]];
    [emojiNode runAction:group completion:^{
    }];
    
    
}
@end

