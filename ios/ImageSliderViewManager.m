#import <React/RCTViewManager.h>
#import <React/RCTConvert.h>
@interface RCT_EXTERN_MODULE(ImageSliderViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(color, NSString)
RCT_EXPORT_VIEW_PROPERTY(data, NSArray[])
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)

@end
