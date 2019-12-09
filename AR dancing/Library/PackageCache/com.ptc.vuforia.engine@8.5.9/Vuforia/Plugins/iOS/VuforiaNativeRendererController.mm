/*============================================================================
 Copyright (c) 2017-2018 PTC Inc. All Rights Reserved.
 
 
 Copyright (c) 2014 Qualcomm Connected Experiences, Inc.
 All Rights Reserved.
 ============================================================================*/

#import "UnityAppController.h"
#import "UnityView.h"
#import "VuforiaRenderDelegate.h"

// Exported methods for native rendering callback
extern "C" void UnityPluginLoad(IUnityInterfaces* unityInterfaces);
extern "C" void UnityPluginUnload();


// Controller to support native rendering callback
@interface VuforiaNativeRendererController : UnityAppController
{
}
- (void)shouldAttachRenderDelegate;
@end

@implementation VuforiaNativeRendererController

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    BOOL ret = [super application:application didFinishLaunchingWithOptions:launchOptions];
    if (ret)
    {
        _unityView.backgroundColor = UIColor.clearColor;
    }
    return ret;
}

- (void)shouldAttachRenderDelegate
{
    self.renderDelegate = [[VuforiaRenderDelegate alloc] init];

    UnityRegisterRenderingPluginV5(&UnityPluginLoad, &UnityPluginUnload);
}
@end


IMPL_APP_CONTROLLER_SUBCLASS(VuforiaNativeRendererController)
