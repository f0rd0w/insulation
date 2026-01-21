#import <Foundation/Foundation.h>
#import <IOKit/hid/IOHIDEventSystem.h>
#import <IOKit/hid/IOHIDEventSystemClient.h>

@interface CommonProduct : NSObject
- (id)initProduct:(id)arg1;
- (void)putDeviceInLowTempSimulationMode:(id)arg1;
- (void)putDeviceInThermalSimulationMode:(id)arg1;
@end

static CommonProduct* product = nil;

%hook CommonProduct
- (id)initProduct:(id)arg1 {
    id res = %orig;
    product = res;
    return res;
}
%end

kern_return_t IOConnectCallStructMethod(mach_port_t	 connection, uint32_t	 selector, const void	*inputStruct, size_t inputStructCnt, void	*outputStruct, size_t	*outputStructCnt);

%hookf(kern_return_t, IOConnectCallStructMethod, mach_port_t connection, uint32_t	 selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt) {
    kern_return_t ret = %orig(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
    [product putDeviceInThermalSimulationMode: @"nominal"];
    return ret;
}