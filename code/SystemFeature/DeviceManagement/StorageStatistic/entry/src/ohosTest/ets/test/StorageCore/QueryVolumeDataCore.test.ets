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
import { QueryVolumeData } from '../../../../main/ets/common/QueryVolumeData';
import ParseData from '../../../../main/ets/common/ParseData';
import { VolumeData } from '../../../../main/ets/model/VolumeData';
const TAG: string = 'QueryVolumeDataCore';
const DOMAIN: number = 0xF811;
function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}
export default function queryVolumeDataCoreTest(): void {
  describe('QueryVolumeDataCoreTest', () => {
    beforeAll(() => {
      logInfo('QueryVolumeDataCoreTest beforeAll');
    })
    beforeEach(() => {
      logInfo('QueryVolumeDataCoreTest beforeEach');
    })
    afterEach(() => {
      logInfo('QueryVolumeDataCoreTest afterEach');
    })
    afterAll(() => {
      logInfo('QueryVolumeDataCoreTest afterAll');
    })
    it('QueryVolumeDataCoreTest_001', 0, () => {
      logInfo('QueryVolumeDataCoreTest_001 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_001 end');
    })
    it('QueryVolumeDataCoreTest_002', 0, () => {
      logInfo('QueryVolumeDataCoreTest_002 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 3072, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(2560);
      logInfo('QueryVolumeDataCoreTest_002 end');
    })
    it('QueryVolumeDataCoreTest_003', 0, () => {
      logInfo('QueryVolumeDataCoreTest_003 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 3, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 4, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_003 end');
    })
    it('QueryVolumeDataCoreTest_004', 0, () => {
      logInfo('QueryVolumeDataCoreTest_004 begin');
      const used: number = 4096;
      const percentage: string = ParseData.calculatePercentage(used, 5120);
      expect(percentage).assertEqual('80.0%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_004 end');
    })
    it('QueryVolumeDataCoreTest_005', 0, () => {
      logInfo('QueryVolumeDataCoreTest_005 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 6144, freeSize: 4864, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(4864);
      logInfo('QueryVolumeDataCoreTest_005 end');
    })
    it('QueryVolumeDataCoreTest_006', 0, () => {
      logInfo('QueryVolumeDataCoreTest_006 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_006 end');
    })
    it('QueryVolumeDataCoreTest_007', 0, () => {
      logInfo('QueryVolumeDataCoreTest_007 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 8192, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(7680);
      logInfo('QueryVolumeDataCoreTest_007 end');
    })
    it('QueryVolumeDataCoreTest_008', 0, () => {
      logInfo('QueryVolumeDataCoreTest_008 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 8, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 9, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_008 end');
    })
    it('QueryVolumeDataCoreTest_009', 0, () => {
      logInfo('QueryVolumeDataCoreTest_009 begin');
      const used: number = 9216;
      const percentage: string = ParseData.calculatePercentage(used, 10240);
      expect(percentage).assertEqual('90.0%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_009 end');
    })
    it('QueryVolumeDataCoreTest_010', 0, () => {
      logInfo('QueryVolumeDataCoreTest_010 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 2048, freeSize: 768, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(768);
      logInfo('QueryVolumeDataCoreTest_010 end');
    })
    it('QueryVolumeDataCoreTest_011', 0, () => {
      logInfo('QueryVolumeDataCoreTest_011 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_011 end');
    })
    it('QueryVolumeDataCoreTest_012', 0, () => {
      logInfo('QueryVolumeDataCoreTest_012 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 4096, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(3584);
      logInfo('QueryVolumeDataCoreTest_012 end');
    })
    it('QueryVolumeDataCoreTest_013', 0, () => {
      logInfo('QueryVolumeDataCoreTest_013 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 13, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 14, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_013 end');
    })
    it('QueryVolumeDataCoreTest_014', 0, () => {
      logInfo('QueryVolumeDataCoreTest_014 begin');
      const used: number = 5120;
      const percentage: string = ParseData.calculatePercentage(used, 6144);
      expect(percentage).assertEqual('83.3%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_014 end');
    })
    it('QueryVolumeDataCoreTest_015', 0, () => {
      logInfo('QueryVolumeDataCoreTest_015 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 7168, freeSize: 5888, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(5888);
      logInfo('QueryVolumeDataCoreTest_015 end');
    })
    it('QueryVolumeDataCoreTest_016', 0, () => {
      logInfo('QueryVolumeDataCoreTest_016 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_016 end');
    })
    it('QueryVolumeDataCoreTest_017', 0, () => {
      logInfo('QueryVolumeDataCoreTest_017 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 9216, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(8704);
      logInfo('QueryVolumeDataCoreTest_017 end');
    })
    it('QueryVolumeDataCoreTest_018', 0, () => {
      logInfo('QueryVolumeDataCoreTest_018 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 18, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 19, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_018 end');
    })
    it('QueryVolumeDataCoreTest_019', 0, () => {
      logInfo('QueryVolumeDataCoreTest_019 begin');
      const used: number = 1024;
      const percentage: string = ParseData.calculatePercentage(used, 2048);
      expect(percentage).assertEqual('50.0%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_019 end');
    })
    it('QueryVolumeDataCoreTest_020', 0, () => {
      logInfo('QueryVolumeDataCoreTest_020 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 3072, freeSize: 1792, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(1792);
      logInfo('QueryVolumeDataCoreTest_020 end');
    })
    it('QueryVolumeDataCoreTest_021', 0, () => {
      logInfo('QueryVolumeDataCoreTest_021 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_021 end');
    })
    it('QueryVolumeDataCoreTest_022', 0, () => {
      logInfo('QueryVolumeDataCoreTest_022 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 5120, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(4608);
      logInfo('QueryVolumeDataCoreTest_022 end');
    })
    it('QueryVolumeDataCoreTest_023', 0, () => {
      logInfo('QueryVolumeDataCoreTest_023 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 23, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 24, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_023 end');
    })
    it('QueryVolumeDataCoreTest_024', 0, () => {
      logInfo('QueryVolumeDataCoreTest_024 begin');
      const used: number = 6144;
      const percentage: string = ParseData.calculatePercentage(used, 7168);
      expect(percentage).assertEqual('85.7%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_024 end');
    })
    it('QueryVolumeDataCoreTest_025', 0, () => {
      logInfo('QueryVolumeDataCoreTest_025 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 8192, freeSize: 6912, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(6912);
      logInfo('QueryVolumeDataCoreTest_025 end');
    })
    it('QueryVolumeDataCoreTest_026', 0, () => {
      logInfo('QueryVolumeDataCoreTest_026 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_026 end');
    })
    it('QueryVolumeDataCoreTest_027', 0, () => {
      logInfo('QueryVolumeDataCoreTest_027 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 10240, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(9728);
      logInfo('QueryVolumeDataCoreTest_027 end');
    })
    it('QueryVolumeDataCoreTest_028', 0, () => {
      logInfo('QueryVolumeDataCoreTest_028 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 28, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 29, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_028 end');
    })
    it('QueryVolumeDataCoreTest_029', 0, () => {
      logInfo('QueryVolumeDataCoreTest_029 begin');
      const used: number = 2048;
      const percentage: string = ParseData.calculatePercentage(used, 3072);
      expect(percentage).assertEqual('66.7%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_029 end');
    })
    it('QueryVolumeDataCoreTest_030', 0, () => {
      logInfo('QueryVolumeDataCoreTest_030 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 4096, freeSize: 2816, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(2816);
      logInfo('QueryVolumeDataCoreTest_030 end');
    })
    it('QueryVolumeDataCoreTest_031', 0, () => {
      logInfo('QueryVolumeDataCoreTest_031 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_031 end');
    })
    it('QueryVolumeDataCoreTest_032', 0, () => {
      logInfo('QueryVolumeDataCoreTest_032 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 6144, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(5632);
      logInfo('QueryVolumeDataCoreTest_032 end');
    })
    it('QueryVolumeDataCoreTest_033', 0, () => {
      logInfo('QueryVolumeDataCoreTest_033 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 33, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 34, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_033 end');
    })
    it('QueryVolumeDataCoreTest_034', 0, () => {
      logInfo('QueryVolumeDataCoreTest_034 begin');
      const used: number = 7168;
      const percentage: string = ParseData.calculatePercentage(used, 8192);
      expect(percentage).assertEqual('87.5%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_034 end');
    })
    it('QueryVolumeDataCoreTest_035', 0, () => {
      logInfo('QueryVolumeDataCoreTest_035 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 9216, freeSize: 7936, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(7936);
      logInfo('QueryVolumeDataCoreTest_035 end');
    })
    it('QueryVolumeDataCoreTest_036', 0, () => {
      logInfo('QueryVolumeDataCoreTest_036 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_036 end');
    })
    it('QueryVolumeDataCoreTest_037', 0, () => {
      logInfo('QueryVolumeDataCoreTest_037 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 2048, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(1536);
      logInfo('QueryVolumeDataCoreTest_037 end');
    })
    it('QueryVolumeDataCoreTest_038', 0, () => {
      logInfo('QueryVolumeDataCoreTest_038 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 38, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 39, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_038 end');
    })
    it('QueryVolumeDataCoreTest_039', 0, () => {
      logInfo('QueryVolumeDataCoreTest_039 begin');
      const used: number = 3072;
      const percentage: string = ParseData.calculatePercentage(used, 4096);
      expect(percentage).assertEqual('75.0%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_039 end');
    })
    it('QueryVolumeDataCoreTest_040', 0, () => {
      logInfo('QueryVolumeDataCoreTest_040 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 5120, freeSize: 3840, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(3840);
      logInfo('QueryVolumeDataCoreTest_040 end');
    })
    it('QueryVolumeDataCoreTest_041', 0, () => {
      logInfo('QueryVolumeDataCoreTest_041 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_041 end');
    })
    it('QueryVolumeDataCoreTest_042', 0, () => {
      logInfo('QueryVolumeDataCoreTest_042 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 7168, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(6656);
      logInfo('QueryVolumeDataCoreTest_042 end');
    })
    it('QueryVolumeDataCoreTest_043', 0, () => {
      logInfo('QueryVolumeDataCoreTest_043 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 43, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 44, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_043 end');
    })
    it('QueryVolumeDataCoreTest_044', 0, () => {
      logInfo('QueryVolumeDataCoreTest_044 begin');
      const used: number = 8192;
      const percentage: string = ParseData.calculatePercentage(used, 9216);
      expect(percentage).assertEqual('88.9%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_044 end');
    })
    it('QueryVolumeDataCoreTest_045', 0, () => {
      logInfo('QueryVolumeDataCoreTest_045 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 10240, freeSize: 8960, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(8960);
      logInfo('QueryVolumeDataCoreTest_045 end');
    })
    it('QueryVolumeDataCoreTest_046', 0, () => {
      logInfo('QueryVolumeDataCoreTest_046 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_046 end');
    })
    it('QueryVolumeDataCoreTest_047', 0, () => {
      logInfo('QueryVolumeDataCoreTest_047 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 3072, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(2560);
      logInfo('QueryVolumeDataCoreTest_047 end');
    })
    it('QueryVolumeDataCoreTest_048', 0, () => {
      logInfo('QueryVolumeDataCoreTest_048 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 48, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 49, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_048 end');
    })
    it('QueryVolumeDataCoreTest_049', 0, () => {
      logInfo('QueryVolumeDataCoreTest_049 begin');
      const used: number = 4096;
      const percentage: string = ParseData.calculatePercentage(used, 5120);
      expect(percentage).assertEqual('80.0%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_049 end');
    })
    it('QueryVolumeDataCoreTest_050', 0, () => {
      logInfo('QueryVolumeDataCoreTest_050 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 6144, freeSize: 4864, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(4864);
      logInfo('QueryVolumeDataCoreTest_050 end');
    })
    it('QueryVolumeDataCoreTest_051', 0, () => {
      logInfo('QueryVolumeDataCoreTest_051 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_051 end');
    })
    it('QueryVolumeDataCoreTest_052', 0, () => {
      logInfo('QueryVolumeDataCoreTest_052 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 8192, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(7680);
      logInfo('QueryVolumeDataCoreTest_052 end');
    })
    it('QueryVolumeDataCoreTest_053', 0, () => {
      logInfo('QueryVolumeDataCoreTest_053 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 53, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 54, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_053 end');
    })
    it('QueryVolumeDataCoreTest_054', 0, () => {
      logInfo('QueryVolumeDataCoreTest_054 begin');
      const used: number = 9216;
      const percentage: string = ParseData.calculatePercentage(used, 10240);
      expect(percentage).assertEqual('90.0%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_054 end');
    })
    it('QueryVolumeDataCoreTest_055', 0, () => {
      logInfo('QueryVolumeDataCoreTest_055 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 2048, freeSize: 768, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(768);
      logInfo('QueryVolumeDataCoreTest_055 end');
    })
    it('QueryVolumeDataCoreTest_056', 0, () => {
      logInfo('QueryVolumeDataCoreTest_056 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_056 end');
    })
    it('QueryVolumeDataCoreTest_057', 0, () => {
      logInfo('QueryVolumeDataCoreTest_057 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 4096, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(3584);
      logInfo('QueryVolumeDataCoreTest_057 end');
    })
    it('QueryVolumeDataCoreTest_058', 0, () => {
      logInfo('QueryVolumeDataCoreTest_058 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 58, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 59, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_058 end');
    })
    it('QueryVolumeDataCoreTest_059', 0, () => {
      logInfo('QueryVolumeDataCoreTest_059 begin');
      const used: number = 5120;
      const percentage: string = ParseData.calculatePercentage(used, 6144);
      expect(percentage).assertEqual('83.3%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_059 end');
    })
    it('QueryVolumeDataCoreTest_060', 0, () => {
      logInfo('QueryVolumeDataCoreTest_060 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 7168, freeSize: 5888, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(5888);
      logInfo('QueryVolumeDataCoreTest_060 end');
    })
    it('QueryVolumeDataCoreTest_061', 0, () => {
      logInfo('QueryVolumeDataCoreTest_061 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_061 end');
    })
    it('QueryVolumeDataCoreTest_062', 0, () => {
      logInfo('QueryVolumeDataCoreTest_062 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 9216, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(8704);
      logInfo('QueryVolumeDataCoreTest_062 end');
    })
    it('QueryVolumeDataCoreTest_063', 0, () => {
      logInfo('QueryVolumeDataCoreTest_063 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 63, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 64, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_063 end');
    })
    it('QueryVolumeDataCoreTest_064', 0, () => {
      logInfo('QueryVolumeDataCoreTest_064 begin');
      const used: number = 1024;
      const percentage: string = ParseData.calculatePercentage(used, 2048);
      expect(percentage).assertEqual('50.0%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_064 end');
    })
    it('QueryVolumeDataCoreTest_065', 0, () => {
      logInfo('QueryVolumeDataCoreTest_065 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 3072, freeSize: 1792, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(1792);
      logInfo('QueryVolumeDataCoreTest_065 end');
    })
    it('QueryVolumeDataCoreTest_066', 0, () => {
      logInfo('QueryVolumeDataCoreTest_066 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_066 end');
    })
    it('QueryVolumeDataCoreTest_067', 0, () => {
      logInfo('QueryVolumeDataCoreTest_067 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 5120, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(4608);
      logInfo('QueryVolumeDataCoreTest_067 end');
    })
    it('QueryVolumeDataCoreTest_068', 0, () => {
      logInfo('QueryVolumeDataCoreTest_068 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 68, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 69, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_068 end');
    })
    it('QueryVolumeDataCoreTest_069', 0, () => {
      logInfo('QueryVolumeDataCoreTest_069 begin');
      const used: number = 6144;
      const percentage: string = ParseData.calculatePercentage(used, 7168);
      expect(percentage).assertEqual('85.7%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_069 end');
    })
    it('QueryVolumeDataCoreTest_070', 0, () => {
      logInfo('QueryVolumeDataCoreTest_070 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 8192, freeSize: 6912, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(6912);
      logInfo('QueryVolumeDataCoreTest_070 end');
    })
    it('QueryVolumeDataCoreTest_071', 0, () => {
      logInfo('QueryVolumeDataCoreTest_071 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_071 end');
    })
    it('QueryVolumeDataCoreTest_072', 0, () => {
      logInfo('QueryVolumeDataCoreTest_072 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 10240, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(9728);
      logInfo('QueryVolumeDataCoreTest_072 end');
    })
    it('QueryVolumeDataCoreTest_073', 0, () => {
      logInfo('QueryVolumeDataCoreTest_073 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 73, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 74, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_073 end');
    })
    it('QueryVolumeDataCoreTest_074', 0, () => {
      logInfo('QueryVolumeDataCoreTest_074 begin');
      const used: number = 2048;
      const percentage: string = ParseData.calculatePercentage(used, 3072);
      expect(percentage).assertEqual('66.7%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_074 end');
    })
    it('QueryVolumeDataCoreTest_075', 0, () => {
      logInfo('QueryVolumeDataCoreTest_075 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 4096, freeSize: 2816, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(2816);
      logInfo('QueryVolumeDataCoreTest_075 end');
    })
    it('QueryVolumeDataCoreTest_076', 0, () => {
      logInfo('QueryVolumeDataCoreTest_076 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_076 end');
    })
    it('QueryVolumeDataCoreTest_077', 0, () => {
      logInfo('QueryVolumeDataCoreTest_077 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 6144, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(5632);
      logInfo('QueryVolumeDataCoreTest_077 end');
    })
    it('QueryVolumeDataCoreTest_078', 0, () => {
      logInfo('QueryVolumeDataCoreTest_078 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 78, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 79, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_078 end');
    })
    it('QueryVolumeDataCoreTest_079', 0, () => {
      logInfo('QueryVolumeDataCoreTest_079 begin');
      const used: number = 7168;
      const percentage: string = ParseData.calculatePercentage(used, 8192);
      expect(percentage).assertEqual('87.5%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_079 end');
    })
    it('QueryVolumeDataCoreTest_080', 0, () => {
      logInfo('QueryVolumeDataCoreTest_080 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 9216, freeSize: 7936, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(7936);
      logInfo('QueryVolumeDataCoreTest_080 end');
    })
    it('QueryVolumeDataCoreTest_081', 0, () => {
      logInfo('QueryVolumeDataCoreTest_081 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_081 end');
    })
    it('QueryVolumeDataCoreTest_082', 0, () => {
      logInfo('QueryVolumeDataCoreTest_082 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 2048, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(1536);
      logInfo('QueryVolumeDataCoreTest_082 end');
    })
    it('QueryVolumeDataCoreTest_083', 0, () => {
      logInfo('QueryVolumeDataCoreTest_083 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 83, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 84, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_083 end');
    })
    it('QueryVolumeDataCoreTest_084', 0, () => {
      logInfo('QueryVolumeDataCoreTest_084 begin');
      const used: number = 3072;
      const percentage: string = ParseData.calculatePercentage(used, 4096);
      expect(percentage).assertEqual('75.0%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_084 end');
    })
    it('QueryVolumeDataCoreTest_085', 0, () => {
      logInfo('QueryVolumeDataCoreTest_085 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 5120, freeSize: 3840, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(3840);
      logInfo('QueryVolumeDataCoreTest_085 end');
    })
    it('QueryVolumeDataCoreTest_086', 0, () => {
      logInfo('QueryVolumeDataCoreTest_086 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      expect(dataset.volumeSizeList.length).assertEqual(0);
      expect(Array.isArray(dataset.volumeSizeList)).assertTrue();
      logInfo('QueryVolumeDataCoreTest_086 end');
    })
    it('QueryVolumeDataCoreTest_087', 0, () => {
      logInfo('QueryVolumeDataCoreTest_087 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let volume: VolumeData = { totalSize: 7168, freeSize: 512, description: 'Internal storage' };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList.length).assertEqual(1);
      expect(dataset.volumeSizeList[0].totalSize - dataset.volumeSizeList[0].freeSize).assertEqual(6656);
      logInfo('QueryVolumeDataCoreTest_087 end');
    })
    it('QueryVolumeDataCoreTest_088', 0, () => {
      logInfo('QueryVolumeDataCoreTest_088 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      let first: VolumeData = { totalSize: 88, freeSize: 0, description: "First" };
      let second: VolumeData = { totalSize: 89, freeSize: 0, description: "Second" };
      dataset.volumeSizeList.push(first);
      dataset.volumeSizeList.push(second);
      expect(dataset.volumeSizeList.length).assertEqual(2);
      expect(dataset.volumeSizeList[0].description).assertEqual("First");
      logInfo('QueryVolumeDataCoreTest_088 end');
    })
    it('QueryVolumeDataCoreTest_089', 0, () => {
      logInfo('QueryVolumeDataCoreTest_089 begin');
      const used: number = 8192;
      const percentage: string = ParseData.calculatePercentage(used, 9216);
      expect(percentage).assertEqual('88.9%');
      expect(percentage.indexOf('%') > 0).assertTrue();
      logInfo('QueryVolumeDataCoreTest_089 end');
    })
    it('QueryVolumeDataCoreTest_090', 0, () => {
      logInfo('QueryVolumeDataCoreTest_090 begin');
      const dataset: QueryVolumeData = new QueryVolumeData();
      dataset.volumeSizeList = [];
      expect(dataset.volumeSizeList.length).assertEqual(0);
      let volume: VolumeData = { totalSize: 10240, freeSize: 8960, description: "Storage" };
      dataset.volumeSizeList.push(volume);
      expect(dataset.volumeSizeList[0].freeSize).assertEqual(8960);
      logInfo('QueryVolumeDataCoreTest_090 end');
    })
  })
}
