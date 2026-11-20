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

export default function storageFormat05Test(): void {
  describe('StorageFormat05', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10200
     * @tc.name AppFsSpace_Format_0413
     * @tc.desc bytes=2013265920 precision=1; GiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0413', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0413';
      const bytes: number = 2013265920;
      const precision: number = 1;
      const expected: string = '1.9 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10300
     * @tc.name AppFsSpace_Format_0414
     * @tc.desc bytes=2013265920 precision=2; GiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0414', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0414';
      const bytes: number = 2013265920;
      const precision: number = 2;
      const expected: string = '1.88 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10400
     * @tc.name AppFsSpace_Format_0415
     * @tc.desc bytes=2013265920 precision=3; GiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0415', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0415';
      const bytes: number = 2013265920;
      const precision: number = 3;
      const expected: string = '1.875 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10500
     * @tc.name AppFsSpace_Format_0416
     * @tc.desc bytes=2013265920 precision=default; GiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0416', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0416';
      const bytes: number = 2013265920;
      const expected: string = '1.9 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4700
     * @tc.name AppFsSpace_Format_0417
     * @tc.desc bytes=2013265919 precision=2; GiB 1 plus seven eighths; one byte below tie
     */
    it('AppFsSpace_Format_0417', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0417';
      const bytes: number = 2013265919;
      const precision: number = 2;
      const expected: string = '1.87 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4800
     * @tc.name AppFsSpace_Format_0418
     * @tc.desc bytes=2013265921 precision=2; GiB 1 plus seven eighths; one byte above tie
     */
    it('AppFsSpace_Format_0418', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0418';
      const bytes: number = 2013265921;
      const precision: number = 2;
      const expected: string = '1.88 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10600
     * @tc.name AppFsSpace_Format_0419
     * @tc.desc bytes=3355443200 precision=0; GiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0419', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0419';
      const bytes: number = 3355443200;
      const precision: number = 0;
      const expected: string = '3 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10700
     * @tc.name AppFsSpace_Format_0420
     * @tc.desc bytes=3355443200 precision=1; GiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0420', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0420';
      const bytes: number = 3355443200;
      const precision: number = 1;
      const expected: string = '3.1 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10800
     * @tc.name AppFsSpace_Format_0421
     * @tc.desc bytes=3355443200 precision=2; GiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0421', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0421';
      const bytes: number = 3355443200;
      const precision: number = 2;
      const expected: string = '3.13 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_10900
     * @tc.name AppFsSpace_Format_0422
     * @tc.desc bytes=3355443200 precision=3; GiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0422', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0422';
      const bytes: number = 3355443200;
      const precision: number = 3;
      const expected: string = '3.125 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11000
     * @tc.name AppFsSpace_Format_0423
     * @tc.desc bytes=3355443200 precision=default; GiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0423', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0423';
      const bytes: number = 3355443200;
      const expected: string = '3.1 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_4900
     * @tc.name AppFsSpace_Format_0424
     * @tc.desc bytes=3355443199 precision=2; GiB 3 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0424', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0424';
      const bytes: number = 3355443199;
      const precision: number = 2;
      const expected: string = '3.12 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5000
     * @tc.name AppFsSpace_Format_0425
     * @tc.desc bytes=3355443201 precision=2; GiB 3 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0425', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0425';
      const bytes: number = 3355443201;
      const precision: number = 2;
      const expected: string = '3.13 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11100
     * @tc.name AppFsSpace_Format_0426
     * @tc.desc bytes=3489660928 precision=0; GiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0426', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0426';
      const bytes: number = 3489660928;
      const precision: number = 0;
      const expected: string = '3 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11200
     * @tc.name AppFsSpace_Format_0427
     * @tc.desc bytes=3489660928 precision=1; GiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0427', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0427';
      const bytes: number = 3489660928;
      const precision: number = 1;
      const expected: string = '3.3 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11300
     * @tc.name AppFsSpace_Format_0428
     * @tc.desc bytes=3489660928 precision=2; GiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0428', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0428';
      const bytes: number = 3489660928;
      const precision: number = 2;
      const expected: string = '3.25 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11400
     * @tc.name AppFsSpace_Format_0429
     * @tc.desc bytes=3489660928 precision=3; GiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0429', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0429';
      const bytes: number = 3489660928;
      const precision: number = 3;
      const expected: string = '3.250 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11500
     * @tc.name AppFsSpace_Format_0430
     * @tc.desc bytes=3489660928 precision=default; GiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0430', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0430';
      const bytes: number = 3489660928;
      const expected: string = '3.3 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5100
     * @tc.name AppFsSpace_Format_0431
     * @tc.desc bytes=3489660927 precision=1; GiB 3 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0431', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0431';
      const bytes: number = 3489660927;
      const precision: number = 1;
      const expected: string = '3.2 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5200
     * @tc.name AppFsSpace_Format_0432
     * @tc.desc bytes=3489660929 precision=1; GiB 3 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0432', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0432';
      const bytes: number = 3489660929;
      const precision: number = 1;
      const expected: string = '3.3 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11600
     * @tc.name AppFsSpace_Format_0433
     * @tc.desc bytes=3758096384 precision=0; GiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0433', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0433';
      const bytes: number = 3758096384;
      const precision: number = 0;
      const expected: string = '4 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11700
     * @tc.name AppFsSpace_Format_0434
     * @tc.desc bytes=3758096384 precision=1; GiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0434', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0434';
      const bytes: number = 3758096384;
      const precision: number = 1;
      const expected: string = '3.5 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11800
     * @tc.name AppFsSpace_Format_0435
     * @tc.desc bytes=3758096384 precision=2; GiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0435', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0435';
      const bytes: number = 3758096384;
      const precision: number = 2;
      const expected: string = '3.50 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_11900
     * @tc.name AppFsSpace_Format_0436
     * @tc.desc bytes=3758096384 precision=3; GiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0436', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0436';
      const bytes: number = 3758096384;
      const precision: number = 3;
      const expected: string = '3.500 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12000
     * @tc.name AppFsSpace_Format_0437
     * @tc.desc bytes=3758096384 precision=default; GiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0437', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0437';
      const bytes: number = 3758096384;
      const expected: string = '3.5 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5300
     * @tc.name AppFsSpace_Format_0438
     * @tc.desc bytes=3758096383 precision=0; GiB 3 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0438', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0438';
      const bytes: number = 3758096383;
      const precision: number = 0;
      const expected: string = '3 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5400
     * @tc.name AppFsSpace_Format_0439
     * @tc.desc bytes=3758096385 precision=0; GiB 3 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0439', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0439';
      const bytes: number = 3758096385;
      const precision: number = 0;
      const expected: string = '4 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_2900
     * @tc.name AppFsSpace_Format_0440
     * @tc.desc bytes=1140850688 precision=0; GiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0440', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0440';
      const bytes: number = 1140850688;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3000
     * @tc.name AppFsSpace_Format_0441
     * @tc.desc bytes=1140850688 precision=1; GiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0441', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0441';
      const bytes: number = 1140850688;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3100
     * @tc.name AppFsSpace_Format_0442
     * @tc.desc bytes=1140850688 precision=2; GiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0442', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0442';
      const bytes: number = 1140850688;
      const precision: number = 2;
      const expected: string = '1.06 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3200
     * @tc.name AppFsSpace_Format_0443
     * @tc.desc bytes=1140850688 precision=3; GiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0443', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0443';
      const bytes: number = 1140850688;
      const precision: number = 3;
      const expected: string = '1.063 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3300
     * @tc.name AppFsSpace_Format_0444
     * @tc.desc bytes=1140850688 precision=default; GiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0444', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0444';
      const bytes: number = 1140850688;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3400
     * @tc.name AppFsSpace_Format_0445
     * @tc.desc bytes=1140850687 precision=3; GiB below 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0445', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0445';
      const bytes: number = 1140850687;
      const precision: number = 3;
      const expected: string = '1.062 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3500
     * @tc.name AppFsSpace_Format_0446
     * @tc.desc bytes=1140850689 precision=3; GiB above 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0446', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0446';
      const bytes: number = 1140850689;
      const precision: number = 3;
      const expected: string = '1.063 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3600
     * @tc.name AppFsSpace_Format_0447
     * @tc.desc bytes=1275068416 precision=0; GiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0447', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0447';
      const bytes: number = 1275068416;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3700
     * @tc.name AppFsSpace_Format_0448
     * @tc.desc bytes=1275068416 precision=1; GiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0448', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0448';
      const bytes: number = 1275068416;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3800
     * @tc.name AppFsSpace_Format_0449
     * @tc.desc bytes=1275068416 precision=2; GiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0449', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0449';
      const bytes: number = 1275068416;
      const precision: number = 2;
      const expected: string = '1.19 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_3900
     * @tc.name AppFsSpace_Format_0450
     * @tc.desc bytes=1275068416 precision=3; GiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0450', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0450';
      const bytes: number = 1275068416;
      const precision: number = 3;
      const expected: string = '1.188 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4000
     * @tc.name AppFsSpace_Format_0451
     * @tc.desc bytes=1275068416 precision=default; GiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0451', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0451';
      const bytes: number = 1275068416;
      const expected: string = '1.2 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4100
     * @tc.name AppFsSpace_Format_0452
     * @tc.desc bytes=1275068415 precision=3; GiB below 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0452', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0452';
      const bytes: number = 1275068415;
      const precision: number = 3;
      const expected: string = '1.187 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4200
     * @tc.name AppFsSpace_Format_0453
     * @tc.desc bytes=1275068417 precision=3; GiB above 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0453', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0453';
      const bytes: number = 1275068417;
      const precision: number = 3;
      const expected: string = '1.188 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4300
     * @tc.name AppFsSpace_Format_0454
     * @tc.desc bytes=1097498361856 precision=0; GiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0454', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0454';
      const bytes: number = 1097498361856;
      const precision: number = 0;
      const expected: string = '1022 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4400
     * @tc.name AppFsSpace_Format_0455
     * @tc.desc bytes=1097498361856 precision=1; GiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0455', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0455';
      const bytes: number = 1097498361856;
      const precision: number = 1;
      const expected: string = '1022.1 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4500
     * @tc.name AppFsSpace_Format_0456
     * @tc.desc bytes=1097498361856 precision=2; GiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0456', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0456';
      const bytes: number = 1097498361856;
      const precision: number = 2;
      const expected: string = '1022.13 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4600
     * @tc.name AppFsSpace_Format_0457
     * @tc.desc bytes=1097498361856 precision=3; GiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0457', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0457';
      const bytes: number = 1097498361856;
      const precision: number = 3;
      const expected: string = '1022.125 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4700
     * @tc.name AppFsSpace_Format_0458
     * @tc.desc bytes=1097498361856 precision=default; GiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0458', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0458';
      const bytes: number = 1097498361856;
      const expected: string = '1022.1 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4800
     * @tc.name AppFsSpace_Format_0459
     * @tc.desc bytes=1097498361855 precision=2; GiB 1022 below one eighth tie
     */
    it('AppFsSpace_Format_0459', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0459';
      const bytes: number = 1097498361855;
      const precision: number = 2;
      const expected: string = '1022.12 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_4900
     * @tc.name AppFsSpace_Format_0460
     * @tc.desc bytes=1097498361857 precision=2; GiB 1022 above one eighth tie
     */
    it('AppFsSpace_Format_0460', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0460';
      const bytes: number = 1097498361857;
      const precision: number = 2;
      const expected: string = '1022.13 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5000
     * @tc.name AppFsSpace_Format_0461
     * @tc.desc bytes=1097632579584 precision=0; GiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0461', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0461';
      const bytes: number = 1097632579584;
      const precision: number = 0;
      const expected: string = '1022 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5100
     * @tc.name AppFsSpace_Format_0462
     * @tc.desc bytes=1097632579584 precision=1; GiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0462', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0462';
      const bytes: number = 1097632579584;
      const precision: number = 1;
      const expected: string = '1022.3 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5200
     * @tc.name AppFsSpace_Format_0463
     * @tc.desc bytes=1097632579584 precision=2; GiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0463', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0463';
      const bytes: number = 1097632579584;
      const precision: number = 2;
      const expected: string = '1022.25 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5300
     * @tc.name AppFsSpace_Format_0464
     * @tc.desc bytes=1097632579584 precision=3; GiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0464', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0464';
      const bytes: number = 1097632579584;
      const precision: number = 3;
      const expected: string = '1022.250 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5400
     * @tc.name AppFsSpace_Format_0465
     * @tc.desc bytes=1097632579584 precision=default; GiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0465', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0465';
      const bytes: number = 1097632579584;
      const expected: string = '1022.3 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5500
     * @tc.name AppFsSpace_Format_0466
     * @tc.desc bytes=1097632579583 precision=1; GiB 1022 below one quarter tie
     */
    it('AppFsSpace_Format_0466', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0466';
      const bytes: number = 1097632579583;
      const precision: number = 1;
      const expected: string = '1022.2 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5600
     * @tc.name AppFsSpace_Format_0467
     * @tc.desc bytes=1097632579585 precision=1; GiB 1022 above one quarter tie
     */
    it('AppFsSpace_Format_0467', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0467';
      const bytes: number = 1097632579585;
      const precision: number = 1;
      const expected: string = '1022.3 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5700
     * @tc.name AppFsSpace_Format_0468
     * @tc.desc bytes=1097901015040 precision=0; GiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0468', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0468';
      const bytes: number = 1097901015040;
      const precision: number = 0;
      const expected: string = '1023 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5800
     * @tc.name AppFsSpace_Format_0469
     * @tc.desc bytes=1097901015040 precision=1; GiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0469', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0469';
      const bytes: number = 1097901015040;
      const precision: number = 1;
      const expected: string = '1022.5 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_5900
     * @tc.name AppFsSpace_Format_0470
     * @tc.desc bytes=1097901015040 precision=2; GiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0470', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0470';
      const bytes: number = 1097901015040;
      const precision: number = 2;
      const expected: string = '1022.50 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6000
     * @tc.name AppFsSpace_Format_0471
     * @tc.desc bytes=1097901015040 precision=3; GiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0471', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0471';
      const bytes: number = 1097901015040;
      const precision: number = 3;
      const expected: string = '1022.500 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6100
     * @tc.name AppFsSpace_Format_0472
     * @tc.desc bytes=1097901015040 precision=default; GiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0472', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0472';
      const bytes: number = 1097901015040;
      const expected: string = '1022.5 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6200
     * @tc.name AppFsSpace_Format_0473
     * @tc.desc bytes=1097901015039 precision=0; GiB 1022 below one half tie
     */
    it('AppFsSpace_Format_0473', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0473';
      const bytes: number = 1097901015039;
      const precision: number = 0;
      const expected: string = '1022 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6300
     * @tc.name AppFsSpace_Format_0474
     * @tc.desc bytes=1097901015041 precision=0; GiB 1022 above one half tie
     */
    it('AppFsSpace_Format_0474', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0474';
      const bytes: number = 1097901015041;
      const precision: number = 0;
      const expected: string = '1023 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3100
     * @tc.name AppFsSpace_Format_0475
     * @tc.desc bytes=2147483648 precision=0; GiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0475', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0475';
      const bytes: number = 2147483648;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3200
     * @tc.name AppFsSpace_Format_0476
     * @tc.desc bytes=2147483648 precision=1; GiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0476', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0476';
      const bytes: number = 2147483648;
      const precision: number = 1;
      const expected: string = '2.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3300
     * @tc.name AppFsSpace_Format_0477
     * @tc.desc bytes=2147483648 precision=2; GiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0477', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0477';
      const bytes: number = 2147483648;
      const precision: number = 2;
      const expected: string = '2.00 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3400
     * @tc.name AppFsSpace_Format_0478
     * @tc.desc bytes=2147483648 precision=3; GiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0478', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0478';
      const bytes: number = 2147483648;
      const precision: number = 3;
      const expected: string = '2.000 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3500
     * @tc.name AppFsSpace_Format_0479
     * @tc.desc bytes=2147483648 precision=default; GiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0479', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0479';
      const bytes: number = 2147483648;
      const expected: string = '2.0 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3600
     * @tc.name AppFsSpace_Format_0480
     * @tc.desc bytes=3221225472 precision=0; GiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0480', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0480';
      const bytes: number = 3221225472;
      const precision: number = 0;
      const expected: string = '3 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3700
     * @tc.name AppFsSpace_Format_0481
     * @tc.desc bytes=3221225472 precision=1; GiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0481', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0481';
      const bytes: number = 3221225472;
      const precision: number = 1;
      const expected: string = '3.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3800
     * @tc.name AppFsSpace_Format_0482
     * @tc.desc bytes=3221225472 precision=2; GiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0482', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0482';
      const bytes: number = 3221225472;
      const precision: number = 2;
      const expected: string = '3.00 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_3900
     * @tc.name AppFsSpace_Format_0483
     * @tc.desc bytes=3221225472 precision=3; GiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0483', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0483';
      const bytes: number = 3221225472;
      const precision: number = 3;
      const expected: string = '3.000 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4000
     * @tc.name AppFsSpace_Format_0484
     * @tc.desc bytes=3221225472 precision=default; GiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0484', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0484';
      const bytes: number = 3221225472;
      const expected: string = '3.0 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4100
     * @tc.name AppFsSpace_Format_0485
     * @tc.desc bytes=7516192768 precision=0; GiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0485', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0485';
      const bytes: number = 7516192768;
      const precision: number = 0;
      const expected: string = '7 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4200
     * @tc.name AppFsSpace_Format_0486
     * @tc.desc bytes=7516192768 precision=1; GiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0486', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0486';
      const bytes: number = 7516192768;
      const precision: number = 1;
      const expected: string = '7.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4300
     * @tc.name AppFsSpace_Format_0487
     * @tc.desc bytes=7516192768 precision=2; GiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0487', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0487';
      const bytes: number = 7516192768;
      const precision: number = 2;
      const expected: string = '7.00 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4400
     * @tc.name AppFsSpace_Format_0488
     * @tc.desc bytes=7516192768 precision=3; GiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0488', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0488';
      const bytes: number = 7516192768;
      const precision: number = 3;
      const expected: string = '7.000 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4500
     * @tc.name AppFsSpace_Format_0489
     * @tc.desc bytes=7516192768 precision=default; GiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0489', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0489';
      const bytes: number = 7516192768;
      const expected: string = '7.0 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12100
     * @tc.name AppFsSpace_Format_0490
     * @tc.desc bytes=1236950581248 precision=0; TiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0490', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0490';
      const bytes: number = 1236950581248;
      const precision: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12200
     * @tc.name AppFsSpace_Format_0491
     * @tc.desc bytes=1236950581248 precision=1; TiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0491', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0491';
      const bytes: number = 1236950581248;
      const precision: number = 1;
      const expected: string = '1.1 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12300
     * @tc.name AppFsSpace_Format_0492
     * @tc.desc bytes=1236950581248 precision=2; TiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0492', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0492';
      const bytes: number = 1236950581248;
      const precision: number = 2;
      const expected: string = '1.13 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12400
     * @tc.name AppFsSpace_Format_0493
     * @tc.desc bytes=1236950581248 precision=3; TiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0493', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0493';
      const bytes: number = 1236950581248;
      const precision: number = 3;
      const expected: string = '1.125 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12500
     * @tc.name AppFsSpace_Format_0494
     * @tc.desc bytes=1236950581248 precision=default; TiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0494', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0494';
      const bytes: number = 1236950581248;
      const expected: string = '1.1 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5500
     * @tc.name AppFsSpace_Format_0495
     * @tc.desc bytes=1236950581247 precision=2; TiB 1 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0495', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0495';
      const bytes: number = 1236950581247;
      const precision: number = 2;
      const expected: string = '1.12 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5600
     * @tc.name AppFsSpace_Format_0496
     * @tc.desc bytes=1236950581249 precision=2; TiB 1 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0496', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0496';
      const bytes: number = 1236950581249;
      const precision: number = 2;
      const expected: string = '1.13 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12600
     * @tc.name AppFsSpace_Format_0497
     * @tc.desc bytes=1374389534720 precision=0; TiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0497', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0497';
      const bytes: number = 1374389534720;
      const precision: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12700
     * @tc.name AppFsSpace_Format_0498
     * @tc.desc bytes=1374389534720 precision=1; TiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0498', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0498';
      const bytes: number = 1374389534720;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12800
     * @tc.name AppFsSpace_Format_0499
     * @tc.desc bytes=1374389534720 precision=2; TiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0499', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0499';
      const bytes: number = 1374389534720;
      const precision: number = 2;
      const expected: string = '1.25 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_12900
     * @tc.name AppFsSpace_Format_0500
     * @tc.desc bytes=1374389534720 precision=3; TiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0500', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0500';
      const bytes: number = 1374389534720;
      const precision: number = 3;
      const expected: string = '1.250 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13000
     * @tc.name AppFsSpace_Format_0501
     * @tc.desc bytes=1374389534720 precision=default; TiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0501', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0501';
      const bytes: number = 1374389534720;
      const expected: string = '1.3 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5700
     * @tc.name AppFsSpace_Format_0502
     * @tc.desc bytes=1374389534719 precision=1; TiB 1 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0502', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0502';
      const bytes: number = 1374389534719;
      const precision: number = 1;
      const expected: string = '1.2 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5800
     * @tc.name AppFsSpace_Format_0503
     * @tc.desc bytes=1374389534721 precision=1; TiB 1 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0503', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0503';
      const bytes: number = 1374389534721;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13100
     * @tc.name AppFsSpace_Format_0504
     * @tc.desc bytes=1511828488192 precision=0; TiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0504', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0504';
      const bytes: number = 1511828488192;
      const precision: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13200
     * @tc.name AppFsSpace_Format_0505
     * @tc.desc bytes=1511828488192 precision=1; TiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0505', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0505';
      const bytes: number = 1511828488192;
      const precision: number = 1;
      const expected: string = '1.4 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13300
     * @tc.name AppFsSpace_Format_0506
     * @tc.desc bytes=1511828488192 precision=2; TiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0506', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0506';
      const bytes: number = 1511828488192;
      const precision: number = 2;
      const expected: string = '1.38 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13400
     * @tc.name AppFsSpace_Format_0507
     * @tc.desc bytes=1511828488192 precision=3; TiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0507', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0507';
      const bytes: number = 1511828488192;
      const precision: number = 3;
      const expected: string = '1.375 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13500
     * @tc.name AppFsSpace_Format_0508
     * @tc.desc bytes=1511828488192 precision=default; TiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0508', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0508';
      const bytes: number = 1511828488192;
      const expected: string = '1.4 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_5900
     * @tc.name AppFsSpace_Format_0509
     * @tc.desc bytes=1511828488191 precision=2; TiB 1 plus three eighths; one byte below tie
     */
    it('AppFsSpace_Format_0509', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0509';
      const bytes: number = 1511828488191;
      const precision: number = 2;
      const expected: string = '1.37 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6000
     * @tc.name AppFsSpace_Format_0510
     * @tc.desc bytes=1511828488193 precision=2; TiB 1 plus three eighths; one byte above tie
     */
    it('AppFsSpace_Format_0510', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0510';
      const bytes: number = 1511828488193;
      const precision: number = 2;
      const expected: string = '1.38 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6100
     * @tc.name AppFsSpace_Format_0511
     * @tc.desc bytes=1649267441663 precision=0; TiB 1 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0511', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0511';
      const bytes: number = 1649267441663;
      const precision: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6200
     * @tc.name AppFsSpace_Format_0512
     * @tc.desc bytes=1649267441665 precision=0; TiB 1 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0512', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0512';
      const bytes: number = 1649267441665;
      const precision: number = 0;
      const expected: string = '2 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13600
     * @tc.name AppFsSpace_Format_0513
     * @tc.desc bytes=1924145348608 precision=0; TiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0513', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0513';
      const bytes: number = 1924145348608;
      const precision: number = 0;
      const expected: string = '2 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13700
     * @tc.name AppFsSpace_Format_0514
     * @tc.desc bytes=1924145348608 precision=1; TiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0514', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0514';
      const bytes: number = 1924145348608;
      const precision: number = 1;
      const expected: string = '1.8 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13800
     * @tc.name AppFsSpace_Format_0515
     * @tc.desc bytes=1924145348608 precision=2; TiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0515', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0515';
      const bytes: number = 1924145348608;
      const precision: number = 2;
      const expected: string = '1.75 TiB';
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
