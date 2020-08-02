#import "Tweak.h"

//使用的图标Base64编码，无需路径添加文件更为干净
static NSString *ImageBase64 = @"iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAQAAAAAYLlVAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQfkCAIRORdLy7FEAAADRklEQVRo3u3ZS2hcVRzH8c+dpClpgqSUNlTFVmJREBeirYsWuxMVRFSE+CKIxQdSfNEKUpAoDUrjA0oWBV9gFcWVuHGji4QsXGQhFqJoCmIppLU01tRXJnO7yNhOZu69uXPv3Okmv8vAnbnnnP/3/M89j/9/SKNbHRPmvI65IZWtCG0zkdt8qOKhqMY7VzS/2WG7wKSflTJ0oGKbnejK0vs+H1/swRCCDBdDKtX6TXpgnWGP4j9rEFY/zSuhVpJLO+33LKZ9pIIgk3HJNZMAnrRfh5P2msg09qkU3/DDDuo252XfFGc+HuAeb+vzl1cdlcf5GQFu845+ZW8aK850PMCNxgzgiEMW2w+w1Zhb8KkD/i7afCPARu/aja+8aK548/UAVxhxL77zgtl2mF8O0O2AJ/CDZ8wsK1UpDqB2KX7E8wK/G3XKNTW/l21sB0BglzXo8ZrXl5UJ9Qoy7gJNeWBpuem2JbJkpZiXsn43PO9r8xErX+C4icxWFgRYSANwxkt+jVx68wzBlG+VTKUByLPrx+sn9wn8kQ6gGJ2Le1DgRptOrfdAl02J3Qr849SlQW41QJdhgyv49bxhnxcFsMmgrSuWuqs4gJISZkxGPg31ulOP4NLKWswsmPR45FQObbFdz3Li1imQdHoMo1eYVnlgvSE3C/XagJ0+rDMVmHbE2caKrQG4zhseqPk+YKChzKJpXxYDsNsh26v3ZbPKdQOx5JeSvqjKeQE6PeagzZiw1g6zHnSiDqBs0Gh8A3m03j7PWedfn3jFiB3KTvitodzppB5k17VG3Q9+NOUO11MNx+uVMNfyADxVNc9NDldNNx3EZQcIXImlmR1U7wK/RO/6xXggxBkjTl908YKpdgLAvM+czNNA3qU4yNuFy34iWgVYBVgFWAVoJ8AiyvXH0nYFpwRuV9Gv93IBsMceDYf3dgIsKVRxvLjgNEnvGdeBudpkT16AMFU2pYLQuKONj/Ify6+20knw/zxjR3QD2RWg3xcNgUijlxLyjNkBQmfR6aqU5WPyjHk88IG1ulN7KybPmAfge083EQekHoJmw4ucOcV6gA3eMt9E/di4P4vez/Sn9IK78xit3Q3H/ZmhhZmIaLgJXQBDehMzvJm/ywAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMC0wNy0xOVQwMzozOToyMCswMDowMIZnDlwAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTktMDEtMDhUMTk6Mzc6MDErMDA6MDDGbSf2AAAAIHRFWHRzb2Z0d2FyZQBodHRwczovL2ltYWdlbWFnaWNrLm9yZ7zPHZ0AAAAYdEVYdFRodW1iOjpEb2N1bWVudDo6UGFnZXMAMaf/uy8AAAAYdEVYdFRodW1iOjpJbWFnZTo6SGVpZ2h0ADUxMo+NU4EAAAAXdEVYdFRodW1iOjpJbWFnZTo6V2lkdGgANTEyHHwD3AAAABl0RVh0VGh1bWI6Ok1pbWV0eXBlAGltYWdlL3BuZz+yVk4AAAAXdEVYdFRodW1iOjpNVGltZQAxNTQ2OTc2MjIxKuksGAAAABJ0RVh0VGh1bWI6OlNpemUAMTI1NThCTy85iAAAAFp0RVh0VGh1bWI6OlVSSQBmaWxlOi8vL2RhdGEvd3d3cm9vdC93d3cuZWFzeWljb24ubmV0L2Nkbi1pbWcuZWFzeWljb24uY24vZmlsZXMvMTE3LzExNzc2NzAucG5nEh5A2QAAAABJRU5ErkJggg==";

%hook SBIconView
- (void)setApplicationShortcutItems:(NSArray *)arg1 {
    NSString *BundleID;
    if([self respondsToSelector:@selector(applicationBundleIdentifierForShortcuts)]) {
    BundleID = [self applicationBundleIdentifierForShortcuts];
    }
	NSMutableArray *NewItem = [[NSMutableArray alloc] init];
	for (SBSApplicationShortcutItem *item in arg1) {
    [NewItem addObject:item];
	}
    NSData *ImageData = [[NSData alloc] initWithBase64EncodedString:ImageBase64 options:0];
	SBSApplicationShortcutItem *IconBundleID = [%c(SBSApplicationShortcutItem) alloc];
    IconBundleID.localizedTitle = @"拷贝 BundleID";
	IconBundleID.localizedSubtitle = BundleID;
	IconBundleID.type = @"com.netskao.iconbundleid";
	[IconBundleID setIcon:[[SBSApplicationShortcutCustomImageIcon alloc] initWithImagePNGData:ImageData]];
	[NewItem addObject:IconBundleID];
	%orig(NewItem);
}

+ (void)activateShortcut:(SBSApplicationShortcutItem *)item withBundleIdentifier:(NSString *)BundleID forIconView:(id)arg3 {
	if([[item type] isEqualToString:@"com.netskao.iconbundleid"]) {
    [UIPasteboard generalPasteboard].string = BundleID;
    AudioServicesPlaySystemSound(1519);
    return;
	} else {
    %orig;
	}
}
%end
