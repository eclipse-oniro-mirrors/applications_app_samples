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
import { QueryStorageData } from '../../../../main/ets/common/QueryStorageData';
import ParseData from '../../../../main/ets/common/ParseData';
import { StorageData } from '../../../../main/ets/model/StorageData';
const TAG: string = 'QueryStorageDataCore';
const DOMAIN: number = 0xF811;
function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}
export default function queryStorageDataCoreTest(): void {
  describe('QueryStorageDataCoreTest', () => {
    beforeAll(() => {
      logInfo('QueryStorageDataCoreTest beforeAll');
    })
    beforeEach(() => {
      logInfo('QueryStorageDataCoreTest beforeEach');
    })
    afterEach(() => {
      logInfo('QueryStorageDataCoreTest afterEach');
    })
    afterAll(() => {
      logInfo('QueryStorageDataCoreTest afterAll');
    })
    it('QueryStorageDataCoreTest_001', 0, () => {
      logInfo('QueryStorageDataCoreTest_001 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_001 end');
    })
    it('QueryStorageDataCoreTest_002', 0, () => {
      logInfo('QueryStorageDataCoreTest_002 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 2097152;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('2.0 MB');
      logInfo('QueryStorageDataCoreTest_002 end');
    })
    it('QueryStorageDataCoreTest_003', 0, () => {
      logInfo('QueryStorageDataCoreTest_003 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 3;
      second.totalSize = 4;
      expect(first.totalSize).assertEqual(3);
      expect(second.totalSize).assertEqual(4);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_003 end');
    })
    it('QueryStorageDataCoreTest_004', 0, () => {
      logInfo('QueryStorageDataCoreTest_004 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_004 end');
    })
    it('QueryStorageDataCoreTest_005', 0, () => {
      logInfo('QueryStorageDataCoreTest_005 begin');
      const bytes: number = 5242880;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(5);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_005 end');
    })
    it('QueryStorageDataCoreTest_006', 0, () => {
      logInfo('QueryStorageDataCoreTest_006 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_006 end');
    })
    it('QueryStorageDataCoreTest_007', 0, () => {
      logInfo('QueryStorageDataCoreTest_007 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_007 end');
    })
    it('QueryStorageDataCoreTest_008', 0, () => {
      logInfo('QueryStorageDataCoreTest_008 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 8388608;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('8.0 MB');
      logInfo('QueryStorageDataCoreTest_008 end');
    })
    it('QueryStorageDataCoreTest_009', 0, () => {
      logInfo('QueryStorageDataCoreTest_009 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 9;
      second.totalSize = 10;
      expect(first.totalSize).assertEqual(9);
      expect(second.totalSize).assertEqual(10);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_009 end');
    })
    it('QueryStorageDataCoreTest_010', 0, () => {
      logInfo('QueryStorageDataCoreTest_010 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_010 end');
    })
    it('QueryStorageDataCoreTest_011', 0, () => {
      logInfo('QueryStorageDataCoreTest_011 begin');
      const bytes: number = 2097152;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(2);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_011 end');
    })
    it('QueryStorageDataCoreTest_012', 0, () => {
      logInfo('QueryStorageDataCoreTest_012 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_012 end');
    })
    it('QueryStorageDataCoreTest_013', 0, () => {
      logInfo('QueryStorageDataCoreTest_013 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_013 end');
    })
    it('QueryStorageDataCoreTest_014', 0, () => {
      logInfo('QueryStorageDataCoreTest_014 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 3145728;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('3.0 MB');
      logInfo('QueryStorageDataCoreTest_014 end');
    })
    it('QueryStorageDataCoreTest_015', 0, () => {
      logInfo('QueryStorageDataCoreTest_015 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 15;
      second.totalSize = 16;
      expect(first.totalSize).assertEqual(15);
      expect(second.totalSize).assertEqual(16);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_015 end');
    })
    it('QueryStorageDataCoreTest_016', 0, () => {
      logInfo('QueryStorageDataCoreTest_016 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_016 end');
    })
    it('QueryStorageDataCoreTest_017', 0, () => {
      logInfo('QueryStorageDataCoreTest_017 begin');
      const bytes: number = 8388608;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(8);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_017 end');
    })
    it('QueryStorageDataCoreTest_018', 0, () => {
      logInfo('QueryStorageDataCoreTest_018 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_018 end');
    })
    it('QueryStorageDataCoreTest_019', 0, () => {
      logInfo('QueryStorageDataCoreTest_019 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_019 end');
    })
    it('QueryStorageDataCoreTest_020', 0, () => {
      logInfo('QueryStorageDataCoreTest_020 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 9437184;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('9.0 MB');
      logInfo('QueryStorageDataCoreTest_020 end');
    })
    it('QueryStorageDataCoreTest_021', 0, () => {
      logInfo('QueryStorageDataCoreTest_021 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 21;
      second.totalSize = 22;
      expect(first.totalSize).assertEqual(21);
      expect(second.totalSize).assertEqual(22);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_021 end');
    })
    it('QueryStorageDataCoreTest_022', 0, () => {
      logInfo('QueryStorageDataCoreTest_022 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_022 end');
    })
    it('QueryStorageDataCoreTest_023', 0, () => {
      logInfo('QueryStorageDataCoreTest_023 begin');
      const bytes: number = 5242880;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(5);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_023 end');
    })
    it('QueryStorageDataCoreTest_024', 0, () => {
      logInfo('QueryStorageDataCoreTest_024 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_024 end');
    })
    it('QueryStorageDataCoreTest_025', 0, () => {
      logInfo('QueryStorageDataCoreTest_025 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_025 end');
    })
    it('QueryStorageDataCoreTest_026', 0, () => {
      logInfo('QueryStorageDataCoreTest_026 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 4194304;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('4.0 MB');
      logInfo('QueryStorageDataCoreTest_026 end');
    })
    it('QueryStorageDataCoreTest_027', 0, () => {
      logInfo('QueryStorageDataCoreTest_027 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 27;
      second.totalSize = 28;
      expect(first.totalSize).assertEqual(27);
      expect(second.totalSize).assertEqual(28);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_027 end');
    })
    it('QueryStorageDataCoreTest_028', 0, () => {
      logInfo('QueryStorageDataCoreTest_028 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_028 end');
    })
    it('QueryStorageDataCoreTest_029', 0, () => {
      logInfo('QueryStorageDataCoreTest_029 begin');
      const bytes: number = 2097152;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(2);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_029 end');
    })
    it('QueryStorageDataCoreTest_030', 0, () => {
      logInfo('QueryStorageDataCoreTest_030 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_030 end');
    })
    it('QueryStorageDataCoreTest_031', 0, () => {
      logInfo('QueryStorageDataCoreTest_031 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_031 end');
    })
    it('QueryStorageDataCoreTest_032', 0, () => {
      logInfo('QueryStorageDataCoreTest_032 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 10485760;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('10.0 MB');
      logInfo('QueryStorageDataCoreTest_032 end');
    })
    it('QueryStorageDataCoreTest_033', 0, () => {
      logInfo('QueryStorageDataCoreTest_033 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 33;
      second.totalSize = 34;
      expect(first.totalSize).assertEqual(33);
      expect(second.totalSize).assertEqual(34);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_033 end');
    })
    it('QueryStorageDataCoreTest_034', 0, () => {
      logInfo('QueryStorageDataCoreTest_034 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_034 end');
    })
    it('QueryStorageDataCoreTest_035', 0, () => {
      logInfo('QueryStorageDataCoreTest_035 begin');
      const bytes: number = 8388608;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(8);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_035 end');
    })
    it('QueryStorageDataCoreTest_036', 0, () => {
      logInfo('QueryStorageDataCoreTest_036 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_036 end');
    })
    it('QueryStorageDataCoreTest_037', 0, () => {
      logInfo('QueryStorageDataCoreTest_037 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_037 end');
    })
    it('QueryStorageDataCoreTest_038', 0, () => {
      logInfo('QueryStorageDataCoreTest_038 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 5242880;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('5.0 MB');
      logInfo('QueryStorageDataCoreTest_038 end');
    })
    it('QueryStorageDataCoreTest_039', 0, () => {
      logInfo('QueryStorageDataCoreTest_039 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 39;
      second.totalSize = 40;
      expect(first.totalSize).assertEqual(39);
      expect(second.totalSize).assertEqual(40);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_039 end');
    })
    it('QueryStorageDataCoreTest_040', 0, () => {
      logInfo('QueryStorageDataCoreTest_040 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_040 end');
    })
    it('QueryStorageDataCoreTest_041', 0, () => {
      logInfo('QueryStorageDataCoreTest_041 begin');
      const bytes: number = 5242880;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(5);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_041 end');
    })
    it('QueryStorageDataCoreTest_042', 0, () => {
      logInfo('QueryStorageDataCoreTest_042 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_042 end');
    })
    it('QueryStorageDataCoreTest_043', 0, () => {
      logInfo('QueryStorageDataCoreTest_043 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_043 end');
    })
    it('QueryStorageDataCoreTest_044', 0, () => {
      logInfo('QueryStorageDataCoreTest_044 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 11534336;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('11.0 MB');
      logInfo('QueryStorageDataCoreTest_044 end');
    })
    it('QueryStorageDataCoreTest_045', 0, () => {
      logInfo('QueryStorageDataCoreTest_045 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 45;
      second.totalSize = 46;
      expect(first.totalSize).assertEqual(45);
      expect(second.totalSize).assertEqual(46);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_045 end');
    })
    it('QueryStorageDataCoreTest_046', 0, () => {
      logInfo('QueryStorageDataCoreTest_046 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_046 end');
    })
    it('QueryStorageDataCoreTest_047', 0, () => {
      logInfo('QueryStorageDataCoreTest_047 begin');
      const bytes: number = 2097152;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(2);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_047 end');
    })
    it('QueryStorageDataCoreTest_048', 0, () => {
      logInfo('QueryStorageDataCoreTest_048 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_048 end');
    })
    it('QueryStorageDataCoreTest_049', 0, () => {
      logInfo('QueryStorageDataCoreTest_049 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_049 end');
    })
    it('QueryStorageDataCoreTest_050', 0, () => {
      logInfo('QueryStorageDataCoreTest_050 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 6291456;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('6.0 MB');
      logInfo('QueryStorageDataCoreTest_050 end');
    })
    it('QueryStorageDataCoreTest_051', 0, () => {
      logInfo('QueryStorageDataCoreTest_051 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 51;
      second.totalSize = 52;
      expect(first.totalSize).assertEqual(51);
      expect(second.totalSize).assertEqual(52);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_051 end');
    })
    it('QueryStorageDataCoreTest_052', 0, () => {
      logInfo('QueryStorageDataCoreTest_052 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_052 end');
    })
    it('QueryStorageDataCoreTest_053', 0, () => {
      logInfo('QueryStorageDataCoreTest_053 begin');
      const bytes: number = 8388608;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(8);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_053 end');
    })
    it('QueryStorageDataCoreTest_054', 0, () => {
      logInfo('QueryStorageDataCoreTest_054 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_054 end');
    })
    it('QueryStorageDataCoreTest_055', 0, () => {
      logInfo('QueryStorageDataCoreTest_055 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_055 end');
    })
    it('QueryStorageDataCoreTest_056', 0, () => {
      logInfo('QueryStorageDataCoreTest_056 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 1048576;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('1024.0 KB');
      logInfo('QueryStorageDataCoreTest_056 end');
    })
    it('QueryStorageDataCoreTest_057', 0, () => {
      logInfo('QueryStorageDataCoreTest_057 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 57;
      second.totalSize = 58;
      expect(first.totalSize).assertEqual(57);
      expect(second.totalSize).assertEqual(58);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_057 end');
    })
    it('QueryStorageDataCoreTest_058', 0, () => {
      logInfo('QueryStorageDataCoreTest_058 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_058 end');
    })
    it('QueryStorageDataCoreTest_059', 0, () => {
      logInfo('QueryStorageDataCoreTest_059 begin');
      const bytes: number = 5242880;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(5);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_059 end');
    })
    it('QueryStorageDataCoreTest_060', 0, () => {
      logInfo('QueryStorageDataCoreTest_060 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_060 end');
    })
    it('QueryStorageDataCoreTest_061', 0, () => {
      logInfo('QueryStorageDataCoreTest_061 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_061 end');
    })
    it('QueryStorageDataCoreTest_062', 0, () => {
      logInfo('QueryStorageDataCoreTest_062 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 7340032;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('7.0 MB');
      logInfo('QueryStorageDataCoreTest_062 end');
    })
    it('QueryStorageDataCoreTest_063', 0, () => {
      logInfo('QueryStorageDataCoreTest_063 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 63;
      second.totalSize = 64;
      expect(first.totalSize).assertEqual(63);
      expect(second.totalSize).assertEqual(64);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_063 end');
    })
    it('QueryStorageDataCoreTest_064', 0, () => {
      logInfo('QueryStorageDataCoreTest_064 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_064 end');
    })
    it('QueryStorageDataCoreTest_065', 0, () => {
      logInfo('QueryStorageDataCoreTest_065 begin');
      const bytes: number = 2097152;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(2);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_065 end');
    })
    it('QueryStorageDataCoreTest_066', 0, () => {
      logInfo('QueryStorageDataCoreTest_066 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_066 end');
    })
    it('QueryStorageDataCoreTest_067', 0, () => {
      logInfo('QueryStorageDataCoreTest_067 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_067 end');
    })
    it('QueryStorageDataCoreTest_068', 0, () => {
      logInfo('QueryStorageDataCoreTest_068 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 2097152;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('2.0 MB');
      logInfo('QueryStorageDataCoreTest_068 end');
    })
    it('QueryStorageDataCoreTest_069', 0, () => {
      logInfo('QueryStorageDataCoreTest_069 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 69;
      second.totalSize = 70;
      expect(first.totalSize).assertEqual(69);
      expect(second.totalSize).assertEqual(70);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_069 end');
    })
    it('QueryStorageDataCoreTest_070', 0, () => {
      logInfo('QueryStorageDataCoreTest_070 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_070 end');
    })
    it('QueryStorageDataCoreTest_071', 0, () => {
      logInfo('QueryStorageDataCoreTest_071 begin');
      const bytes: number = 8388608;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(8);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_071 end');
    })
    it('QueryStorageDataCoreTest_072', 0, () => {
      logInfo('QueryStorageDataCoreTest_072 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_072 end');
    })
    it('QueryStorageDataCoreTest_073', 0, () => {
      logInfo('QueryStorageDataCoreTest_073 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_073 end');
    })
    it('QueryStorageDataCoreTest_074', 0, () => {
      logInfo('QueryStorageDataCoreTest_074 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 8388608;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('8.0 MB');
      logInfo('QueryStorageDataCoreTest_074 end');
    })
    it('QueryStorageDataCoreTest_075', 0, () => {
      logInfo('QueryStorageDataCoreTest_075 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 75;
      second.totalSize = 76;
      expect(first.totalSize).assertEqual(75);
      expect(second.totalSize).assertEqual(76);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_075 end');
    })
    it('QueryStorageDataCoreTest_076', 0, () => {
      logInfo('QueryStorageDataCoreTest_076 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_076 end');
    })
    it('QueryStorageDataCoreTest_077', 0, () => {
      logInfo('QueryStorageDataCoreTest_077 begin');
      const bytes: number = 5242880;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(5);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_077 end');
    })
    it('QueryStorageDataCoreTest_078', 0, () => {
      logInfo('QueryStorageDataCoreTest_078 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_078 end');
    })
    it('QueryStorageDataCoreTest_079', 0, () => {
      logInfo('QueryStorageDataCoreTest_079 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_079 end');
    })
    it('QueryStorageDataCoreTest_080', 0, () => {
      logInfo('QueryStorageDataCoreTest_080 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 3145728;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('3.0 MB');
      logInfo('QueryStorageDataCoreTest_080 end');
    })
    it('QueryStorageDataCoreTest_081', 0, () => {
      logInfo('QueryStorageDataCoreTest_081 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 81;
      second.totalSize = 82;
      expect(first.totalSize).assertEqual(81);
      expect(second.totalSize).assertEqual(82);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_081 end');
    })
    it('QueryStorageDataCoreTest_082', 0, () => {
      logInfo('QueryStorageDataCoreTest_082 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_082 end');
    })
    it('QueryStorageDataCoreTest_083', 0, () => {
      logInfo('QueryStorageDataCoreTest_083 begin');
      const bytes: number = 2097152;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(2);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_083 end');
    })
    it('QueryStorageDataCoreTest_084', 0, () => {
      logInfo('QueryStorageDataCoreTest_084 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_084 end');
    })
    it('QueryStorageDataCoreTest_085', 0, () => {
      logInfo('QueryStorageDataCoreTest_085 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_085 end');
    })
    it('QueryStorageDataCoreTest_086', 0, () => {
      logInfo('QueryStorageDataCoreTest_086 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 9437184;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('9.0 MB');
      logInfo('QueryStorageDataCoreTest_086 end');
    })
    it('QueryStorageDataCoreTest_087', 0, () => {
      logInfo('QueryStorageDataCoreTest_087 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 87;
      second.totalSize = 88;
      expect(first.totalSize).assertEqual(87);
      expect(second.totalSize).assertEqual(88);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_087 end');
    })
    it('QueryStorageDataCoreTest_088', 0, () => {
      logInfo('QueryStorageDataCoreTest_088 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_088 end');
    })
    it('QueryStorageDataCoreTest_089', 0, () => {
      logInfo('QueryStorageDataCoreTest_089 begin');
      const bytes: number = 8388608;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(8);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_089 end');
    })
    it('QueryStorageDataCoreTest_090', 0, () => {
      logInfo('QueryStorageDataCoreTest_090 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_090 end');
    })
    it('QueryStorageDataCoreTest_091', 0, () => {
      logInfo('QueryStorageDataCoreTest_091 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_091 end');
    })
    it('QueryStorageDataCoreTest_092', 0, () => {
      logInfo('QueryStorageDataCoreTest_092 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 4194304;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('4.0 MB');
      logInfo('QueryStorageDataCoreTest_092 end');
    })
    it('QueryStorageDataCoreTest_093', 0, () => {
      logInfo('QueryStorageDataCoreTest_093 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 93;
      second.totalSize = 94;
      expect(first.totalSize).assertEqual(93);
      expect(second.totalSize).assertEqual(94);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_093 end');
    })
    it('QueryStorageDataCoreTest_094', 0, () => {
      logInfo('QueryStorageDataCoreTest_094 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_094 end');
    })
    it('QueryStorageDataCoreTest_095', 0, () => {
      logInfo('QueryStorageDataCoreTest_095 begin');
      const bytes: number = 5242880;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(5);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_095 end');
    })
    it('QueryStorageDataCoreTest_096', 0, () => {
      logInfo('QueryStorageDataCoreTest_096 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_096 end');
    })
    it('QueryStorageDataCoreTest_097', 0, () => {
      logInfo('QueryStorageDataCoreTest_097 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_097 end');
    })
    it('QueryStorageDataCoreTest_098', 0, () => {
      logInfo('QueryStorageDataCoreTest_098 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 10485760;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('10.0 MB');
      logInfo('QueryStorageDataCoreTest_098 end');
    })
    it('QueryStorageDataCoreTest_099', 0, () => {
      logInfo('QueryStorageDataCoreTest_099 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 99;
      second.totalSize = 100;
      expect(first.totalSize).assertEqual(99);
      expect(second.totalSize).assertEqual(100);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_099 end');
    })
    it('QueryStorageDataCoreTest_100', 0, () => {
      logInfo('QueryStorageDataCoreTest_100 begin');
      const colors: string[] = ["#F9A20F","#F2400A","#E65392","#A12DF7","#4B48F7","#007DFF"];
      const index: number = 3;
      expect(colors.length).assertEqual(6);
      expect(colors[index]).assertEqual('#A12DF7');
      expect(colors[index].indexOf('#')).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_100 end');
    })
    it('QueryStorageDataCoreTest_101', 0, () => {
      logInfo('QueryStorageDataCoreTest_101 begin');
      const bytes: number = 2097152;
      const megabytes: number = ParseData.parseSize(bytes);
      expect(megabytes).assertEqual(2);
      expect(megabytes > 0).assertTrue();
      logInfo('QueryStorageDataCoreTest_101 end');
    })
    it('QueryStorageDataCoreTest_102', 0, () => {
      logInfo('QueryStorageDataCoreTest_102 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.appDataList.length).assertEqual(0);
      expect(Array.isArray(dataset.appDataList)).assertTrue();
      expect(Array.isArray(dataset.itemSizeList)).assertTrue();
      logInfo('QueryStorageDataCoreTest_102 end');
    })
    it('QueryStorageDataCoreTest_103', 0, () => {
      logInfo('QueryStorageDataCoreTest_103 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      expect(dataset.totalSize).assertEqual(-1);
      expect(dataset.freeSize).assertEqual(-1);
      expect(dataset.itemSizeList.length).assertEqual(0);
      expect(dataset.classifiedDataList.length).assertEqual(0);
      logInfo('QueryStorageDataCoreTest_103 end');
    })
    it('QueryStorageDataCoreTest_104', 0, () => {
      logInfo('QueryStorageDataCoreTest_104 begin');
      const dataset: QueryStorageData = new QueryStorageData();
      const size: number = 5242880;
      let item: StorageData = { name: 'Application', size: size, color: '#F9A20F' };
      dataset.classifiedDataList.push(item);
      expect(dataset.classifiedDataList.length).assertEqual(1);
      expect(ParseData.parseSizeToString(dataset.classifiedDataList[0].size)).assertEqual('5.0 MB');
      logInfo('QueryStorageDataCoreTest_104 end');
    })
    it('QueryStorageDataCoreTest_105', 0, () => {
      logInfo('QueryStorageDataCoreTest_105 begin');
      const first: QueryStorageData = new QueryStorageData();
      const second: QueryStorageData = new QueryStorageData();
      first.totalSize = 105;
      second.totalSize = 106;
      expect(first.totalSize).assertEqual(105);
      expect(second.totalSize).assertEqual(106);
      expect(first.classifiedDataList !== second.classifiedDataList).assertTrue();
      logInfo('QueryStorageDataCoreTest_105 end');
    })
  })
}
