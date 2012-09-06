//
//  UIToastWindow.m
//  HelloAlert
//
//  Created by ding_yuanyi on 12-9-6.
//
//

#import "UIToastWindow.h"
#import <QuartzCore/QuartzCore.h>

static UIToastWindow *instance;

@implementation UIToastWindow

+(UIToastWindow *)shareInstance
{
	@synchronized(self)
	{
		if (!instance)
        {
			instance = [[UIToastWindow alloc] initWithFrame:CGRectMake(0, 20, 40, 30)];
		}
	}    
	return instance;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.windowLevel = UIWindowLevelStatusBar;
        
        UIButton *hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        hideButton.frame = CGRectMake(0, 0, 40, 30);
        [hideButton addTarget:self action:@selector(hideWindow:) forControlEvents:UIControlEventTouchUpInside];
        hideButton.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.85];
        hideButton.layer.cornerRadius = 5;
        hideButton.layer.masksToBounds = YES;
        [hideButton setTitle:@"隐藏" forState:UIControlStateNormal];
        [self addSubview:hideButton];
        
        [self makeKeyAndVisible];
    }
    return self;
}

- (void)hideWindow:(UIButton *)sender
{
    self.hidden = YES;
}

@end
