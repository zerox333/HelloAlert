//#import <SpringBoard/SpringBoard.h>
#import <SpringBoard/SBFolderIcon.h>
//#import <SpringBoard/SBApplicationIcon.h>
#import "UIToast.h"
 
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
    
    NSString *appName = [self displayName];
    NSString *message = [NSString stringWithFormat:@"\"%@\" folder has been opened", appName];
    
    UIToast *toast = [[UIToast alloc] init];
    [toast show:message Gravity:TOAST_GRAVITY_CENTURE Length:TOAST_LENGTH_LONG];
    [toast release];
}
 
%end

%hook SBApplicationIcon

-(void)launch
{

    NSString *appName = [self displayName];
    NSString *message = [NSString stringWithFormat:@"The app %@ has been launched", appName,nil];

//    UIAlertView*alert =[[UIAlertView alloc] initWithTitle:appName
//                                                  message:message
//                                                 delegate:self
//                                        cancelButtonTitle:@"OK"
//                                        otherButtonTitles:nil];
//    [alert show];
//    [alert release];
    
    UIToast *toast = [[UIToast alloc] init];
    [toast show:message Gravity:TOAST_GRAVITY_CENTURE Length:TOAST_LENGTH_LONG];
    [toast release];
    
    %orig;
}

%end