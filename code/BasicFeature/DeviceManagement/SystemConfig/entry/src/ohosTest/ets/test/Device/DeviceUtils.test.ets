/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0001: deviceType=%{public}s', deviceType);
      expect(deviceType.length).assertLarger(0);
      // 真实设备类型不再硬编码为 default；归一化外的取值可能含数字（如 2in1），仅校验为非空小写字母数字标识串
      expect(/^[a-z0-9]+$/.test(deviceType)).assertTrue();
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
      const width: number = DeviceUtils.getScreenWidth();
      const height: number = DeviceUtils.getScreenHeight();
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0002: width=%{public}d, height=%{public}d', width, height);
      // 屏幕尺寸来自真实 display，仅校验为正数，不再假设具体分辨率与朝向
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0002: repeat width=%{public}d, height=%{public}d',
        DeviceUtils.getScreenWidth(), DeviceUtils.getScreenHeight());
      // ensureScreenSize 惰性取值后写入缓存，重复获取必须稳定一致
      expect(DeviceUtils.getScreenWidth()).assertEqual(width);
      expect(DeviceUtils.getScreenHeight()).assertEqual(height);
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
      const portrait: boolean = DeviceUtils.isPortrait();
      const landscape: boolean = DeviceUtils.isLandscape();
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0004: portrait=%{public}s, landscape=%{public}s',
        portrait.toString(), landscape.toString());
      // 朝向由真实屏幕尺寸决定，横竖屏互斥，不再假设默认为竖屏
      expect(portrait).assertEqual(!landscape);
      // 朝向判定必须与真实宽高关系一致：竖屏 height>=width，横屏 width>height
      const w: number = DeviceUtils.getScreenWidth();
      const h: number = DeviceUtils.getScreenHeight();
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0004: width=%{public}d, height=%{public}d', w, h);
      expect(portrait).assertEqual(h >= w);
      expect(landscape).assertEqual(w > h);
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
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0005: osVersion=%{public}s', version);
      // 系统版本来自 deviceInfo.osFullName，仅校验非空，不再硬编码具体版本串
      expect(version.length).assertLarger(0);
      // osFullName 为稳定单行标识串，重复获取必须一致且不含换行
      expect(version).assertEqual(DeviceUtils.getOsVersion());
      expect(version.indexOf('\n')).assertEqual(-1);
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
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0007: apiVersion=%{public}d', version);
      // API 版本来自 deviceInfo.sdkApiVersion，随运行设备而变，仅校验为正整数
      expect(version).assertLarger(0);
      expect(Number.isInteger(version)).assertTrue();
      // 本工程目标 API 26，运行设备不低于最低支持版本 10；重复读取必须稳定
      expect(version >= 10).assertTrue();
      expect(DeviceUtils.getApiVersion()).assertEqual(version);
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
