#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(RecordComponent, RCTViewManager)
RCT_EXTERN_METHOD(
  showSaveView:(nonnull NSNumber *)node
  fileName:(NSString *)
)
@end
