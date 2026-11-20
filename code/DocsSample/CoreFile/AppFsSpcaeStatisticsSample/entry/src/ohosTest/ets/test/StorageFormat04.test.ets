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

export default function storageFormat04Test(): void {
  describe('StorageFormat04', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3000
     * @tc.name AppFsSpace_Format_0310
     * @tc.desc bytes=1966081 precision=2; MiB 1 plus seven eighths; one byte above tie
     */
    it('AppFsSpace_Format_0310', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0310';
      const bytes: number = 1966081;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6600
     * @tc.name AppFsSpace_Format_0311
     * @tc.desc bytes=3276800 precision=0; MiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0311', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0311';
      const bytes: number = 3276800;
      const precision: number = 0;
      const expected: string = '3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6700
     * @tc.name AppFsSpace_Format_0312
     * @tc.desc bytes=3276800 precision=1; MiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0312', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0312';
      const bytes: number = 3276800;
      const precision: number = 1;
      const expected: string = '3.1 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6800
     * @tc.name AppFsSpace_Format_0313
     * @tc.desc bytes=3276800 precision=2; MiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0313', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0313';
      const bytes: number = 3276800;
      const precision: number = 2;
      const expected: string = '3.13 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_6900
     * @tc.name AppFsSpace_Format_0314
     * @tc.desc bytes=3276800 precision=3; MiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0314', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0314';
      const bytes: number = 3276800;
      const precision: number = 3;
      const expected: string = '3.125 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7000
     * @tc.name AppFsSpace_Format_0315
     * @tc.desc bytes=3276800 precision=default; MiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0315', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0315';
      const bytes: number = 3276800;
      const expected: string = '3.1 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3100
     * @tc.name AppFsSpace_Format_0316
     * @tc.desc bytes=3276799 precision=2; MiB 3 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0316', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0316';
      const bytes: number = 3276799;
      const precision: number = 2;
      const expected: string = '3.12 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3200
     * @tc.name AppFsSpace_Format_0317
     * @tc.desc bytes=3276801 precision=2; MiB 3 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0317', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0317';
      const bytes: number = 3276801;
      const precision: number = 2;
      const expected: string = '3.13 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7100
     * @tc.name AppFsSpace_Format_0318
     * @tc.desc bytes=3407872 precision=0; MiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0318', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0318';
      const bytes: number = 3407872;
      const precision: number = 0;
      const expected: string = '3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7200
     * @tc.name AppFsSpace_Format_0319
     * @tc.desc bytes=3407872 precision=1; MiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0319', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0319';
      const bytes: number = 3407872;
      const precision: number = 1;
      const expected: string = '3.3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7300
     * @tc.name AppFsSpace_Format_0320
     * @tc.desc bytes=3407872 precision=2; MiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0320', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0320';
      const bytes: number = 3407872;
      const precision: number = 2;
      const expected: string = '3.25 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7400
     * @tc.name AppFsSpace_Format_0321
     * @tc.desc bytes=3407872 precision=3; MiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0321', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0321';
      const bytes: number = 3407872;
      const precision: number = 3;
      const expected: string = '3.250 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7500
     * @tc.name AppFsSpace_Format_0322
     * @tc.desc bytes=3407872 precision=default; MiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0322', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0322';
      const bytes: number = 3407872;
      const expected: string = '3.3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3300
     * @tc.name AppFsSpace_Format_0323
     * @tc.desc bytes=3407871 precision=1; MiB 3 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0323', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0323';
      const bytes: number = 3407871;
      const precision: number = 1;
      const expected: string = '3.2 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3400
     * @tc.name AppFsSpace_Format_0324
     * @tc.desc bytes=3407873 precision=1; MiB 3 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0324', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0324';
      const bytes: number = 3407873;
      const precision: number = 1;
      const expected: string = '3.3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7600
     * @tc.name AppFsSpace_Format_0325
     * @tc.desc bytes=3670016 precision=0; MiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0325', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0325';
      const bytes: number = 3670016;
      const precision: number = 0;
      const expected: string = '4 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7700
     * @tc.name AppFsSpace_Format_0326
     * @tc.desc bytes=3670016 precision=1; MiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0326', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0326';
      const bytes: number = 3670016;
      const precision: number = 1;
      const expected: string = '3.5 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7800
     * @tc.name AppFsSpace_Format_0327
     * @tc.desc bytes=3670016 precision=2; MiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0327', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0327';
      const bytes: number = 3670016;
      const precision: number = 2;
      const expected: string = '3.50 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_7900
     * @tc.name AppFsSpace_Format_0328
     * @tc.desc bytes=3670016 precision=3; MiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0328', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0328';
      const bytes: number = 3670016;
      const precision: number = 3;
      const expected: string = '3.500 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8000
     * @tc.name AppFsSpace_Format_0329
     * @tc.desc bytes=3670016 precision=default; MiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0329', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0329';
      const bytes: number = 3670016;
      const expected: string = '3.5 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3500
     * @tc.name AppFsSpace_Format_0330
     * @tc.desc bytes=3670015 precision=0; MiB 3 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0330', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0330';
      const bytes: number = 3670015;
      const precision: number = 0;
      const expected: string = '3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3600
     * @tc.name AppFsSpace_Format_0331
     * @tc.desc bytes=3670017 precision=0; MiB 3 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0331', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0331';
      const bytes: number = 3670017;
      const precision: number = 0;
      const expected: string = '4 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1500
     * @tc.name AppFsSpace_Format_0332
     * @tc.desc bytes=1114112 precision=0; MiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0332', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0332';
      const bytes: number = 1114112;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1600
     * @tc.name AppFsSpace_Format_0333
     * @tc.desc bytes=1114112 precision=1; MiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0333', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0333';
      const bytes: number = 1114112;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1700
     * @tc.name AppFsSpace_Format_0334
     * @tc.desc bytes=1114112 precision=2; MiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0334', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0334';
      const bytes: number = 1114112;
      const precision: number = 2;
      const expected: string = '1.06 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1800
     * @tc.name AppFsSpace_Format_0335
     * @tc.desc bytes=1114112 precision=3; MiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0335', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0335';
      const bytes: number = 1114112;
      const precision: number = 3;
      const expected: string = '1.063 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_1900
     * @tc.name AppFsSpace_Format_0336
     * @tc.desc bytes=1114112 precision=default; MiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0336', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0336';
      const bytes: number = 1114112;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2000
     * @tc.name AppFsSpace_Format_0337
     * @tc.desc bytes=1114111 precision=3; MiB below 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0337', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0337';
      const bytes: number = 1114111;
      const precision: number = 3;
      const expected: string = '1.062 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2100
     * @tc.name AppFsSpace_Format_0338
     * @tc.desc bytes=1114113 precision=3; MiB above 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0338', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0338';
      const bytes: number = 1114113;
      const precision: number = 3;
      const expected: string = '1.063 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2200
     * @tc.name AppFsSpace_Format_0339
     * @tc.desc bytes=1245184 precision=0; MiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0339', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0339';
      const bytes: number = 1245184;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2300
     * @tc.name AppFsSpace_Format_0340
     * @tc.desc bytes=1245184 precision=1; MiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0340', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0340';
      const bytes: number = 1245184;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2400
     * @tc.name AppFsSpace_Format_0341
     * @tc.desc bytes=1245184 precision=2; MiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0341', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0341';
      const bytes: number = 1245184;
      const precision: number = 2;
      const expected: string = '1.19 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2500
     * @tc.name AppFsSpace_Format_0342
     * @tc.desc bytes=1245184 precision=3; MiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0342', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0342';
      const bytes: number = 1245184;
      const precision: number = 3;
      const expected: string = '1.188 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2600
     * @tc.name AppFsSpace_Format_0343
     * @tc.desc bytes=1245184 precision=default; MiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0343', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0343';
      const bytes: number = 1245184;
      const expected: string = '1.2 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2700
     * @tc.name AppFsSpace_Format_0344
     * @tc.desc bytes=1245183 precision=3; MiB below 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0344', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0344';
      const bytes: number = 1245183;
      const precision: number = 3;
      const expected: string = '1.187 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2800
     * @tc.name AppFsSpace_Format_0345
     * @tc.desc bytes=1245185 precision=3; MiB above 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0345', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0345';
      const bytes: number = 1245185;
      const precision: number = 3;
      const expected: string = '1.188 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2200
     * @tc.name AppFsSpace_Format_0346
     * @tc.desc bytes=1071775744 precision=0; MiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0346', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0346';
      const bytes: number = 1071775744;
      const precision: number = 0;
      const expected: string = '1022 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2300
     * @tc.name AppFsSpace_Format_0347
     * @tc.desc bytes=1071775744 precision=1; MiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0347', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0347';
      const bytes: number = 1071775744;
      const precision: number = 1;
      const expected: string = '1022.1 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2400
     * @tc.name AppFsSpace_Format_0348
     * @tc.desc bytes=1071775744 precision=2; MiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0348', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0348';
      const bytes: number = 1071775744;
      const precision: number = 2;
      const expected: string = '1022.13 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2500
     * @tc.name AppFsSpace_Format_0349
     * @tc.desc bytes=1071775744 precision=3; MiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0349', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0349';
      const bytes: number = 1071775744;
      const precision: number = 3;
      const expected: string = '1022.125 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2600
     * @tc.name AppFsSpace_Format_0350
     * @tc.desc bytes=1071775744 precision=default; MiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0350', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0350';
      const bytes: number = 1071775744;
      const expected: string = '1022.1 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2700
     * @tc.name AppFsSpace_Format_0351
     * @tc.desc bytes=1071775743 precision=2; MiB 1022 below one eighth tie
     */
    it('AppFsSpace_Format_0351', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0351';
      const bytes: number = 1071775743;
      const precision: number = 2;
      const expected: string = '1022.12 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2800
     * @tc.name AppFsSpace_Format_0352
     * @tc.desc bytes=1071775745 precision=2; MiB 1022 above one eighth tie
     */
    it('AppFsSpace_Format_0352', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0352';
      const bytes: number = 1071775745;
      const precision: number = 2;
      const expected: string = '1022.13 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_2900
     * @tc.name AppFsSpace_Format_0353
     * @tc.desc bytes=1071906816 precision=0; MiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0353', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0353';
      const bytes: number = 1071906816;
      const precision: number = 0;
      const expected: string = '1022 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3000
     * @tc.name AppFsSpace_Format_0354
     * @tc.desc bytes=1071906816 precision=1; MiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0354', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0354';
      const bytes: number = 1071906816;
      const precision: number = 1;
      const expected: string = '1022.3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3100
     * @tc.name AppFsSpace_Format_0355
     * @tc.desc bytes=1071906816 precision=2; MiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0355', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0355';
      const bytes: number = 1071906816;
      const precision: number = 2;
      const expected: string = '1022.25 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3200
     * @tc.name AppFsSpace_Format_0356
     * @tc.desc bytes=1071906816 precision=3; MiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0356', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0356';
      const bytes: number = 1071906816;
      const precision: number = 3;
      const expected: string = '1022.250 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3300
     * @tc.name AppFsSpace_Format_0357
     * @tc.desc bytes=1071906816 precision=default; MiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0357', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0357';
      const bytes: number = 1071906816;
      const expected: string = '1022.3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3400
     * @tc.name AppFsSpace_Format_0358
     * @tc.desc bytes=1071906815 precision=1; MiB 1022 below one quarter tie
     */
    it('AppFsSpace_Format_0358', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0358';
      const bytes: number = 1071906815;
      const precision: number = 1;
      const expected: string = '1022.2 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3500
     * @tc.name AppFsSpace_Format_0359
     * @tc.desc bytes=1071906817 precision=1; MiB 1022 above one quarter tie
     */
    it('AppFsSpace_Format_0359', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0359';
      const bytes: number = 1071906817;
      const precision: number = 1;
      const expected: string = '1022.3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3600
     * @tc.name AppFsSpace_Format_0360
     * @tc.desc bytes=1072168960 precision=0; MiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0360', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0360';
      const bytes: number = 1072168960;
      const precision: number = 0;
      const expected: string = '1023 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3700
     * @tc.name AppFsSpace_Format_0361
     * @tc.desc bytes=1072168960 precision=1; MiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0361', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0361';
      const bytes: number = 1072168960;
      const precision: number = 1;
      const expected: string = '1022.5 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3800
     * @tc.name AppFsSpace_Format_0362
     * @tc.desc bytes=1072168960 precision=2; MiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0362', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0362';
      const bytes: number = 1072168960;
      const precision: number = 2;
      const expected: string = '1022.50 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_3900
     * @tc.name AppFsSpace_Format_0363
     * @tc.desc bytes=1072168960 precision=3; MiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0363', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0363';
      const bytes: number = 1072168960;
      const precision: number = 3;
      const expected: string = '1022.500 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4000
     * @tc.name AppFsSpace_Format_0364
     * @tc.desc bytes=1072168960 precision=default; MiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0364', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0364';
      const bytes: number = 1072168960;
      const expected: string = '1022.5 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4100
     * @tc.name AppFsSpace_Format_0365
     * @tc.desc bytes=1072168959 precision=0; MiB 1022 below one half tie
     */
    it('AppFsSpace_Format_0365', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0365';
      const bytes: number = 1072168959;
      const precision: number = 0;
      const expected: string = '1022 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4200
     * @tc.name AppFsSpace_Format_0366
     * @tc.desc bytes=1072168961 precision=0; MiB 1022 above one half tie
     */
    it('AppFsSpace_Format_0366', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0366';
      const bytes: number = 1072168961;
      const precision: number = 0;
      const expected: string = '1023 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1600
     * @tc.name AppFsSpace_Format_0367
     * @tc.desc bytes=2097152 precision=0; MiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0367', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0367';
      const bytes: number = 2097152;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1700
     * @tc.name AppFsSpace_Format_0368
     * @tc.desc bytes=2097152 precision=1; MiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0368', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0368';
      const bytes: number = 2097152;
      const precision: number = 1;
      const expected: string = '2.0 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1800
     * @tc.name AppFsSpace_Format_0369
     * @tc.desc bytes=2097152 precision=2; MiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0369', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0369';
      const bytes: number = 2097152;
      const precision: number = 2;
      const expected: string = '2.00 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_1900
     * @tc.name AppFsSpace_Format_0370
     * @tc.desc bytes=2097152 precision=3; MiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0370', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0370';
      const bytes: number = 2097152;
      const precision: number = 3;
      const expected: string = '2.000 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2000
     * @tc.name AppFsSpace_Format_0371
     * @tc.desc bytes=2097152 precision=default; MiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0371', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0371';
      const bytes: number = 2097152;
      const expected: string = '2.0 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2100
     * @tc.name AppFsSpace_Format_0372
     * @tc.desc bytes=3145728 precision=0; MiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0372', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0372';
      const bytes: number = 3145728;
      const precision: number = 0;
      const expected: string = '3 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2200
     * @tc.name AppFsSpace_Format_0373
     * @tc.desc bytes=3145728 precision=1; MiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0373', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0373';
      const bytes: number = 3145728;
      const precision: number = 1;
      const expected: string = '3.0 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2300
     * @tc.name AppFsSpace_Format_0374
     * @tc.desc bytes=3145728 precision=2; MiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0374', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0374';
      const bytes: number = 3145728;
      const precision: number = 2;
      const expected: string = '3.00 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2400
     * @tc.name AppFsSpace_Format_0375
     * @tc.desc bytes=3145728 precision=3; MiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0375', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0375';
      const bytes: number = 3145728;
      const precision: number = 3;
      const expected: string = '3.000 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2500
     * @tc.name AppFsSpace_Format_0376
     * @tc.desc bytes=3145728 precision=default; MiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0376', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0376';
      const bytes: number = 3145728;
      const expected: string = '3.0 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2600
     * @tc.name AppFsSpace_Format_0377
     * @tc.desc bytes=7340032 precision=0; MiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0377', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0377';
      const bytes: number = 7340032;
      const precision: number = 0;
      const expected: string = '7 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2700
     * @tc.name AppFsSpace_Format_0378
     * @tc.desc bytes=7340032 precision=1; MiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0378', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0378';
      const bytes: number = 7340032;
      const precision: number = 1;
      const expected: string = '7.0 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2800
     * @tc.name AppFsSpace_Format_0379
     * @tc.desc bytes=7340032 precision=2; MiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0379', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0379';
      const bytes: number = 7340032;
      const precision: number = 2;
      const expected: string = '7.00 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_2900
     * @tc.name AppFsSpace_Format_0380
     * @tc.desc bytes=7340032 precision=3; MiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0380', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0380';
      const bytes: number = 7340032;
      const precision: number = 3;
      const expected: string = '7.000 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3000
     * @tc.name AppFsSpace_Format_0381
     * @tc.desc bytes=7340032 precision=default; MiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0381', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0381';
      const bytes: number = 7340032;
      const expected: string = '7.0 MiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8100
     * @tc.name AppFsSpace_Format_0382
     * @tc.desc bytes=1207959552 precision=0; GiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0382', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0382';
      const bytes: number = 1207959552;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8200
     * @tc.name AppFsSpace_Format_0383
     * @tc.desc bytes=1207959552 precision=1; GiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0383', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0383';
      const bytes: number = 1207959552;
      const precision: number = 1;
      const expected: string = '1.1 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8300
     * @tc.name AppFsSpace_Format_0384
     * @tc.desc bytes=1207959552 precision=2; GiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0384', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0384';
      const bytes: number = 1207959552;
      const precision: number = 2;
      const expected: string = '1.13 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8400
     * @tc.name AppFsSpace_Format_0385
     * @tc.desc bytes=1207959552 precision=3; GiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0385', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0385';
      const bytes: number = 1207959552;
      const precision: number = 3;
      const expected: string = '1.125 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8500
     * @tc.name AppFsSpace_Format_0386
     * @tc.desc bytes=1207959552 precision=default; GiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0386', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0386';
      const bytes: number = 1207959552;
      const expected: string = '1.1 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3700
     * @tc.name AppFsSpace_Format_0387
     * @tc.desc bytes=1207959551 precision=2; GiB 1 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0387', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0387';
      const bytes: number = 1207959551;
      const precision: number = 2;
      const expected: string = '1.12 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3800
     * @tc.name AppFsSpace_Format_0388
     * @tc.desc bytes=1207959553 precision=2; GiB 1 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0388', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0388';
      const bytes: number = 1207959553;
      const precision: number = 2;
      const expected: string = '1.13 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8600
     * @tc.name AppFsSpace_Format_0389
     * @tc.desc bytes=1342177280 precision=0; GiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0389', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0389';
      const bytes: number = 1342177280;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8700
     * @tc.name AppFsSpace_Format_0390
     * @tc.desc bytes=1342177280 precision=1; GiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0390', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0390';
      const bytes: number = 1342177280;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8800
     * @tc.name AppFsSpace_Format_0391
     * @tc.desc bytes=1342177280 precision=2; GiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0391', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0391';
      const bytes: number = 1342177280;
      const precision: number = 2;
      const expected: string = '1.25 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_8900
     * @tc.name AppFsSpace_Format_0392
     * @tc.desc bytes=1342177280 precision=3; GiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0392', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0392';
      const bytes: number = 1342177280;
      const precision: number = 3;
      const expected: string = '1.250 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9000
     * @tc.name AppFsSpace_Format_0393
     * @tc.desc bytes=1342177280 precision=default; GiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0393', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0393';
      const bytes: number = 1342177280;
      const expected: string = '1.3 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_3900
     * @tc.name AppFsSpace_Format_0394
     * @tc.desc bytes=1342177279 precision=1; GiB 1 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0394', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0394';
      const bytes: number = 1342177279;
      const precision: number = 1;
      const expected: string = '1.2 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4000
     * @tc.name AppFsSpace_Format_0395
     * @tc.desc bytes=1342177281 precision=1; GiB 1 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0395', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0395';
      const bytes: number = 1342177281;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9100
     * @tc.name AppFsSpace_Format_0396
     * @tc.desc bytes=1476395008 precision=0; GiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0396', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0396';
      const bytes: number = 1476395008;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9200
     * @tc.name AppFsSpace_Format_0397
     * @tc.desc bytes=1476395008 precision=1; GiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0397', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0397';
      const bytes: number = 1476395008;
      const precision: number = 1;
      const expected: string = '1.4 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9300
     * @tc.name AppFsSpace_Format_0398
     * @tc.desc bytes=1476395008 precision=2; GiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0398', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0398';
      const bytes: number = 1476395008;
      const precision: number = 2;
      const expected: string = '1.38 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9400
     * @tc.name AppFsSpace_Format_0399
     * @tc.desc bytes=1476395008 precision=3; GiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0399', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0399';
      const bytes: number = 1476395008;
      const precision: number = 3;
      const expected: string = '1.375 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9500
     * @tc.name AppFsSpace_Format_0400
     * @tc.desc bytes=1476395008 precision=default; GiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0400', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0400';
      const bytes: number = 1476395008;
      const expected: string = '1.4 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4100
     * @tc.name AppFsSpace_Format_0401
     * @tc.desc bytes=1476395007 precision=2; GiB 1 plus three eighths; one byte below tie
     */
    it('AppFsSpace_Format_0401', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0401';
      const bytes: number = 1476395007;
      const precision: number = 2;
      const expected: string = '1.37 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4200
     * @tc.name AppFsSpace_Format_0402
     * @tc.desc bytes=1476395009 precision=2; GiB 1 plus three eighths; one byte above tie
     */
    it('AppFsSpace_Format_0402', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0402';
      const bytes: number = 1476395009;
      const precision: number = 2;
      const expected: string = '1.38 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4300
     * @tc.name AppFsSpace_Format_0403
     * @tc.desc bytes=1610612735 precision=0; GiB 1 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0403', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0403';
      const bytes: number = 1610612735;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4400
     * @tc.name AppFsSpace_Format_0404
     * @tc.desc bytes=1610612737 precision=0; GiB 1 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0404', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0404';
      const bytes: number = 1610612737;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9600
     * @tc.name AppFsSpace_Format_0405
     * @tc.desc bytes=1879048192 precision=0; GiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0405', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0405';
      const bytes: number = 1879048192;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9700
     * @tc.name AppFsSpace_Format_0406
     * @tc.desc bytes=1879048192 precision=1; GiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0406', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0406';
      const bytes: number = 1879048192;
      const precision: number = 1;
      const expected: string = '1.8 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9800
     * @tc.name AppFsSpace_Format_0407
     * @tc.desc bytes=1879048192 precision=2; GiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0407', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0407';
      const bytes: number = 1879048192;
      const precision: number = 2;
      const expected: string = '1.75 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_9900
     * @tc.name AppFsSpace_Format_0408
     * @tc.desc bytes=1879048192 precision=3; GiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0408', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0408';
      const bytes: number = 1879048192;
      const precision: number = 3;
      const expected: string = '1.750 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10000
     * @tc.name AppFsSpace_Format_0409
     * @tc.desc bytes=1879048192 precision=default; GiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0409', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0409';
      const bytes: number = 1879048192;
      const expected: string = '1.8 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4500
     * @tc.name AppFsSpace_Format_0410
     * @tc.desc bytes=1879048191 precision=1; GiB 1 plus three quarters; one byte below tie
     */
    it('AppFsSpace_Format_0410', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0410';
      const bytes: number = 1879048191;
      const precision: number = 1;
      const expected: string = '1.7 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4600
     * @tc.name AppFsSpace_Format_0411
     * @tc.desc bytes=1879048193 precision=1; GiB 1 plus three quarters; one byte above tie
     */
    it('AppFsSpace_Format_0411', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0411';
      const bytes: number = 1879048193;
      const precision: number = 1;
      const expected: string = '1.8 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10100
     * @tc.name AppFsSpace_Format_0412
     * @tc.desc bytes=2013265920 precision=0; GiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0412', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0412';
      const bytes: number = 2013265920;
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
  });
}
