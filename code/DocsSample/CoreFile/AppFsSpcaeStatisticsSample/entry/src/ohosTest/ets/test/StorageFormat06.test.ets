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

export default function storageFormat06Test(): void {
  describe('StorageFormat06', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_13900
     * @tc.name AppFsSpace_Format_0516
     * @tc.desc bytes=1924145348608 precision=3; TiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0516', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0516';
      const bytes: number = 1924145348608;
      const precision: number = 3;
      const expected: string = '1.750 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14000
     * @tc.name AppFsSpace_Format_0517
     * @tc.desc bytes=1924145348608 precision=default; TiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0517', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0517';
      const bytes: number = 1924145348608;
      const expected: string = '1.8 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6300
     * @tc.name AppFsSpace_Format_0518
     * @tc.desc bytes=1924145348607 precision=1; TiB 1 plus three quarters; one byte below tie
     */
    it('AppFsSpace_Format_0518', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0518';
      const bytes: number = 1924145348607;
      const precision: number = 1;
      const expected: string = '1.7 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6400
     * @tc.name AppFsSpace_Format_0519
     * @tc.desc bytes=1924145348609 precision=1; TiB 1 plus three quarters; one byte above tie
     */
    it('AppFsSpace_Format_0519', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0519';
      const bytes: number = 1924145348609;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14100
     * @tc.name AppFsSpace_Format_0520
     * @tc.desc bytes=2061584302080 precision=0; TiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0520', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0520';
      const bytes: number = 2061584302080;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14200
     * @tc.name AppFsSpace_Format_0521
     * @tc.desc bytes=2061584302080 precision=1; TiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0521', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0521';
      const bytes: number = 2061584302080;
      const precision: number = 1;
      const expected: string = '1.9 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14300
     * @tc.name AppFsSpace_Format_0522
     * @tc.desc bytes=2061584302080 precision=2; TiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0522', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0522';
      const bytes: number = 2061584302080;
      const precision: number = 2;
      const expected: string = '1.88 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14400
     * @tc.name AppFsSpace_Format_0523
     * @tc.desc bytes=2061584302080 precision=3; TiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0523', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0523';
      const bytes: number = 2061584302080;
      const precision: number = 3;
      const expected: string = '1.875 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14500
     * @tc.name AppFsSpace_Format_0524
     * @tc.desc bytes=2061584302080 precision=default; TiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0524', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0524';
      const bytes: number = 2061584302080;
      const expected: string = '1.9 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6500
     * @tc.name AppFsSpace_Format_0525
     * @tc.desc bytes=2061584302079 precision=2; TiB 1 plus seven eighths; one byte below tie
     */
    it('AppFsSpace_Format_0525', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0525';
      const bytes: number = 2061584302079;
      const precision: number = 2;
      const expected: string = '1.87 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6600
     * @tc.name AppFsSpace_Format_0526
     * @tc.desc bytes=2061584302081 precision=2; TiB 1 plus seven eighths; one byte above tie
     */
    it('AppFsSpace_Format_0526', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0526';
      const bytes: number = 2061584302081;
      const precision: number = 2;
      const expected: string = '1.88 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14600
     * @tc.name AppFsSpace_Format_0527
     * @tc.desc bytes=3435973836800 precision=0; TiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0527', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0527';
      const bytes: number = 3435973836800;
      const precision: number = 0;
      const expected: string = '3 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14700
     * @tc.name AppFsSpace_Format_0528
     * @tc.desc bytes=3435973836800 precision=1; TiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0528', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0528';
      const bytes: number = 3435973836800;
      const precision: number = 1;
      const expected: string = '3.1 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14800
     * @tc.name AppFsSpace_Format_0529
     * @tc.desc bytes=3435973836800 precision=2; TiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0529', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0529';
      const bytes: number = 3435973836800;
      const precision: number = 2;
      const expected: string = '3.13 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_14900
     * @tc.name AppFsSpace_Format_0530
     * @tc.desc bytes=3435973836800 precision=3; TiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0530', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0530';
      const bytes: number = 3435973836800;
      const precision: number = 3;
      const expected: string = '3.125 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15000
     * @tc.name AppFsSpace_Format_0531
     * @tc.desc bytes=3435973836800 precision=default; TiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0531', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0531';
      const bytes: number = 3435973836800;
      const expected: string = '3.1 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6700
     * @tc.name AppFsSpace_Format_0532
     * @tc.desc bytes=3435973836799 precision=2; TiB 3 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0532', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0532';
      const bytes: number = 3435973836799;
      const precision: number = 2;
      const expected: string = '3.12 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6800
     * @tc.name AppFsSpace_Format_0533
     * @tc.desc bytes=3435973836801 precision=2; TiB 3 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0533', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0533';
      const bytes: number = 3435973836801;
      const precision: number = 2;
      const expected: string = '3.13 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15100
     * @tc.name AppFsSpace_Format_0534
     * @tc.desc bytes=3573412790272 precision=0; TiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0534', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0534';
      const bytes: number = 3573412790272;
      const precision: number = 0;
      const expected: string = '3 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15200
     * @tc.name AppFsSpace_Format_0535
     * @tc.desc bytes=3573412790272 precision=1; TiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0535', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0535';
      const bytes: number = 3573412790272;
      const precision: number = 1;
      const expected: string = '3.3 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15300
     * @tc.name AppFsSpace_Format_0536
     * @tc.desc bytes=3573412790272 precision=2; TiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0536', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0536';
      const bytes: number = 3573412790272;
      const precision: number = 2;
      const expected: string = '3.25 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15400
     * @tc.name AppFsSpace_Format_0537
     * @tc.desc bytes=3573412790272 precision=3; TiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0537', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0537';
      const bytes: number = 3573412790272;
      const precision: number = 3;
      const expected: string = '3.250 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15500
     * @tc.name AppFsSpace_Format_0538
     * @tc.desc bytes=3573412790272 precision=default; TiB 3 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0538', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0538';
      const bytes: number = 3573412790272;
      const expected: string = '3.3 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_6900
     * @tc.name AppFsSpace_Format_0539
     * @tc.desc bytes=3573412790271 precision=1; TiB 3 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0539', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0539';
      const bytes: number = 3573412790271;
      const precision: number = 1;
      const expected: string = '3.2 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_7000
     * @tc.name AppFsSpace_Format_0540
     * @tc.desc bytes=3573412790273 precision=1; TiB 3 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0540', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0540';
      const bytes: number = 3573412790273;
      const precision: number = 1;
      const expected: string = '3.3 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15600
     * @tc.name AppFsSpace_Format_0541
     * @tc.desc bytes=3848290697216 precision=0; TiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0541', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0541';
      const bytes: number = 3848290697216;
      const precision: number = 0;
      const expected: string = '4 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15700
     * @tc.name AppFsSpace_Format_0542
     * @tc.desc bytes=3848290697216 precision=1; TiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0542', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0542';
      const bytes: number = 3848290697216;
      const precision: number = 1;
      const expected: string = '3.5 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15800
     * @tc.name AppFsSpace_Format_0543
     * @tc.desc bytes=3848290697216 precision=2; TiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0543', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0543';
      const bytes: number = 3848290697216;
      const precision: number = 2;
      const expected: string = '3.50 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_15900
     * @tc.name AppFsSpace_Format_0544
     * @tc.desc bytes=3848290697216 precision=3; TiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0544', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0544';
      const bytes: number = 3848290697216;
      const precision: number = 3;
      const expected: string = '3.500 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16000
     * @tc.name AppFsSpace_Format_0545
     * @tc.desc bytes=3848290697216 precision=default; TiB 3 plus one half; exact binary fraction
     */
    it('AppFsSpace_Format_0545', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0545';
      const bytes: number = 3848290697216;
      const expected: string = '3.5 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_7100
     * @tc.name AppFsSpace_Format_0546
     * @tc.desc bytes=3848290697215 precision=0; TiB 3 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0546', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0546';
      const bytes: number = 3848290697215;
      const precision: number = 0;
      const expected: string = '3 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_7200
     * @tc.name AppFsSpace_Format_0547
     * @tc.desc bytes=3848290697217 precision=0; TiB 3 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0547', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0547';
      const bytes: number = 3848290697217;
      const precision: number = 0;
      const expected: string = '4 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4300
     * @tc.name AppFsSpace_Format_0548
     * @tc.desc bytes=1168231104512 precision=0; TiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0548', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0548';
      const bytes: number = 1168231104512;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4400
     * @tc.name AppFsSpace_Format_0549
     * @tc.desc bytes=1168231104512 precision=1; TiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0549', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0549';
      const bytes: number = 1168231104512;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4500
     * @tc.name AppFsSpace_Format_0550
     * @tc.desc bytes=1168231104512 precision=2; TiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0550', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0550';
      const bytes: number = 1168231104512;
      const precision: number = 2;
      const expected: string = '1.06 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4600
     * @tc.name AppFsSpace_Format_0551
     * @tc.desc bytes=1168231104512 precision=3; TiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0551', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0551';
      const bytes: number = 1168231104512;
      const precision: number = 3;
      const expected: string = '1.063 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4700
     * @tc.name AppFsSpace_Format_0552
     * @tc.desc bytes=1168231104512 precision=default; TiB 1/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0552', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0552';
      const bytes: number = 1168231104512;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4800
     * @tc.name AppFsSpace_Format_0553
     * @tc.desc bytes=1168231104511 precision=3; TiB below 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0553', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0553';
      const bytes: number = 1168231104511;
      const precision: number = 3;
      const expected: string = '1.062 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_4900
     * @tc.name AppFsSpace_Format_0554
     * @tc.desc bytes=1168231104513 precision=3; TiB above 1/16 three-digit tie
     */
    it('AppFsSpace_Format_0554', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0554';
      const bytes: number = 1168231104513;
      const precision: number = 3;
      const expected: string = '1.063 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5000
     * @tc.name AppFsSpace_Format_0555
     * @tc.desc bytes=1305670057984 precision=0; TiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0555', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0555';
      const bytes: number = 1305670057984;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5100
     * @tc.name AppFsSpace_Format_0556
     * @tc.desc bytes=1305670057984 precision=1; TiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0556', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0556';
      const bytes: number = 1305670057984;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5200
     * @tc.name AppFsSpace_Format_0557
     * @tc.desc bytes=1305670057984 precision=2; TiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0557', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0557';
      const bytes: number = 1305670057984;
      const precision: number = 2;
      const expected: string = '1.19 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5300
     * @tc.name AppFsSpace_Format_0558
     * @tc.desc bytes=1305670057984 precision=3; TiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0558', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0558';
      const bytes: number = 1305670057984;
      const precision: number = 3;
      const expected: string = '1.188 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5400
     * @tc.name AppFsSpace_Format_0559
     * @tc.desc bytes=1305670057984 precision=default; TiB 3/16; compare rounding and trailing digits
     */
    it('AppFsSpace_Format_0559', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0559';
      const bytes: number = 1305670057984;
      const expected: string = '1.2 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5500
     * @tc.name AppFsSpace_Format_0560
     * @tc.desc bytes=1305670057983 precision=3; TiB below 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0560', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0560';
      const bytes: number = 1305670057983;
      const precision: number = 3;
      const expected: string = '1.187 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_TIE_5600
     * @tc.name AppFsSpace_Format_0561
     * @tc.desc bytes=1305670057985 precision=3; TiB above 3/16 three-digit tie
     */
    it('AppFsSpace_Format_0561', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0561';
      const bytes: number = 1305670057985;
      const precision: number = 3;
      const expected: string = '1.188 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6400
     * @tc.name AppFsSpace_Format_0562
     * @tc.desc bytes=1123838322540544 precision=0; TiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0562', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0562';
      const bytes: number = 1123838322540544;
      const precision: number = 0;
      const expected: string = '1022 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6500
     * @tc.name AppFsSpace_Format_0563
     * @tc.desc bytes=1123838322540544 precision=1; TiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0563', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0563';
      const bytes: number = 1123838322540544;
      const precision: number = 1;
      const expected: string = '1022.1 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6600
     * @tc.name AppFsSpace_Format_0564
     * @tc.desc bytes=1123838322540544 precision=2; TiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0564', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0564';
      const bytes: number = 1123838322540544;
      const precision: number = 2;
      const expected: string = '1022.13 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6700
     * @tc.name AppFsSpace_Format_0565
     * @tc.desc bytes=1123838322540544 precision=3; TiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0565', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0565';
      const bytes: number = 1123838322540544;
      const precision: number = 3;
      const expected: string = '1022.125 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6800
     * @tc.name AppFsSpace_Format_0566
     * @tc.desc bytes=1123838322540544 precision=default; TiB 1022 plus one eighth; precision comparison
     */
    it('AppFsSpace_Format_0566', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0566';
      const bytes: number = 1123838322540544;
      const expected: string = '1022.1 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_6900
     * @tc.name AppFsSpace_Format_0567
     * @tc.desc bytes=1123838322540543 precision=2; TiB 1022 below one eighth tie
     */
    it('AppFsSpace_Format_0567', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0567';
      const bytes: number = 1123838322540543;
      const precision: number = 2;
      const expected: string = '1022.12 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7000
     * @tc.name AppFsSpace_Format_0568
     * @tc.desc bytes=1123838322540545 precision=2; TiB 1022 above one eighth tie
     */
    it('AppFsSpace_Format_0568', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0568';
      const bytes: number = 1123838322540545;
      const precision: number = 2;
      const expected: string = '1022.13 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7100
     * @tc.name AppFsSpace_Format_0569
     * @tc.desc bytes=1123975761494016 precision=0; TiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0569', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0569';
      const bytes: number = 1123975761494016;
      const precision: number = 0;
      const expected: string = '1022 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7200
     * @tc.name AppFsSpace_Format_0570
     * @tc.desc bytes=1123975761494016 precision=1; TiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0570', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0570';
      const bytes: number = 1123975761494016;
      const precision: number = 1;
      const expected: string = '1022.3 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7300
     * @tc.name AppFsSpace_Format_0571
     * @tc.desc bytes=1123975761494016 precision=2; TiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0571', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0571';
      const bytes: number = 1123975761494016;
      const precision: number = 2;
      const expected: string = '1022.25 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7400
     * @tc.name AppFsSpace_Format_0572
     * @tc.desc bytes=1123975761494016 precision=3; TiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0572', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0572';
      const bytes: number = 1123975761494016;
      const precision: number = 3;
      const expected: string = '1022.250 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7500
     * @tc.name AppFsSpace_Format_0573
     * @tc.desc bytes=1123975761494016 precision=default; TiB 1022 plus one quarter; precision comparison
     */
    it('AppFsSpace_Format_0573', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0573';
      const bytes: number = 1123975761494016;
      const expected: string = '1022.3 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7600
     * @tc.name AppFsSpace_Format_0574
     * @tc.desc bytes=1123975761494015 precision=1; TiB 1022 below one quarter tie
     */
    it('AppFsSpace_Format_0574', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0574';
      const bytes: number = 1123975761494015;
      const precision: number = 1;
      const expected: string = '1022.2 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7700
     * @tc.name AppFsSpace_Format_0575
     * @tc.desc bytes=1123975761494017 precision=1; TiB 1022 above one quarter tie
     */
    it('AppFsSpace_Format_0575', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0575';
      const bytes: number = 1123975761494017;
      const precision: number = 1;
      const expected: string = '1022.3 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7800
     * @tc.name AppFsSpace_Format_0576
     * @tc.desc bytes=1124250639400960 precision=0; TiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0576', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0576';
      const bytes: number = 1124250639400960;
      const precision: number = 0;
      const expected: string = '1023 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_7900
     * @tc.name AppFsSpace_Format_0577
     * @tc.desc bytes=1124250639400960 precision=1; TiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0577', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0577';
      const bytes: number = 1124250639400960;
      const precision: number = 1;
      const expected: string = '1022.5 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8000
     * @tc.name AppFsSpace_Format_0578
     * @tc.desc bytes=1124250639400960 precision=2; TiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0578', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0578';
      const bytes: number = 1124250639400960;
      const precision: number = 2;
      const expected: string = '1022.50 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8100
     * @tc.name AppFsSpace_Format_0579
     * @tc.desc bytes=1124250639400960 precision=3; TiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0579', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0579';
      const bytes: number = 1124250639400960;
      const precision: number = 3;
      const expected: string = '1022.500 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8200
     * @tc.name AppFsSpace_Format_0580
     * @tc.desc bytes=1124250639400960 precision=default; TiB 1022 plus one half; precision comparison
     */
    it('AppFsSpace_Format_0580', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0580';
      const bytes: number = 1124250639400960;
      const expected: string = '1022.5 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8300
     * @tc.name AppFsSpace_Format_0581
     * @tc.desc bytes=1124250639400959 precision=0; TiB 1022 below one half tie
     */
    it('AppFsSpace_Format_0581', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0581';
      const bytes: number = 1124250639400959;
      const precision: number = 0;
      const expected: string = '1022 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_HIGH_TIE_8400
     * @tc.name AppFsSpace_Format_0582
     * @tc.desc bytes=1124250639400961 precision=0; TiB 1022 above one half tie
     */
    it('AppFsSpace_Format_0582', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0582';
      const bytes: number = 1124250639400961;
      const precision: number = 0;
      const expected: string = '1023 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4600
     * @tc.name AppFsSpace_Format_0583
     * @tc.desc bytes=2199023255552 precision=0; TiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0583', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0583';
      const bytes: number = 2199023255552;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4700
     * @tc.name AppFsSpace_Format_0584
     * @tc.desc bytes=2199023255552 precision=1; TiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0584', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0584';
      const bytes: number = 2199023255552;
      const precision: number = 1;
      const expected: string = '2.0 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4800
     * @tc.name AppFsSpace_Format_0585
     * @tc.desc bytes=2199023255552 precision=2; TiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0585', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0585';
      const bytes: number = 2199023255552;
      const precision: number = 2;
      const expected: string = '2.00 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_4900
     * @tc.name AppFsSpace_Format_0586
     * @tc.desc bytes=2199023255552 precision=3; TiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0586', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0586';
      const bytes: number = 2199023255552;
      const precision: number = 3;
      const expected: string = '2.000 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5000
     * @tc.name AppFsSpace_Format_0587
     * @tc.desc bytes=2199023255552 precision=default; TiB integer multiple 2; trailing zeros
     */
    it('AppFsSpace_Format_0587', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0587';
      const bytes: number = 2199023255552;
      const expected: string = '2.0 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5100
     * @tc.name AppFsSpace_Format_0588
     * @tc.desc bytes=3298534883328 precision=0; TiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0588', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0588';
      const bytes: number = 3298534883328;
      const precision: number = 0;
      const expected: string = '3 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5200
     * @tc.name AppFsSpace_Format_0589
     * @tc.desc bytes=3298534883328 precision=1; TiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0589', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0589';
      const bytes: number = 3298534883328;
      const precision: number = 1;
      const expected: string = '3.0 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5300
     * @tc.name AppFsSpace_Format_0590
     * @tc.desc bytes=3298534883328 precision=2; TiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0590', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0590';
      const bytes: number = 3298534883328;
      const precision: number = 2;
      const expected: string = '3.00 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5400
     * @tc.name AppFsSpace_Format_0591
     * @tc.desc bytes=3298534883328 precision=3; TiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0591', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0591';
      const bytes: number = 3298534883328;
      const precision: number = 3;
      const expected: string = '3.000 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5500
     * @tc.name AppFsSpace_Format_0592
     * @tc.desc bytes=3298534883328 precision=default; TiB integer multiple 3; trailing zeros
     */
    it('AppFsSpace_Format_0592', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0592';
      const bytes: number = 3298534883328;
      const expected: string = '3.0 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5600
     * @tc.name AppFsSpace_Format_0593
     * @tc.desc bytes=7696581394432 precision=0; TiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0593', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0593';
      const bytes: number = 7696581394432;
      const precision: number = 0;
      const expected: string = '7 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5700
     * @tc.name AppFsSpace_Format_0594
     * @tc.desc bytes=7696581394432 precision=1; TiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0594', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0594';
      const bytes: number = 7696581394432;
      const precision: number = 1;
      const expected: string = '7.0 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5800
     * @tc.name AppFsSpace_Format_0595
     * @tc.desc bytes=7696581394432 precision=2; TiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0595', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0595';
      const bytes: number = 7696581394432;
      const precision: number = 2;
      const expected: string = '7.00 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_5900
     * @tc.name AppFsSpace_Format_0596
     * @tc.desc bytes=7696581394432 precision=3; TiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0596', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0596';
      const bytes: number = 7696581394432;
      const precision: number = 3;
      const expected: string = '7.000 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_MULTIPLE_6000
     * @tc.name AppFsSpace_Format_0597
     * @tc.desc bytes=7696581394432 precision=default; TiB integer multiple 7; trailing zeros
     */
    it('AppFsSpace_Format_0597', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0597';
      const bytes: number = 7696581394432;
      const expected: string = '7.0 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16100
     * @tc.name AppFsSpace_Format_0598
     * @tc.desc bytes=1266637395197952 precision=0; PiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0598', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0598';
      const bytes: number = 1266637395197952;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16200
     * @tc.name AppFsSpace_Format_0599
     * @tc.desc bytes=1266637395197952 precision=1; PiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0599', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0599';
      const bytes: number = 1266637395197952;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16300
     * @tc.name AppFsSpace_Format_0600
     * @tc.desc bytes=1266637395197952 precision=2; PiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0600', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0600';
      const bytes: number = 1266637395197952;
      const precision: number = 2;
      const expected: string = '1.13 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16400
     * @tc.name AppFsSpace_Format_0601
     * @tc.desc bytes=1266637395197952 precision=3; PiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0601', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0601';
      const bytes: number = 1266637395197952;
      const precision: number = 3;
      const expected: string = '1.125 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16500
     * @tc.name AppFsSpace_Format_0602
     * @tc.desc bytes=1266637395197952 precision=default; PiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0602', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0602';
      const bytes: number = 1266637395197952;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_7300
     * @tc.name AppFsSpace_Format_0603
     * @tc.desc bytes=1266637395197951 precision=2; PiB 1 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0603', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0603';
      const bytes: number = 1266637395197951;
      const precision: number = 2;
      const expected: string = '1.12 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_7400
     * @tc.name AppFsSpace_Format_0604
     * @tc.desc bytes=1266637395197953 precision=2; PiB 1 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0604', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0604';
      const bytes: number = 1266637395197953;
      const precision: number = 2;
      const expected: string = '1.13 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16600
     * @tc.name AppFsSpace_Format_0605
     * @tc.desc bytes=1407374883553280 precision=0; PiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0605', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0605';
      const bytes: number = 1407374883553280;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16700
     * @tc.name AppFsSpace_Format_0606
     * @tc.desc bytes=1407374883553280 precision=1; PiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0606', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0606';
      const bytes: number = 1407374883553280;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16800
     * @tc.name AppFsSpace_Format_0607
     * @tc.desc bytes=1407374883553280 precision=2; PiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0607', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0607';
      const bytes: number = 1407374883553280;
      const precision: number = 2;
      const expected: string = '1.25 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_16900
     * @tc.name AppFsSpace_Format_0608
     * @tc.desc bytes=1407374883553280 precision=3; PiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0608', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0608';
      const bytes: number = 1407374883553280;
      const precision: number = 3;
      const expected: string = '1.250 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17000
     * @tc.name AppFsSpace_Format_0609
     * @tc.desc bytes=1407374883553280 precision=default; PiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0609', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0609';
      const bytes: number = 1407374883553280;
      const expected: string = '1.3 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_7500
     * @tc.name AppFsSpace_Format_0610
     * @tc.desc bytes=1407374883553279 precision=1; PiB 1 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0610', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0610';
      const bytes: number = 1407374883553279;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_7600
     * @tc.name AppFsSpace_Format_0611
     * @tc.desc bytes=1407374883553281 precision=1; PiB 1 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0611', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0611';
      const bytes: number = 1407374883553281;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17100
     * @tc.name AppFsSpace_Format_0612
     * @tc.desc bytes=1548112371908608 precision=0; PiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0612', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0612';
      const bytes: number = 1548112371908608;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17200
     * @tc.name AppFsSpace_Format_0613
     * @tc.desc bytes=1548112371908608 precision=1; PiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0613', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0613';
      const bytes: number = 1548112371908608;
      const precision: number = 1;
      const expected: string = '1.4 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17300
     * @tc.name AppFsSpace_Format_0614
     * @tc.desc bytes=1548112371908608 precision=2; PiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0614', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0614';
      const bytes: number = 1548112371908608;
      const precision: number = 2;
      const expected: string = '1.38 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17400
     * @tc.name AppFsSpace_Format_0615
     * @tc.desc bytes=1548112371908608 precision=3; PiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0615', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0615';
      const bytes: number = 1548112371908608;
      const precision: number = 3;
      const expected: string = '1.375 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_17500
     * @tc.name AppFsSpace_Format_0616
     * @tc.desc bytes=1548112371908608 precision=default; PiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0616', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0616';
      const bytes: number = 1548112371908608;
      const expected: string = '1.4 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_7700
     * @tc.name AppFsSpace_Format_0617
     * @tc.desc bytes=1548112371908607 precision=2; PiB 1 plus three eighths; one byte below tie
     */
    it('AppFsSpace_Format_0617', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0617';
      const bytes: number = 1548112371908607;
      const precision: number = 2;
      const expected: string = '1.37 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
