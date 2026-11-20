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

export default function storageFormat03Test(): void {
  describe('StorageFormat03', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3000
     * @tc.name AppFsSpace_Format_0207
     * @tc.desc bytes=3200 precision=default; KiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0207', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0207';
      const bytes: number = 3200;
      const expected: string = '3.1 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1300
     * @tc.name AppFsSpace_Format_0208
     * @tc.desc bytes=3199 precision=2; KiB 3 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0208', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0208';
      const bytes: number = 3199;
      const precision: number = 2;
      const expected: string = '3.12 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1400
     * @tc.name AppFsSpace_Format_0209
     * @tc.desc bytes=3201 precision=2; KiB 3 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0209', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0209';
      const bytes: number = 3201;
      const precision: number = 2;
      const expected: string = '3.13 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3100
     * @tc.name AppFsSpace_Format_0210
     * @tc.desc bytes=3328 precision=0; KiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0210', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0210';
      const bytes: number = 3328;
      const precision: number = 0;
      const expected: string = '3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3200
     * @tc.name AppFsSpace_Format_0211
     * @tc.desc bytes=3328 precision=1; KiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0211', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0211';
      const bytes: number = 3328;
      const precision: number = 1;
      const expected: string = '3.3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3300
     * @tc.name AppFsSpace_Format_0212
     * @tc.desc bytes=3328 precision=2; KiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0212', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0212';
      const bytes: number = 3328;
      const precision: number = 2;
      const expected: string = '3.25 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3400
     * @tc.name AppFsSpace_Format_0213
     * @tc.desc bytes=3328 precision=3; KiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0213', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0213';
      const bytes: number = 3328;
      const precision: number = 3;
      const expected: string = '3.250 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3500
     * @tc.name AppFsSpace_Format_0214
     * @tc.desc bytes=3328 precision=default; KiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0214', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0214';
      const bytes: number = 3328;
      const expected: string = '3.3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1500
     * @tc.name AppFsSpace_Format_0215
     * @tc.desc bytes=3327 precision=1; KiB 3 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0215', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0215';
      const bytes: number = 3327;
      const precision: number = 1;
      const expected: string = '3.2 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1600
     * @tc.name AppFsSpace_Format_0216
     * @tc.desc bytes=3329 precision=1; KiB 3 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0216', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0216';
      const bytes: number = 3329;
      const precision: number = 1;
      const expected: string = '3.3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3600
     * @tc.name AppFsSpace_Format_0217
     * @tc.desc bytes=3584 precision=0; KiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0217', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0217';
      const bytes: number = 3584;
      const precision: number = 0;
      const expected: string = '4 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3700
     * @tc.name AppFsSpace_Format_0218
     * @tc.desc bytes=3584 precision=1; KiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0218', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0218';
      const bytes: number = 3584;
      const precision: number = 1;
      const expected: string = '3.5 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3800
     * @tc.name AppFsSpace_Format_0219
     * @tc.desc bytes=3584 precision=2; KiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0219', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0219';
      const bytes: number = 3584;
      const precision: number = 2;
      const expected: string = '3.50 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_3900
     * @tc.name AppFsSpace_Format_0220
     * @tc.desc bytes=3584 precision=3; KiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0220', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0220';
      const bytes: number = 3584;
      const precision: number = 3;
      const expected: string = '3.500 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4000
     * @tc.name AppFsSpace_Format_0221
     * @tc.desc bytes=3584 precision=default; KiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0221', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0221';
      const bytes: number = 3584;
      const expected: string = '3.5 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1700
     * @tc.name AppFsSpace_Format_0222
     * @tc.desc bytes=3583 precision=0; KiB 3 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0222', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0222';
      const bytes: number = 3583;
      const precision: number = 0;
      const expected: string = '3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1800
     * @tc.name AppFsSpace_Format_0223
     * @tc.desc bytes=3585 precision=0; KiB 3 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0223', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0223';
      const bytes: number = 3585;
      const precision: number = 0;
      const expected: string = '4 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_0100
     * @tc.name AppFsSpace_Format_0224
     * @tc.desc bytes=1088 precision=0; KiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0224', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0224';
      const bytes: number = 1088;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_0200
     * @tc.name AppFsSpace_Format_0225
     * @tc.desc bytes=1088 precision=1; KiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0225', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0225';
      const bytes: number = 1088;
      const precision: number = 1;
      const expected: string = '1.1 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_0300
     * @tc.name AppFsSpace_Format_0226
     * @tc.desc bytes=1088 precision=2; KiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0226', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0226';
      const bytes: number = 1088;
      const precision: number = 2;
      const expected: string = '1.06 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_0400
     * @tc.name AppFsSpace_Format_0227
     * @tc.desc bytes=1088 precision=3; KiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0227', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0227';
      const bytes: number = 1088;
      const precision: number = 3;
      const expected: string = '1.063 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_0500
     * @tc.name AppFsSpace_Format_0228
     * @tc.desc bytes=1088 precision=default; KiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0228', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0228';
      const bytes: number = 1088;
      const expected: string = '1.1 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_0600
     * @tc.name AppFsSpace_Format_0229
     * @tc.desc bytes=1087 precision=3; KiB below 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0229', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0229';
      const bytes: number = 1087;
      const precision: number = 3;
      const expected: string = '1.062 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_0700
     * @tc.name AppFsSpace_Format_0230
     * @tc.desc bytes=1089 precision=3; KiB above 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0230', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0230';
      const bytes: number = 1089;
      const precision: number = 3;
      const expected: string = '1.063 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_0800
     * @tc.name AppFsSpace_Format_0231
     * @tc.desc bytes=1216 precision=0; KiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0231', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0231';
      const bytes: number = 1216;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_0900
     * @tc.name AppFsSpace_Format_0232
     * @tc.desc bytes=1216 precision=1; KiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0232', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0232';
      const bytes: number = 1216;
      const precision: number = 1;
      const expected: string = '1.2 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1000
     * @tc.name AppFsSpace_Format_0233
     * @tc.desc bytes=1216 precision=2; KiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0233', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0233';
      const bytes: number = 1216;
      const precision: number = 2;
      const expected: string = '1.19 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1100
     * @tc.name AppFsSpace_Format_0234
     * @tc.desc bytes=1216 precision=3; KiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0234', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0234';
      const bytes: number = 1216;
      const precision: number = 3;
      const expected: string = '1.188 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1200
     * @tc.name AppFsSpace_Format_0235
     * @tc.desc bytes=1216 precision=default; KiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0235', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0235';
      const bytes: number = 1216;
      const expected: string = '1.2 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1300
     * @tc.name AppFsSpace_Format_0236
     * @tc.desc bytes=1215 precision=3; KiB below 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0236', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0236';
      const bytes: number = 1215;
      const precision: number = 3;
      const expected: string = '1.187 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1400
     * @tc.name AppFsSpace_Format_0237
     * @tc.desc bytes=1217 precision=3; KiB above 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0237', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0237';
      const bytes: number = 1217;
      const precision: number = 3;
      const expected: string = '1.188 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_0100
     * @tc.name AppFsSpace_Format_0238
     * @tc.desc bytes=1046656 precision=0; KiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0238', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0238';
      const bytes: number = 1046656;
      const precision: number = 0;
      const expected: string = '1022 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_0200
     * @tc.name AppFsSpace_Format_0239
     * @tc.desc bytes=1046656 precision=1; KiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0239', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0239';
      const bytes: number = 1046656;
      const precision: number = 1;
      const expected: string = '1022.1 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_0300
     * @tc.name AppFsSpace_Format_0240
     * @tc.desc bytes=1046656 precision=2; KiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0240', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0240';
      const bytes: number = 1046656;
      const precision: number = 2;
      const expected: string = '1022.13 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_0400
     * @tc.name AppFsSpace_Format_0241
     * @tc.desc bytes=1046656 precision=3; KiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0241', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0241';
      const bytes: number = 1046656;
      const precision: number = 3;
      const expected: string = '1022.125 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_0500
     * @tc.name AppFsSpace_Format_0242
     * @tc.desc bytes=1046656 precision=default; KiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0242', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0242';
      const bytes: number = 1046656;
      const expected: string = '1022.1 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_0600
     * @tc.name AppFsSpace_Format_0243
     * @tc.desc bytes=1046655 precision=2; KiB 1022 below one eighth tie
     */
    it('AppFsSpace_Format_0243', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0243';
      const bytes: number = 1046655;
      const precision: number = 2;
      const expected: string = '1022.12 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_0700
     * @tc.name AppFsSpace_Format_0244
     * @tc.desc bytes=1046657 precision=2; KiB 1022 above one eighth tie
     */
    it('AppFsSpace_Format_0244', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0244';
      const bytes: number = 1046657;
      const precision: number = 2;
      const expected: string = '1022.13 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_0800
     * @tc.name AppFsSpace_Format_0245
     * @tc.desc bytes=1046784 precision=0; KiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0245', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0245';
      const bytes: number = 1046784;
      const precision: number = 0;
      const expected: string = '1022 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_0900
     * @tc.name AppFsSpace_Format_0246
     * @tc.desc bytes=1046784 precision=1; KiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0246', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0246';
      const bytes: number = 1046784;
      const precision: number = 1;
      const expected: string = '1022.3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1000
     * @tc.name AppFsSpace_Format_0247
     * @tc.desc bytes=1046784 precision=2; KiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0247', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0247';
      const bytes: number = 1046784;
      const precision: number = 2;
      const expected: string = '1022.25 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1100
     * @tc.name AppFsSpace_Format_0248
     * @tc.desc bytes=1046784 precision=3; KiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0248', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0248';
      const bytes: number = 1046784;
      const precision: number = 3;
      const expected: string = '1022.250 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1200
     * @tc.name AppFsSpace_Format_0249
     * @tc.desc bytes=1046784 precision=default; KiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0249', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0249';
      const bytes: number = 1046784;
      const expected: string = '1022.3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1300
     * @tc.name AppFsSpace_Format_0250
     * @tc.desc bytes=1046783 precision=1; KiB 1022 below one quarter tie
     */
    it('AppFsSpace_Format_0250', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0250';
      const bytes: number = 1046783;
      const precision: number = 1;
      const expected: string = '1022.2 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1400
     * @tc.name AppFsSpace_Format_0251
     * @tc.desc bytes=1046785 precision=1; KiB 1022 above one quarter tie
     */
    it('AppFsSpace_Format_0251', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0251';
      const bytes: number = 1046785;
      const precision: number = 1;
      const expected: string = '1022.3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1500
     * @tc.name AppFsSpace_Format_0252
     * @tc.desc bytes=1047040 precision=0; KiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0252', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0252';
      const bytes: number = 1047040;
      const precision: number = 0;
      const expected: string = '1023 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1600
     * @tc.name AppFsSpace_Format_0253
     * @tc.desc bytes=1047040 precision=1; KiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0253', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0253';
      const bytes: number = 1047040;
      const precision: number = 1;
      const expected: string = '1022.5 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1700
     * @tc.name AppFsSpace_Format_0254
     * @tc.desc bytes=1047040 precision=2; KiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0254', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0254';
      const bytes: number = 1047040;
      const precision: number = 2;
      const expected: string = '1022.50 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1800
     * @tc.name AppFsSpace_Format_0255
     * @tc.desc bytes=1047040 precision=3; KiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0255', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0255';
      const bytes: number = 1047040;
      const precision: number = 3;
      const expected: string = '1022.500 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_1900
     * @tc.name AppFsSpace_Format_0256
     * @tc.desc bytes=1047040 precision=default; KiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0256', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0256';
      const bytes: number = 1047040;
      const expected: string = '1022.5 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2000
     * @tc.name AppFsSpace_Format_0257
     * @tc.desc bytes=1047039 precision=0; KiB 1022 below one half tie
     */
    it('AppFsSpace_Format_0257', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0257';
      const bytes: number = 1047039;
      const precision: number = 0;
      const expected: string = '1022 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2100
     * @tc.name AppFsSpace_Format_0258
     * @tc.desc bytes=1047041 precision=0; KiB 1022 above one half tie
     */
    it('AppFsSpace_Format_0258', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0258';
      const bytes: number = 1047041;
      const precision: number = 0;
      const expected: string = '1023 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_0100
     * @tc.name AppFsSpace_Format_0259
     * @tc.desc bytes=2048 precision=0; KiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0259', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0259';
      const bytes: number = 2048;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_0200
     * @tc.name AppFsSpace_Format_0260
     * @tc.desc bytes=2048 precision=1; KiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0260', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0260';
      const bytes: number = 2048;
      const precision: number = 1;
      const expected: string = '2.0 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_0300
     * @tc.name AppFsSpace_Format_0261
     * @tc.desc bytes=2048 precision=2; KiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0261', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0261';
      const bytes: number = 2048;
      const precision: number = 2;
      const expected: string = '2.00 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_0400
     * @tc.name AppFsSpace_Format_0262
     * @tc.desc bytes=2048 precision=3; KiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0262', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0262';
      const bytes: number = 2048;
      const precision: number = 3;
      const expected: string = '2.000 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_0500
     * @tc.name AppFsSpace_Format_0263
     * @tc.desc bytes=2048 precision=default; KiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0263', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0263';
      const bytes: number = 2048;
      const expected: string = '2.0 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_0600
     * @tc.name AppFsSpace_Format_0264
     * @tc.desc bytes=3072 precision=0; KiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0264', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0264';
      const bytes: number = 3072;
      const precision: number = 0;
      const expected: string = '3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_0700
     * @tc.name AppFsSpace_Format_0265
     * @tc.desc bytes=3072 precision=1; KiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0265', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0265';
      const bytes: number = 3072;
      const precision: number = 1;
      const expected: string = '3.0 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_0800
     * @tc.name AppFsSpace_Format_0266
     * @tc.desc bytes=3072 precision=2; KiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0266', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0266';
      const bytes: number = 3072;
      const precision: number = 2;
      const expected: string = '3.00 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_0900
     * @tc.name AppFsSpace_Format_0267
     * @tc.desc bytes=3072 precision=3; KiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0267', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0267';
      const bytes: number = 3072;
      const precision: number = 3;
      const expected: string = '3.000 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1000
     * @tc.name AppFsSpace_Format_0268
     * @tc.desc bytes=3072 precision=default; KiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0268', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0268';
      const bytes: number = 3072;
      const expected: string = '3.0 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1100
     * @tc.name AppFsSpace_Format_0269
     * @tc.desc bytes=7168 precision=0; KiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0269', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0269';
      const bytes: number = 7168;
      const precision: number = 0;
      const expected: string = '7 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1200
     * @tc.name AppFsSpace_Format_0270
     * @tc.desc bytes=7168 precision=1; KiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0270', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0270';
      const bytes: number = 7168;
      const precision: number = 1;
      const expected: string = '7.0 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1300
     * @tc.name AppFsSpace_Format_0271
     * @tc.desc bytes=7168 precision=2; KiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0271', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0271';
      const bytes: number = 7168;
      const precision: number = 2;
      const expected: string = '7.00 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1400
     * @tc.name AppFsSpace_Format_0272
     * @tc.desc bytes=7168 precision=3; KiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0272', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0272';
      const bytes: number = 7168;
      const precision: number = 3;
      const expected: string = '7.000 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1500
     * @tc.name AppFsSpace_Format_0273
     * @tc.desc bytes=7168 precision=default; KiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0273', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0273';
      const bytes: number = 7168;
      const expected: string = '7.0 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4100
     * @tc.name AppFsSpace_Format_0274
     * @tc.desc bytes=1179648 precision=0; MiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0274', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0274';
      const bytes: number = 1179648;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4200
     * @tc.name AppFsSpace_Format_0275
     * @tc.desc bytes=1179648 precision=1; MiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0275', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0275';
      const bytes: number = 1179648;
      const precision: number = 1;
      const expected: string = '1.1 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4300
     * @tc.name AppFsSpace_Format_0276
     * @tc.desc bytes=1179648 precision=2; MiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0276', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0276';
      const bytes: number = 1179648;
      const precision: number = 2;
      const expected: string = '1.13 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4400
     * @tc.name AppFsSpace_Format_0277
     * @tc.desc bytes=1179648 precision=3; MiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0277', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0277';
      const bytes: number = 1179648;
      const precision: number = 3;
      const expected: string = '1.125 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4500
     * @tc.name AppFsSpace_Format_0278
     * @tc.desc bytes=1179648 precision=default; MiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0278', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0278';
      const bytes: number = 1179648;
      const expected: string = '1.1 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1900
     * @tc.name AppFsSpace_Format_0279
     * @tc.desc bytes=1179647 precision=2; MiB 1 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0279', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0279';
      const bytes: number = 1179647;
      const precision: number = 2;
      const expected: string = '1.12 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_2000
     * @tc.name AppFsSpace_Format_0280
     * @tc.desc bytes=1179649 precision=2; MiB 1 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0280', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0280';
      const bytes: number = 1179649;
      const precision: number = 2;
      const expected: string = '1.13 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4600
     * @tc.name AppFsSpace_Format_0281
     * @tc.desc bytes=1310720 precision=0; MiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0281', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0281';
      const bytes: number = 1310720;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4700
     * @tc.name AppFsSpace_Format_0282
     * @tc.desc bytes=1310720 precision=1; MiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0282', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0282';
      const bytes: number = 1310720;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4800
     * @tc.name AppFsSpace_Format_0283
     * @tc.desc bytes=1310720 precision=2; MiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0283', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0283';
      const bytes: number = 1310720;
      const precision: number = 2;
      const expected: string = '1.25 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_4900
     * @tc.name AppFsSpace_Format_0284
     * @tc.desc bytes=1310720 precision=3; MiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0284', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0284';
      const bytes: number = 1310720;
      const precision: number = 3;
      const expected: string = '1.250 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5000
     * @tc.name AppFsSpace_Format_0285
     * @tc.desc bytes=1310720 precision=default; MiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0285', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0285';
      const bytes: number = 1310720;
      const expected: string = '1.3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_2100
     * @tc.name AppFsSpace_Format_0286
     * @tc.desc bytes=1310719 precision=1; MiB 1 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0286', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0286';
      const bytes: number = 1310719;
      const precision: number = 1;
      const expected: string = '1.2 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_2200
     * @tc.name AppFsSpace_Format_0287
     * @tc.desc bytes=1310721 precision=1; MiB 1 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0287', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0287';
      const bytes: number = 1310721;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5100
     * @tc.name AppFsSpace_Format_0288
     * @tc.desc bytes=1441792 precision=0; MiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0288', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0288';
      const bytes: number = 1441792;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5200
     * @tc.name AppFsSpace_Format_0289
     * @tc.desc bytes=1441792 precision=1; MiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0289', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0289';
      const bytes: number = 1441792;
      const precision: number = 1;
      const expected: string = '1.4 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5300
     * @tc.name AppFsSpace_Format_0290
     * @tc.desc bytes=1441792 precision=2; MiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0290', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0290';
      const bytes: number = 1441792;
      const precision: number = 2;
      const expected: string = '1.38 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5400
     * @tc.name AppFsSpace_Format_0291
     * @tc.desc bytes=1441792 precision=3; MiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0291', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0291';
      const bytes: number = 1441792;
      const precision: number = 3;
      const expected: string = '1.375 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5500
     * @tc.name AppFsSpace_Format_0292
     * @tc.desc bytes=1441792 precision=default; MiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0292', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0292';
      const bytes: number = 1441792;
      const expected: string = '1.4 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_2300
     * @tc.name AppFsSpace_Format_0293
     * @tc.desc bytes=1441791 precision=2; MiB 1 plus three eighths; one byte below tie
     */
    it('AppFsSpace_Format_0293', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0293';
      const bytes: number = 1441791;
      const precision: number = 2;
      const expected: string = '1.37 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_2400
     * @tc.name AppFsSpace_Format_0294
     * @tc.desc bytes=1441793 precision=2; MiB 1 plus three eighths; one byte above tie
     */
    it('AppFsSpace_Format_0294', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0294';
      const bytes: number = 1441793;
      const precision: number = 2;
      const expected: string = '1.38 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_2500
     * @tc.name AppFsSpace_Format_0295
     * @tc.desc bytes=1572863 precision=0; MiB 1 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0295', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0295';
      const bytes: number = 1572863;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_2600
     * @tc.name AppFsSpace_Format_0296
     * @tc.desc bytes=1572865 precision=0; MiB 1 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0296', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0296';
      const bytes: number = 1572865;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5600
     * @tc.name AppFsSpace_Format_0297
     * @tc.desc bytes=1835008 precision=0; MiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0297', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0297';
      const bytes: number = 1835008;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5700
     * @tc.name AppFsSpace_Format_0298
     * @tc.desc bytes=1835008 precision=1; MiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0298', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0298';
      const bytes: number = 1835008;
      const precision: number = 1;
      const expected: string = '1.8 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5800
     * @tc.name AppFsSpace_Format_0299
     * @tc.desc bytes=1835008 precision=2; MiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0299', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0299';
      const bytes: number = 1835008;
      const precision: number = 2;
      const expected: string = '1.75 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_5900
     * @tc.name AppFsSpace_Format_0300
     * @tc.desc bytes=1835008 precision=3; MiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0300', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0300';
      const bytes: number = 1835008;
      const precision: number = 3;
      const expected: string = '1.750 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6000
     * @tc.name AppFsSpace_Format_0301
     * @tc.desc bytes=1835008 precision=default; MiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0301', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0301';
      const bytes: number = 1835008;
      const expected: string = '1.8 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_2700
     * @tc.name AppFsSpace_Format_0302
     * @tc.desc bytes=1835007 precision=1; MiB 1 plus three quarters; one byte below tie
     */
    it('AppFsSpace_Format_0302', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0302';
      const bytes: number = 1835007;
      const precision: number = 1;
      const expected: string = '1.7 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_2800
     * @tc.name AppFsSpace_Format_0303
     * @tc.desc bytes=1835009 precision=1; MiB 1 plus three quarters; one byte above tie
     */
    it('AppFsSpace_Format_0303', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0303';
      const bytes: number = 1835009;
      const precision: number = 1;
      const expected: string = '1.8 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6100
     * @tc.name AppFsSpace_Format_0304
     * @tc.desc bytes=1966080 precision=0; MiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0304', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0304';
      const bytes: number = 1966080;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6200
     * @tc.name AppFsSpace_Format_0305
     * @tc.desc bytes=1966080 precision=1; MiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0305', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0305';
      const bytes: number = 1966080;
      const precision: number = 1;
      const expected: string = '1.9 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6300
     * @tc.name AppFsSpace_Format_0306
     * @tc.desc bytes=1966080 precision=2; MiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0306', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0306';
      const bytes: number = 1966080;
      const precision: number = 2;
      const expected: string = '1.88 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6400
     * @tc.name AppFsSpace_Format_0307
     * @tc.desc bytes=1966080 precision=3; MiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0307', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0307';
      const bytes: number = 1966080;
      const precision: number = 3;
      const expected: string = '1.875 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6500
     * @tc.name AppFsSpace_Format_0308
     * @tc.desc bytes=1966080 precision=default; MiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0308', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0308';
      const bytes: number = 1966080;
      const expected: string = '1.9 MiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
