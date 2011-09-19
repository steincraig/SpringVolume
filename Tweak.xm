#import <UIKit/UIKit.h>

static UIButton *btn;
static UIButton *button;

@class VolumeControl;


@interface VolumeControl : NSObject { }
-(void)increaseVolume;
-(void)decreaseVolume;
-(void)cancelVolumeEvent;
+(id)sharedVolumeControl;
@end


%hook SBUIController
-(void)finishLaunching{
%orig;
btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
btn.frame = CGRectMake(20.0, 375.0, 40.0, 20.0);
[btn setTitle:@"-" forState:UIControlStateNormal];
[btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
[btn addTarget:self action:@selector(decrease:)forControlEvents:UIControlEventTouchDown];
[[self window] addSubview:btn];


button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
button.frame = CGRectMake(270.0, 375.0, 40.0, 20.0);
[button setTitle:@"+" forState:UIControlStateNormal];
[button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
[button addTarget:self action:@selector(increase:)forControlEvents:UIControlEventTouchDown];
[[self window] addSubview:button];

}

%new(v@:@@)

-(void)decrease:(id)sender{
%class VolumeControl;
	id controller = [$VolumeControl sharedVolumeControl];
	[controller decreaseVolume];
		[controller cancelVolumeEvent];
		}
		
		
%new(v@:@@)
		
		-(void)increase:(id)sender{
		%class VolumeControl;
	id controller = [$VolumeControl sharedVolumeControl];
	[controller increaseVolume];
		[controller cancelVolumeEvent];
		}
		%end