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

export default function storageFormat07Test(): void {
  describe('StorageFormat07', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_7900
     * @tc.name AppFsSpace_Format_0619
     * @tc.desc bytes=1688849860263935 precision=0; PiB 1 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0619', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0619';
      const bytes: number = 1688849860263935;
      const precision: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8000
     * @tc.name AppFsSpace_Format_0620
     * @tc.desc bytes=1688849860263937 precision=0; PiB 1 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0620', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0620';
      const bytes: number = 1688849860263937;
      const precision: number = 0;
      const expected: string = '2 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17600
     * @tc.name AppFsSpace_Format_0621
     * @tc.desc bytes=1970324836974592 precision=0; PiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0621', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0621';
      const bytes: number = 1970324836974592;
      const precision: number = 0;
      const expected: string = '2 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17700
     * @tc.name AppFsSpace_Format_0622
     * @tc.desc bytes=1970324836974592 precision=1; PiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0622', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0622';
      const bytes: number = 1970324836974592;
      const precision: number = 1;
      const expected: string = '1.8 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17800
     * @tc.name AppFsSpace_Format_0623
     * @tc.desc bytes=1970324836974592 precision=2; PiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0623', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0623';
      const bytes: number = 1970324836974592;
      const precision: number = 2;
      const expected: string = '1.75 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17900
     * @tc.name AppFsSpace_Format_0624
     * @tc.desc bytes=1970324836974592 precision=3; PiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0624', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0624';
      const bytes: number = 1970324836974592;
      const precision: number = 3;
      const expected: string = '1.750 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18000
     * @tc.name AppFsSpace_Format_0625
     * @tc.desc bytes=1970324836974592 precision=default; PiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0625', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0625';
      const bytes: number = 1970324836974592;
      const expected: string = '1.8 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8100
     * @tc.name AppFsSpace_Format_0626
     * @tc.desc bytes=1970324836974591 precision=1; PiB 1 plus three quarters; one byte below tie
     */
    it('AppFsSpace_Format_0626', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0626';
      const bytes: number = 1970324836974591;
      const precision: number = 1;
      const expected: string = '1.7 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8200
     * @tc.name AppFsSpace_Format_0627
     * @tc.desc bytes=1970324836974593 precision=1; PiB 1 plus three quarters; one byte above tie
     */
    it('AppFsSpace_Format_0627', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0627';
      const bytes: number = 1970324836974593;
      const precision: number = 1;
      const expected: string = '1.8 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18100
     * @tc.name AppFsSpace_Format_0628
     * @tc.desc bytes=2111062325329920 precision=0; PiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0628', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0628';
      const bytes: number = 2111062325329920;
      const precision: number = 0;
      const expected: string = '2 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18200
     * @tc.name AppFsSpace_Format_0629
     * @tc.desc bytes=2111062325329920 precision=1; PiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0629', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0629';
      const bytes: number = 2111062325329920;
      const precision: number = 1;
      const expected: string = '1.9 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18300
     * @tc.name AppFsSpace_Format_0630
     * @tc.desc bytes=2111062325329920 precision=2; PiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0630', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0630';
      const bytes: number = 2111062325329920;
      const precision: number = 2;
      const expected: string = '1.88 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18400
     * @tc.name AppFsSpace_Format_0631
     * @tc.desc bytes=2111062325329920 precision=3; PiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0631', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0631';
      const bytes: number = 2111062325329920;
      const precision: number = 3;
      const expected: string = '1.875 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18500
     * @tc.name AppFsSpace_Format_0632
     * @tc.desc bytes=2111062325329920 precision=default; PiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0632', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0632';
      const bytes: number = 2111062325329920;
      const expected: string = '1.9 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8300
     * @tc.name AppFsSpace_Format_0633
     * @tc.desc bytes=2111062325329919 precision=2; PiB 1 plus seven eighths; one byte below tie
     */
    it('AppFsSpace_Format_0633', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0633';
      const bytes: number = 2111062325329919;
      const precision: number = 2;
      const expected: string = '1.87 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8400
     * @tc.name AppFsSpace_Format_0634
     * @tc.desc bytes=2111062325329921 precision=2; PiB 1 plus seven eighths; one byte above tie
     */
    it('AppFsSpace_Format_0634', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0634';
      const bytes: number = 2111062325329921;
      const precision: number = 2;
      const expected: string = '1.88 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18600
     * @tc.name AppFsSpace_Format_0635
     * @tc.desc bytes=3518437208883200 precision=0; PiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0635', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0635';
      const bytes: number = 3518437208883200;
      const precision: number = 0;
      const expected: string = '3 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18700
     * @tc.name AppFsSpace_Format_0636
     * @tc.desc bytes=3518437208883200 precision=1; PiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0636', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0636';
      const bytes: number = 3518437208883200;
      const precision: number = 1;
      const expected: string = '3.1 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18800
     * @tc.name AppFsSpace_Format_0637
     * @tc.desc bytes=3518437208883200 precision=2; PiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0637', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0637';
      const bytes: number = 3518437208883200;
      const precision: number = 2;
      const expected: string = '3.13 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_18900
     * @tc.name AppFsSpace_Format_0638
     * @tc.desc bytes=3518437208883200 precision=3; PiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0638', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0638';
      const bytes: number = 3518437208883200;
      const precision: number = 3;
      const expected: string = '3.125 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19000
     * @tc.name AppFsSpace_Format_0639
     * @tc.desc bytes=3518437208883200 precision=default; PiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0639', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0639';
      const bytes: number = 3518437208883200;
      const expected: string = '3.1 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8500
     * @tc.name AppFsSpace_Format_0640
     * @tc.desc bytes=3518437208883199 precision=2; PiB 3 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0640', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0640';
      const bytes: number = 3518437208883199;
      const precision: number = 2;
      const expected: string = '3.12 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8600
     * @tc.name AppFsSpace_Format_0641
     * @tc.desc bytes=3518437208883201 precision=2; PiB 3 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0641', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0641';
      const bytes: number = 3518437208883201;
      const precision: number = 2;
      const expected: string = '3.13 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19100
     * @tc.name AppFsSpace_Format_0642
     * @tc.desc bytes=3659174697238528 precision=0; PiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0642', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0642';
      const bytes: number = 3659174697238528;
      const precision: number = 0;
      const expected: string = '3 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19200
     * @tc.name AppFsSpace_Format_0643
     * @tc.desc bytes=3659174697238528 precision=1; PiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0643', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0643';
      const bytes: number = 3659174697238528;
      const precision: number = 1;
      const expected: string = '3.3 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19300
     * @tc.name AppFsSpace_Format_0644
     * @tc.desc bytes=3659174697238528 precision=2; PiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0644', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0644';
      const bytes: number = 3659174697238528;
      const precision: number = 2;
      const expected: string = '3.25 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19400
     * @tc.name AppFsSpace_Format_0645
     * @tc.desc bytes=3659174697238528 precision=3; PiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0645', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0645';
      const bytes: number = 3659174697238528;
      const precision: number = 3;
      const expected: string = '3.250 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19500
     * @tc.name AppFsSpace_Format_0646
     * @tc.desc bytes=3659174697238528 precision=default; PiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0646', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0646';
      const bytes: number = 3659174697238528;
      const expected: string = '3.3 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8700
     * @tc.name AppFsSpace_Format_0647
     * @tc.desc bytes=3659174697238527 precision=1; PiB 3 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0647', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0647';
      const bytes: number = 3659174697238527;
      const precision: number = 1;
      const expected: string = '3.2 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8800
     * @tc.name AppFsSpace_Format_0648
     * @tc.desc bytes=3659174697238529 precision=1; PiB 3 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0648', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0648';
      const bytes: number = 3659174697238529;
      const precision: number = 1;
      const expected: string = '3.3 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19600
     * @tc.name AppFsSpace_Format_0649
     * @tc.desc bytes=3940649673949184 precision=0; PiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0649', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0649';
      const bytes: number = 3940649673949184;
      const precision: number = 0;
      const expected: string = '4 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19700
     * @tc.name AppFsSpace_Format_0650
     * @tc.desc bytes=3940649673949184 precision=1; PiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0650', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0650';
      const bytes: number = 3940649673949184;
      const precision: number = 1;
      const expected: string = '3.5 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19800
     * @tc.name AppFsSpace_Format_0651
     * @tc.desc bytes=3940649673949184 precision=2; PiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0651', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0651';
      const bytes: number = 3940649673949184;
      const precision: number = 2;
      const expected: string = '3.50 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_19900
     * @tc.name AppFsSpace_Format_0652
     * @tc.desc bytes=3940649673949184 precision=3; PiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0652', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0652';
      const bytes: number = 3940649673949184;
      const precision: number = 3;
      const expected: string = '3.500 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_20000
     * @tc.name AppFsSpace_Format_0653
     * @tc.desc bytes=3940649673949184 precision=default; PiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0653', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0653';
      const bytes: number = 3940649673949184;
      const expected: string = '3.5 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_8900
     * @tc.name AppFsSpace_Format_0654
     * @tc.desc bytes=3940649673949183 precision=0; PiB 3 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0654', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0654';
      const bytes: number = 3940649673949183;
      const precision: number = 0;
      const expected: string = '3 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_9000
     * @tc.name AppFsSpace_Format_0655
     * @tc.desc bytes=3940649673949185 precision=0; PiB 3 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0655', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0655';
      const bytes: number = 3940649673949185;
      const precision: number = 0;
      const expected: string = '4 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5700
     * @tc.name AppFsSpace_Format_0656
     * @tc.desc bytes=1196268651020288 precision=0; PiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0656', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0656';
      const bytes: number = 1196268651020288;
      const precision: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5800
     * @tc.name AppFsSpace_Format_0657
     * @tc.desc bytes=1196268651020288 precision=1; PiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0657', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0657';
      const bytes: number = 1196268651020288;
      const precision: number = 1;
      const expected: string = '1.1 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5900
     * @tc.name AppFsSpace_Format_0658
     * @tc.desc bytes=1196268651020288 precision=2; PiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0658', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0658';
      const bytes: number = 1196268651020288;
      const precision: number = 2;
      const expected: string = '1.06 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6000
     * @tc.name AppFsSpace_Format_0659
     * @tc.desc bytes=1196268651020288 precision=3; PiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0659', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0659';
      const bytes: number = 1196268651020288;
      const precision: number = 3;
      const expected: string = '1.063 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6100
     * @tc.name AppFsSpace_Format_0660
     * @tc.desc bytes=1196268651020288 precision=default; PiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0660', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0660';
      const bytes: number = 1196268651020288;
      const expected: string = '1.1 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6200
     * @tc.name AppFsSpace_Format_0661
     * @tc.desc bytes=1196268651020287 precision=3; PiB below 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0661', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0661';
      const bytes: number = 1196268651020287;
      const precision: number = 3;
      const expected: string = '1.062 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6300
     * @tc.name AppFsSpace_Format_0662
     * @tc.desc bytes=1196268651020289 precision=3; PiB above 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0662', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0662';
      const bytes: number = 1196268651020289;
      const precision: number = 3;
      const expected: string = '1.063 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6400
     * @tc.name AppFsSpace_Format_0663
     * @tc.desc bytes=1337006139375616 precision=0; PiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0663', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0663';
      const bytes: number = 1337006139375616;
      const precision: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6500
     * @tc.name AppFsSpace_Format_0664
     * @tc.desc bytes=1337006139375616 precision=1; PiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0664', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0664';
      const bytes: number = 1337006139375616;
      const precision: number = 1;
      const expected: string = '1.2 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6600
     * @tc.name AppFsSpace_Format_0665
     * @tc.desc bytes=1337006139375616 precision=2; PiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0665', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0665';
      const bytes: number = 1337006139375616;
      const precision: number = 2;
      const expected: string = '1.19 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6700
     * @tc.name AppFsSpace_Format_0666
     * @tc.desc bytes=1337006139375616 precision=3; PiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0666', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0666';
      const bytes: number = 1337006139375616;
      const precision: number = 3;
      const expected: string = '1.188 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6800
     * @tc.name AppFsSpace_Format_0667
     * @tc.desc bytes=1337006139375616 precision=default; PiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0667', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0667';
      const bytes: number = 1337006139375616;
      const expected: string = '1.2 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_6900
     * @tc.name AppFsSpace_Format_0668
     * @tc.desc bytes=1337006139375615 precision=3; PiB below 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0668', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0668';
      const bytes: number = 1337006139375615;
      const precision: number = 3;
      const expected: string = '1.187 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_7000
     * @tc.name AppFsSpace_Format_0669
     * @tc.desc bytes=1337006139375617 precision=3; PiB above 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0669', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0669';
      const bytes: number = 1337006139375617;
      const precision: number = 3;
      const expected: string = '1.188 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8500
     * @tc.name AppFsSpace_Format_0670
     * @tc.desc bytes=6896136929411072 precision=0; PiB 6 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0670', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0670';
      const bytes: number = 6896136929411072;
      const precision: number = 0;
      const expected: string = '6 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8600
     * @tc.name AppFsSpace_Format_0671
     * @tc.desc bytes=6896136929411072 precision=1; PiB 6 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0671', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0671';
      const bytes: number = 6896136929411072;
      const precision: number = 1;
      const expected: string = '6.1 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8700
     * @tc.name AppFsSpace_Format_0672
     * @tc.desc bytes=6896136929411072 precision=2; PiB 6 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0672', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0672';
      const bytes: number = 6896136929411072;
      const precision: number = 2;
      const expected: string = '6.13 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8800
     * @tc.name AppFsSpace_Format_0673
     * @tc.desc bytes=6896136929411072 precision=3; PiB 6 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0673', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0673';
      const bytes: number = 6896136929411072;
      const precision: number = 3;
      const expected: string = '6.125 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8900
     * @tc.name AppFsSpace_Format_0674
     * @tc.desc bytes=6896136929411072 precision=default; PiB 6 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0674', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0674';
      const bytes: number = 6896136929411072;
      const expected: string = '6.1 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9000
     * @tc.name AppFsSpace_Format_0675
     * @tc.desc bytes=6896136929411071 precision=2; PiB 6 below one eighth tie
     */
    it('AppFsSpace_Format_0675', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0675';
      const bytes: number = 6896136929411071;
      const precision: number = 2;
      const expected: string = '6.12 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9100
     * @tc.name AppFsSpace_Format_0676
     * @tc.desc bytes=6896136929411073 precision=2; PiB 6 above one eighth tie
     */
    it('AppFsSpace_Format_0676', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0676';
      const bytes: number = 6896136929411073;
      const precision: number = 2;
      const expected: string = '6.13 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9200
     * @tc.name AppFsSpace_Format_0677
     * @tc.desc bytes=7036874417766400 precision=0; PiB 6 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0677', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0677';
      const bytes: number = 7036874417766400;
      const precision: number = 0;
      const expected: string = '6 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9300
     * @tc.name AppFsSpace_Format_0678
     * @tc.desc bytes=7036874417766400 precision=1; PiB 6 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0678', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0678';
      const bytes: number = 7036874417766400;
      const precision: number = 1;
      const expected: string = '6.3 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9400
     * @tc.name AppFsSpace_Format_0679
     * @tc.desc bytes=7036874417766400 precision=2; PiB 6 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0679', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0679';
      const bytes: number = 7036874417766400;
      const precision: number = 2;
      const expected: string = '6.25 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9500
     * @tc.name AppFsSpace_Format_0680
     * @tc.desc bytes=7036874417766400 precision=3; PiB 6 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0680', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0680';
      const bytes: number = 7036874417766400;
      const precision: number = 3;
      const expected: string = '6.250 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9600
     * @tc.name AppFsSpace_Format_0681
     * @tc.desc bytes=7036874417766400 precision=default; PiB 6 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0681', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0681';
      const bytes: number = 7036874417766400;
      const expected: string = '6.3 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9700
     * @tc.name AppFsSpace_Format_0682
     * @tc.desc bytes=7036874417766399 precision=1; PiB 6 below one quarter tie
     */
    it('AppFsSpace_Format_0682', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0682';
      const bytes: number = 7036874417766399;
      const precision: number = 1;
      const expected: string = '6.2 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9800
     * @tc.name AppFsSpace_Format_0683
     * @tc.desc bytes=7036874417766401 precision=1; PiB 6 above one quarter tie
     */
    it('AppFsSpace_Format_0683', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0683';
      const bytes: number = 7036874417766401;
      const precision: number = 1;
      const expected: string = '6.3 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_9900
     * @tc.name AppFsSpace_Format_0684
     * @tc.desc bytes=7318349394477056 precision=0; PiB 6 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0684', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0684';
      const bytes: number = 7318349394477056;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_10000
     * @tc.name AppFsSpace_Format_0685
     * @tc.desc bytes=7318349394477056 precision=1; PiB 6 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0685', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0685';
      const bytes: number = 7318349394477056;
      const precision: number = 1;
      const expected: string = '6.5 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_10100
     * @tc.name AppFsSpace_Format_0686
     * @tc.desc bytes=7318349394477056 precision=2; PiB 6 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0686', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0686';
      const bytes: number = 7318349394477056;
      const precision: number = 2;
      const expected: string = '6.50 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_10200
     * @tc.name AppFsSpace_Format_0687
     * @tc.desc bytes=7318349394477056 precision=3; PiB 6 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0687', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0687';
      const bytes: number = 7318349394477056;
      const precision: number = 3;
      const expected: string = '6.500 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_10300
     * @tc.name AppFsSpace_Format_0688
     * @tc.desc bytes=7318349394477056 precision=default; PiB 6 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0688', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0688';
      const bytes: number = 7318349394477056;
      const expected: string = '6.5 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_10400
     * @tc.name AppFsSpace_Format_0689
     * @tc.desc bytes=7318349394477055 precision=0; PiB 6 below one half tie
     */
    it('AppFsSpace_Format_0689', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0689';
      const bytes: number = 7318349394477055;
      const precision: number = 0;
      const expected: string = '6 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_10500
     * @tc.name AppFsSpace_Format_0690
     * @tc.desc bytes=7318349394477057 precision=0; PiB 6 above one half tie
     */
    it('AppFsSpace_Format_0690', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0690';
      const bytes: number = 7318349394477057;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6100
     * @tc.name AppFsSpace_Format_0691
     * @tc.desc bytes=2251799813685248 precision=0; PiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0691', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0691';
      const bytes: number = 2251799813685248;
      const precision: number = 0;
      const expected: string = '2 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6200
     * @tc.name AppFsSpace_Format_0692
     * @tc.desc bytes=2251799813685248 precision=1; PiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0692', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0692';
      const bytes: number = 2251799813685248;
      const precision: number = 1;
      const expected: string = '2.0 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6300
     * @tc.name AppFsSpace_Format_0693
     * @tc.desc bytes=2251799813685248 precision=2; PiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0693', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0693';
      const bytes: number = 2251799813685248;
      const precision: number = 2;
      const expected: string = '2.00 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6400
     * @tc.name AppFsSpace_Format_0694
     * @tc.desc bytes=2251799813685248 precision=3; PiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0694', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0694';
      const bytes: number = 2251799813685248;
      const precision: number = 3;
      const expected: string = '2.000 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6500
     * @tc.name AppFsSpace_Format_0695
     * @tc.desc bytes=2251799813685248 precision=default; PiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0695', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0695';
      const bytes: number = 2251799813685248;
      const expected: string = '2.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6600
     * @tc.name AppFsSpace_Format_0696
     * @tc.desc bytes=3377699720527872 precision=0; PiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0696', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0696';
      const bytes: number = 3377699720527872;
      const precision: number = 0;
      const expected: string = '3 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6700
     * @tc.name AppFsSpace_Format_0697
     * @tc.desc bytes=3377699720527872 precision=1; PiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0697', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0697';
      const bytes: number = 3377699720527872;
      const precision: number = 1;
      const expected: string = '3.0 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6800
     * @tc.name AppFsSpace_Format_0698
     * @tc.desc bytes=3377699720527872 precision=2; PiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0698', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0698';
      const bytes: number = 3377699720527872;
      const precision: number = 2;
      const expected: string = '3.00 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6900
     * @tc.name AppFsSpace_Format_0699
     * @tc.desc bytes=3377699720527872 precision=3; PiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0699', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0699';
      const bytes: number = 3377699720527872;
      const precision: number = 3;
      const expected: string = '3.000 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_7000
     * @tc.name AppFsSpace_Format_0700
     * @tc.desc bytes=3377699720527872 precision=default; PiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0700', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0700';
      const bytes: number = 3377699720527872;
      const expected: string = '3.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_7100
     * @tc.name AppFsSpace_Format_0701
     * @tc.desc bytes=7881299347898368 precision=0; PiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0701', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0701';
      const bytes: number = 7881299347898368;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_7200
     * @tc.name AppFsSpace_Format_0702
     * @tc.desc bytes=7881299347898368 precision=1; PiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0702', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0702';
      const bytes: number = 7881299347898368;
      const precision: number = 1;
      const expected: string = '7.0 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_7300
     * @tc.name AppFsSpace_Format_0703
     * @tc.desc bytes=7881299347898368 precision=2; PiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0703', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0703';
      const bytes: number = 7881299347898368;
      const precision: number = 2;
      const expected: string = '7.00 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_7400
     * @tc.name AppFsSpace_Format_0704
     * @tc.desc bytes=7881299347898368 precision=3; PiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0704', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0704';
      const bytes: number = 7881299347898368;
      const precision: number = 3;
      const expected: string = '7.000 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_7500
     * @tc.name AppFsSpace_Format_0705
     * @tc.desc bytes=7881299347898368 precision=default; PiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0705', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0705';
      const bytes: number = 7881299347898368;
      const expected: string = '7.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_0100
     * @tc.name AppFsSpace_Format_0706
     * @tc.desc bytes=0 precision=0; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0706', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0706';
      const bytes: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_0200
     * @tc.name AppFsSpace_Format_0707
     * @tc.desc bytes=0 precision=1; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0707', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0707';
      const bytes: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_0300
     * @tc.name AppFsSpace_Format_0708
     * @tc.desc bytes=0 precision=2; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0708', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0708';
      const bytes: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_0400
     * @tc.name AppFsSpace_Format_0709
     * @tc.desc bytes=0 precision=3; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0709', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0709';
      const bytes: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_0500
     * @tc.name AppFsSpace_Format_0710
     * @tc.desc bytes=0 precision=default; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0710', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0710';
      const bytes: number = 0;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_0600
     * @tc.name AppFsSpace_Format_0711
     * @tc.desc bytes=1 precision=0; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0711', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0711';
      const bytes: number = 1;
      const precision: number = 0;
      const expected: string = '1 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_0700
     * @tc.name AppFsSpace_Format_0712
     * @tc.desc bytes=1 precision=1; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0712', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0712';
      const bytes: number = 1;
      const precision: number = 1;
      const expected: string = '1 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_0800
     * @tc.name AppFsSpace_Format_0713
     * @tc.desc bytes=1 precision=2; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0713', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0713';
      const bytes: number = 1;
      const precision: number = 2;
      const expected: string = '1 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_0900
     * @tc.name AppFsSpace_Format_0714
     * @tc.desc bytes=1 precision=3; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0714', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0714';
      const bytes: number = 1;
      const precision: number = 3;
      const expected: string = '1 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_1000
     * @tc.name AppFsSpace_Format_0715
     * @tc.desc bytes=1 precision=default; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0715', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0715';
      const bytes: number = 1;
      const expected: string = '1 B';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_1100
     * @tc.name AppFsSpace_Format_0716
     * @tc.desc bytes=127 precision=0; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0716', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0716';
      const bytes: number = 127;
      const precision: number = 0;
      const expected: string = '127 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_1200
     * @tc.name AppFsSpace_Format_0717
     * @tc.desc bytes=127 precision=1; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0717', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0717';
      const bytes: number = 127;
      const precision: number = 1;
      const expected: string = '127 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_1300
     * @tc.name AppFsSpace_Format_0718
     * @tc.desc bytes=127 precision=2; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0718', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0718';
      const bytes: number = 127;
      const precision: number = 2;
      const expected: string = '127 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_1400
     * @tc.name AppFsSpace_Format_0719
     * @tc.desc bytes=127 precision=3; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0719', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0719';
      const bytes: number = 127;
      const precision: number = 3;
      const expected: string = '127 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_BYTE_1500
     * @tc.name AppFsSpace_Format_0720
     * @tc.desc bytes=127 precision=default; byte interval stays integral regardless of precision
     */
    it('AppFsSpace_Format_0720', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0720';
      const bytes: number = 127;
      const expected: string = '127 B';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes);
