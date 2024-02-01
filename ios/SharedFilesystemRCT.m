//
//  SharedFilesystemRCT.m
//  researchTwo
//
//  Created by Łukasz Kubok on 06/12/2023.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(SharedFileSystemRCT, NSObject)
RCT_EXTERN_METHOD(
   getAllFiles: (RCTPromiseResolveBlock)resolve
   rejecter:(RCTPromiseRejectBlock)reject
)
@end
