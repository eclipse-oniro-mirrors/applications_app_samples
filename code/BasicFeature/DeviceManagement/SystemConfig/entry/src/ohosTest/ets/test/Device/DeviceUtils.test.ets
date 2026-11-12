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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * DeviceUtils utility test suite.
 */
export default function DeviceUtilsTest(): void {
  describe('DeviceUtilsTest', () => {

    /**
     * @tc.number SUB_DEVICE_UTILS_0100
     * @tc.name testDeviceUtils0001
     * @tc.desc Verify getDeviceType returns a non-empty string
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
      // The real device type is no longer hardcoded as default; values outside normalization may contain digits (e.g. 2in1), so only verify it is a non-empty lowercase alphanumeric identifier
      expect(/^[a-z0-9]+$/.test(deviceType)).assertTrue();
      const cached: string = DeviceUtils.getDeviceType();
      expect(cached).assertEqual(deviceType);
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0200
     * @tc.name testDeviceUtils0002
     * @tc.desc Verify the screen size is positive
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
      // The screen size comes from the real display, only verify it is positive, no longer assuming a specific resolution or orientation
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0002: repeat width=%{public}d, height=%{public}d',
        DeviceUtils.getScreenWidth(), DeviceUtils.getScreenHeight());
      // ensureScreenSize reads lazily then caches, so repeated reads must stay consistent
      expect(DeviceUtils.getScreenWidth()).assertEqual(width);
      expect(DeviceUtils.getScreenHeight()).assertEqual(height);
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0300
     * @tc.name testDeviceUtils0003
     * @tc.desc Verify the size can be read after setting the screen size
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
     * @tc.desc Verify portrait under the default size
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
      // Orientation is decided by the real screen size, portrait and landscape are mutually exclusive, no longer assuming portrait by default
      expect(portrait).assertEqual(!landscape);
      // The orientation decision must match the real width/height relation: portrait height>=width, landscape width>height
      const w: number = DeviceUtils.getScreenWidth();
      const h: number = DeviceUtils.getScreenHeight();
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0004: width=%{public}d, height=%{public}d', w, h);
      expect(portrait).assertEqual(h >= w);
      expect(landscape).assertEqual(w > h);
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0500
     * @tc.name testDeviceUtils0005
     * @tc.desc Verify getOsVersion returns a non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0005: begin');
      const version: string = DeviceUtils.getOsVersion();
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0005: osVersion=%{public}s', version);
      // The system version comes from deviceInfo.osFullName, only verify non-empty, no longer hardcoding a specific version string
      expect(version.length).assertLarger(0);
      // osFullName is a stable single-line identifier, repeated reads must be consistent and contain no newline
      expect(version).assertEqual(DeviceUtils.getOsVersion());
      expect(version.indexOf('\n')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0600
     * @tc.name testDeviceUtils0006
     * @tc.desc Verify getDeviceId returns a non-empty string
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
     * @tc.desc Verify a positive integer is returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0007: begin');
      const version: number = DeviceUtils.getApiVersion();
      hilog.info(DOMAIN, TAG, 'testDeviceUtils0007: apiVersion=%{public}d', version);
      // The API version comes from deviceInfo.sdkApiVersion and varies by device, only verify it is a positive integer
      expect(version).assertLarger(0);
      expect(Number.isInteger(version)).assertTrue();
      // This project targets API 26, the running device is no lower than the minimum supported version 10; repeated reads must be stable
      expect(version >= 10).assertTrue();
      expect(DeviceUtils.getApiVersion()).assertEqual(version);
    });

    /**
     * @tc.number SUB_DEVICE_UTILS_0800
     * @tc.name testDeviceUtils0008
     * @tc.desc Verify getBundleName returns a non-empty string
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
     * @tc.desc Verify the device type is re-fetched after clearing the cache
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
