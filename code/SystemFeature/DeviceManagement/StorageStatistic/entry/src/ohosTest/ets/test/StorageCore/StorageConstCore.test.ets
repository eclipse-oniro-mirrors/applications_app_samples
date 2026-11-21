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
import { StorageConst } from '../../../../main/ets/utils/StorageConst';
const TAG: string = 'StorageConstCore';
const DOMAIN: number = 0xF811;
function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}
export default function storageConstCoreTest(): void {
  describe('StorageConstCoreTest', () => {
    beforeAll(() => {
      logInfo('StorageConstCoreTest beforeAll');
    })
    beforeEach(() => {
      logInfo('StorageConstCoreTest beforeEach');
    })
    afterEach(() => {
      logInfo('StorageConstCoreTest afterEach');
    })
    afterAll(() => {
      logInfo('StorageConstCoreTest afterAll');
    })
    it('StorageConstCoreTest_001', 0, () => {
      logInfo('StorageConstCoreTest_001 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_001 end');
    })
    it('StorageConstCoreTest_002', 0, () => {
      logInfo('StorageConstCoreTest_002 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_002 end');
    })
    it('StorageConstCoreTest_003', 0, () => {
      logInfo('StorageConstCoreTest_003 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_003 end');
    })
    it('StorageConstCoreTest_004', 0, () => {
      logInfo('StorageConstCoreTest_004 begin');
      const mb: number = 4;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(4194304);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_004 end');
    })
    it('StorageConstCoreTest_005', 0, () => {
      logInfo('StorageConstCoreTest_005 begin');
      const gb: number = 5;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(5368709120);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_005 end');
    })
    it('StorageConstCoreTest_006', 0, () => {
      logInfo('StorageConstCoreTest_006 begin');
      const kb: number = 6;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(6144);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_006 end');
    })
    it('StorageConstCoreTest_007', 0, () => {
      logInfo('StorageConstCoreTest_007 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_007 end');
    })
    it('StorageConstCoreTest_008', 0, () => {
      logInfo('StorageConstCoreTest_008 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_008 end');
    })
    it('StorageConstCoreTest_009', 0, () => {
      logInfo('StorageConstCoreTest_009 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_009 end');
    })
    it('StorageConstCoreTest_010', 0, () => {
      logInfo('StorageConstCoreTest_010 begin');
      const mb: number = 1;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_010 end');
    })
    it('StorageConstCoreTest_011', 0, () => {
      logInfo('StorageConstCoreTest_011 begin');
      const gb: number = 1;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_011 end');
    })
    it('StorageConstCoreTest_012', 0, () => {
      logInfo('StorageConstCoreTest_012 begin');
      const kb: number = 1;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_012 end');
    })
    it('StorageConstCoreTest_013', 0, () => {
      logInfo('StorageConstCoreTest_013 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_013 end');
    })
    it('StorageConstCoreTest_014', 0, () => {
      logInfo('StorageConstCoreTest_014 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_014 end');
    })
    it('StorageConstCoreTest_015', 0, () => {
      logInfo('StorageConstCoreTest_015 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_015 end');
    })
    it('StorageConstCoreTest_016', 0, () => {
      logInfo('StorageConstCoreTest_016 begin');
      const mb: number = 7;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(7340032);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_016 end');
    })
    it('StorageConstCoreTest_017', 0, () => {
      logInfo('StorageConstCoreTest_017 begin');
      const gb: number = 2;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(2147483648);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_017 end');
    })
    it('StorageConstCoreTest_018', 0, () => {
      logInfo('StorageConstCoreTest_018 begin');
      const kb: number = 7;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(7168);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_018 end');
    })
    it('StorageConstCoreTest_019', 0, () => {
      logInfo('StorageConstCoreTest_019 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_019 end');
    })
    it('StorageConstCoreTest_020', 0, () => {
      logInfo('StorageConstCoreTest_020 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_020 end');
    })
    it('StorageConstCoreTest_021', 0, () => {
      logInfo('StorageConstCoreTest_021 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_021 end');
    })
    it('StorageConstCoreTest_022', 0, () => {
      logInfo('StorageConstCoreTest_022 begin');
      const mb: number = 4;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(4194304);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_022 end');
    })
    it('StorageConstCoreTest_023', 0, () => {
      logInfo('StorageConstCoreTest_023 begin');
      const gb: number = 3;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(3221225472);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_023 end');
    })
    it('StorageConstCoreTest_024', 0, () => {
      logInfo('StorageConstCoreTest_024 begin');
      const kb: number = 2;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(2048);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_024 end');
    })
    it('StorageConstCoreTest_025', 0, () => {
      logInfo('StorageConstCoreTest_025 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_025 end');
    })
    it('StorageConstCoreTest_026', 0, () => {
      logInfo('StorageConstCoreTest_026 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_026 end');
    })
    it('StorageConstCoreTest_027', 0, () => {
      logInfo('StorageConstCoreTest_027 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_027 end');
    })
    it('StorageConstCoreTest_028', 0, () => {
      logInfo('StorageConstCoreTest_028 begin');
      const mb: number = 1;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_028 end');
    })
    it('StorageConstCoreTest_029', 0, () => {
      logInfo('StorageConstCoreTest_029 begin');
      const gb: number = 4;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(4294967296);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_029 end');
    })
    it('StorageConstCoreTest_030', 0, () => {
      logInfo('StorageConstCoreTest_030 begin');
      const kb: number = 8;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(8192);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_030 end');
    })
    it('StorageConstCoreTest_031', 0, () => {
      logInfo('StorageConstCoreTest_031 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_031 end');
    })
    it('StorageConstCoreTest_032', 0, () => {
      logInfo('StorageConstCoreTest_032 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_032 end');
    })
    it('StorageConstCoreTest_033', 0, () => {
      logInfo('StorageConstCoreTest_033 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_033 end');
    })
    it('StorageConstCoreTest_034', 0, () => {
      logInfo('StorageConstCoreTest_034 begin');
      const mb: number = 7;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(7340032);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_034 end');
    })
    it('StorageConstCoreTest_035', 0, () => {
      logInfo('StorageConstCoreTest_035 begin');
      const gb: number = 5;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(5368709120);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_035 end');
    })
    it('StorageConstCoreTest_036', 0, () => {
      logInfo('StorageConstCoreTest_036 begin');
      const kb: number = 3;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(3072);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_036 end');
    })
    it('StorageConstCoreTest_037', 0, () => {
      logInfo('StorageConstCoreTest_037 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_037 end');
    })
    it('StorageConstCoreTest_038', 0, () => {
      logInfo('StorageConstCoreTest_038 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_038 end');
    })
    it('StorageConstCoreTest_039', 0, () => {
      logInfo('StorageConstCoreTest_039 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_039 end');
    })
    it('StorageConstCoreTest_040', 0, () => {
      logInfo('StorageConstCoreTest_040 begin');
      const mb: number = 4;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(4194304);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_040 end');
    })
    it('StorageConstCoreTest_041', 0, () => {
      logInfo('StorageConstCoreTest_041 begin');
      const gb: number = 1;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_041 end');
    })
    it('StorageConstCoreTest_042', 0, () => {
      logInfo('StorageConstCoreTest_042 begin');
      const kb: number = 9;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(9216);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_042 end');
    })
    it('StorageConstCoreTest_043', 0, () => {
      logInfo('StorageConstCoreTest_043 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_043 end');
    })
    it('StorageConstCoreTest_044', 0, () => {
      logInfo('StorageConstCoreTest_044 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_044 end');
    })
    it('StorageConstCoreTest_045', 0, () => {
      logInfo('StorageConstCoreTest_045 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_045 end');
    })
    it('StorageConstCoreTest_046', 0, () => {
      logInfo('StorageConstCoreTest_046 begin');
      const mb: number = 1;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_046 end');
    })
    it('StorageConstCoreTest_047', 0, () => {
      logInfo('StorageConstCoreTest_047 begin');
      const gb: number = 2;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(2147483648);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_047 end');
    })
    it('StorageConstCoreTest_048', 0, () => {
      logInfo('StorageConstCoreTest_048 begin');
      const kb: number = 4;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(4096);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_048 end');
    })
    it('StorageConstCoreTest_049', 0, () => {
      logInfo('StorageConstCoreTest_049 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_049 end');
    })
    it('StorageConstCoreTest_050', 0, () => {
      logInfo('StorageConstCoreTest_050 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_050 end');
    })
    it('StorageConstCoreTest_051', 0, () => {
      logInfo('StorageConstCoreTest_051 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_051 end');
    })
    it('StorageConstCoreTest_052', 0, () => {
      logInfo('StorageConstCoreTest_052 begin');
      const mb: number = 7;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(7340032);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_052 end');
    })
    it('StorageConstCoreTest_053', 0, () => {
      logInfo('StorageConstCoreTest_053 begin');
      const gb: number = 3;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(3221225472);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_053 end');
    })
    it('StorageConstCoreTest_054', 0, () => {
      logInfo('StorageConstCoreTest_054 begin');
      const kb: number = 10;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(10240);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_054 end');
    })
    it('StorageConstCoreTest_055', 0, () => {
      logInfo('StorageConstCoreTest_055 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_055 end');
    })
    it('StorageConstCoreTest_056', 0, () => {
      logInfo('StorageConstCoreTest_056 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_056 end');
    })
    it('StorageConstCoreTest_057', 0, () => {
      logInfo('StorageConstCoreTest_057 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_057 end');
    })
    it('StorageConstCoreTest_058', 0, () => {
      logInfo('StorageConstCoreTest_058 begin');
      const mb: number = 4;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(4194304);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_058 end');
    })
    it('StorageConstCoreTest_059', 0, () => {
      logInfo('StorageConstCoreTest_059 begin');
      const gb: number = 4;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(4294967296);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_059 end');
    })
    it('StorageConstCoreTest_060', 0, () => {
      logInfo('StorageConstCoreTest_060 begin');
      const kb: number = 5;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(5120);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_060 end');
    })
    it('StorageConstCoreTest_061', 0, () => {
      logInfo('StorageConstCoreTest_061 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_061 end');
    })
    it('StorageConstCoreTest_062', 0, () => {
      logInfo('StorageConstCoreTest_062 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_062 end');
    })
    it('StorageConstCoreTest_063', 0, () => {
      logInfo('StorageConstCoreTest_063 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_063 end');
    })
    it('StorageConstCoreTest_064', 0, () => {
      logInfo('StorageConstCoreTest_064 begin');
      const mb: number = 1;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_064 end');
    })
    it('StorageConstCoreTest_065', 0, () => {
      logInfo('StorageConstCoreTest_065 begin');
      const gb: number = 5;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(5368709120);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_065 end');
    })
    it('StorageConstCoreTest_066', 0, () => {
      logInfo('StorageConstCoreTest_066 begin');
      const kb: number = 11;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(11264);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_066 end');
    })
    it('StorageConstCoreTest_067', 0, () => {
      logInfo('StorageConstCoreTest_067 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_067 end');
    })
    it('StorageConstCoreTest_068', 0, () => {
      logInfo('StorageConstCoreTest_068 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_068 end');
    })
    it('StorageConstCoreTest_069', 0, () => {
      logInfo('StorageConstCoreTest_069 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_069 end');
    })
    it('StorageConstCoreTest_070', 0, () => {
      logInfo('StorageConstCoreTest_070 begin');
      const mb: number = 7;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(7340032);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_070 end');
    })
    it('StorageConstCoreTest_071', 0, () => {
      logInfo('StorageConstCoreTest_071 begin');
      const gb: number = 1;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_071 end');
    })
    it('StorageConstCoreTest_072', 0, () => {
      logInfo('StorageConstCoreTest_072 begin');
      const kb: number = 6;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(6144);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_072 end');
    })
    it('StorageConstCoreTest_073', 0, () => {
      logInfo('StorageConstCoreTest_073 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_073 end');
    })
    it('StorageConstCoreTest_074', 0, () => {
      logInfo('StorageConstCoreTest_074 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_074 end');
    })
    it('StorageConstCoreTest_075', 0, () => {
      logInfo('StorageConstCoreTest_075 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_075 end');
    })
    it('StorageConstCoreTest_076', 0, () => {
      logInfo('StorageConstCoreTest_076 begin');
      const mb: number = 4;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(4194304);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_076 end');
    })
    it('StorageConstCoreTest_077', 0, () => {
      logInfo('StorageConstCoreTest_077 begin');
      const gb: number = 2;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(2147483648);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_077 end');
    })
    it('StorageConstCoreTest_078', 0, () => {
      logInfo('StorageConstCoreTest_078 begin');
      const kb: number = 1;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_078 end');
    })
    it('StorageConstCoreTest_079', 0, () => {
      logInfo('StorageConstCoreTest_079 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_079 end');
    })
    it('StorageConstCoreTest_080', 0, () => {
      logInfo('StorageConstCoreTest_080 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_080 end');
    })
    it('StorageConstCoreTest_081', 0, () => {
      logInfo('StorageConstCoreTest_081 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_081 end');
    })
    it('StorageConstCoreTest_082', 0, () => {
      logInfo('StorageConstCoreTest_082 begin');
      const mb: number = 1;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_082 end');
    })
    it('StorageConstCoreTest_083', 0, () => {
      logInfo('StorageConstCoreTest_083 begin');
      const gb: number = 3;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(3221225472);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_083 end');
    })
    it('StorageConstCoreTest_084', 0, () => {
      logInfo('StorageConstCoreTest_084 begin');
      const kb: number = 7;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(7168);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_084 end');
    })
    it('StorageConstCoreTest_085', 0, () => {
      logInfo('StorageConstCoreTest_085 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_085 end');
    })
    it('StorageConstCoreTest_086', 0, () => {
      logInfo('StorageConstCoreTest_086 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_086 end');
    })
    it('StorageConstCoreTest_087', 0, () => {
      logInfo('StorageConstCoreTest_087 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_087 end');
    })
    it('StorageConstCoreTest_088', 0, () => {
      logInfo('StorageConstCoreTest_088 begin');
      const mb: number = 7;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(7340032);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_088 end');
    })
    it('StorageConstCoreTest_089', 0, () => {
      logInfo('StorageConstCoreTest_089 begin');
      const gb: number = 4;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(4294967296);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_089 end');
    })
    it('StorageConstCoreTest_090', 0, () => {
      logInfo('StorageConstCoreTest_090 begin');
      const kb: number = 2;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(2048);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_090 end');
    })
    it('StorageConstCoreTest_091', 0, () => {
      logInfo('StorageConstCoreTest_091 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_091 end');
    })
    it('StorageConstCoreTest_092', 0, () => {
      logInfo('StorageConstCoreTest_092 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_092 end');
    })
    it('StorageConstCoreTest_093', 0, () => {
      logInfo('StorageConstCoreTest_093 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_093 end');
    })
    it('StorageConstCoreTest_094', 0, () => {
      logInfo('StorageConstCoreTest_094 begin');
      const mb: number = 4;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(4194304);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_094 end');
    })
    it('StorageConstCoreTest_095', 0, () => {
      logInfo('StorageConstCoreTest_095 begin');
      const gb: number = 5;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(5368709120);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_095 end');
    })
    it('StorageConstCoreTest_096', 0, () => {
      logInfo('StorageConstCoreTest_096 begin');
      const kb: number = 8;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(8192);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_096 end');
    })
    it('StorageConstCoreTest_097', 0, () => {
      logInfo('StorageConstCoreTest_097 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_097 end');
    })
    it('StorageConstCoreTest_098', 0, () => {
      logInfo('StorageConstCoreTest_098 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_098 end');
    })
    it('StorageConstCoreTest_099', 0, () => {
      logInfo('StorageConstCoreTest_099 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_099 end');
    })
    it('StorageConstCoreTest_100', 0, () => {
      logInfo('StorageConstCoreTest_100 begin');
      const mb: number = 1;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_100 end');
    })
    it('StorageConstCoreTest_101', 0, () => {
      logInfo('StorageConstCoreTest_101 begin');
      const gb: number = 1;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_101 end');
    })
    it('StorageConstCoreTest_102', 0, () => {
      logInfo('StorageConstCoreTest_102 begin');
      const kb: number = 3;
      expect(kb * StorageConst.KB_MAGNITUDE).assertEqual(3072);
      expect(StorageConst.KB_MAGNITUDE > 0).assertTrue();
      logInfo('StorageConstCoreTest_102 end');
    })
    it('StorageConstCoreTest_103', 0, () => {
      logInfo('StorageConstCoreTest_103 begin');
      expect(StorageConst.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConst.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConst.KB_MAGNITUDE).assertEqual(1024);
      logInfo('StorageConstCoreTest_103 end');
    })
    it('StorageConstCoreTest_104', 0, () => {
      logInfo('StorageConstCoreTest_104 begin');
      expect(StorageConst.GB_SYMBOL).assertEqual('GB');
      expect(StorageConst.MB_SYMBOL).assertEqual('MB');
      expect(StorageConst.KB_SYMBOL).assertEqual('KB');
      expect(StorageConst.BYTE_SYMBOL).assertEqual('B');
      logInfo('StorageConstCoreTest_104 end');
    })
    it('StorageConstCoreTest_105', 0, () => {
      logInfo('StorageConstCoreTest_105 begin');
      expect(StorageConst.GB_MAGNITUDE / StorageConst.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.MB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConst.GB_MAGNITUDE / StorageConst.KB_MAGNITUDE).assertEqual(1048576);
      logInfo('StorageConstCoreTest_105 end');
    })
    it('StorageConstCoreTest_106', 0, () => {
      logInfo('StorageConstCoreTest_106 begin');
      const mb: number = 7;
      expect(mb * StorageConst.MB_MAGNITUDE).assertEqual(7340032);
      expect(StorageConst.MB_MAGNITUDE > StorageConst.KB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_106 end');
    })
    it('StorageConstCoreTest_107', 0, () => {
      logInfo('StorageConstCoreTest_107 begin');
      const gb: number = 2;
      expect(gb * StorageConst.GB_MAGNITUDE).assertEqual(2147483648);
      expect(StorageConst.GB_MAGNITUDE > StorageConst.MB_MAGNITUDE).assertTrue();
      logInfo('StorageConstCoreTest_107 end');
    })
  })
}
