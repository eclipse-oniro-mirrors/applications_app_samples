/**
 * DeviceUtil 设备形态工具类
 *
 * 基于 @ohos.deviceInfo 读取设备档案（类型/系统版本/产品型号），
 * 并提供 ArkUI 标准断点划分（sm <600vp，md <840vp，lg >=840vp），
 * 供 Index 页面做单栏/双栏自适应布局。DAYU200（RK3568）上报 deviceType 为 tablet 或 phone。
 */
import { deviceInfo } from '@kit.BasicServicesKit';
import { LogUtil } from './LogUtil';

/** ArkUI 标准断点档位 */
export type Breakpoint = 'sm' | 'md' | 'lg';

/** 断点阈值（vp）：与系统栅格断点一致 */
const MD_MIN_VP = 600;
const LG_MIN_VP = 840;

export class DeviceUtil {
  /** 设备类型：phone / tablet / 2in1 等 */
  static getDeviceType(): string {
    return deviceInfo.deviceType;
  }

  static isPhone(): boolean {
    return deviceInfo.deviceType === 'phone';
  }

  static isTablet(): boolean {
    return deviceInfo.deviceType === 'tablet';
  }

  static is2in1(): boolean {
    return deviceInfo.deviceType === '2in1';
  }

  /** 是否宽屏形态（tablet / 2in1，适合双栏布局） */
  static isWideScreen(): boolean {
    return DeviceUtil.isTablet() || DeviceUtil.is2in1();
  }

  static getOsFullName(): string {
    return deviceInfo.osFullName;
  }

  static getSdkApiVersion(): number {
    return deviceInfo.sdkApiVersion;
  }

  static getProductModel(): string {
    return deviceInfo.productModel;
  }

  static getMarketName(): string {
    return deviceInfo.marketName;
  }

  /** 按窗口宽度（vp）划分断点档位 */
  static getBreakpoint(widthVp: number): Breakpoint {
    if (widthVp >= LG_MIN_VP) {
      return 'lg';
    }
    if (widthVp >= MD_MIN_VP) {
      return 'md';
    }
    return 'sm';
  }

  /** 是否应使用双栏布局（宽屏形态或 md/lg 断点） */
  static preferTwoColumn(widthVp: number): boolean {
    return DeviceUtil.getBreakpoint(widthVp) !== 'sm';
  }

  /** 输出设备档案日志（Index 启动时调用，便于在 DAYU200 上确认运行环境） */
  static logDeviceProfile(): void {
    LogUtil.info('Device', `设备类型=${DeviceUtil.getDeviceType()}` +
      `，产品型号=${DeviceUtil.getProductModel()}` +
      `，系统版本=${DeviceUtil.getOsFullName()}` +
      `，SDK API=${DeviceUtil.getSdkApiVersion()}`);
  }
}
