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
import { StorageConst } from '../../../../main/ets/utils/StorageConst';
const TAG: string = 'ParseDataCore';
const DOMAIN: number = 0xF811;
function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}
export default function parseDataCoreTest(): void {
  describe('ParseDataCoreTest', () => {
    beforeAll(() => {
      logInfo('ParseDataCoreTest beforeAll');
    })
    beforeEach(() => {
      logInfo('ParseDataCoreTest beforeEach');
    })
    afterEach(() => {
      logInfo('ParseDataCoreTest afterEach');
    })
    afterAll(() => {
      logInfo('ParseDataCoreTest afterAll');
    })
    it('ParseDataCoreTest_001', 0, () => {
      logInfo('ParseDataCoreTest_001 begin');
      const input: number = 0;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_001 end');
    })
    it('ParseDataCoreTest_002', 0, () => {
      logInfo('ParseDataCoreTest_002 begin');
      const input: number = 2097152;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(2);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(2097152);
      logInfo('ParseDataCoreTest_002 end');
    })
    it('ParseDataCoreTest_003', 0, () => {
      logInfo('ParseDataCoreTest_003 begin');
      const molecule: number = 3145728;
      const denominator: number = 4194304;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('75.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_003 end');
    })
    it('ParseDataCoreTest_004', 0, () => {
      logInfo('ParseDataCoreTest_004 begin');
      const input: number = 102;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_004 end');
    })
    it('ParseDataCoreTest_005', 0, () => {
      logInfo('ParseDataCoreTest_005 begin');
      const input: number = 103;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0.1 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_005 end');
    })
    it('ParseDataCoreTest_006', 0, () => {
      logInfo('ParseDataCoreTest_006 begin');
      const input: number = 6291456;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(6);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(6291456);
      logInfo('ParseDataCoreTest_006 end');
    })
    it('ParseDataCoreTest_007', 0, () => {
      logInfo('ParseDataCoreTest_007 begin');
      const molecule: number = 2097152;
      const denominator: number = 8388608;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('25.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_007 end');
    })
    it('ParseDataCoreTest_008', 0, () => {
      logInfo('ParseDataCoreTest_008 begin');
      const input: number = 1048576;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_008 end');
    })
    it('ParseDataCoreTest_009', 0, () => {
      logInfo('ParseDataCoreTest_009 begin');
      const input: number = 1048577;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1.0 MB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_009 end');
    })
    it('ParseDataCoreTest_010', 0, () => {
      logInfo('ParseDataCoreTest_010 begin');
      const input: number = 1048576;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(1);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(1048576);
      logInfo('ParseDataCoreTest_010 end');
    })
    it('ParseDataCoreTest_011', 0, () => {
      logInfo('ParseDataCoreTest_011 begin');
      const molecule: number = 1048576;
      const denominator: number = 5242880;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('20.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_011 end');
    })
    it('ParseDataCoreTest_012', 0, () => {
      logInfo('ParseDataCoreTest_012 begin');
      const input: number = 1073741825;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_012 end');
    })
    it('ParseDataCoreTest_013', 0, () => {
      logInfo('ParseDataCoreTest_013 begin');
      const input: number = 5368709120;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('5.0 GB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_013 end');
    })
    it('ParseDataCoreTest_014', 0, () => {
      logInfo('ParseDataCoreTest_014 begin');
      const input: number = 5242880;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(5);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(5242880);
      logInfo('ParseDataCoreTest_014 end');
    })
    it('ParseDataCoreTest_015', 0, () => {
      logInfo('ParseDataCoreTest_015 begin');
      const molecule: number = 5242880;
      const denominator: number = 2097152;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('250.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_015 end');
    })
    it('ParseDataCoreTest_016', 0, () => {
      logInfo('ParseDataCoreTest_016 begin');
      const input: number = 100;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_016 end');
    })
    it('ParseDataCoreTest_017', 0, () => {
      logInfo('ParseDataCoreTest_017 begin');
      const input: number = 102;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_017 end');
    })
    it('ParseDataCoreTest_018', 0, () => {
      logInfo('ParseDataCoreTest_018 begin');
      const input: number = 9437184;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(9);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(9437184);
      logInfo('ParseDataCoreTest_018 end');
    })
    it('ParseDataCoreTest_019', 0, () => {
      logInfo('ParseDataCoreTest_019 begin');
      const molecule: number = 4194304;
      const denominator: number = 6291456;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('66.7%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_019 end');
    })
    it('ParseDataCoreTest_020', 0, () => {
      logInfo('ParseDataCoreTest_020 begin');
      const input: number = 1048575;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_020 end');
    })
    it('ParseDataCoreTest_021', 0, () => {
      logInfo('ParseDataCoreTest_021 begin');
      const input: number = 1048576;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1024.0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_021 end');
    })
    it('ParseDataCoreTest_022', 0, () => {
      logInfo('ParseDataCoreTest_022 begin');
      const input: number = 4194304;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(4);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(4194304);
      logInfo('ParseDataCoreTest_022 end');
    })
    it('ParseDataCoreTest_023', 0, () => {
      logInfo('ParseDataCoreTest_023 begin');
      const molecule: number = 3145728;
      const denominator: number = 3145728;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('100.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_023 end');
    })
    it('ParseDataCoreTest_024', 0, () => {
      logInfo('ParseDataCoreTest_024 begin');
      const input: number = 1073741824;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_024 end');
    })
    it('ParseDataCoreTest_025', 0, () => {
      logInfo('ParseDataCoreTest_025 begin');
      const input: number = 1073741825;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1.0 GB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_025 end');
    })
    it('ParseDataCoreTest_026', 0, () => {
      logInfo('ParseDataCoreTest_026 begin');
      const input: number = 8388608;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(8);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(8388608);
      logInfo('ParseDataCoreTest_026 end');
    })
    it('ParseDataCoreTest_027', 0, () => {
      logInfo('ParseDataCoreTest_027 begin');
      const molecule: number = 2097152;
      const denominator: number = 7340032;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('28.6%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_027 end');
    })
    it('ParseDataCoreTest_028', 0, () => {
      logInfo('ParseDataCoreTest_028 begin');
      const input: number = 1;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_028 end');
    })
    it('ParseDataCoreTest_029', 0, () => {
      logInfo('ParseDataCoreTest_029 begin');
      const input: number = 100;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_029 end');
    })
    it('ParseDataCoreTest_030', 0, () => {
      logInfo('ParseDataCoreTest_030 begin');
      const input: number = 3145728;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(3);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(3145728);
      logInfo('ParseDataCoreTest_030 end');
    })
    it('ParseDataCoreTest_031', 0, () => {
      logInfo('ParseDataCoreTest_031 begin');
      const molecule: number = 1048576;
      const denominator: number = 4194304;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('25.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_031 end');
    })
    it('ParseDataCoreTest_032', 0, () => {
      logInfo('ParseDataCoreTest_032 begin');
      const input: number = 1024;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_032 end');
    })
    it('ParseDataCoreTest_033', 0, () => {
      logInfo('ParseDataCoreTest_033 begin');
      const input: number = 1048575;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1024.0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_033 end');
    })
    it('ParseDataCoreTest_034', 0, () => {
      logInfo('ParseDataCoreTest_034 begin');
      const input: number = 7340032;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(7);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(7340032);
      logInfo('ParseDataCoreTest_034 end');
    })
    it('ParseDataCoreTest_035', 0, () => {
      logInfo('ParseDataCoreTest_035 begin');
      const molecule: number = 5242880;
      const denominator: number = 8388608;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('62.5%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_035 end');
    })
    it('ParseDataCoreTest_036', 0, () => {
      logInfo('ParseDataCoreTest_036 begin');
      const input: number = 1073741823;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_036 end');
    })
    it('ParseDataCoreTest_037', 0, () => {
      logInfo('ParseDataCoreTest_037 begin');
      const input: number = 1073741824;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1024.0 MB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_037 end');
    })
    it('ParseDataCoreTest_038', 0, () => {
      logInfo('ParseDataCoreTest_038 begin');
      const input: number = 2097152;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(2);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(2097152);
      logInfo('ParseDataCoreTest_038 end');
    })
    it('ParseDataCoreTest_039', 0, () => {
      logInfo('ParseDataCoreTest_039 begin');
      const molecule: number = 4194304;
      const denominator: number = 5242880;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('80.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_039 end');
    })
    it('ParseDataCoreTest_040', 0, () => {
      logInfo('ParseDataCoreTest_040 begin');
      const input: number = 0;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_040 end');
    })
    it('ParseDataCoreTest_041', 0, () => {
      logInfo('ParseDataCoreTest_041 begin');
      const input: number = 1;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_041 end');
    })
    it('ParseDataCoreTest_042', 0, () => {
      logInfo('ParseDataCoreTest_042 begin');
      const input: number = 6291456;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(6);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(6291456);
      logInfo('ParseDataCoreTest_042 end');
    })
    it('ParseDataCoreTest_043', 0, () => {
      logInfo('ParseDataCoreTest_043 begin');
      const molecule: number = 3145728;
      const denominator: number = 2097152;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('150.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_043 end');
    })
    it('ParseDataCoreTest_044', 0, () => {
      logInfo('ParseDataCoreTest_044 begin');
      const input: number = 103;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_044 end');
    })
    it('ParseDataCoreTest_045', 0, () => {
      logInfo('ParseDataCoreTest_045 begin');
      const input: number = 1024;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1.0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_045 end');
    })
    it('ParseDataCoreTest_046', 0, () => {
      logInfo('ParseDataCoreTest_046 begin');
      const input: number = 1048576;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(1);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(1048576);
      logInfo('ParseDataCoreTest_046 end');
    })
    it('ParseDataCoreTest_047', 0, () => {
      logInfo('ParseDataCoreTest_047 begin');
      const molecule: number = 2097152;
      const denominator: number = 6291456;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('33.3%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_047 end');
    })
    it('ParseDataCoreTest_048', 0, () => {
      logInfo('ParseDataCoreTest_048 begin');
      const input: number = 1048577;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_048 end');
    })
    it('ParseDataCoreTest_049', 0, () => {
      logInfo('ParseDataCoreTest_049 begin');
      const input: number = 1073741823;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1024.0 MB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_049 end');
    })
    it('ParseDataCoreTest_050', 0, () => {
      logInfo('ParseDataCoreTest_050 begin');
      const input: number = 5242880;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(5);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(5242880);
      logInfo('ParseDataCoreTest_050 end');
    })
    it('ParseDataCoreTest_051', 0, () => {
      logInfo('ParseDataCoreTest_051 begin');
      const molecule: number = 1048576;
      const denominator: number = 3145728;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('33.3%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_051 end');
    })
    it('ParseDataCoreTest_052', 0, () => {
      logInfo('ParseDataCoreTest_052 begin');
      const input: number = 5368709120;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_052 end');
    })
    it('ParseDataCoreTest_053', 0, () => {
      logInfo('ParseDataCoreTest_053 begin');
      const input: number = 0;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_053 end');
    })
    it('ParseDataCoreTest_054', 0, () => {
      logInfo('ParseDataCoreTest_054 begin');
      const input: number = 9437184;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(9);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(9437184);
      logInfo('ParseDataCoreTest_054 end');
    })
    it('ParseDataCoreTest_055', 0, () => {
      logInfo('ParseDataCoreTest_055 begin');
      const molecule: number = 5242880;
      const denominator: number = 7340032;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('71.4%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_055 end');
    })
    it('ParseDataCoreTest_056', 0, () => {
      logInfo('ParseDataCoreTest_056 begin');
      const input: number = 102;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_056 end');
    })
    it('ParseDataCoreTest_057', 0, () => {
      logInfo('ParseDataCoreTest_057 begin');
      const input: number = 103;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0.1 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_057 end');
    })
    it('ParseDataCoreTest_058', 0, () => {
      logInfo('ParseDataCoreTest_058 begin');
      const input: number = 4194304;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(4);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(4194304);
      logInfo('ParseDataCoreTest_058 end');
    })
    it('ParseDataCoreTest_059', 0, () => {
      logInfo('ParseDataCoreTest_059 begin');
      const molecule: number = 4194304;
      const denominator: number = 4194304;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('100.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_059 end');
    })
    it('ParseDataCoreTest_060', 0, () => {
      logInfo('ParseDataCoreTest_060 begin');
      const input: number = 1048576;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_060 end');
    })
    it('ParseDataCoreTest_061', 0, () => {
      logInfo('ParseDataCoreTest_061 begin');
      const input: number = 1048577;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1.0 MB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_061 end');
    })
    it('ParseDataCoreTest_062', 0, () => {
      logInfo('ParseDataCoreTest_062 begin');
      const input: number = 8388608;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(8);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(8388608);
      logInfo('ParseDataCoreTest_062 end');
    })
    it('ParseDataCoreTest_063', 0, () => {
      logInfo('ParseDataCoreTest_063 begin');
      const molecule: number = 3145728;
      const denominator: number = 8388608;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('37.5%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_063 end');
    })
    it('ParseDataCoreTest_064', 0, () => {
      logInfo('ParseDataCoreTest_064 begin');
      const input: number = 1073741825;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_064 end');
    })
    it('ParseDataCoreTest_065', 0, () => {
      logInfo('ParseDataCoreTest_065 begin');
      const input: number = 5368709120;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('5.0 GB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_065 end');
    })
    it('ParseDataCoreTest_066', 0, () => {
      logInfo('ParseDataCoreTest_066 begin');
      const input: number = 3145728;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(3);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(3145728);
      logInfo('ParseDataCoreTest_066 end');
    })
    it('ParseDataCoreTest_067', 0, () => {
      logInfo('ParseDataCoreTest_067 begin');
      const molecule: number = 2097152;
      const denominator: number = 5242880;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('40.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_067 end');
    })
    it('ParseDataCoreTest_068', 0, () => {
      logInfo('ParseDataCoreTest_068 begin');
      const input: number = 100;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_068 end');
    })
    it('ParseDataCoreTest_069', 0, () => {
      logInfo('ParseDataCoreTest_069 begin');
      const input: number = 102;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_069 end');
    })
    it('ParseDataCoreTest_070', 0, () => {
      logInfo('ParseDataCoreTest_070 begin');
      const input: number = 7340032;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(7);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(7340032);
      logInfo('ParseDataCoreTest_070 end');
    })
    it('ParseDataCoreTest_071', 0, () => {
      logInfo('ParseDataCoreTest_071 begin');
      const molecule: number = 1048576;
      const denominator: number = 2097152;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('50.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_071 end');
    })
    it('ParseDataCoreTest_072', 0, () => {
      logInfo('ParseDataCoreTest_072 begin');
      const input: number = 1048575;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_072 end');
    })
    it('ParseDataCoreTest_073', 0, () => {
      logInfo('ParseDataCoreTest_073 begin');
      const input: number = 1048576;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1024.0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_073 end');
    })
    it('ParseDataCoreTest_074', 0, () => {
      logInfo('ParseDataCoreTest_074 begin');
      const input: number = 2097152;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(2);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(2097152);
      logInfo('ParseDataCoreTest_074 end');
    })
    it('ParseDataCoreTest_075', 0, () => {
      logInfo('ParseDataCoreTest_075 begin');
      const molecule: number = 5242880;
      const denominator: number = 6291456;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('83.3%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_075 end');
    })
    it('ParseDataCoreTest_076', 0, () => {
      logInfo('ParseDataCoreTest_076 begin');
      const input: number = 1073741824;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_076 end');
    })
    it('ParseDataCoreTest_077', 0, () => {
      logInfo('ParseDataCoreTest_077 begin');
      const input: number = 1073741825;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1.0 GB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_077 end');
    })
    it('ParseDataCoreTest_078', 0, () => {
      logInfo('ParseDataCoreTest_078 begin');
      const input: number = 6291456;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(6);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(6291456);
      logInfo('ParseDataCoreTest_078 end');
    })
    it('ParseDataCoreTest_079', 0, () => {
      logInfo('ParseDataCoreTest_079 begin');
      const molecule: number = 4194304;
      const denominator: number = 3145728;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('133.3%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_079 end');
    })
    it('ParseDataCoreTest_080', 0, () => {
      logInfo('ParseDataCoreTest_080 begin');
      const input: number = 1;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_080 end');
    })
    it('ParseDataCoreTest_081', 0, () => {
      logInfo('ParseDataCoreTest_081 begin');
      const input: number = 100;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_081 end');
    })
    it('ParseDataCoreTest_082', 0, () => {
      logInfo('ParseDataCoreTest_082 begin');
      const input: number = 1048576;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(1);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(1048576);
      logInfo('ParseDataCoreTest_082 end');
    })
    it('ParseDataCoreTest_083', 0, () => {
      logInfo('ParseDataCoreTest_083 begin');
      const molecule: number = 3145728;
      const denominator: number = 7340032;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('42.9%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_083 end');
    })
    it('ParseDataCoreTest_084', 0, () => {
      logInfo('ParseDataCoreTest_084 begin');
      const input: number = 1024;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_084 end');
    })
    it('ParseDataCoreTest_085', 0, () => {
      logInfo('ParseDataCoreTest_085 begin');
      const input: number = 1048575;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1024.0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_085 end');
    })
    it('ParseDataCoreTest_086', 0, () => {
      logInfo('ParseDataCoreTest_086 begin');
      const input: number = 5242880;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(5);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(5242880);
      logInfo('ParseDataCoreTest_086 end');
    })
    it('ParseDataCoreTest_087', 0, () => {
      logInfo('ParseDataCoreTest_087 begin');
      const molecule: number = 2097152;
      const denominator: number = 4194304;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('50.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_087 end');
    })
    it('ParseDataCoreTest_088', 0, () => {
      logInfo('ParseDataCoreTest_088 begin');
      const input: number = 1073741823;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_088 end');
    })
    it('ParseDataCoreTest_089', 0, () => {
      logInfo('ParseDataCoreTest_089 begin');
      const input: number = 1073741824;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1024.0 MB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_089 end');
    })
    it('ParseDataCoreTest_090', 0, () => {
      logInfo('ParseDataCoreTest_090 begin');
      const input: number = 9437184;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(9);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(9437184);
      logInfo('ParseDataCoreTest_090 end');
    })
    it('ParseDataCoreTest_091', 0, () => {
      logInfo('ParseDataCoreTest_091 begin');
      const molecule: number = 1048576;
      const denominator: number = 8388608;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('12.5%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_091 end');
    })
    it('ParseDataCoreTest_092', 0, () => {
      logInfo('ParseDataCoreTest_092 begin');
      const input: number = 0;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_092 end');
    })
    it('ParseDataCoreTest_093', 0, () => {
      logInfo('ParseDataCoreTest_093 begin');
      const input: number = 1;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_093 end');
    })
    it('ParseDataCoreTest_094', 0, () => {
      logInfo('ParseDataCoreTest_094 begin');
      const input: number = 4194304;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(4);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(4194304);
      logInfo('ParseDataCoreTest_094 end');
    })
    it('ParseDataCoreTest_095', 0, () => {
      logInfo('ParseDataCoreTest_095 begin');
      const molecule: number = 5242880;
      const denominator: number = 5242880;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('100.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_095 end');
    })
    it('ParseDataCoreTest_096', 0, () => {
      logInfo('ParseDataCoreTest_096 begin');
      const input: number = 103;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_096 end');
    })
    it('ParseDataCoreTest_097', 0, () => {
      logInfo('ParseDataCoreTest_097 begin');
      const input: number = 1024;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1.0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_097 end');
    })
    it('ParseDataCoreTest_098', 0, () => {
      logInfo('ParseDataCoreTest_098 begin');
      const input: number = 8388608;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(8);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(8388608);
      logInfo('ParseDataCoreTest_098 end');
    })
    it('ParseDataCoreTest_099', 0, () => {
      logInfo('ParseDataCoreTest_099 begin');
      const molecule: number = 4194304;
      const denominator: number = 2097152;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('200.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_099 end');
    })
    it('ParseDataCoreTest_100', 0, () => {
      logInfo('ParseDataCoreTest_100 begin');
      const input: number = 1048577;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_100 end');
    })
    it('ParseDataCoreTest_101', 0, () => {
      logInfo('ParseDataCoreTest_101 begin');
      const input: number = 1073741823;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1024.0 MB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_101 end');
    })
    it('ParseDataCoreTest_102', 0, () => {
      logInfo('ParseDataCoreTest_102 begin');
      const input: number = 3145728;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(3);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(3145728);
      logInfo('ParseDataCoreTest_102 end');
    })
    it('ParseDataCoreTest_103', 0, () => {
      logInfo('ParseDataCoreTest_103 begin');
      const molecule: number = 3145728;
      const denominator: number = 6291456;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('50.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_103 end');
    })
    it('ParseDataCoreTest_104', 0, () => {
      logInfo('ParseDataCoreTest_104 begin');
      const input: number = 5368709120;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_104 end');
    })
    it('ParseDataCoreTest_105', 0, () => {
      logInfo('ParseDataCoreTest_105 begin');
      const input: number = 0;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_105 end');
    })
    it('ParseDataCoreTest_106', 0, () => {
      logInfo('ParseDataCoreTest_106 begin');
      const input: number = 7340032;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(7);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(7340032);
      logInfo('ParseDataCoreTest_106 end');
    })
    it('ParseDataCoreTest_107', 0, () => {
      logInfo('ParseDataCoreTest_107 begin');
      const molecule: number = 2097152;
      const denominator: number = 3145728;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('66.7%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_107 end');
    })
    it('ParseDataCoreTest_108', 0, () => {
      logInfo('ParseDataCoreTest_108 begin');
      const input: number = 102;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_108 end');
    })
    it('ParseDataCoreTest_109', 0, () => {
      logInfo('ParseDataCoreTest_109 begin');
      const input: number = 103;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('0.1 KB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_109 end');
    })
    it('ParseDataCoreTest_110', 0, () => {
      logInfo('ParseDataCoreTest_110 begin');
      const input: number = 2097152;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(2);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(2097152);
      logInfo('ParseDataCoreTest_110 end');
    })
    it('ParseDataCoreTest_111', 0, () => {
      logInfo('ParseDataCoreTest_111 begin');
      const molecule: number = 1048576;
      const denominator: number = 7340032;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('14.3%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_111 end');
    })
    it('ParseDataCoreTest_112', 0, () => {
      logInfo('ParseDataCoreTest_112 begin');
      const input: number = 1048576;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_112 end');
    })
    it('ParseDataCoreTest_113', 0, () => {
      logInfo('ParseDataCoreTest_113 begin');
      const input: number = 1048577;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('1.0 MB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_113 end');
    })
    it('ParseDataCoreTest_114', 0, () => {
      logInfo('ParseDataCoreTest_114 begin');
      const input: number = 6291456;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(6);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(6291456);
      logInfo('ParseDataCoreTest_114 end');
    })
    it('ParseDataCoreTest_115', 0, () => {
      logInfo('ParseDataCoreTest_115 begin');
      const molecule: number = 5242880;
      const denominator: number = 4194304;
      const actual: string = ParseData.calculatePercentage(molecule, denominator);
      expect(actual).assertEqual('125.0%');
      expect(actual.indexOf('%') > 0).assertTrue();
      logInfo('ParseDataCoreTest_115 end');
    })
    it('ParseDataCoreTest_116', 0, () => {
      logInfo('ParseDataCoreTest_116 begin');
      const input: number = 1073741825;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual.indexOf('KB') >= 0 || actual.indexOf('MB') >= 0 || actual.indexOf('GB') >= 0).assertTrue();
      expect(actual === '').assertFalse();
      expect(actual.length).assertLarger(2);
      logInfo('ParseDataCoreTest_116 end');
    })
    it('ParseDataCoreTest_117', 0, () => {
      logInfo('ParseDataCoreTest_117 begin');
      const input: number = 5368709120;
      const actual: string = ParseData.parseSizeToString(input);
      expect(actual).assertEqual('5.0 GB');
      expect(actual.length > 0).assertTrue();
      expect(actual.indexOf(' ') > 0).assertTrue();
      logInfo('ParseDataCoreTest_117 end');
    })
    it('ParseDataCoreTest_118', 0, () => {
      logInfo('ParseDataCoreTest_118 begin');
      const input: number = 1048576;
      const actual: number = ParseData.parseSize(input);
      expect(actual).assertEqual(1);
      expect(actual > 0).assertTrue();
      expect(actual * 1024 * 1024).assertEqual(1048576);
      logInfo('ParseDataCoreTest_118 end');
    })
  })
}
