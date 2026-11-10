import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DeviceUtils, SystemConfigConstants } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * DeviceUtils 工具类测试套件。
 */
export default function DeviceUtilsTest(): void {
  describe('DeviceUtilsTest', () => {

    /**
     * @tc.number SUB_DEVICE_UTILS_0100
     * @tc.name testDeviceUtils0001
     * @tc.desc 正向: 返回非空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0001: begin');
      DeviceUtils.clearCache();
      const deviceType: string = DeviceUtils.getDeviceType();
      expect(deviceType.length).assertLarger(0);
      expect(deviceType).assertEqual('default');
      const cached: string = DeviceUtils.getDeviceType();
      expect(cached).assertEqual(deviceType);
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0200
     * @tc.name testDeviceUtils0002
     * @tc.desc 正向: 屏幕尺寸为正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0002: begin');
      DeviceUtils.clearCache();
      expect(DeviceUtils.getScreenWidth()).assertLarger(0);
      expect(DeviceUtils.getScreenHeight()).assertLarger(0);
      expect(DeviceUtils.getScreenHeight()).assertLarger(DeviceUtils.getScreenWidth() - 1);
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0300
     * @tc.name testDeviceUtils0003
     * @tc.desc 正向: 设置屏幕尺寸后可获取
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0003: begin');
      DeviceUtils.setScreenSize(1440, 3200);
      expect(DeviceUtils.getScreenWidth()).assertEqual(1440);
      expect(DeviceUtils.getScreenHeight()).assertEqual(3200);
      expect(DeviceUtils.isPortrait()).assertTrue();
      DeviceUtils.clearCache();
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0400
     * @tc.name testDeviceUtils0004
     * @tc.desc 正向: 默认尺寸下为竖屏
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0004: begin');
      DeviceUtils.clearCache();
      expect(DeviceUtils.isPortrait()).assertEqual(true);
      expect(DeviceUtils.isLandscape()).assertEqual(false);
      expect(DeviceUtils.isPortrait()).assertEqual(!DeviceUtils.isLandscape());
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0500
     * @tc.name testDeviceUtils0005
     * @tc.desc 正向: 返回非空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0005: begin');
      const version: string = DeviceUtils.getOsVersion();
      expect(version.length).assertLarger(0);
      expect(version.indexOf('OpenHarmony')).assertLarger(-1);
      expect(version).assertEqual('OpenHarmony 5.0');
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0600
     * @tc.name testDeviceUtils0006
     * @tc.desc 正向: 返回非空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0006: begin');
      DeviceUtils.clearCache();
      const id: string = DeviceUtils.getDeviceId();
      expect(id.length).assertLarger(0);
      expect(id.indexOf('dev_')).assertEqual(0);
      const cached: string = DeviceUtils.getDeviceId();
      expect(cached).assertEqual(id);
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0700
     * @tc.name testDeviceUtils0007
     * @tc.desc 正向: 返回正整数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0007: begin');
      const version: number = DeviceUtils.getApiVersion();
      expect(version).assertLarger(0);
      expect(version).assertEqual(26);
      expect(Number.isInteger(version)).assertTrue();
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0800
     * @tc.name testDeviceUtils0008
     * @tc.desc 正向: 返回非空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0008: begin');
      const name: string = DeviceUtils.getBundleName();
      expect(name.length).assertLarger(0);
      expect(name.indexOf('.')).assertLarger(-1);
      expect(name).assertEqual(SystemConfigConstants.BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0900
     * @tc.name testDeviceUtils0009
     * @tc.desc 正向: 清除缓存后重新获取设备类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDeviceUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0009: begin');
      const type1: string = DeviceUtils.getDeviceType();
      expect(type1.length).assertLarger(0);
      DeviceUtils.clearCache();
      const type2: string = DeviceUtils.getDeviceType();
      expect(type2.length).assertLarger(0);
      expect(type2).assertEqual(type1);
    });
  });
}
