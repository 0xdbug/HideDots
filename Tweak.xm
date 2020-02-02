#import "Tweak.h"

//
static bool hs = false;
static bool ls = false;


//
static void reloadPreferences() {
    HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"cf.1di4r.hidedotspref"];
    hs = [([file objectForKey:@"isHS"] ?: @(YES)) boolValue];
  ls = [([file objectForKey:@"isLS"] ?: @(YES)) boolValue];



}

%group HideDots
    %hook SBIconListPageControl
    - (id)initWithFrame:(CGRect)frame
    {
 reloadPreferences();
  if(hs){




    	return nil; %orig;



}else {
  return %orig;
}

}
%end

%hook SBDashBoardPageControl
- (id)initWithFrame:(CGRect)frame
{
 reloadPreferences();
if(ls){




  return nil; %orig;


}else {
  return %orig;
}

}
%end


%end

//Preferences stuff

static void displayStatusChanged(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
}




%ctor{
 reloadPreferences();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPreferences, (CFStringRef)@"cf.1di4r.hidedotspref/ReloadPrefs", NULL, kNilOptions);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, displayStatusChanged, CFSTR("com.apple.iokit.hid.displayStatus"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);

    %init(HideDots);
}
