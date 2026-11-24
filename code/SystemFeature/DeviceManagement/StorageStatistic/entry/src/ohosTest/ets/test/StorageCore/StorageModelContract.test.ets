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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import ParseData from '../../../../main/ets/common/ParseData';
import { AppData } from '../../../../main/ets/model/AppData';
import { StorageData } from '../../../../main/ets/model/StorageData';
import { VolumeData } from '../../../../main/ets/model/VolumeData';
import storageStatistics from '@ohos.file.storageStatistics';
const TAG: string = 'StorageModelContract';
const DOMAIN: number = 0xF811;
function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}
export default function storageModelContractTest(): void {
  describe('StorageModelContractTest', () => {
    beforeAll(() => {
      logInfo('StorageModelContractTest beforeAll');
    })
    beforeEach(() => {
      logInfo('StorageModelContractTest beforeEach');
    })
    afterEach(() => {
      logInfo('StorageModelContractTest afterEach');
    })
    afterAll(() => {
      logInfo('StorageModelContractTest afterAll');
    })
    it('StorageModelContractTest_001', 0, () => {
      logInfo('StorageModelContractTest_001 begin');
      let volume: VolumeData = { totalSize: 2048, freeSize: 1024, description: 'Internal' };
      expect(volume.totalSize).assertEqual(2048);
      expect(volume.freeSize).assertEqual(1024);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_001 end');
    })
    it('StorageModelContractTest_002', 0, () => {
      logInfo('StorageModelContractTest_002 begin');
      let item: StorageData = { name: 'Application', size: 2048, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(2048);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_002 end');
    })
    it('StorageModelContractTest_003', 0, () => {
      logInfo('StorageModelContractTest_003 begin');
      let stats: storageStatistics.BundleStats = { appSize: 3072, cacheSize: 1536, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(3072);
      logInfo('StorageModelContractTest_003 end');
    })
    it('StorageModelContractTest_004', 0, () => {
      logInfo('StorageModelContractTest_004 begin');
      let stats: storageStatistics.BundleStats = { appSize: 4096, cacheSize: 2048, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_004 end');
    })
    it('StorageModelContractTest_005', 0, () => {
      logInfo('StorageModelContractTest_005 begin');
      let stats: storageStatistics.BundleStats = { appSize: 5120, cacheSize: 2560, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(8192);
      expect(ParseData.parseSizeToString(total)).assertEqual('8.0 KB');
      logInfo('StorageModelContractTest_005 end');
    })
    it('StorageModelContractTest_006', 0, () => {
      logInfo('StorageModelContractTest_006 begin');
      let item: StorageData = { name: 'System', size: 6144, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_006 end');
    })
    it('StorageModelContractTest_007', 0, () => {
      logInfo('StorageModelContractTest_007 begin');
      let volume: VolumeData = { totalSize: 14336, freeSize: 7168, description: 'Internal' };
      expect(volume.totalSize).assertEqual(14336);
      expect(volume.freeSize).assertEqual(7168);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_007 end');
    })
    it('StorageModelContractTest_008', 0, () => {
      logInfo('StorageModelContractTest_008 begin');
      let item: StorageData = { name: 'Application', size: 1024, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(1024);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_008 end');
    })
    it('StorageModelContractTest_009', 0, () => {
      logInfo('StorageModelContractTest_009 begin');
      let stats: storageStatistics.BundleStats = { appSize: 2048, cacheSize: 2048, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(2048);
      logInfo('StorageModelContractTest_009 end');
    })
    it('StorageModelContractTest_010', 0, () => {
      logInfo('StorageModelContractTest_010 begin');
      let stats: storageStatistics.BundleStats = { appSize: 3072, cacheSize: 2560, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_010 end');
    })
    it('StorageModelContractTest_011', 0, () => {
      logInfo('StorageModelContractTest_011 begin');
      let stats: storageStatistics.BundleStats = { appSize: 4096, cacheSize: 512, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(5120);
      expect(ParseData.parseSizeToString(total)).assertEqual('5.0 KB');
      logInfo('StorageModelContractTest_011 end');
    })
    it('StorageModelContractTest_012', 0, () => {
      logInfo('StorageModelContractTest_012 begin');
      let item: StorageData = { name: 'System', size: 5120, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_012 end');
    })
    it('StorageModelContractTest_013', 0, () => {
      logInfo('StorageModelContractTest_013 begin');
      let volume: VolumeData = { totalSize: 12288, freeSize: 6144, description: 'Internal' };
      expect(volume.totalSize).assertEqual(12288);
      expect(volume.freeSize).assertEqual(6144);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_013 end');
    })
    it('StorageModelContractTest_014', 0, () => {
      logInfo('StorageModelContractTest_014 begin');
      let item: StorageData = { name: 'Application', size: 7168, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(7168);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_014 end');
    })
    it('StorageModelContractTest_015', 0, () => {
      logInfo('StorageModelContractTest_015 begin');
      let stats: storageStatistics.BundleStats = { appSize: 1024, cacheSize: 2560, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(1024);
      logInfo('StorageModelContractTest_015 end');
    })
    it('StorageModelContractTest_016', 0, () => {
      logInfo('StorageModelContractTest_016 begin');
      let stats: storageStatistics.BundleStats = { appSize: 2048, cacheSize: 512, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_016 end');
    })
    it('StorageModelContractTest_017', 0, () => {
      logInfo('StorageModelContractTest_017 begin');
      let stats: storageStatistics.BundleStats = { appSize: 3072, cacheSize: 1024, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(4608);
      expect(ParseData.parseSizeToString(total)).assertEqual('4.5 KB');
      logInfo('StorageModelContractTest_017 end');
    })
    it('StorageModelContractTest_018', 0, () => {
      logInfo('StorageModelContractTest_018 begin');
      let item: StorageData = { name: 'System', size: 4096, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_018 end');
    })
    it('StorageModelContractTest_019', 0, () => {
      logInfo('StorageModelContractTest_019 begin');
      let volume: VolumeData = { totalSize: 10240, freeSize: 5120, description: 'Internal' };
      expect(volume.totalSize).assertEqual(10240);
      expect(volume.freeSize).assertEqual(5120);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_019 end');
    })
    it('StorageModelContractTest_020', 0, () => {
      logInfo('StorageModelContractTest_020 begin');
      let item: StorageData = { name: 'Application', size: 6144, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(6144);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_020 end');
    })
    it('StorageModelContractTest_021', 0, () => {
      logInfo('StorageModelContractTest_021 begin');
      let stats: storageStatistics.BundleStats = { appSize: 7168, cacheSize: 512, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(7168);
      logInfo('StorageModelContractTest_021 end');
    })
    it('StorageModelContractTest_022', 0, () => {
      logInfo('StorageModelContractTest_022 begin');
      let stats: storageStatistics.BundleStats = { appSize: 1024, cacheSize: 1024, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_022 end');
    })
    it('StorageModelContractTest_023', 0, () => {
      logInfo('StorageModelContractTest_023 begin');
      let stats: storageStatistics.BundleStats = { appSize: 2048, cacheSize: 1536, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(4096);
      expect(ParseData.parseSizeToString(total)).assertEqual('4.0 KB');
      logInfo('StorageModelContractTest_023 end');
    })
    it('StorageModelContractTest_024', 0, () => {
      logInfo('StorageModelContractTest_024 begin');
      let item: StorageData = { name: 'System', size: 3072, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_024 end');
    })
    it('StorageModelContractTest_025', 0, () => {
      logInfo('StorageModelContractTest_025 begin');
      let volume: VolumeData = { totalSize: 8192, freeSize: 4096, description: 'Internal' };
      expect(volume.totalSize).assertEqual(8192);
      expect(volume.freeSize).assertEqual(4096);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_025 end');
    })
    it('StorageModelContractTest_026', 0, () => {
      logInfo('StorageModelContractTest_026 begin');
      let item: StorageData = { name: 'Application', size: 5120, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(5120);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_026 end');
    })
    it('StorageModelContractTest_027', 0, () => {
      logInfo('StorageModelContractTest_027 begin');
      let stats: storageStatistics.BundleStats = { appSize: 6144, cacheSize: 1024, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(6144);
      logInfo('StorageModelContractTest_027 end');
    })
    it('StorageModelContractTest_028', 0, () => {
      logInfo('StorageModelContractTest_028 begin');
      let stats: storageStatistics.BundleStats = { appSize: 7168, cacheSize: 1536, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_028 end');
    })
    it('StorageModelContractTest_029', 0, () => {
      logInfo('StorageModelContractTest_029 begin');
      let stats: storageStatistics.BundleStats = { appSize: 1024, cacheSize: 2048, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(3584);
      expect(ParseData.parseSizeToString(total)).assertEqual('3.5 KB');
      logInfo('StorageModelContractTest_029 end');
    })
    it('StorageModelContractTest_030', 0, () => {
      logInfo('StorageModelContractTest_030 begin');
      let item: StorageData = { name: 'System', size: 2048, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_030 end');
    })
    it('StorageModelContractTest_031', 0, () => {
      logInfo('StorageModelContractTest_031 begin');
      let volume: VolumeData = { totalSize: 6144, freeSize: 3072, description: 'Internal' };
      expect(volume.totalSize).assertEqual(6144);
      expect(volume.freeSize).assertEqual(3072);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_031 end');
    })
    it('StorageModelContractTest_032', 0, () => {
      logInfo('StorageModelContractTest_032 begin');
      let item: StorageData = { name: 'Application', size: 4096, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(4096);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_032 end');
    })
    it('StorageModelContractTest_033', 0, () => {
      logInfo('StorageModelContractTest_033 begin');
      let stats: storageStatistics.BundleStats = { appSize: 5120, cacheSize: 1536, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(5120);
      logInfo('StorageModelContractTest_033 end');
    })
    it('StorageModelContractTest_034', 0, () => {
      logInfo('StorageModelContractTest_034 begin');
      let stats: storageStatistics.BundleStats = { appSize: 6144, cacheSize: 2048, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_034 end');
    })
    it('StorageModelContractTest_035', 0, () => {
      logInfo('StorageModelContractTest_035 begin');
      let stats: storageStatistics.BundleStats = { appSize: 7168, cacheSize: 2560, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(10240);
      expect(ParseData.parseSizeToString(total)).assertEqual('10.0 KB');
      logInfo('StorageModelContractTest_035 end');
    })
    it('StorageModelContractTest_036', 0, () => {
      logInfo('StorageModelContractTest_036 begin');
      let item: StorageData = { name: 'System', size: 1024, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_036 end');
    })
    it('StorageModelContractTest_037', 0, () => {
      logInfo('StorageModelContractTest_037 begin');
      let volume: VolumeData = { totalSize: 4096, freeSize: 2048, description: 'Internal' };
      expect(volume.totalSize).assertEqual(4096);
      expect(volume.freeSize).assertEqual(2048);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_037 end');
    })
    it('StorageModelContractTest_038', 0, () => {
      logInfo('StorageModelContractTest_038 begin');
      let item: StorageData = { name: 'Application', size: 3072, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(3072);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_038 end');
    })
    it('StorageModelContractTest_039', 0, () => {
      logInfo('StorageModelContractTest_039 begin');
      let stats: storageStatistics.BundleStats = { appSize: 4096, cacheSize: 2048, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(4096);
      logInfo('StorageModelContractTest_039 end');
    })
    it('StorageModelContractTest_040', 0, () => {
      logInfo('StorageModelContractTest_040 begin');
      let stats: storageStatistics.BundleStats = { appSize: 5120, cacheSize: 2560, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_040 end');
    })
    it('StorageModelContractTest_041', 0, () => {
      logInfo('StorageModelContractTest_041 begin');
      let stats: storageStatistics.BundleStats = { appSize: 6144, cacheSize: 512, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(7168);
      expect(ParseData.parseSizeToString(total)).assertEqual('7.0 KB');
      logInfo('StorageModelContractTest_041 end');
    })
    it('StorageModelContractTest_042', 0, () => {
      logInfo('StorageModelContractTest_042 begin');
      let item: StorageData = { name: 'System', size: 7168, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_042 end');
    })
    it('StorageModelContractTest_043', 0, () => {
      logInfo('StorageModelContractTest_043 begin');
      let volume: VolumeData = { totalSize: 2048, freeSize: 1024, description: 'Internal' };
      expect(volume.totalSize).assertEqual(2048);
      expect(volume.freeSize).assertEqual(1024);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_043 end');
    })
    it('StorageModelContractTest_044', 0, () => {
      logInfo('StorageModelContractTest_044 begin');
      let item: StorageData = { name: 'Application', size: 2048, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(2048);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_044 end');
    })
    it('StorageModelContractTest_045', 0, () => {
      logInfo('StorageModelContractTest_045 begin');
      let stats: storageStatistics.BundleStats = { appSize: 3072, cacheSize: 2560, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(3072);
      logInfo('StorageModelContractTest_045 end');
    })
    it('StorageModelContractTest_046', 0, () => {
      logInfo('StorageModelContractTest_046 begin');
      let stats: storageStatistics.BundleStats = { appSize: 4096, cacheSize: 512, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_046 end');
    })
    it('StorageModelContractTest_047', 0, () => {
      logInfo('StorageModelContractTest_047 begin');
      let stats: storageStatistics.BundleStats = { appSize: 5120, cacheSize: 1024, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(6656);
      expect(ParseData.parseSizeToString(total)).assertEqual('6.5 KB');
      logInfo('StorageModelContractTest_047 end');
    })
    it('StorageModelContractTest_048', 0, () => {
      logInfo('StorageModelContractTest_048 begin');
      let item: StorageData = { name: 'System', size: 6144, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_048 end');
    })
    it('StorageModelContractTest_049', 0, () => {
      logInfo('StorageModelContractTest_049 begin');
      let volume: VolumeData = { totalSize: 14336, freeSize: 7168, description: 'Internal' };
      expect(volume.totalSize).assertEqual(14336);
      expect(volume.freeSize).assertEqual(7168);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_049 end');
    })
    it('StorageModelContractTest_050', 0, () => {
      logInfo('StorageModelContractTest_050 begin');
      let item: StorageData = { name: 'Application', size: 1024, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(1024);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_050 end');
    })
    it('StorageModelContractTest_051', 0, () => {
      logInfo('StorageModelContractTest_051 begin');
      let stats: storageStatistics.BundleStats = { appSize: 2048, cacheSize: 512, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(2048);
      logInfo('StorageModelContractTest_051 end');
    })
    it('StorageModelContractTest_052', 0, () => {
      logInfo('StorageModelContractTest_052 begin');
      let stats: storageStatistics.BundleStats = { appSize: 3072, cacheSize: 1024, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_052 end');
    })
    it('StorageModelContractTest_053', 0, () => {
      logInfo('StorageModelContractTest_053 begin');
      let stats: storageStatistics.BundleStats = { appSize: 4096, cacheSize: 1536, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(6144);
      expect(ParseData.parseSizeToString(total)).assertEqual('6.0 KB');
      logInfo('StorageModelContractTest_053 end');
    })
    it('StorageModelContractTest_054', 0, () => {
      logInfo('StorageModelContractTest_054 begin');
      let item: StorageData = { name: 'System', size: 5120, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_054 end');
    })
    it('StorageModelContractTest_055', 0, () => {
      logInfo('StorageModelContractTest_055 begin');
      let volume: VolumeData = { totalSize: 12288, freeSize: 6144, description: 'Internal' };
      expect(volume.totalSize).assertEqual(12288);
      expect(volume.freeSize).assertEqual(6144);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_055 end');
    })
    it('StorageModelContractTest_056', 0, () => {
      logInfo('StorageModelContractTest_056 begin');
      let item: StorageData = { name: 'Application', size: 7168, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(7168);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_056 end');
    })
    it('StorageModelContractTest_057', 0, () => {
      logInfo('StorageModelContractTest_057 begin');
      let stats: storageStatistics.BundleStats = { appSize: 1024, cacheSize: 1024, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(1024);
      logInfo('StorageModelContractTest_057 end');
    })
    it('StorageModelContractTest_058', 0, () => {
      logInfo('StorageModelContractTest_058 begin');
      let stats: storageStatistics.BundleStats = { appSize: 2048, cacheSize: 1536, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_058 end');
    })
    it('StorageModelContractTest_059', 0, () => {
      logInfo('StorageModelContractTest_059 begin');
      let stats: storageStatistics.BundleStats = { appSize: 3072, cacheSize: 2048, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(5632);
      expect(ParseData.parseSizeToString(total)).assertEqual('5.5 KB');
      logInfo('StorageModelContractTest_059 end');
    })
    it('StorageModelContractTest_060', 0, () => {
      logInfo('StorageModelContractTest_060 begin');
      let item: StorageData = { name: 'System', size: 4096, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_060 end');
    })
    it('StorageModelContractTest_061', 0, () => {
      logInfo('StorageModelContractTest_061 begin');
      let volume: VolumeData = { totalSize: 10240, freeSize: 5120, description: 'Internal' };
      expect(volume.totalSize).assertEqual(10240);
      expect(volume.freeSize).assertEqual(5120);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_061 end');
    })
    it('StorageModelContractTest_062', 0, () => {
      logInfo('StorageModelContractTest_062 begin');
      let item: StorageData = { name: 'Application', size: 6144, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(6144);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_062 end');
    })
    it('StorageModelContractTest_063', 0, () => {
      logInfo('StorageModelContractTest_063 begin');
      let stats: storageStatistics.BundleStats = { appSize: 7168, cacheSize: 1536, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(7168);
      logInfo('StorageModelContractTest_063 end');
    })
    it('StorageModelContractTest_064', 0, () => {
      logInfo('StorageModelContractTest_064 begin');
      let stats: storageStatistics.BundleStats = { appSize: 1024, cacheSize: 2048, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_064 end');
    })
    it('StorageModelContractTest_065', 0, () => {
      logInfo('StorageModelContractTest_065 begin');
      let stats: storageStatistics.BundleStats = { appSize: 2048, cacheSize: 2560, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(5120);
      expect(ParseData.parseSizeToString(total)).assertEqual('5.0 KB');
      logInfo('StorageModelContractTest_065 end');
    })
    it('StorageModelContractTest_066', 0, () => {
      logInfo('StorageModelContractTest_066 begin');
      let item: StorageData = { name: 'System', size: 3072, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_066 end');
    })
    it('StorageModelContractTest_067', 0, () => {
      logInfo('StorageModelContractTest_067 begin');
      let volume: VolumeData = { totalSize: 8192, freeSize: 4096, description: 'Internal' };
      expect(volume.totalSize).assertEqual(8192);
      expect(volume.freeSize).assertEqual(4096);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_067 end');
    })
    it('StorageModelContractTest_068', 0, () => {
      logInfo('StorageModelContractTest_068 begin');
      let item: StorageData = { name: 'Application', size: 5120, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(5120);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_068 end');
    })
    it('StorageModelContractTest_069', 0, () => {
      logInfo('StorageModelContractTest_069 begin');
      let stats: storageStatistics.BundleStats = { appSize: 6144, cacheSize: 2048, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(6144);
      logInfo('StorageModelContractTest_069 end');
    })
    it('StorageModelContractTest_070', 0, () => {
      logInfo('StorageModelContractTest_070 begin');
      let stats: storageStatistics.BundleStats = { appSize: 7168, cacheSize: 2560, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_070 end');
    })
    it('StorageModelContractTest_071', 0, () => {
      logInfo('StorageModelContractTest_071 begin');
      let stats: storageStatistics.BundleStats = { appSize: 1024, cacheSize: 512, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(2048);
      expect(ParseData.parseSizeToString(total)).assertEqual('2.0 KB');
      logInfo('StorageModelContractTest_071 end');
    })
    it('StorageModelContractTest_072', 0, () => {
      logInfo('StorageModelContractTest_072 begin');
      let item: StorageData = { name: 'System', size: 2048, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_072 end');
    })
    it('StorageModelContractTest_073', 0, () => {
      logInfo('StorageModelContractTest_073 begin');
      let volume: VolumeData = { totalSize: 6144, freeSize: 3072, description: 'Internal' };
      expect(volume.totalSize).assertEqual(6144);
      expect(volume.freeSize).assertEqual(3072);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_073 end');
    })
    it('StorageModelContractTest_074', 0, () => {
      logInfo('StorageModelContractTest_074 begin');
      let item: StorageData = { name: 'Application', size: 4096, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(4096);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_074 end');
    })
    it('StorageModelContractTest_075', 0, () => {
      logInfo('StorageModelContractTest_075 begin');
      let stats: storageStatistics.BundleStats = { appSize: 5120, cacheSize: 2560, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(5120);
      logInfo('StorageModelContractTest_075 end');
    })
    it('StorageModelContractTest_076', 0, () => {
      logInfo('StorageModelContractTest_076 begin');
      let stats: storageStatistics.BundleStats = { appSize: 6144, cacheSize: 512, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_076 end');
    })
    it('StorageModelContractTest_077', 0, () => {
      logInfo('StorageModelContractTest_077 begin');
      let stats: storageStatistics.BundleStats = { appSize: 7168, cacheSize: 1024, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(8704);
      expect(ParseData.parseSizeToString(total)).assertEqual('8.5 KB');
      logInfo('StorageModelContractTest_077 end');
    })
    it('StorageModelContractTest_078', 0, () => {
      logInfo('StorageModelContractTest_078 begin');
      let item: StorageData = { name: 'System', size: 1024, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_078 end');
    })
    it('StorageModelContractTest_079', 0, () => {
      logInfo('StorageModelContractTest_079 begin');
      let volume: VolumeData = { totalSize: 4096, freeSize: 2048, description: 'Internal' };
      expect(volume.totalSize).assertEqual(4096);
      expect(volume.freeSize).assertEqual(2048);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_079 end');
    })
    it('StorageModelContractTest_080', 0, () => {
      logInfo('StorageModelContractTest_080 begin');
      let item: StorageData = { name: 'Application', size: 3072, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(3072);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_080 end');
    })
    it('StorageModelContractTest_081', 0, () => {
      logInfo('StorageModelContractTest_081 begin');
      let stats: storageStatistics.BundleStats = { appSize: 4096, cacheSize: 512, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(4096);
      logInfo('StorageModelContractTest_081 end');
    })
    it('StorageModelContractTest_082', 0, () => {
      logInfo('StorageModelContractTest_082 begin');
      let stats: storageStatistics.BundleStats = { appSize: 5120, cacheSize: 1024, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_082 end');
    })
    it('StorageModelContractTest_083', 0, () => {
      logInfo('StorageModelContractTest_083 begin');
      let stats: storageStatistics.BundleStats = { appSize: 6144, cacheSize: 1536, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(8192);
      expect(ParseData.parseSizeToString(total)).assertEqual('8.0 KB');
      logInfo('StorageModelContractTest_083 end');
    })
    it('StorageModelContractTest_084', 0, () => {
      logInfo('StorageModelContractTest_084 begin');
      let item: StorageData = { name: 'System', size: 7168, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_084 end');
    })
    it('StorageModelContractTest_085', 0, () => {
      logInfo('StorageModelContractTest_085 begin');
      let volume: VolumeData = { totalSize: 2048, freeSize: 1024, description: 'Internal' };
      expect(volume.totalSize).assertEqual(2048);
      expect(volume.freeSize).assertEqual(1024);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_085 end');
    })
    it('StorageModelContractTest_086', 0, () => {
      logInfo('StorageModelContractTest_086 begin');
      let item: StorageData = { name: 'Application', size: 2048, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(2048);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_086 end');
    })
    it('StorageModelContractTest_087', 0, () => {
      logInfo('StorageModelContractTest_087 begin');
      let stats: storageStatistics.BundleStats = { appSize: 3072, cacheSize: 1024, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(3072);
      logInfo('StorageModelContractTest_087 end');
    })
    it('StorageModelContractTest_088', 0, () => {
      logInfo('StorageModelContractTest_088 begin');
      let stats: storageStatistics.BundleStats = { appSize: 4096, cacheSize: 1536, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_088 end');
    })
    it('StorageModelContractTest_089', 0, () => {
      logInfo('StorageModelContractTest_089 begin');
      let stats: storageStatistics.BundleStats = { appSize: 5120, cacheSize: 2048, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(7680);
      expect(ParseData.parseSizeToString(total)).assertEqual('7.5 KB');
      logInfo('StorageModelContractTest_089 end');
    })
    it('StorageModelContractTest_090', 0, () => {
      logInfo('StorageModelContractTest_090 begin');
      let item: StorageData = { name: 'System', size: 6144, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_090 end');
    })
    it('StorageModelContractTest_091', 0, () => {
      logInfo('StorageModelContractTest_091 begin');
      let volume: VolumeData = { totalSize: 14336, freeSize: 7168, description: 'Internal' };
      expect(volume.totalSize).assertEqual(14336);
      expect(volume.freeSize).assertEqual(7168);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_091 end');
    })
    it('StorageModelContractTest_092', 0, () => {
      logInfo('StorageModelContractTest_092 begin');
      let item: StorageData = { name: 'Application', size: 1024, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(1024);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_092 end');
    })
    it('StorageModelContractTest_093', 0, () => {
      logInfo('StorageModelContractTest_093 begin');
      let stats: storageStatistics.BundleStats = { appSize: 2048, cacheSize: 1536, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(2048);
      logInfo('StorageModelContractTest_093 end');
    })
    it('StorageModelContractTest_094', 0, () => {
      logInfo('StorageModelContractTest_094 begin');
      let stats: storageStatistics.BundleStats = { appSize: 3072, cacheSize: 2048, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_094 end');
    })
    it('StorageModelContractTest_095', 0, () => {
      logInfo('StorageModelContractTest_095 begin');
      let stats: storageStatistics.BundleStats = { appSize: 4096, cacheSize: 2560, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(7168);
      expect(ParseData.parseSizeToString(total)).assertEqual('7.0 KB');
      logInfo('StorageModelContractTest_095 end');
    })
    it('StorageModelContractTest_096', 0, () => {
      logInfo('StorageModelContractTest_096 begin');
      let item: StorageData = { name: 'System', size: 5120, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_096 end');
    })
    it('StorageModelContractTest_097', 0, () => {
      logInfo('StorageModelContractTest_097 begin');
      let volume: VolumeData = { totalSize: 12288, freeSize: 6144, description: 'Internal' };
      expect(volume.totalSize).assertEqual(12288);
      expect(volume.freeSize).assertEqual(6144);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_097 end');
    })
    it('StorageModelContractTest_098', 0, () => {
      logInfo('StorageModelContractTest_098 begin');
      let item: StorageData = { name: 'Application', size: 7168, color: '#F9A20F' };
      expect(item.name).assertEqual('Application');
      expect(item.size).assertEqual(7168);
      expect(item.color).assertEqual('#F9A20F');
      logInfo('StorageModelContractTest_098 end');
    })
    it('StorageModelContractTest_099', 0, () => {
      logInfo('StorageModelContractTest_099 begin');
      let stats: storageStatistics.BundleStats = { appSize: 1024, cacheSize: 2048, dataSize: 768 };
      let appData: AppData = { appName: 'Sample', bundleName: 'ohos.samples.storagestaistic', bundleStats: stats, hasLabel: true };
      expect(appData.bundleName).assertEqual('ohos.samples.storagestaistic');
      expect(appData.bundleStats.appSize).assertEqual(1024);
      logInfo('StorageModelContractTest_099 end');
    })
    it('StorageModelContractTest_100', 0, () => {
      logInfo('StorageModelContractTest_100 begin');
      let stats: storageStatistics.BundleStats = { appSize: 2048, cacheSize: 2560, dataSize: 256 };
      let appData: AppData = { appName: 'label', bundleName: 'bundle', bundleStats: stats, hasLabel: false };
      expect(appData.hasLabel).assertFalse();
      appData.hasLabel = true;
      expect(appData.hasLabel).assertTrue();
      logInfo('StorageModelContractTest_100 end');
    })
    it('StorageModelContractTest_101', 0, () => {
      logInfo('StorageModelContractTest_101 begin');
      let stats: storageStatistics.BundleStats = { appSize: 3072, cacheSize: 512, dataSize: 512 };
      let appData: AppData = { appName: 'Sample', bundleName: 'bundle', bundleStats: stats, hasLabel: true };
      const total: number = appData.bundleStats.appSize + appData.bundleStats.cacheSize + appData.bundleStats.dataSize;
      expect(total).assertEqual(4096);
      expect(ParseData.parseSizeToString(total)).assertEqual('4.0 KB');
      logInfo('StorageModelContractTest_101 end');
    })
    it('StorageModelContractTest_102', 0, () => {
      logInfo('StorageModelContractTest_102 begin');
      let item: StorageData = { name: 'System', size: 4096, color: '#007DFF' };
      expect(item.color).assertEqual('#007DFF');
      expect(item.name).assertEqual("System");
      expect(item.color).assertEqual('#007DFF');
      logInfo('StorageModelContractTest_102 end');
    })
    it('StorageModelContractTest_103', 0, () => {
      logInfo('StorageModelContractTest_103 begin');
      let volume: VolumeData = { totalSize: 10240, freeSize: 5120, description: 'Internal' };
      expect(volume.totalSize).assertEqual(10240);
      expect(volume.freeSize).assertEqual(5120);
      expect(volume.description).assertEqual('Internal');
      logInfo('StorageModelContractTest_103 end');
    })
  })
}
