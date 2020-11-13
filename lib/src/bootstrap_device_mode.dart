
enum BootstrapDeviceMode {
  pc,
  tablet,
  mobile,
}

extension BootstrapDeviceModeHelper on BootstrapDeviceMode {
  static const tabletThreshold = 992.0;
  static const mobileThreshold = 768.0;

  static BootstrapDeviceMode valueOf(double width) {
    if (tabletThreshold <= width) {
      return BootstrapDeviceMode.pc;
    }
    if (mobileThreshold <= width) {
      return BootstrapDeviceMode.tablet;
    }
    return BootstrapDeviceMode.mobile;
  }
}
