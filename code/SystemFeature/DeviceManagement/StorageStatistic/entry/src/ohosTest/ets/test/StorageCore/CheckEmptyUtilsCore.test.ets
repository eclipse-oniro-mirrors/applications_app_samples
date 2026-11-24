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
import CheckEmptyUtils from '../../../../main/ets/utils/CheckEmptyUtils';
const TAG: string = 'CheckEmptyUtilsCore';
const DOMAIN: number = 0xF811;
function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}
export default function checkEmptyUtilsCoreTest(): void {
  describe('CheckEmptyUtilsCoreTest', () => {
    beforeAll(() => {
      logInfo('CheckEmptyUtilsCoreTest beforeAll');
    })
    beforeEach(() => {
      logInfo('CheckEmptyUtilsCoreTest beforeEach');
    })
    afterEach(() => {
      logInfo('CheckEmptyUtilsCoreTest afterEach');
    })
    afterAll(() => {
      logInfo('CheckEmptyUtilsCoreTest afterAll');
    })
    it('CheckEmptyUtilsCoreTest_001', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_001 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_001 end');
    })
    it('CheckEmptyUtilsCoreTest_002', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_002 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(2);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_002 end');
    })
    it('CheckEmptyUtilsCoreTest_003', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_003 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_003 end');
    })
    it('CheckEmptyUtilsCoreTest_004', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_004 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_004 end');
    })
    it('CheckEmptyUtilsCoreTest_005', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_005 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_005 end');
    })
    it('CheckEmptyUtilsCoreTest_006', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_006 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_006 end');
    })
    it('CheckEmptyUtilsCoreTest_007', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_007 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(7);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_007 end');
    })
    it('CheckEmptyUtilsCoreTest_008', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_008 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_008 end');
    })
    it('CheckEmptyUtilsCoreTest_009', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_009 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_009 end');
    })
    it('CheckEmptyUtilsCoreTest_010', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_010 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_010 end');
    })
    it('CheckEmptyUtilsCoreTest_011', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_011 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_011 end');
    })
    it('CheckEmptyUtilsCoreTest_012', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_012 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(12);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_012 end');
    })
    it('CheckEmptyUtilsCoreTest_013', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_013 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_013 end');
    })
    it('CheckEmptyUtilsCoreTest_014', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_014 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_014 end');
    })
    it('CheckEmptyUtilsCoreTest_015', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_015 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_015 end');
    })
    it('CheckEmptyUtilsCoreTest_016', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_016 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_016 end');
    })
    it('CheckEmptyUtilsCoreTest_017', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_017 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(17);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_017 end');
    })
    it('CheckEmptyUtilsCoreTest_018', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_018 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_018 end');
    })
    it('CheckEmptyUtilsCoreTest_019', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_019 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_019 end');
    })
    it('CheckEmptyUtilsCoreTest_020', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_020 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_020 end');
    })
    it('CheckEmptyUtilsCoreTest_021', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_021 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_021 end');
    })
    it('CheckEmptyUtilsCoreTest_022', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_022 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(22);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_022 end');
    })
    it('CheckEmptyUtilsCoreTest_023', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_023 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_023 end');
    })
    it('CheckEmptyUtilsCoreTest_024', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_024 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_024 end');
    })
    it('CheckEmptyUtilsCoreTest_025', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_025 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_025 end');
    })
    it('CheckEmptyUtilsCoreTest_026', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_026 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_026 end');
    })
    it('CheckEmptyUtilsCoreTest_027', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_027 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(27);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_027 end');
    })
    it('CheckEmptyUtilsCoreTest_028', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_028 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_028 end');
    })
    it('CheckEmptyUtilsCoreTest_029', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_029 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_029 end');
    })
    it('CheckEmptyUtilsCoreTest_030', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_030 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_030 end');
    })
    it('CheckEmptyUtilsCoreTest_031', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_031 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_031 end');
    })
    it('CheckEmptyUtilsCoreTest_032', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_032 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(32);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_032 end');
    })
    it('CheckEmptyUtilsCoreTest_033', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_033 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_033 end');
    })
    it('CheckEmptyUtilsCoreTest_034', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_034 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_034 end');
    })
    it('CheckEmptyUtilsCoreTest_035', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_035 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_035 end');
    })
    it('CheckEmptyUtilsCoreTest_036', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_036 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_036 end');
    })
    it('CheckEmptyUtilsCoreTest_037', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_037 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(37);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_037 end');
    })
    it('CheckEmptyUtilsCoreTest_038', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_038 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_038 end');
    })
    it('CheckEmptyUtilsCoreTest_039', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_039 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_039 end');
    })
    it('CheckEmptyUtilsCoreTest_040', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_040 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_040 end');
    })
    it('CheckEmptyUtilsCoreTest_041', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_041 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_041 end');
    })
    it('CheckEmptyUtilsCoreTest_042', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_042 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(42);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_042 end');
    })
    it('CheckEmptyUtilsCoreTest_043', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_043 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_043 end');
    })
    it('CheckEmptyUtilsCoreTest_044', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_044 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_044 end');
    })
    it('CheckEmptyUtilsCoreTest_045', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_045 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_045 end');
    })
    it('CheckEmptyUtilsCoreTest_046', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_046 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_046 end');
    })
    it('CheckEmptyUtilsCoreTest_047', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_047 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(47);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_047 end');
    })
    it('CheckEmptyUtilsCoreTest_048', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_048 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_048 end');
    })
    it('CheckEmptyUtilsCoreTest_049', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_049 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_049 end');
    })
    it('CheckEmptyUtilsCoreTest_050', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_050 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_050 end');
    })
    it('CheckEmptyUtilsCoreTest_051', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_051 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_051 end');
    })
    it('CheckEmptyUtilsCoreTest_052', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_052 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(52);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_052 end');
    })
    it('CheckEmptyUtilsCoreTest_053', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_053 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_053 end');
    })
    it('CheckEmptyUtilsCoreTest_054', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_054 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_054 end');
    })
    it('CheckEmptyUtilsCoreTest_055', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_055 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_055 end');
    })
    it('CheckEmptyUtilsCoreTest_056', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_056 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_056 end');
    })
    it('CheckEmptyUtilsCoreTest_057', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_057 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(57);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_057 end');
    })
    it('CheckEmptyUtilsCoreTest_058', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_058 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_058 end');
    })
    it('CheckEmptyUtilsCoreTest_059', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_059 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_059 end');
    })
    it('CheckEmptyUtilsCoreTest_060', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_060 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_060 end');
    })
    it('CheckEmptyUtilsCoreTest_061', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_061 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_061 end');
    })
    it('CheckEmptyUtilsCoreTest_062', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_062 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(62);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_062 end');
    })
    it('CheckEmptyUtilsCoreTest_063', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_063 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_063 end');
    })
    it('CheckEmptyUtilsCoreTest_064', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_064 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_064 end');
    })
    it('CheckEmptyUtilsCoreTest_065', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_065 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_065 end');
    })
    it('CheckEmptyUtilsCoreTest_066', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_066 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_066 end');
    })
    it('CheckEmptyUtilsCoreTest_067', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_067 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(67);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_067 end');
    })
    it('CheckEmptyUtilsCoreTest_068', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_068 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_068 end');
    })
    it('CheckEmptyUtilsCoreTest_069', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_069 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_069 end');
    })
    it('CheckEmptyUtilsCoreTest_070', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_070 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_070 end');
    })
    it('CheckEmptyUtilsCoreTest_071', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_071 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_071 end');
    })
    it('CheckEmptyUtilsCoreTest_072', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_072 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(72);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_072 end');
    })
    it('CheckEmptyUtilsCoreTest_073', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_073 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_073 end');
    })
    it('CheckEmptyUtilsCoreTest_074', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_074 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_074 end');
    })
    it('CheckEmptyUtilsCoreTest_075', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_075 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_075 end');
    })
    it('CheckEmptyUtilsCoreTest_076', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_076 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_076 end');
    })
    it('CheckEmptyUtilsCoreTest_077', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_077 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(77);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_077 end');
    })
    it('CheckEmptyUtilsCoreTest_078', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_078 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_078 end');
    })
    it('CheckEmptyUtilsCoreTest_079', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_079 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_079 end');
    })
    it('CheckEmptyUtilsCoreTest_080', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_080 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_080 end');
    })
    it('CheckEmptyUtilsCoreTest_081', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_081 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_081 end');
    })
    it('CheckEmptyUtilsCoreTest_082', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_082 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(82);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_082 end');
    })
    it('CheckEmptyUtilsCoreTest_083', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_083 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_083 end');
    })
    it('CheckEmptyUtilsCoreTest_084', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_084 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_084 end');
    })
    it('CheckEmptyUtilsCoreTest_085', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_085 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_085 end');
    })
    it('CheckEmptyUtilsCoreTest_086', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_086 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_086 end');
    })
    it('CheckEmptyUtilsCoreTest_087', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_087 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(87);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_087 end');
    })
    it('CheckEmptyUtilsCoreTest_088', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_088 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_088 end');
    })
    it('CheckEmptyUtilsCoreTest_089', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_089 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_089 end');
    })
    it('CheckEmptyUtilsCoreTest_090', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_090 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_090 end');
    })
    it('CheckEmptyUtilsCoreTest_091', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_091 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_091 end');
    })
    it('CheckEmptyUtilsCoreTest_092', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_092 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(92);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_092 end');
    })
    it('CheckEmptyUtilsCoreTest_093', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_093 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_093 end');
    })
    it('CheckEmptyUtilsCoreTest_094', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_094 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_094 end');
    })
    it('CheckEmptyUtilsCoreTest_095', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_095 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_095 end');
    })
    it('CheckEmptyUtilsCoreTest_096', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_096 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_096 end');
    })
    it('CheckEmptyUtilsCoreTest_097', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_097 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(97);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_097 end');
    })
    it('CheckEmptyUtilsCoreTest_098', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_098 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_098 end');
    })
    it('CheckEmptyUtilsCoreTest_099', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_099 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_099 end');
    })
    it('CheckEmptyUtilsCoreTest_100', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_100 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_100 end');
    })
    it('CheckEmptyUtilsCoreTest_101', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_101 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_101 end');
    })
    it('CheckEmptyUtilsCoreTest_102', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_102 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(102);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_102 end');
    })
    it('CheckEmptyUtilsCoreTest_103', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_103 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_103 end');
    })
    it('CheckEmptyUtilsCoreTest_104', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_104 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_104 end');
    })
    it('CheckEmptyUtilsCoreTest_105', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_105 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_105 end');
    })
    it('CheckEmptyUtilsCoreTest_106', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_106 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_106 end');
    })
    it('CheckEmptyUtilsCoreTest_107', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_107 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(107);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_107 end');
    })
    it('CheckEmptyUtilsCoreTest_108', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_108 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_108 end');
    })
    it('CheckEmptyUtilsCoreTest_109', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_109 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_109 end');
    })
    it('CheckEmptyUtilsCoreTest_110', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_110 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_110 end');
    })
    it('CheckEmptyUtilsCoreTest_111', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_111 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_111 end');
    })
    it('CheckEmptyUtilsCoreTest_112', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_112 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(112);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_112 end');
    })
    it('CheckEmptyUtilsCoreTest_113', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_113 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_113 end');
    })
    it('CheckEmptyUtilsCoreTest_114', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_114 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_114 end');
    })
    it('CheckEmptyUtilsCoreTest_115', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_115 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_115 end');
    })
    it('CheckEmptyUtilsCoreTest_116', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_116 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('storage')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_116 end');
    })
    it('CheckEmptyUtilsCoreTest_117', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_117 begin');
      const emptyList: number[] = [];
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertTrue();
      emptyList.push(117);
      expect(CheckEmptyUtils.isEmptyArr<number>(emptyList)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_117 end');
    })
    it('CheckEmptyUtilsCoreTest_118', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_118 begin');
      const emptyNames: string[] = [];
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertTrue();
      emptyNames.push('Application');
      expect(CheckEmptyUtils.isEmptyArr<string>(emptyNames)).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_118 end');
    })
    it('CheckEmptyUtilsCoreTest_119', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_119 begin');
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty('Audio')).assertFalse();
      logInfo('CheckEmptyUtilsCoreTest_119 end');
    })
    it('CheckEmptyUtilsCoreTest_120', 0, () => {
      logInfo('CheckEmptyUtilsCoreTest_120 begin');
      expect(CheckEmptyUtils.checkStrIsEmpty('  ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' Video ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      logInfo('CheckEmptyUtilsCoreTest_120 end');
    })
  })
}
