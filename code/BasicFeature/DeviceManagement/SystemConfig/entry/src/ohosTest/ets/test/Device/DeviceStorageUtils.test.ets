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
import { StorageUtils } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * StorageUtils storage calculation utility test suite.
 * Covers all public methods including formatStorageSize/parseStorageSize/getAvailablePercent/
 * isStorageLow/getStorageLevel/estimateFreeSpace/
 * calculateUsagePercent/getStorageSummary.
 */
export default function StorageUtilsTest(): void {
  describe('StorageUtilsTest', () => {

    // ========================================
    // formatStorageSize
    // ========================================

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_0100
     * @tc.name testDeviceStorageUtils0001
     * @tc.desc Verify byte counts of each magnitude format into a readable string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceStorageUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0001 begin');
      expect(StorageUtils.formatStorageSize(0)).assertEqual('0 B');
      expect(StorageUtils.formatStorageSize(-100)).assertEqual('0 B');
      expect(StorageUtils.formatStorageSize(500)).assertEqual('500.00 B');
      const kbStr: string = StorageUtils.formatStorageSize(1024);
      expect(kbStr.indexOf('KB')).assertLarger(-1);
      const mbStr: string = StorageUtils.formatStorageSize(1048576);
      expect(mbStr.indexOf('MB')).assertLarger(-1);
      const gbStr: string = StorageUtils.formatStorageSize(1073741824);
      expect(gbStr.indexOf('GB')).assertLarger(-1);
      const tbStr: string = StorageUtils.formatStorageSize(1099511627776);
      expect(tbStr.indexOf('TB')).assertLarger(-1);
    });

    // ========================================
    // parseStorageSize
    // ========================================

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_0200
     * @tc.name testDeviceStorageUtils0002
     * @tc.desc Verify storage unit strings parse into byte counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceStorageUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0002 begin');
      expect(StorageUtils.parseStorageSize('1024 B')).assertEqual(1024);
      expect(StorageUtils.parseStorageSize('1 KB')).assertEqual(1024);
      expect(StorageUtils.parseStorageSize('1 MB')).assertEqual(1048576);
      expect(StorageUtils.parseStorageSize('1 GB')).assertEqual(1073741824);
      expect(StorageUtils.parseStorageSize('1 TB')).assertEqual(1099511627776);
      expect(StorageUtils.parseStorageSize('')).assertEqual(0);
      expect(StorageUtils.parseStorageSize('abc')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_0300
     * @tc.name testDeviceStorageUtils0003
     * @tc.desc Verify abbreviated units K/M/G/T parse correctly too
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDeviceStorageUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0003 begin');
      expect(StorageUtils.parseStorageSize('5K')).assertEqual(5120);
      expect(StorageUtils.parseStorageSize('2M')).assertEqual(2097152);
      expect(StorageUtils.parseStorageSize('1G')).assertEqual(1073741824);
      expect(StorageUtils.parseStorageSize('1T')).assertEqual(1099511627776);
    });

    // ========================================
    // getAvailablePercent
    // ========================================

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_0400
     * @tc.name testDeviceStorageUtils0004
     * @tc.desc Verify the available space percentage calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceStorageUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0004 begin');
      expect(StorageUtils.getAvailablePercent(50, 100)).assertEqual(50);
      expect(StorageUtils.getAvailablePercent(0, 100)).assertEqual(100);
      expect(StorageUtils.getAvailablePercent(100, 100)).assertEqual(0);
      expect(StorageUtils.getAvailablePercent(0, 0)).assertEqual(0);
      expect(StorageUtils.getAvailablePercent(-10, 100)).assertEqual(100);
      expect(StorageUtils.getAvailablePercent(200, 100)).assertEqual(0);
    });

    // ========================================
    // isStorageLow
    // ========================================

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_0500
     * @tc.name testDeviceStorageUtils0005
     * @tc.desc Verify isStorageLow judges by the available/total ratio and returns false for illegal input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDeviceStorageUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0005 begin');
      // Illegal input: negative available or non-positive total -> false
      expect(StorageUtils.isStorageLow(-1, 100)).assertFalse();
      expect(StorageUtils.isStorageLow(10, 0)).assertFalse();
      // Available is 0 and total is positive -> storage low
      expect(StorageUtils.isStorageLow(0, 100)).assertTrue();
      // The positive low-storage branch is reachable: 5% < 10% threshold -> true
      expect(StorageUtils.isStorageLow(5, 100)).assertTrue();
      // 50% -> storage not low
      expect(StorageUtils.isStorageLow(50, 100)).assertFalse();
      expect(StorageUtils.estimateFreeSpace(0)).assertEqual(0);
    });

    // ========================================
    // getStorageLevel
    // ========================================

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_0600
     * @tc.name testDeviceStorageUtils0006
     * @tc.desc Verify each ratio maps to the correct storage level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceStorageUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0006 begin');
      const total: number = 1000;
      expect(StorageUtils.getStorageLevel(600, total)).assertEqual('充足');
      expect(StorageUtils.getStorageLevel(350, total)).assertEqual('一般');
      expect(StorageUtils.getStorageLevel(150, total)).assertEqual('不足');
      expect(StorageUtils.getStorageLevel(50, total)).assertEqual('危险');
      expect(StorageUtils.getStorageLevel(0, 0)).assertEqual('危险');
    });

    // ========================================
    // estimateFreeSpace
    // ========================================

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_0700
     * @tc.name testDeviceStorageUtils0007
     * @tc.desc Verify estimateFreeSpace returns 35% of the total capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceStorageUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0007 begin');
      const total: number = 10000;
      const estimated: number = StorageUtils.estimateFreeSpace(total);
      expect(estimated).assertEqual(3500);
      expect(estimated).assertLarger(0);
      expect(StorageUtils.estimateFreeSpace(0)).assertEqual(0);
      expect(StorageUtils.estimateFreeSpace(-100)).assertEqual(0);
    });

    // ========================================
    // calculateUsagePercent
    // ========================================

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_0800
     * @tc.name testDeviceStorageUtils0008
     * @tc.desc Verify the usage percentage calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceStorageUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0008 begin');
      expect(StorageUtils.calculateUsagePercent(50, 100)).assertEqual(50);
      expect(StorageUtils.calculateUsagePercent(0, 100)).assertEqual(0);
      expect(StorageUtils.calculateUsagePercent(100, 100)).assertEqual(100);
      expect(StorageUtils.calculateUsagePercent(0, 0)).assertEqual(0);
      expect(StorageUtils.calculateUsagePercent(-10, 100)).assertEqual(0);
      expect(StorageUtils.calculateUsagePercent(200, 100)).assertEqual(100);
    });

    // ========================================
    // getStorageSummary
    // ========================================

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_0900
     * @tc.name testDeviceStorageUtils0009
     * @tc.desc Verify getStorageSummary returns a summary containing the key info
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceStorageUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0009 begin');
      const summary: string = StorageUtils.getStorageSummary(500, 1000);
      expect(summary.indexOf('StorageUtils')).assertEqual(0);
      expect(summary.indexOf('used=')).assertLarger(-1);
      expect(summary.indexOf('available=')).assertLarger(-1);
      expect(summary.indexOf('total=')).assertLarger(-1);
      expect(summary.indexOf('usage=')).assertLarger(-1);
      expect(summary.indexOf('level=')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_1000
     * @tc.name testDeviceStorageUtils0010
     * @tc.desc Verify the summary does not crash when total capacity is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDeviceStorageUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0010 begin');
      const summary: string = StorageUtils.getStorageSummary(0, 0);
      expect(summary.indexOf('StorageUtils')).assertEqual(0);
      expect(summary.indexOf('level=')).assertLarger(-1);
      expect(summary.length).assertLarger(0);
    });

    // ========================================
    // Round-trip consistency
    // ========================================

    /**
     * @tc.number SUB_DEVICE_STORAGE_UTILS_1100
     * @tc.name testDeviceStorageUtils0011
     * @tc.desc Verify parse can restore the original byte count after format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDeviceStorageUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceStorageUtils0011 begin');
      const originalBytes: number = 1048576;
      const formatted: string = StorageUtils.formatStorageSize(originalBytes);
      expect(formatted).assertEqual('1.00 MB');
      const parsed: number = StorageUtils.parseStorageSize(formatted);
      expect(parsed).assertEqual(originalBytes);
      expect(StorageUtils.formatStorageSize(0)).assertEqual('0 B');
      expect(StorageUtils.formatStorageSize(-100)).assertEqual('0 B');
      expect(StorageUtils.parseStorageSize('1.5 GB')).assertEqual(1610612736);
      expect(StorageUtils.parseStorageSize('abc')).assertEqual(0);
    });
  });
}
