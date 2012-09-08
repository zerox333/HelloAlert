//#import <SpringBoard/SpringBoard.h>
#import <SpringBoard/SBFolderIcon.h>
//#import <SpringBoard/SBApplicationIcon.h>
#import "UIMyToast.h"
#import "NSProperty.h"

#define TOAST_SHOW_TEXT @"toast_show_text"
 
/*%hook SpringBoard
 
-(void)applicationDidFinishLaunching:(id)application {
    %orig;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" 
        message:@"Hello World!" 
        delegate:nil 
        cancelButtonTitle:@"Thanks" 
        otherButtonTitles:nil];
    [alert show];
    [alert release];
}
 
%end*/

%hook SBFolderIcon

- (void)launch
{
    %orig;
    
    if ([NSProperty isToastEnabled])
    {
        NSString *appName = [self displayName];
        NSString *message = [NSString stringWithFormat:@"\"%@\" folder has been opened", appName];
        
        UIMyToast *toast = [[UIMyToast alloc] init];
        [toast show:message Gravity:TOAST_GRAVITY_CENTURE Length:TOAST_LENGTH_SHORT];
        [toast release];

        [[NSNotificationCenter defaultCenter] postNotificationName:TOAST_SHOW_TEXT object:message];
    }
}

%end

%hook SBApplicationIcon

-(void)launch
{
    if ([NSProperty isToastEnabled])
    {
        NSString *appName = [self displayName];
        NSString *message = [NSString stringWithFormat:@"The app %@ has been launched", appName,nil];
        
        UIMyToast *toast = [[UIMyToast alloc] init];
        [toast show:message Gravity:TOAST_GRAVITY_CENTURE Length:TOAST_LENGTH_SHORT];
        [toast release];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:TOAST_SHOW_TEXT object:message];
    }
    
    %orig;
}

%end