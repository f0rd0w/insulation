import Orion
import insulationC

class CommonProductClassHook: ClassHook<CommonProduct> {
  func initProduct(_ arg: Any?) -> CommonProduct? {
    // return nil;
    let res = orig.initProduct(arg);
    target.putDevice(inThermalSimulationMode: "nominal");
    return res;
  }

  func putDeviceInThermalSimulationMode(_ arg: Any?) {
    orig.putDeviceInThermalSimulationMode("nominal");
  }

  func putDeviceInLowTempSimulationMode(_ arg: Any?) {
    orig.putDeviceInLowTempSimulationMode("nominal");
  }

  func tryTakeAction() {}
  func simulateLightThermalPressure() {}
  func updatePowerzoneTelemetry() {}
}

class HidSensorsHook: ClassHook<HidSensors> {
  func handleTemperatureEvent(_ arg1: Int, service arg2: Any?) {}
}