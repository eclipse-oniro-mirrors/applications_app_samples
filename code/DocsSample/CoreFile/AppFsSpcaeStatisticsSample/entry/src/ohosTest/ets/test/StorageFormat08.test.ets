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

export default function storageFormat08Test(): void {
  describe('StorageFormat08', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_1700
     * @tc.name AppFsSpace_Format_0722
     * @tc.desc bytes=255 precision=1; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0722', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0722';
      const bytes: number = 255;
      const precision: number = 1;
      const expected: string = '255 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_1800
     * @tc.name AppFsSpace_Format_0723
     * @tc.desc bytes=255 precision=2; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0723', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0723';
      const bytes: number = 255;
      const precision: number = 2;
      const expected: string = '255 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_1900
     * @tc.name AppFsSpace_Format_0724
     * @tc.desc bytes=255 precision=3; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0724', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0724';
      const bytes: number = 255;
      const precision: number = 3;
      const expected: string = '255 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2000
     * @tc.name AppFsSpace_Format_0725
     * @tc.desc bytes=255 precision=default; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0725', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0725';
      const bytes: number = 255;
      const expected: string = '255 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2100
     * @tc.name AppFsSpace_Format_0726
     * @tc.desc bytes=511 precision=0; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0726', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0726';
      const bytes: number = 511;
      const precision: number = 0;
      const expected: string = '511 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2200
     * @tc.name AppFsSpace_Format_0727
     * @tc.desc bytes=511 precision=1; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0727', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0727';
      const bytes: number = 511;
      const precision: number = 1;
      const expected: string = '511 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2300
     * @tc.name AppFsSpace_Format_0728
     * @tc.desc bytes=511 precision=2; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0728', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0728';
      const bytes: number = 511;
      const precision: number = 2;
      const expected: string = '511 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2400
     * @tc.name AppFsSpace_Format_0729
     * @tc.desc bytes=511 precision=3; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0729', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0729';
      const bytes: number = 511;
      const precision: number = 3;
      const expected: string = '511 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2500
     * @tc.name AppFsSpace_Format_0730
     * @tc.desc bytes=511 precision=default; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0730', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0730';
      const bytes: number = 511;
      const expected: string = '511 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2600
     * @tc.name AppFsSpace_Format_0731
     * @tc.desc bytes=513 precision=0; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0731', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0731';
      const bytes: number = 513;
      const precision: number = 0;
      const expected: string = '513 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2700
     * @tc.name AppFsSpace_Format_0732
     * @tc.desc bytes=513 precision=1; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0732', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0732';
      const bytes: number = 513;
      const precision: number = 1;
      const expected: string = '513 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2800
     * @tc.name AppFsSpace_Format_0733
     * @tc.desc bytes=513 precision=2; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0733', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0733';
      const bytes: number = 513;
      const precision: number = 2;
      const expected: string = '513 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_2900
     * @tc.name AppFsSpace_Format_0734
     * @tc.desc bytes=513 precision=3; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0734', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0734';
      const bytes: number = 513;
      const precision: number = 3;
      const expected: string = '513 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3000
     * @tc.name AppFsSpace_Format_0735
     * @tc.desc bytes=513 precision=default; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0735', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0735';
      const bytes: number = 513;
      const expected: string = '513 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3100
     * @tc.name AppFsSpace_Format_0736
     * @tc.desc bytes=767 precision=0; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0736', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0736';
      const bytes: number = 767;
      const precision: number = 0;
      const expected: string = '767 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3200
     * @tc.name AppFsSpace_Format_0737
     * @tc.desc bytes=767 precision=1; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0737', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0737';
      const bytes: number = 767;
      const precision: number = 1;
      const expected: string = '767 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3300
     * @tc.name AppFsSpace_Format_0738
     * @tc.desc bytes=767 precision=2; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0738', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0738';
      const bytes: number = 767;
      const precision: number = 2;
      const expected: string = '767 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3400
     * @tc.name AppFsSpace_Format_0739
     * @tc.desc bytes=767 precision=3; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0739', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0739';
      const bytes: number = 767;
      const precision: number = 3;
      const expected: string = '767 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3500
     * @tc.name AppFsSpace_Format_0740
     * @tc.desc bytes=767 precision=default; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0740', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0740';
      const bytes: number = 767;
      const expected: string = '767 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3600
     * @tc.name AppFsSpace_Format_0741
     * @tc.desc bytes=1022 precision=0; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0741', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0741';
      const bytes: number = 1022;
      const precision: number = 0;
      const expected: string = '1022 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3700
     * @tc.name AppFsSpace_Format_0742
     * @tc.desc bytes=1022 precision=1; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0742', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0742';
      const bytes: number = 1022;
      const precision: number = 1;
      const expected: string = '1022 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3800
     * @tc.name AppFsSpace_Format_0743
     * @tc.desc bytes=1022 precision=2; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0743', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0743';
      const bytes: number = 1022;
      const precision: number = 2;
      const expected: string = '1022 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_3900
     * @tc.name AppFsSpace_Format_0744
     * @tc.desc bytes=1022 precision=3; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0744', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0744';
      const bytes: number = 1022;
      const precision: number = 3;
      const expected: string = '1022 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_4000
     * @tc.name AppFsSpace_Format_0745
     * @tc.desc bytes=1022 precision=default; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0745', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0745';
      const bytes: number = 1022;
      const expected: string = '1022 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_0100
     * @tc.name AppFsSpace_Format_0746
     * @tc.desc bytes=9007199254740991 precision=0; safe maximum minus 0; retain PiB before rounding
     */
    it('AppFsSpace_Format_0746', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0746';
      const bytes: number = 9007199254740991;
      const precision: number = 0;
      const expected: string = '8 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_0200
     * @tc.name AppFsSpace_Format_0747
     * @tc.desc bytes=9007199254740991 precision=1; safe maximum minus 0; retain PiB before rounding
     */
    it('AppFsSpace_Format_0747', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0747';
      const bytes: number = 9007199254740991;
      const precision: number = 1;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_0300
     * @tc.name AppFsSpace_Format_0748
     * @tc.desc bytes=9007199254740991 precision=2; safe maximum minus 0; retain PiB before rounding
     */
    it('AppFsSpace_Format_0748', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0748';
      const bytes: number = 9007199254740991;
      const precision: number = 2;
      const expected: string = '8.00 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_0400
     * @tc.name AppFsSpace_Format_0749
     * @tc.desc bytes=9007199254740991 precision=3; safe maximum minus 0; retain PiB before rounding
     */
    it('AppFsSpace_Format_0749', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0749';
      const bytes: number = 9007199254740991;
      const precision: number = 3;
      const expected: string = '8.000 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_0500
     * @tc.name AppFsSpace_Format_0750
     * @tc.desc bytes=9007199254740991 precision=default; safe maximum minus 0; retain PiB before rounding
     */
    it('AppFsSpace_Format_0750', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0750';
      const bytes: number = 9007199254740991;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_0600
     * @tc.name AppFsSpace_Format_0751
     * @tc.desc bytes=9007199254740990 precision=0; safe maximum minus 1; retain PiB before rounding
     */
    it('AppFsSpace_Format_0751', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0751';
      const bytes: number = 9007199254740990;
      const precision: number = 0;
      const expected: string = '8 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_0700
     * @tc.name AppFsSpace_Format_0752
     * @tc.desc bytes=9007199254740990 precision=1; safe maximum minus 1; retain PiB before rounding
     */
    it('AppFsSpace_Format_0752', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0752';
      const bytes: number = 9007199254740990;
      const precision: number = 1;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_0800
     * @tc.name AppFsSpace_Format_0753
     * @tc.desc bytes=9007199254740990 precision=2; safe maximum minus 1; retain PiB before rounding
     */
    it('AppFsSpace_Format_0753', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0753';
      const bytes: number = 9007199254740990;
      const precision: number = 2;
      const expected: string = '8.00 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_0900
     * @tc.name AppFsSpace_Format_0754
     * @tc.desc bytes=9007199254740990 precision=3; safe maximum minus 1; retain PiB before rounding
     */
    it('AppFsSpace_Format_0754', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0754';
      const bytes: number = 9007199254740990;
      const precision: number = 3;
      const expected: string = '8.000 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1000
     * @tc.name AppFsSpace_Format_0755
     * @tc.desc bytes=9007199254740990 precision=default; safe maximum minus 1; retain PiB before rounding
     */
    it('AppFsSpace_Format_0755', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0755';
      const bytes: number = 9007199254740990;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1100
     * @tc.name AppFsSpace_Format_0756
     * @tc.desc bytes=9007199254740480 precision=0; safe maximum minus 511; retain PiB before rounding
     */
    it('AppFsSpace_Format_0756', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0756';
      const bytes: number = 9007199254740480;
      const precision: number = 0;
      const expected: string = '8 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1200
     * @tc.name AppFsSpace_Format_0757
     * @tc.desc bytes=9007199254740480 precision=1; safe maximum minus 511; retain PiB before rounding
     */
    it('AppFsSpace_Format_0757', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0757';
      const bytes: number = 9007199254740480;
      const precision: number = 1;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1300
     * @tc.name AppFsSpace_Format_0758
     * @tc.desc bytes=9007199254740480 precision=2; safe maximum minus 511; retain PiB before rounding
     */
    it('AppFsSpace_Format_0758', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0758';
      const bytes: number = 9007199254740480;
      const precision: number = 2;
      const expected: string = '8.00 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1400
     * @tc.name AppFsSpace_Format_0759
     * @tc.desc bytes=9007199254740480 precision=3; safe maximum minus 511; retain PiB before rounding
     */
    it('AppFsSpace_Format_0759', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0759';
      const bytes: number = 9007199254740480;
      const precision: number = 3;
      const expected: string = '8.000 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1500
     * @tc.name AppFsSpace_Format_0760
     * @tc.desc bytes=9007199254740480 precision=default; safe maximum minus 511; retain PiB before rounding
     */
    it('AppFsSpace_Format_0760', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0760';
      const bytes: number = 9007199254740480;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1600
     * @tc.name AppFsSpace_Format_0761
     * @tc.desc bytes=9007199254740479 precision=0; safe maximum minus 512; retain PiB before rounding
     */
    it('AppFsSpace_Format_0761', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0761';
      const bytes: number = 9007199254740479;
      const precision: number = 0;
      const expected: string = '8 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1700
     * @tc.name AppFsSpace_Format_0762
     * @tc.desc bytes=9007199254740479 precision=1; safe maximum minus 512; retain PiB before rounding
     */
    it('AppFsSpace_Format_0762', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0762';
      const bytes: number = 9007199254740479;
      const precision: number = 1;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1800
     * @tc.name AppFsSpace_Format_0763
     * @tc.desc bytes=9007199254740479 precision=2; safe maximum minus 512; retain PiB before rounding
     */
    it('AppFsSpace_Format_0763', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0763';
      const bytes: number = 9007199254740479;
      const precision: number = 2;
      const expected: string = '8.00 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_1900
     * @tc.name AppFsSpace_Format_0764
     * @tc.desc bytes=9007199254740479 precision=3; safe maximum minus 512; retain PiB before rounding
     */
    it('AppFsSpace_Format_0764', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0764';
      const bytes: number = 9007199254740479;
      const precision: number = 3;
      const expected: string = '8.000 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2000
     * @tc.name AppFsSpace_Format_0765
     * @tc.desc bytes=9007199254740479 precision=default; safe maximum minus 512; retain PiB before rounding
     */
    it('AppFsSpace_Format_0765', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0765';
      const bytes: number = 9007199254740479;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2100
     * @tc.name AppFsSpace_Format_0766
     * @tc.desc bytes=9007199254740478 precision=0; safe maximum minus 513; retain PiB before rounding
     */
    it('AppFsSpace_Format_0766', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0766';
      const bytes: number = 9007199254740478;
      const precision: number = 0;
      const expected: string = '8 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2200
     * @tc.name AppFsSpace_Format_0767
     * @tc.desc bytes=9007199254740478 precision=1; safe maximum minus 513; retain PiB before rounding
     */
    it('AppFsSpace_Format_0767', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0767';
      const bytes: number = 9007199254740478;
      const precision: number = 1;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2300
     * @tc.name AppFsSpace_Format_0768
     * @tc.desc bytes=9007199254740478 precision=2; safe maximum minus 513; retain PiB before rounding
     */
    it('AppFsSpace_Format_0768', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0768';
      const bytes: number = 9007199254740478;
      const precision: number = 2;
      const expected: string = '8.00 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2400
     * @tc.name AppFsSpace_Format_0769
     * @tc.desc bytes=9007199254740478 precision=3; safe maximum minus 513; retain PiB before rounding
     */
    it('AppFsSpace_Format_0769', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0769';
      const bytes: number = 9007199254740478;
      const precision: number = 3;
      const expected: string = '8.000 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2500
     * @tc.name AppFsSpace_Format_0770
     * @tc.desc bytes=9007199254740478 precision=default; safe maximum minus 513; retain PiB before rounding
     */
    it('AppFsSpace_Format_0770', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0770';
      const bytes: number = 9007199254740478;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2600
     * @tc.name AppFsSpace_Format_0771
     * @tc.desc bytes=9007199254739968 precision=0; safe maximum minus 1023; retain PiB before rounding
     */
    it('AppFsSpace_Format_0771', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0771';
      const bytes: number = 9007199254739968;
      const precision: number = 0;
      const expected: string = '8 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2700
     * @tc.name AppFsSpace_Format_0772
     * @tc.desc bytes=9007199254739968 precision=1; safe maximum minus 1023; retain PiB before rounding
     */
    it('AppFsSpace_Format_0772', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0772';
      const bytes: number = 9007199254739968;
      const precision: number = 1;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2800
     * @tc.name AppFsSpace_Format_0773
     * @tc.desc bytes=9007199254739968 precision=2; safe maximum minus 1023; retain PiB before rounding
     */
    it('AppFsSpace_Format_0773', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0773';
      const bytes: number = 9007199254739968;
      const precision: number = 2;
      const expected: string = '8.00 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_2900
     * @tc.name AppFsSpace_Format_0774
     * @tc.desc bytes=9007199254739968 precision=3; safe maximum minus 1023; retain PiB before rounding
     */
    it('AppFsSpace_Format_0774', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0774';
      const bytes: number = 9007199254739968;
      const precision: number = 3;
      const expected: string = '8.000 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3000
     * @tc.name AppFsSpace_Format_0775
     * @tc.desc bytes=9007199254739968 precision=default; safe maximum minus 1023; retain PiB before rounding
     */
    it('AppFsSpace_Format_0775', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0775';
      const bytes: number = 9007199254739968;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3100
     * @tc.name AppFsSpace_Format_0776
     * @tc.desc bytes=8444249301319678 precision=0; safe upper half-unit boundary offset -1; exact rounding
     */
    it('AppFsSpace_Format_0776', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0776';
      const bytes: number = 8444249301319678;
      const precision: number = 0;
      const expected: string = '7 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3200
     * @tc.name AppFsSpace_Format_0777
     * @tc.desc bytes=8444249301319678 precision=1; safe upper half-unit boundary offset -1; exact rounding
     */
    it('AppFsSpace_Format_0777', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0777';
      const bytes: number = 8444249301319678;
      const precision: number = 1;
      const expected: string = '7.5 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3300
     * @tc.name AppFsSpace_Format_0778
     * @tc.desc bytes=8444249301319678 precision=2; safe upper half-unit boundary offset -1; exact rounding
     */
    it('AppFsSpace_Format_0778', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0778';
      const bytes: number = 8444249301319678;
      const precision: number = 2;
      const expected: string = '7.50 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3400
     * @tc.name AppFsSpace_Format_0779
     * @tc.desc bytes=8444249301319678 precision=3; safe upper half-unit boundary offset -1; exact rounding
     */
    it('AppFsSpace_Format_0779', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0779';
      const bytes: number = 8444249301319678;
      const precision: number = 3;
      const expected: string = '7.500 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3500
     * @tc.name AppFsSpace_Format_0780
     * @tc.desc bytes=8444249301319678 precision=default; safe upper half-unit boundary offset -1; exact rounding
     */
    it('AppFsSpace_Format_0780', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0780';
      const bytes: number = 8444249301319678;
      const expected: string = '7.5 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3600
     * @tc.name AppFsSpace_Format_0781
     * @tc.desc bytes=8444249301319679 precision=0; safe upper half-unit boundary offset 0; exact rounding
     */
    it('AppFsSpace_Format_0781', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0781';
      const bytes: number = 8444249301319679;
      const precision: number = 0;
      const expected: string = '7 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3700
     * @tc.name AppFsSpace_Format_0782
     * @tc.desc bytes=8444249301319679 precision=1; safe upper half-unit boundary offset 0; exact rounding
     */
    it('AppFsSpace_Format_0782', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0782';
      const bytes: number = 8444249301319679;
      const precision: number = 1;
      const expected: string = '7.5 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3800
     * @tc.name AppFsSpace_Format_0783
     * @tc.desc bytes=8444249301319679 precision=2; safe upper half-unit boundary offset 0; exact rounding
     */
    it('AppFsSpace_Format_0783', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0783';
      const bytes: number = 8444249301319679;
      const precision: number = 2;
      const expected: string = '7.50 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_3900
     * @tc.name AppFsSpace_Format_0784
     * @tc.desc bytes=8444249301319679 precision=3; safe upper half-unit boundary offset 0; exact rounding
     */
    it('AppFsSpace_Format_0784', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0784';
      const bytes: number = 8444249301319679;
      const precision: number = 3;
      const expected: string = '7.500 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_4000
     * @tc.name AppFsSpace_Format_0785
     * @tc.desc bytes=8444249301319679 precision=default; safe upper half-unit boundary offset 0; exact rounding
     */
    it('AppFsSpace_Format_0785', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0785';
      const bytes: number = 8444249301319679;
      const expected: string = '7.5 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_4100
     * @tc.name AppFsSpace_Format_0786
     * @tc.desc bytes=8444249301319680 precision=0; safe upper half-unit boundary offset 1; exact rounding
     */
    it('AppFsSpace_Format_0786', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0786';
      const bytes: number = 8444249301319680;
      const precision: number = 0;
      const expected: string = '8 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_4200
     * @tc.name AppFsSpace_Format_0787
     * @tc.desc bytes=8444249301319680 precision=1; safe upper half-unit boundary offset 1; exact rounding
     */
    it('AppFsSpace_Format_0787', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0787';
      const bytes: number = 8444249301319680;
      const precision: number = 1;
      const expected: string = '7.5 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_4300
     * @tc.name AppFsSpace_Format_0788
     * @tc.desc bytes=8444249301319680 precision=2; safe upper half-unit boundary offset 1; exact rounding
     */
    it('AppFsSpace_Format_0788', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0788';
      const bytes: number = 8444249301319680;
      const precision: number = 2;
      const expected: string = '7.50 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_4400
     * @tc.name AppFsSpace_Format_0789
     * @tc.desc bytes=8444249301319680 precision=3; safe upper half-unit boundary offset 1; exact rounding
     */
    it('AppFsSpace_Format_0789', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0789';
      const bytes: number = 8444249301319680;
      const precision: number = 3;
      const expected: string = '7.500 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_SAFE_4500
     * @tc.name AppFsSpace_Format_0790
     * @tc.desc bytes=8444249301319680 precision=default; safe upper half-unit boundary offset 1; exact rounding
     */
    it('AppFsSpace_Format_0790', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0790';
      const bytes: number = 8444249301319680;
      const expected: string = '7.5 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_0100
     * @tc.name AppFsSpace_Format_0791
     * @tc.desc bytes=-0 precision=0; negative zero is a valid byte count
     */
    it('AppFsSpace_Format_0791', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0791';
      const bytes: number = -0;
      const precision: number = 0;
      const expected: string = '0 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_0200
     * @tc.name AppFsSpace_Format_0792
     * @tc.desc bytes=-0 precision=1; negative zero is a valid byte count
     */
    it('AppFsSpace_Format_0792', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0792';
      const bytes: number = -0;
      const precision: number = 1;
      const expected: string = '0 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_0300
     * @tc.name AppFsSpace_Format_0793
     * @tc.desc bytes=-0 precision=2; negative zero is a valid byte count
     */
    it('AppFsSpace_Format_0793', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0793';
      const bytes: number = -0;
      const precision: number = 2;
      const expected: string = '0 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_0400
     * @tc.name AppFsSpace_Format_0794
     * @tc.desc bytes=-0 precision=3; negative zero is a valid byte count
     */
    it('AppFsSpace_Format_0794', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0794';
      const bytes: number = -0;
      const precision: number = 3;
      const expected: string = '0 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_0500
     * @tc.name AppFsSpace_Format_0795
     * @tc.desc bytes=-0 precision=default; negative zero is a valid byte count
     */
    it('AppFsSpace_Format_0795', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0795';
      const bytes: number = -0;
      const expected: string = '0 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_0600
     * @tc.name AppFsSpace_Format_0796
     * @tc.desc bytes=0 precision=-0; negative zero precision selects integer output
     */
    it('AppFsSpace_Format_0796', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0796';
      const bytes: number = 0;
      const precision: number = -0;
      const expected: string = '0 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_0700
     * @tc.name AppFsSpace_Format_0797
     * @tc.desc bytes=1024 precision=-0; negative zero precision selects integer output
     */
    it('AppFsSpace_Format_0797', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0797';
      const bytes: number = 1024;
      const precision: number = -0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_0800
     * @tc.name AppFsSpace_Format_0798
     * @tc.desc bytes=1048576 precision=-0; negative zero precision selects integer output
     */
    it('AppFsSpace_Format_0798', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0798';
      const bytes: number = 1048576;
      const precision: number = -0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_0900
     * @tc.name AppFsSpace_Format_0799
     * @tc.desc bytes=1073741824 precision=-0; negative zero precision selects integer output
     */
    it('AppFsSpace_Format_0799', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0799';
      const bytes: number = 1073741824;
      const precision: number = -0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_1000
     * @tc.name AppFsSpace_Format_0800
     * @tc.desc bytes=1099511627776 precision=-0; negative zero precision selects integer output
     */
    it('AppFsSpace_Format_0800', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0800';
      const bytes: number = 1099511627776;
      const precision: number = -0;
      const expected: string = '1 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ZERO_1100
     * @tc.name AppFsSpace_Format_0801
     * @tc.desc bytes=1125899906842624 precision=-0; negative zero precision selects integer output
     */
    it('AppFsSpace_Format_0801', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0801';
      const bytes: number = 1125899906842624;
      const precision: number = -0;
      const expected: string = '1 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_DEFAULT_0100
     * @tc.name AppFsSpace_Format_0802
     * @tc.desc bytes=0 precision=undefined; explicit undefined selects default precision one
     */
    it('AppFsSpace_Format_0802', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0802';
      const bytes: number = 0;
      const precision: number | undefined = undefined;
      const expected: string = '0 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_DEFAULT_0200
     * @tc.name AppFsSpace_Format_0803
     * @tc.desc bytes=1023 precision=undefined; explicit undefined selects default precision one
     */
    it('AppFsSpace_Format_0803', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0803';
      const bytes: number = 1023;
      const precision: number | undefined = undefined;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_DEFAULT_0300
     * @tc.name AppFsSpace_Format_0804
     * @tc.desc bytes=1280 precision=undefined; explicit undefined selects default precision one
     */
    it('AppFsSpace_Format_0804', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0804';
      const bytes: number = 1280;
      const precision: number | undefined = undefined;
      const expected: string = '1.3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_DEFAULT_0400
     * @tc.name AppFsSpace_Format_0805
     * @tc.desc bytes=1310720 precision=undefined; explicit undefined selects default precision one
     */
    it('AppFsSpace_Format_0805', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0805';
      const bytes: number = 1310720;
      const precision: number | undefined = undefined;
      const expected: string = '1.3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_DEFAULT_0500
     * @tc.name AppFsSpace_Format_0806
     * @tc.desc bytes=1342177280 precision=undefined; explicit undefined selects default precision one
     */
    it('AppFsSpace_Format_0806', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0806';
      const bytes: number = 1342177280;
      const precision: number | undefined = undefined;
      const expected: string = '1.3 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_DEFAULT_0600
     * @tc.name AppFsSpace_Format_0807
     * @tc.desc bytes=1374389534720 precision=undefined; explicit undefined selects default precision one
     */
    it('AppFsSpace_Format_0807', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0807';
      const bytes: number = 1374389534720;
      const precision: number | undefined = undefined;
      const expected: string = '1.3 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_DEFAULT_0700
     * @tc.name AppFsSpace_Format_0808
     * @tc.desc bytes=1407374883553280 precision=undefined; explicit undefined selects default precision one
     */
    it('AppFsSpace_Format_0808', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0808';
      const bytes: number = 1407374883553280;
      const precision: number | undefined = undefined;
      const expected: string = '1.3 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_DEFAULT_0800
     * @tc.name AppFsSpace_Format_0809
     * @tc.desc bytes=9007199254740991 precision=undefined; explicit undefined selects default precision one
     */
    it('AppFsSpace_Format_0809', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0809';
      const bytes: number = 9007199254740991;
      const precision: number | undefined = undefined;
      const expected: string = '8.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_0100
     * @tc.name AppFsSpace_Format_0810
     * @tc.desc bytes=-1 precision=0; reject negative byte count before formatting
     */
    it('AppFsSpace_Format_0810', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0810';
      const bytes: number = -1;
      const precision: number = 0;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_0200
     * @tc.name AppFsSpace_Format_0811
     * @tc.desc bytes=-1 precision=1; reject negative byte count before formatting
     */
    it('AppFsSpace_Format_0811', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0811';
      const bytes: number = -1;
      const precision: number = 1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_0300
     * @tc.name AppFsSpace_Format_0812
     * @tc.desc bytes=-1 precision=2; reject negative byte count before formatting
     */
    it('AppFsSpace_Format_0812', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0812';
      const bytes: number = -1;
      const precision: number = 2;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_0400
     * @tc.name AppFsSpace_Format_0813
     * @tc.desc bytes=-1 precision=3; reject negative byte count before formatting
     */
    it('AppFsSpace_Format_0813', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0813';
      const bytes: number = -1;
      const precision: number = 3;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_INVALID_BYTES_0500
     * @tc.name AppFsSpace_Format_0814
     * @tc.desc bytes=-1 precision=default; reject negative byte count before formatting
     */
    it('AppFsSpace_Format_0814', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0814';
      const bytes: number = -1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=default throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=default error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=default error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_0100
     * @tc.name AppFsSpace_Format_0815
     * @tc.desc bytes=-1 precision=-1; bytes validation wins over negative precision
     */
    it('AppFsSpace_Format_0815', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0815';
      const bytes: number = -1;
      const precision: number = -1;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_0200
     * @tc.name AppFsSpace_Format_0816
     * @tc.desc bytes=-1 precision=4; bytes validation wins over precision above three
     */
    it('AppFsSpace_Format_0816', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0816';
      const bytes: number = -1;
      const precision: number = 4;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
          const actual: string = formatStorageSize(bytes, precision);
          logCase(name, `unexpected return=${actual}`);
        } catch (error) {
          thrown = true;
          const caught: Error = error as Error;
          errorName = caught.name;
          errorMessage = caught.message;
          logCase(name, `caught name=${errorName} message=${errorMessage}`);
        }
        logAssertion(name, `bytes=${bytes} precision=${precision} throws`, thrown, true);
        expect(thrown).assertEqual(true);
        logAssertion(name, `bytes=${bytes} precision=${precision} error name`, errorName, 'InvalidStorageValueError');
        expect(errorName).assertEqual('InvalidStorageValueError');
        logAssertion(name, `bytes=${bytes} precision=${precision} error message`,
          errorMessage, 'Storage size must be a nonnegative safe integer');
        expect(errorMessage).assertEqual('Storage size must be a nonnegative safe integer');
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_PRIORITY_0300
     * @tc.name AppFsSpace_Format_0817
     * @tc.desc bytes=-1 precision=0.5; bytes validation wins over fractional precision
     */
    it('AppFsSpace_Format_0817', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0817';
      const bytes: number = -1;
      const precision: number = 0.5;
      logCase(name, 'begin');
      try {
        let thrown: boolean = false;
        let errorName: string = '';
        let errorMessage: string = '';
        try {
