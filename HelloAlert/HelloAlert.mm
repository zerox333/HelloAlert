#line 1 "/Users/zerox/Desktop/HelloAlert/HelloAlert/HelloAlert.xm"

#import <SpringBoard/SBFolderIcon.h>

#import "UIMyToast.h"
#import "NSProperty.h"

#define TOAST_SHOW_TEXT @"toast_show_text"
 
















#include <substrate.h>
@class SBFolderIcon; @class SBApplicationIcon; 
static void (*_logos_orig$_ungrouped$SBFolderIcon$launch)(SBFolderIcon*, SEL); static void _logos_method$_ungrouped$SBFolderIcon$launch(SBFolderIcon*, SEL); static void (*_logos_orig$_ungrouped$SBApplicationIcon$launch)(SBApplicationIcon*, SEL); static void _logos_method$_ungrouped$SBApplicationIcon$launch(SBApplicationIcon*, SEL); 

#line 25 "/Users/zerox/Desktop/HelloAlert/HelloAlert/HelloAlert.xm"



static void _logos_method$_ungrouped$SBFolderIcon$launch(SBFolderIcon* self, SEL _cmd) {
    _logos_orig$_ungrouped$SBFolderIcon$launch(self, _cmd);
    
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






static void _logos_method$_ungrouped$SBApplicationIcon$launch(SBApplicationIcon* self, SEL _cmd) {
    if ([NSProperty isToastEnabled])
    {
        NSString *appName = [self displayName];
        NSString *message = [NSString stringWithFormat:@"The app %@ has been launched", appName,nil];
        
        UIMyToast *toast = [[UIMyToast alloc] init];
        [toast show:message Gravity:TOAST_GRAVITY_CENTURE Length:TOAST_LENGTH_SHORT];
        [toast release];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:TOAST_SHOW_TEXT object:message];
    }
    
    _logos_orig$_ungrouped$SBApplicationIcon$launch(self, _cmd);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBFolderIcon = objc_getClass("SBFolderIcon"); MSHookMessageEx(_logos_class$_ungrouped$SBFolderIcon, @selector(launch), (IMP)&_logos_method$_ungrouped$SBFolderIcon$launch, (IMP*)&_logos_orig$_ungrouped$SBFolderIcon$launch);Class _logos_class$_ungrouped$SBApplicationIcon = objc_getClass("SBApplicationIcon"); MSHookMessageEx(_logos_class$_ungrouped$SBApplicationIcon, @selector(launch), (IMP)&_logos_method$_ungrouped$SBApplicationIcon$launch, (IMP*)&_logos_orig$_ungrouped$SBApplicationIcon$launch);}  }
#line 66 "/Users/zerox/Desktop/HelloAlert/HelloAlert/HelloAlert.xm"
