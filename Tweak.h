#import <AudioToolbox/AudioToolbox.h>
@interface SBIconView : UIView
- (void)setApplicationShortcutItems:(NSArray *)arg1;
@property (nonatomic, readonly, copy) NSString *applicationBundleIdentifierForShortcuts;
@end

@interface SBSApplicationShortcutIcon : NSObject
@end

@interface SBSApplicationShortcutCustomImageIcon : SBSApplicationShortcutIcon
- (id)initWithImagePNGData:(id)arg1;
@end

@interface SBSApplicationShortcutItem : NSObject
@property(nonatomic, copy) NSString *localizedTitle;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) SBSApplicationShortcutIcon *icon;
@property(nonatomic, copy) NSString *localizedSubtitle;
- (NSString *)localizedTitle;
- (void)setLocalizedTitle:(NSString *)arg1;
- (NSString *)type;
- (void)setType:(NSString *)arg1;
- (SBSApplicationShortcutIcon *)icon;
- (void)setIcon:(SBSApplicationShortcutIcon *)arg1;
- (NSString *)localizedSubtitle;
- (void)setLocalizedSubtitle:(NSString *)arg1;
@end
