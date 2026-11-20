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
import { formatStorageSize } from '../../../main/ets/model/StorageQuery';
import { logCase, logAssertion } from './StorageTestSupport';

export default function storageFormat01Test(): void {
  describe('StorageFormat01', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_0100
     * @tc.name AppFsSpace_Format_0001
     * @tc.desc bytes=512 precision=0; KiB lower threshold half below
     */
    it('AppFsSpace_Format_0001', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0001';
      const bytes: number = 512;
      const precision: number = 0;
      const expected: string = '512 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_0200
     * @tc.name AppFsSpace_Format_0002
     * @tc.desc bytes=512 precision=1; KiB lower threshold half below
     */
    it('AppFsSpace_Format_0002', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0002';
      const bytes: number = 512;
      const precision: number = 1;
      const expected: string = '512 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_0300
     * @tc.name AppFsSpace_Format_0003
     * @tc.desc bytes=512 precision=2; KiB lower threshold half below
     */
    it('AppFsSpace_Format_0003', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0003';
      const bytes: number = 512;
      const precision: number = 2;
      const expected: string = '512 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_0400
     * @tc.name AppFsSpace_Format_0004
     * @tc.desc bytes=512 precision=3; KiB lower threshold half below
     */
    it('AppFsSpace_Format_0004', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0004';
      const bytes: number = 512;
      const precision: number = 3;
      const expected: string = '512 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_0500
     * @tc.name AppFsSpace_Format_0005
     * @tc.desc bytes=512 precision=default; KiB lower threshold half below
     */
    it('AppFsSpace_Format_0005', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0005';
      const bytes: number = 512;
      const expected: string = '512 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_0600
     * @tc.name AppFsSpace_Format_0006
     * @tc.desc bytes=1023 precision=0; KiB lower threshold one byte below
     */
    it('AppFsSpace_Format_0006', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0006';
      const bytes: number = 1023;
      const precision: number = 0;
      const expected: string = '1023 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_0700
     * @tc.name AppFsSpace_Format_0007
     * @tc.desc bytes=1023 precision=1; KiB lower threshold one byte below
     */
    it('AppFsSpace_Format_0007', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0007';
      const bytes: number = 1023;
      const precision: number = 1;
      const expected: string = '1023 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_0800
     * @tc.name AppFsSpace_Format_0008
     * @tc.desc bytes=1023 precision=2; KiB lower threshold one byte below
     */
    it('AppFsSpace_Format_0008', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0008';
      const bytes: number = 1023;
      const precision: number = 2;
      const expected: string = '1023 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_0900
     * @tc.name AppFsSpace_Format_0009
     * @tc.desc bytes=1023 precision=3; KiB lower threshold one byte below
     */
    it('AppFsSpace_Format_0009', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0009';
      const bytes: number = 1023;
      const precision: number = 3;
      const expected: string = '1023 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1000
     * @tc.name AppFsSpace_Format_0010
     * @tc.desc bytes=1023 precision=default; KiB lower threshold one byte below
     */
    it('AppFsSpace_Format_0010', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0010';
      const bytes: number = 1023;
      const expected: string = '1023 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1100
     * @tc.name AppFsSpace_Format_0011
     * @tc.desc bytes=1024 precision=0; KiB lower threshold exact
     */
    it('AppFsSpace_Format_0011', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0011';
      const bytes: number = 1024;
      const precision: number = 0;
      const expected: string = '1 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1200
     * @tc.name AppFsSpace_Format_0012
     * @tc.desc bytes=1024 precision=1; KiB lower threshold exact
     */
    it('AppFsSpace_Format_0012', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0012';
      const bytes: number = 1024;
      const precision: number = 1;
      const expected: string = '1.0 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1300
     * @tc.name AppFsSpace_Format_0013
     * @tc.desc bytes=1024 precision=2; KiB lower threshold exact
     */
    it('AppFsSpace_Format_0013', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0013';
      const bytes: number = 1024;
      const precision: number = 2;
      const expected: string = '1.00 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1400
     * @tc.name AppFsSpace_Format_0014
     * @tc.desc bytes=1024 precision=3; KiB lower threshold exact
     */
    it('AppFsSpace_Format_0014', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0014';
      const bytes: number = 1024;
      const precision: number = 3;
      const expected: string = '1.000 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1500
     * @tc.name AppFsSpace_Format_0015
     * @tc.desc bytes=1024 precision=default; KiB lower threshold exact
     */
    it('AppFsSpace_Format_0015', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0015';
      const bytes: number = 1024;
      const expected: string = '1.0 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1600
     * @tc.name AppFsSpace_Format_0016
     * @tc.desc bytes=1025 precision=0; KiB lower threshold one byte above
     */
    it('AppFsSpace_Format_0016', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0016';
      const bytes: number = 1025;
      const precision: number = 0;
      const expected: string = '1 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1700
     * @tc.name AppFsSpace_Format_0017
     * @tc.desc bytes=1025 precision=1; KiB lower threshold one byte above
     */
    it('AppFsSpace_Format_0017', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0017';
      const bytes: number = 1025;
      const precision: number = 1;
      const expected: string = '1.0 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1800
     * @tc.name AppFsSpace_Format_0018
     * @tc.desc bytes=1025 precision=2; KiB lower threshold one byte above
     */
    it('AppFsSpace_Format_0018', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0018';
      const bytes: number = 1025;
      const precision: number = 2;
      const expected: string = '1.00 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_1900
     * @tc.name AppFsSpace_Format_0019
     * @tc.desc bytes=1025 precision=3; KiB lower threshold one byte above
     */
    it('AppFsSpace_Format_0019', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0019';
      const bytes: number = 1025;
      const precision: number = 3;
      const expected: string = '1.001 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2000
     * @tc.name AppFsSpace_Format_0020
     * @tc.desc bytes=1025 precision=default; KiB lower threshold one byte above
     */
    it('AppFsSpace_Format_0020', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0020';
      const bytes: number = 1025;
      const expected: string = '1.0 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2100
     * @tc.name AppFsSpace_Format_0021
     * @tc.desc bytes=1536 precision=0; KiB lower threshold half above
     */
    it('AppFsSpace_Format_0021', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0021';
      const bytes: number = 1536;
      const precision: number = 0;
      const expected: string = '2 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2200
     * @tc.name AppFsSpace_Format_0022
     * @tc.desc bytes=1536 precision=1; KiB lower threshold half above
     */
    it('AppFsSpace_Format_0022', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0022';
      const bytes: number = 1536;
      const precision: number = 1;
      const expected: string = '1.5 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2300
     * @tc.name AppFsSpace_Format_0023
     * @tc.desc bytes=1536 precision=2; KiB lower threshold half above
     */
    it('AppFsSpace_Format_0023', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0023';
      const bytes: number = 1536;
      const precision: number = 2;
      const expected: string = '1.50 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2400
     * @tc.name AppFsSpace_Format_0024
     * @tc.desc bytes=1536 precision=3; KiB lower threshold half above
     */
    it('AppFsSpace_Format_0024', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0024';
      const bytes: number = 1536;
      const precision: number = 3;
      const expected: string = '1.500 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2500
     * @tc.name AppFsSpace_Format_0025
     * @tc.desc bytes=1536 precision=default; KiB lower threshold half above
     */
    it('AppFsSpace_Format_0025', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0025';
      const bytes: number = 1536;
      const expected: string = '1.5 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2600
     * @tc.name AppFsSpace_Format_0026
     * @tc.desc bytes=1048064 precision=0; KiB upper threshold half below
     */
    it('AppFsSpace_Format_0026', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0026';
      const bytes: number = 1048064;
      const precision: number = 0;
      const expected: string = '1024 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2700
     * @tc.name AppFsSpace_Format_0027
     * @tc.desc bytes=1048064 precision=1; KiB upper threshold half below
     */
    it('AppFsSpace_Format_0027', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0027';
      const bytes: number = 1048064;
      const precision: number = 1;
      const expected: string = '1023.5 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2800
     * @tc.name AppFsSpace_Format_0028
     * @tc.desc bytes=1048064 precision=2; KiB upper threshold half below
     */
    it('AppFsSpace_Format_0028', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0028';
      const bytes: number = 1048064;
      const precision: number = 2;
      const expected: string = '1023.50 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_2900
     * @tc.name AppFsSpace_Format_0029
     * @tc.desc bytes=1048064 precision=3; KiB upper threshold half below
     */
    it('AppFsSpace_Format_0029', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0029';
      const bytes: number = 1048064;
      const precision: number = 3;
      const expected: string = '1023.500 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3000
     * @tc.name AppFsSpace_Format_0030
     * @tc.desc bytes=1048064 precision=default; KiB upper threshold half below
     */
    it('AppFsSpace_Format_0030', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0030';
      const bytes: number = 1048064;
      const expected: string = '1023.5 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3100
     * @tc.name AppFsSpace_Format_0031
     * @tc.desc bytes=1048575 precision=0; KiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0031', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0031';
      const bytes: number = 1048575;
      const precision: number = 0;
      const expected: string = '1024 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3200
     * @tc.name AppFsSpace_Format_0032
     * @tc.desc bytes=1048575 precision=1; KiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0032', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0032';
      const bytes: number = 1048575;
      const precision: number = 1;
      const expected: string = '1024.0 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3300
     * @tc.name AppFsSpace_Format_0033
     * @tc.desc bytes=1048575 precision=2; KiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0033', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0033';
      const bytes: number = 1048575;
      const precision: number = 2;
      const expected: string = '1024.00 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3400
     * @tc.name AppFsSpace_Format_0034
     * @tc.desc bytes=1048575 precision=3; KiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0034', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0034';
      const bytes: number = 1048575;
      const precision: number = 3;
      const expected: string = '1023.999 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3500
     * @tc.name AppFsSpace_Format_0035
     * @tc.desc bytes=1048575 precision=default; KiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0035', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0035';
      const bytes: number = 1048575;
      const expected: string = '1024.0 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3600
     * @tc.name AppFsSpace_Format_0036
     * @tc.desc bytes=1048576 precision=0; KiB upper threshold exact
     */
    it('AppFsSpace_Format_0036', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0036';
      const bytes: number = 1048576;
      const precision: number = 0;
      const expected: string = '1 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3700
     * @tc.name AppFsSpace_Format_0037
     * @tc.desc bytes=1048576 precision=1; KiB upper threshold exact
     */
    it('AppFsSpace_Format_0037', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0037';
      const bytes: number = 1048576;
      const precision: number = 1;
      const expected: string = '1.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3800
     * @tc.name AppFsSpace_Format_0038
     * @tc.desc bytes=1048576 precision=2; KiB upper threshold exact
     */
    it('AppFsSpace_Format_0038', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0038';
      const bytes: number = 1048576;
      const precision: number = 2;
      const expected: string = '1.00 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_3900
     * @tc.name AppFsSpace_Format_0039
     * @tc.desc bytes=1048576 precision=3; KiB upper threshold exact
     */
    it('AppFsSpace_Format_0039', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0039';
      const bytes: number = 1048576;
      const precision: number = 3;
      const expected: string = '1.000 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4000
     * @tc.name AppFsSpace_Format_0040
     * @tc.desc bytes=1048576 precision=default; KiB upper threshold exact
     */
    it('AppFsSpace_Format_0040', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0040';
      const bytes: number = 1048576;
      const expected: string = '1.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4100
     * @tc.name AppFsSpace_Format_0041
     * @tc.desc bytes=1048577 precision=0; KiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0041', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0041';
      const bytes: number = 1048577;
      const precision: number = 0;
      const expected: string = '1 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4200
     * @tc.name AppFsSpace_Format_0042
     * @tc.desc bytes=1048577 precision=1; KiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0042', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0042';
      const bytes: number = 1048577;
      const precision: number = 1;
      const expected: string = '1.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4300
     * @tc.name AppFsSpace_Format_0043
     * @tc.desc bytes=1048577 precision=2; KiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0043', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0043';
      const bytes: number = 1048577;
      const precision: number = 2;
      const expected: string = '1.00 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4400
     * @tc.name AppFsSpace_Format_0044
     * @tc.desc bytes=1048577 precision=3; KiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0044', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0044';
      const bytes: number = 1048577;
      const precision: number = 3;
      const expected: string = '1.000 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4500
     * @tc.name AppFsSpace_Format_0045
     * @tc.desc bytes=1048577 precision=default; KiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0045', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0045';
      const bytes: number = 1048577;
      const expected: string = '1.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4600
     * @tc.name AppFsSpace_Format_0046
     * @tc.desc bytes=1049088 precision=0; KiB upper threshold half above
     */
    it('AppFsSpace_Format_0046', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0046';
      const bytes: number = 1049088;
      const precision: number = 0;
      const expected: string = '1 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4700
     * @tc.name AppFsSpace_Format_0047
     * @tc.desc bytes=1049088 precision=1; KiB upper threshold half above
     */
    it('AppFsSpace_Format_0047', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0047';
      const bytes: number = 1049088;
      const precision: number = 1;
      const expected: string = '1.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4800
     * @tc.name AppFsSpace_Format_0048
     * @tc.desc bytes=1049088 precision=2; KiB upper threshold half above
     */
    it('AppFsSpace_Format_0048', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0048';
      const bytes: number = 1049088;
      const precision: number = 2;
      const expected: string = '1.00 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_4900
     * @tc.name AppFsSpace_Format_0049
     * @tc.desc bytes=1049088 precision=3; KiB upper threshold half above
     */
    it('AppFsSpace_Format_0049', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0049';
      const bytes: number = 1049088;
      const precision: number = 3;
      const expected: string = '1.000 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5000
     * @tc.name AppFsSpace_Format_0050
     * @tc.desc bytes=1049088 precision=default; KiB upper threshold half above
     */
    it('AppFsSpace_Format_0050', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0050';
      const bytes: number = 1049088;
      const expected: string = '1.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5100
     * @tc.name AppFsSpace_Format_0051
     * @tc.desc bytes=524288 precision=0; MiB lower threshold half below
     */
    it('AppFsSpace_Format_0051', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0051';
      const bytes: number = 524288;
      const precision: number = 0;
      const expected: string = '512 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5200
     * @tc.name AppFsSpace_Format_0052
     * @tc.desc bytes=524288 precision=1; MiB lower threshold half below
     */
    it('AppFsSpace_Format_0052', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0052';
      const bytes: number = 524288;
      const precision: number = 1;
      const expected: string = '512.0 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5300
     * @tc.name AppFsSpace_Format_0053
     * @tc.desc bytes=524288 precision=2; MiB lower threshold half below
     */
    it('AppFsSpace_Format_0053', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0053';
      const bytes: number = 524288;
      const precision: number = 2;
      const expected: string = '512.00 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5400
     * @tc.name AppFsSpace_Format_0054
     * @tc.desc bytes=524288 precision=3; MiB lower threshold half below
     */
    it('AppFsSpace_Format_0054', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0054';
      const bytes: number = 524288;
      const precision: number = 3;
      const expected: string = '512.000 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5500
     * @tc.name AppFsSpace_Format_0055
     * @tc.desc bytes=524288 precision=default; MiB lower threshold half below
     */
    it('AppFsSpace_Format_0055', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0055';
      const bytes: number = 524288;
      const expected: string = '512.0 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5600
     * @tc.name AppFsSpace_Format_0056
     * @tc.desc bytes=1572864 precision=0; MiB lower threshold half above
     */
    it('AppFsSpace_Format_0056', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0056';
      const bytes: number = 1572864;
      const precision: number = 0;
      const expected: string = '2 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5700
     * @tc.name AppFsSpace_Format_0057
     * @tc.desc bytes=1572864 precision=1; MiB lower threshold half above
     */
    it('AppFsSpace_Format_0057', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0057';
      const bytes: number = 1572864;
      const precision: number = 1;
      const expected: string = '1.5 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5800
     * @tc.name AppFsSpace_Format_0058
     * @tc.desc bytes=1572864 precision=2; MiB lower threshold half above
     */
    it('AppFsSpace_Format_0058', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0058';
      const bytes: number = 1572864;
      const precision: number = 2;
      const expected: string = '1.50 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_5900
     * @tc.name AppFsSpace_Format_0059
     * @tc.desc bytes=1572864 precision=3; MiB lower threshold half above
     */
    it('AppFsSpace_Format_0059', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0059';
      const bytes: number = 1572864;
      const precision: number = 3;
      const expected: string = '1.500 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6000
     * @tc.name AppFsSpace_Format_0060
     * @tc.desc bytes=1572864 precision=default; MiB lower threshold half above
     */
    it('AppFsSpace_Format_0060', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0060';
      const bytes: number = 1572864;
      const expected: string = '1.5 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6100
     * @tc.name AppFsSpace_Format_0061
     * @tc.desc bytes=1073217536 precision=0; MiB upper threshold half below
     */
    it('AppFsSpace_Format_0061', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0061';
      const bytes: number = 1073217536;
      const precision: number = 0;
      const expected: string = '1024 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6200
     * @tc.name AppFsSpace_Format_0062
     * @tc.desc bytes=1073217536 precision=1; MiB upper threshold half below
     */
    it('AppFsSpace_Format_0062', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0062';
      const bytes: number = 1073217536;
      const precision: number = 1;
      const expected: string = '1023.5 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6300
     * @tc.name AppFsSpace_Format_0063
     * @tc.desc bytes=1073217536 precision=2; MiB upper threshold half below
     */
    it('AppFsSpace_Format_0063', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0063';
      const bytes: number = 1073217536;
      const precision: number = 2;
      const expected: string = '1023.50 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6400
     * @tc.name AppFsSpace_Format_0064
     * @tc.desc bytes=1073217536 precision=3; MiB upper threshold half below
     */
    it('AppFsSpace_Format_0064', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0064';
      const bytes: number = 1073217536;
      const precision: number = 3;
      const expected: string = '1023.500 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6500
     * @tc.name AppFsSpace_Format_0065
     * @tc.desc bytes=1073217536 precision=default; MiB upper threshold half below
     */
    it('AppFsSpace_Format_0065', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0065';
      const bytes: number = 1073217536;
      const expected: string = '1023.5 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6600
     * @tc.name AppFsSpace_Format_0066
     * @tc.desc bytes=1073741823 precision=0; MiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0066', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0066';
      const bytes: number = 1073741823;
      const precision: number = 0;
      const expected: string = '1024 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6700
     * @tc.name AppFsSpace_Format_0067
     * @tc.desc bytes=1073741823 precision=1; MiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0067', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0067';
      const bytes: number = 1073741823;
      const precision: number = 1;
      const expected: string = '1024.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6800
     * @tc.name AppFsSpace_Format_0068
     * @tc.desc bytes=1073741823 precision=2; MiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0068', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0068';
      const bytes: number = 1073741823;
      const precision: number = 2;
      const expected: string = '1024.00 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_6900
     * @tc.name AppFsSpace_Format_0069
     * @tc.desc bytes=1073741823 precision=3; MiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0069', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0069';
      const bytes: number = 1073741823;
      const precision: number = 3;
      const expected: string = '1024.000 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7000
     * @tc.name AppFsSpace_Format_0070
     * @tc.desc bytes=1073741823 precision=default; MiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0070', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0070';
      const bytes: number = 1073741823;
      const expected: string = '1024.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7100
     * @tc.name AppFsSpace_Format_0071
     * @tc.desc bytes=1073741824 precision=0; MiB upper threshold exact
     */
    it('AppFsSpace_Format_0071', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0071';
      const bytes: number = 1073741824;
      const precision: number = 0;
      const expected: string = '1 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7200
     * @tc.name AppFsSpace_Format_0072
     * @tc.desc bytes=1073741824 precision=1; MiB upper threshold exact
     */
    it('AppFsSpace_Format_0072', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0072';
      const bytes: number = 1073741824;
      const precision: number = 1;
      const expected: string = '1.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7300
     * @tc.name AppFsSpace_Format_0073
     * @tc.desc bytes=1073741824 precision=2; MiB upper threshold exact
     */
    it('AppFsSpace_Format_0073', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0073';
      const bytes: number = 1073741824;
      const precision: number = 2;
      const expected: string = '1.00 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7400
     * @tc.name AppFsSpace_Format_0074
     * @tc.desc bytes=1073741824 precision=3; MiB upper threshold exact
     */
    it('AppFsSpace_Format_0074', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0074';
      const bytes: number = 1073741824;
      const precision: number = 3;
      const expected: string = '1.000 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7500
     * @tc.name AppFsSpace_Format_0075
     * @tc.desc bytes=1073741824 precision=default; MiB upper threshold exact
     */
    it('AppFsSpace_Format_0075', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0075';
      const bytes: number = 1073741824;
      const expected: string = '1.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7600
     * @tc.name AppFsSpace_Format_0076
     * @tc.desc bytes=1073741825 precision=0; MiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0076', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0076';
      const bytes: number = 1073741825;
      const precision: number = 0;
      const expected: string = '1 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7700
     * @tc.name AppFsSpace_Format_0077
     * @tc.desc bytes=1073741825 precision=1; MiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0077', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0077';
      const bytes: number = 1073741825;
      const precision: number = 1;
      const expected: string = '1.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7800
     * @tc.name AppFsSpace_Format_0078
     * @tc.desc bytes=1073741825 precision=2; MiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0078', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0078';
      const bytes: number = 1073741825;
      const precision: number = 2;
      const expected: string = '1.00 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_7900
     * @tc.name AppFsSpace_Format_0079
     * @tc.desc bytes=1073741825 precision=3; MiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0079', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0079';
      const bytes: number = 1073741825;
      const precision: number = 3;
      const expected: string = '1.000 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8000
     * @tc.name AppFsSpace_Format_0080
     * @tc.desc bytes=1073741825 precision=default; MiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0080', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0080';
      const bytes: number = 1073741825;
      const expected: string = '1.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8100
     * @tc.name AppFsSpace_Format_0081
     * @tc.desc bytes=1074266112 precision=0; MiB upper threshold half above
     */
    it('AppFsSpace_Format_0081', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0081';
      const bytes: number = 1074266112;
      const precision: number = 0;
      const expected: string = '1 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8200
     * @tc.name AppFsSpace_Format_0082
     * @tc.desc bytes=1074266112 precision=1; MiB upper threshold half above
     */
    it('AppFsSpace_Format_0082', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0082';
      const bytes: number = 1074266112;
      const precision: number = 1;
      const expected: string = '1.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8300
     * @tc.name AppFsSpace_Format_0083
     * @tc.desc bytes=1074266112 precision=2; MiB upper threshold half above
     */
    it('AppFsSpace_Format_0083', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0083';
      const bytes: number = 1074266112;
      const precision: number = 2;
      const expected: string = '1.00 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8400
     * @tc.name AppFsSpace_Format_0084
     * @tc.desc bytes=1074266112 precision=3; MiB upper threshold half above
     */
    it('AppFsSpace_Format_0084', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0084';
      const bytes: number = 1074266112;
      const precision: number = 3;
      const expected: string = '1.000 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8500
     * @tc.name AppFsSpace_Format_0085
     * @tc.desc bytes=1074266112 precision=default; MiB upper threshold half above
     */
    it('AppFsSpace_Format_0085', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0085';
      const bytes: number = 1074266112;
      const expected: string = '1.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8600
     * @tc.name AppFsSpace_Format_0086
     * @tc.desc bytes=536870912 precision=0; GiB lower threshold half below
     */
    it('AppFsSpace_Format_0086', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0086';
      const bytes: number = 536870912;
      const precision: number = 0;
      const expected: string = '512 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8700
     * @tc.name AppFsSpace_Format_0087
     * @tc.desc bytes=536870912 precision=1; GiB lower threshold half below
     */
    it('AppFsSpace_Format_0087', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0087';
      const bytes: number = 536870912;
      const precision: number = 1;
      const expected: string = '512.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8800
     * @tc.name AppFsSpace_Format_0088
     * @tc.desc bytes=536870912 precision=2; GiB lower threshold half below
     */
    it('AppFsSpace_Format_0088', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0088';
      const bytes: number = 536870912;
      const precision: number = 2;
      const expected: string = '512.00 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_8900
     * @tc.name AppFsSpace_Format_0089
     * @tc.desc bytes=536870912 precision=3; GiB lower threshold half below
     */
    it('AppFsSpace_Format_0089', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0089';
      const bytes: number = 536870912;
      const precision: number = 3;
      const expected: string = '512.000 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9000
     * @tc.name AppFsSpace_Format_0090
     * @tc.desc bytes=536870912 precision=default; GiB lower threshold half below
     */
    it('AppFsSpace_Format_0090', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0090';
      const bytes: number = 536870912;
      const expected: string = '512.0 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9100
     * @tc.name AppFsSpace_Format_0091
     * @tc.desc bytes=1610612736 precision=0; GiB lower threshold half above
     */
    it('AppFsSpace_Format_0091', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0091';
      const bytes: number = 1610612736;
      const precision: number = 0;
      const expected: string = '2 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9200
     * @tc.name AppFsSpace_Format_0092
     * @tc.desc bytes=1610612736 precision=1; GiB lower threshold half above
     */
    it('AppFsSpace_Format_0092', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0092';
      const bytes: number = 1610612736;
      const precision: number = 1;
      const expected: string = '1.5 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9300
     * @tc.name AppFsSpace_Format_0093
     * @tc.desc bytes=1610612736 precision=2; GiB lower threshold half above
     */
    it('AppFsSpace_Format_0093', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0093';
      const bytes: number = 1610612736;
      const precision: number = 2;
      const expected: string = '1.50 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9400
     * @tc.name AppFsSpace_Format_0094
     * @tc.desc bytes=1610612736 precision=3; GiB lower threshold half above
     */
    it('AppFsSpace_Format_0094', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0094';
      const bytes: number = 1610612736;
      const precision: number = 3;
      const expected: string = '1.500 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9500
     * @tc.name AppFsSpace_Format_0095
     * @tc.desc bytes=1610612736 precision=default; GiB lower threshold half above
     */
    it('AppFsSpace_Format_0095', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0095';
      const bytes: number = 1610612736;
      const expected: string = '1.5 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9600
     * @tc.name AppFsSpace_Format_0096
     * @tc.desc bytes=1098974756864 precision=0; GiB upper threshold half below
     */
    it('AppFsSpace_Format_0096', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0096';
      const bytes: number = 1098974756864;
      const precision: number = 0;
      const expected: string = '1024 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9700
     * @tc.name AppFsSpace_Format_0097
     * @tc.desc bytes=1098974756864 precision=1; GiB upper threshold half below
     */
    it('AppFsSpace_Format_0097', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0097';
      const bytes: number = 1098974756864;
      const precision: number = 1;
      const expected: string = '1023.5 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9800
     * @tc.name AppFsSpace_Format_0098
     * @tc.desc bytes=1098974756864 precision=2; GiB upper threshold half below
     */
    it('AppFsSpace_Format_0098', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0098';
      const bytes: number = 1098974756864;
      const precision: number = 2;
      const expected: string = '1023.50 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_9900
     * @tc.name AppFsSpace_Format_0099
     * @tc.desc bytes=1098974756864 precision=3; GiB upper threshold half below
     */
    it('AppFsSpace_Format_0099', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0099';
      const bytes: number = 1098974756864;
      const precision: number = 3;
      const expected: string = '1023.500 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10000
     * @tc.name AppFsSpace_Format_0100
     * @tc.desc bytes=1098974756864 precision=default; GiB upper threshold half below
     */
    it('AppFsSpace_Format_0100', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0100';
      const bytes: number = 1098974756864;
      const expected: string = '1023.5 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
        logAssertion(name, `bytes=${bytes} precision=default formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10100
     * @tc.name AppFsSpace_Format_0101
     * @tc.desc bytes=1099511627775 precision=0; GiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0101', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0101';
      const bytes: number = 1099511627775;
      const precision: number = 0;
      const expected: string = '1024 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10200
     * @tc.name AppFsSpace_Format_0102
     * @tc.desc bytes=1099511627775 precision=1; GiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0102', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0102';
      const bytes: number = 1099511627775;
      const precision: number = 1;
      const expected: string = '1024.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10300
     * @tc.name AppFsSpace_Format_0103
     * @tc.desc bytes=1099511627775 precision=2; GiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0103', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0103';
      const bytes: number = 1099511627775;
      const precision: number = 2;
      const expected: string = '1024.00 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
  });
}
