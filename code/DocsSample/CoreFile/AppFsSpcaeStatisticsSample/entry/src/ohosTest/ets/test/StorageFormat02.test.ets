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

export default function storageFormat02Test(): void {
  describe('StorageFormat02', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10400
     * @tc.name AppFsSpace_Format_0104
     * @tc.desc bytes=1099511627775 precision=3; GiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0104', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0104';
      const bytes: number = 1099511627775;
      const precision: number = 3;
      const expected: string = '1024.000 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10500
     * @tc.name AppFsSpace_Format_0105
     * @tc.desc bytes=1099511627775 precision=default; GiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0105', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0105';
      const bytes: number = 1099511627775;
      const expected: string = '1024.0 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10600
     * @tc.name AppFsSpace_Format_0106
     * @tc.desc bytes=1099511627776 precision=0; GiB upper threshold exact
     */
    it('AppFsSpace_Format_0106', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0106';
      const bytes: number = 1099511627776;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10700
     * @tc.name AppFsSpace_Format_0107
     * @tc.desc bytes=1099511627776 precision=1; GiB upper threshold exact
     */
    it('AppFsSpace_Format_0107', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0107';
      const bytes: number = 1099511627776;
      const precision: number = 1;
      const expected: string = '1.0 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10800
     * @tc.name AppFsSpace_Format_0108
     * @tc.desc bytes=1099511627776 precision=2; GiB upper threshold exact
     */
    it('AppFsSpace_Format_0108', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0108';
      const bytes: number = 1099511627776;
      const precision: number = 2;
      const expected: string = '1.00 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_10900
     * @tc.name AppFsSpace_Format_0109
     * @tc.desc bytes=1099511627776 precision=3; GiB upper threshold exact
     */
    it('AppFsSpace_Format_0109', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0109';
      const bytes: number = 1099511627776;
      const precision: number = 3;
      const expected: string = '1.000 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11000
     * @tc.name AppFsSpace_Format_0110
     * @tc.desc bytes=1099511627776 precision=default; GiB upper threshold exact
     */
    it('AppFsSpace_Format_0110', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0110';
      const bytes: number = 1099511627776;
      const expected: string = '1.0 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11100
     * @tc.name AppFsSpace_Format_0111
     * @tc.desc bytes=1099511627777 precision=0; GiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0111', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0111';
      const bytes: number = 1099511627777;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11200
     * @tc.name AppFsSpace_Format_0112
     * @tc.desc bytes=1099511627777 precision=1; GiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0112', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0112';
      const bytes: number = 1099511627777;
      const precision: number = 1;
      const expected: string = '1.0 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11300
     * @tc.name AppFsSpace_Format_0113
     * @tc.desc bytes=1099511627777 precision=2; GiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0113', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0113';
      const bytes: number = 1099511627777;
      const precision: number = 2;
      const expected: string = '1.00 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11400
     * @tc.name AppFsSpace_Format_0114
     * @tc.desc bytes=1099511627777 precision=3; GiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0114', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0114';
      const bytes: number = 1099511627777;
      const precision: number = 3;
      const expected: string = '1.000 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11500
     * @tc.name AppFsSpace_Format_0115
     * @tc.desc bytes=1099511627777 precision=default; GiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0115', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0115';
      const bytes: number = 1099511627777;
      const expected: string = '1.0 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11600
     * @tc.name AppFsSpace_Format_0116
     * @tc.desc bytes=1100048498688 precision=0; GiB upper threshold half above
     */
    it('AppFsSpace_Format_0116', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0116';
      const bytes: number = 1100048498688;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11700
     * @tc.name AppFsSpace_Format_0117
     * @tc.desc bytes=1100048498688 precision=1; GiB upper threshold half above
     */
    it('AppFsSpace_Format_0117', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0117';
      const bytes: number = 1100048498688;
      const precision: number = 1;
      const expected: string = '1.0 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11800
     * @tc.name AppFsSpace_Format_0118
     * @tc.desc bytes=1100048498688 precision=2; GiB upper threshold half above
     */
    it('AppFsSpace_Format_0118', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0118';
      const bytes: number = 1100048498688;
      const precision: number = 2;
      const expected: string = '1.00 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_11900
     * @tc.name AppFsSpace_Format_0119
     * @tc.desc bytes=1100048498688 precision=3; GiB upper threshold half above
     */
    it('AppFsSpace_Format_0119', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0119';
      const bytes: number = 1100048498688;
      const precision: number = 3;
      const expected: string = '1.000 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12000
     * @tc.name AppFsSpace_Format_0120
     * @tc.desc bytes=1100048498688 precision=default; GiB upper threshold half above
     */
    it('AppFsSpace_Format_0120', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0120';
      const bytes: number = 1100048498688;
      const expected: string = '1.0 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12100
     * @tc.name AppFsSpace_Format_0121
     * @tc.desc bytes=549755813888 precision=0; TiB lower threshold half below
     */
    it('AppFsSpace_Format_0121', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0121';
      const bytes: number = 549755813888;
      const precision: number = 0;
      const expected: string = '512 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12200
     * @tc.name AppFsSpace_Format_0122
     * @tc.desc bytes=549755813888 precision=1; TiB lower threshold half below
     */
    it('AppFsSpace_Format_0122', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0122';
      const bytes: number = 549755813888;
      const precision: number = 1;
      const expected: string = '512.0 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12300
     * @tc.name AppFsSpace_Format_0123
     * @tc.desc bytes=549755813888 precision=2; TiB lower threshold half below
     */
    it('AppFsSpace_Format_0123', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0123';
      const bytes: number = 549755813888;
      const precision: number = 2;
      const expected: string = '512.00 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12400
     * @tc.name AppFsSpace_Format_0124
     * @tc.desc bytes=549755813888 precision=3; TiB lower threshold half below
     */
    it('AppFsSpace_Format_0124', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0124';
      const bytes: number = 549755813888;
      const precision: number = 3;
      const expected: string = '512.000 GiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12500
     * @tc.name AppFsSpace_Format_0125
     * @tc.desc bytes=549755813888 precision=default; TiB lower threshold half below
     */
    it('AppFsSpace_Format_0125', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0125';
      const bytes: number = 549755813888;
      const expected: string = '512.0 GiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12600
     * @tc.name AppFsSpace_Format_0126
     * @tc.desc bytes=1649267441664 precision=0; TiB lower threshold half above
     */
    it('AppFsSpace_Format_0126', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0126';
      const bytes: number = 1649267441664;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12700
     * @tc.name AppFsSpace_Format_0127
     * @tc.desc bytes=1649267441664 precision=1; TiB lower threshold half above
     */
    it('AppFsSpace_Format_0127', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0127';
      const bytes: number = 1649267441664;
      const precision: number = 1;
      const expected: string = '1.5 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12800
     * @tc.name AppFsSpace_Format_0128
     * @tc.desc bytes=1649267441664 precision=2; TiB lower threshold half above
     */
    it('AppFsSpace_Format_0128', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0128';
      const bytes: number = 1649267441664;
      const precision: number = 2;
      const expected: string = '1.50 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_12900
     * @tc.name AppFsSpace_Format_0129
     * @tc.desc bytes=1649267441664 precision=3; TiB lower threshold half above
     */
    it('AppFsSpace_Format_0129', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0129';
      const bytes: number = 1649267441664;
      const precision: number = 3;
      const expected: string = '1.500 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13000
     * @tc.name AppFsSpace_Format_0130
     * @tc.desc bytes=1649267441664 precision=default; TiB lower threshold half above
     */
    it('AppFsSpace_Format_0130', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0130';
      const bytes: number = 1649267441664;
      const expected: string = '1.5 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13100
     * @tc.name AppFsSpace_Format_0131
     * @tc.desc bytes=1125350151028736 precision=0; TiB upper threshold half below
     */
    it('AppFsSpace_Format_0131', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0131';
      const bytes: number = 1125350151028736;
      const precision: number = 0;
      const expected: string = '1024 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13200
     * @tc.name AppFsSpace_Format_0132
     * @tc.desc bytes=1125350151028736 precision=1; TiB upper threshold half below
     */
    it('AppFsSpace_Format_0132', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0132';
      const bytes: number = 1125350151028736;
      const precision: number = 1;
      const expected: string = '1023.5 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13300
     * @tc.name AppFsSpace_Format_0133
     * @tc.desc bytes=1125350151028736 precision=2; TiB upper threshold half below
     */
    it('AppFsSpace_Format_0133', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0133';
      const bytes: number = 1125350151028736;
      const precision: number = 2;
      const expected: string = '1023.50 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13400
     * @tc.name AppFsSpace_Format_0134
     * @tc.desc bytes=1125350151028736 precision=3; TiB upper threshold half below
     */
    it('AppFsSpace_Format_0134', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0134';
      const bytes: number = 1125350151028736;
      const precision: number = 3;
      const expected: string = '1023.500 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13500
     * @tc.name AppFsSpace_Format_0135
     * @tc.desc bytes=1125350151028736 precision=default; TiB upper threshold half below
     */
    it('AppFsSpace_Format_0135', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0135';
      const bytes: number = 1125350151028736;
      const expected: string = '1023.5 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13600
     * @tc.name AppFsSpace_Format_0136
     * @tc.desc bytes=1125899906842623 precision=0; TiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0136', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0136';
      const bytes: number = 1125899906842623;
      const precision: number = 0;
      const expected: string = '1024 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13700
     * @tc.name AppFsSpace_Format_0137
     * @tc.desc bytes=1125899906842623 precision=1; TiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0137', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0137';
      const bytes: number = 1125899906842623;
      const precision: number = 1;
      const expected: string = '1024.0 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13800
     * @tc.name AppFsSpace_Format_0138
     * @tc.desc bytes=1125899906842623 precision=2; TiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0138', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0138';
      const bytes: number = 1125899906842623;
      const precision: number = 2;
      const expected: string = '1024.00 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_13900
     * @tc.name AppFsSpace_Format_0139
     * @tc.desc bytes=1125899906842623 precision=3; TiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0139', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0139';
      const bytes: number = 1125899906842623;
      const precision: number = 3;
      const expected: string = '1024.000 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14000
     * @tc.name AppFsSpace_Format_0140
     * @tc.desc bytes=1125899906842623 precision=default; TiB upper threshold one byte below
     */
    it('AppFsSpace_Format_0140', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0140';
      const bytes: number = 1125899906842623;
      const expected: string = '1024.0 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14100
     * @tc.name AppFsSpace_Format_0141
     * @tc.desc bytes=1125899906842624 precision=0; TiB upper threshold exact
     */
    it('AppFsSpace_Format_0141', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0141';
      const bytes: number = 1125899906842624;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14200
     * @tc.name AppFsSpace_Format_0142
     * @tc.desc bytes=1125899906842624 precision=1; TiB upper threshold exact
     */
    it('AppFsSpace_Format_0142', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0142';
      const bytes: number = 1125899906842624;
      const precision: number = 1;
      const expected: string = '1.0 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14300
     * @tc.name AppFsSpace_Format_0143
     * @tc.desc bytes=1125899906842624 precision=2; TiB upper threshold exact
     */
    it('AppFsSpace_Format_0143', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0143';
      const bytes: number = 1125899906842624;
      const precision: number = 2;
      const expected: string = '1.00 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14400
     * @tc.name AppFsSpace_Format_0144
     * @tc.desc bytes=1125899906842624 precision=3; TiB upper threshold exact
     */
    it('AppFsSpace_Format_0144', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0144';
      const bytes: number = 1125899906842624;
      const precision: number = 3;
      const expected: string = '1.000 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14500
     * @tc.name AppFsSpace_Format_0145
     * @tc.desc bytes=1125899906842624 precision=default; TiB upper threshold exact
     */
    it('AppFsSpace_Format_0145', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0145';
      const bytes: number = 1125899906842624;
      const expected: string = '1.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14600
     * @tc.name AppFsSpace_Format_0146
     * @tc.desc bytes=1125899906842625 precision=0; TiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0146', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0146';
      const bytes: number = 1125899906842625;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14700
     * @tc.name AppFsSpace_Format_0147
     * @tc.desc bytes=1125899906842625 precision=1; TiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0147', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0147';
      const bytes: number = 1125899906842625;
      const precision: number = 1;
      const expected: string = '1.0 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14800
     * @tc.name AppFsSpace_Format_0148
     * @tc.desc bytes=1125899906842625 precision=2; TiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0148', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0148';
      const bytes: number = 1125899906842625;
      const precision: number = 2;
      const expected: string = '1.00 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_14900
     * @tc.name AppFsSpace_Format_0149
     * @tc.desc bytes=1125899906842625 precision=3; TiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0149', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0149';
      const bytes: number = 1125899906842625;
      const precision: number = 3;
      const expected: string = '1.000 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15000
     * @tc.name AppFsSpace_Format_0150
     * @tc.desc bytes=1125899906842625 precision=default; TiB upper threshold one byte above
     */
    it('AppFsSpace_Format_0150', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0150';
      const bytes: number = 1125899906842625;
      const expected: string = '1.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15100
     * @tc.name AppFsSpace_Format_0151
     * @tc.desc bytes=1126449662656512 precision=0; TiB upper threshold half above
     */
    it('AppFsSpace_Format_0151', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0151';
      const bytes: number = 1126449662656512;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15200
     * @tc.name AppFsSpace_Format_0152
     * @tc.desc bytes=1126449662656512 precision=1; TiB upper threshold half above
     */
    it('AppFsSpace_Format_0152', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0152';
      const bytes: number = 1126449662656512;
      const precision: number = 1;
      const expected: string = '1.0 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15300
     * @tc.name AppFsSpace_Format_0153
     * @tc.desc bytes=1126449662656512 precision=2; TiB upper threshold half above
     */
    it('AppFsSpace_Format_0153', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0153';
      const bytes: number = 1126449662656512;
      const precision: number = 2;
      const expected: string = '1.00 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15400
     * @tc.name AppFsSpace_Format_0154
     * @tc.desc bytes=1126449662656512 precision=3; TiB upper threshold half above
     */
    it('AppFsSpace_Format_0154', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0154';
      const bytes: number = 1126449662656512;
      const precision: number = 3;
      const expected: string = '1.000 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15500
     * @tc.name AppFsSpace_Format_0155
     * @tc.desc bytes=1126449662656512 precision=default; TiB upper threshold half above
     */
    it('AppFsSpace_Format_0155', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0155';
      const bytes: number = 1126449662656512;
      const expected: string = '1.0 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15600
     * @tc.name AppFsSpace_Format_0156
     * @tc.desc bytes=562949953421312 precision=0; PiB lower threshold half below
     */
    it('AppFsSpace_Format_0156', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0156';
      const bytes: number = 562949953421312;
      const precision: number = 0;
      const expected: string = '512 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15700
     * @tc.name AppFsSpace_Format_0157
     * @tc.desc bytes=562949953421312 precision=1; PiB lower threshold half below
     */
    it('AppFsSpace_Format_0157', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0157';
      const bytes: number = 562949953421312;
      const precision: number = 1;
      const expected: string = '512.0 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15800
     * @tc.name AppFsSpace_Format_0158
     * @tc.desc bytes=562949953421312 precision=2; PiB lower threshold half below
     */
    it('AppFsSpace_Format_0158', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0158';
      const bytes: number = 562949953421312;
      const precision: number = 2;
      const expected: string = '512.00 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_15900
     * @tc.name AppFsSpace_Format_0159
     * @tc.desc bytes=562949953421312 precision=3; PiB lower threshold half below
     */
    it('AppFsSpace_Format_0159', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0159';
      const bytes: number = 562949953421312;
      const precision: number = 3;
      const expected: string = '512.000 TiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_16000
     * @tc.name AppFsSpace_Format_0160
     * @tc.desc bytes=562949953421312 precision=default; PiB lower threshold half below
     */
    it('AppFsSpace_Format_0160', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0160';
      const bytes: number = 562949953421312;
      const expected: string = '512.0 TiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_16100
     * @tc.name AppFsSpace_Format_0161
     * @tc.desc bytes=1688849860263936 precision=0; PiB lower threshold half above
     */
    it('AppFsSpace_Format_0161', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0161';
      const bytes: number = 1688849860263936;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_16200
     * @tc.name AppFsSpace_Format_0162
     * @tc.desc bytes=1688849860263936 precision=1; PiB lower threshold half above
     */
    it('AppFsSpace_Format_0162', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0162';
      const bytes: number = 1688849860263936;
      const precision: number = 1;
      const expected: string = '1.5 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_16300
     * @tc.name AppFsSpace_Format_0163
     * @tc.desc bytes=1688849860263936 precision=2; PiB lower threshold half above
     */
    it('AppFsSpace_Format_0163', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0163';
      const bytes: number = 1688849860263936;
      const precision: number = 2;
      const expected: string = '1.50 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_16400
     * @tc.name AppFsSpace_Format_0164
     * @tc.desc bytes=1688849860263936 precision=3; PiB lower threshold half above
     */
    it('AppFsSpace_Format_0164', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0164';
      const bytes: number = 1688849860263936;
      const precision: number = 3;
      const expected: string = '1.500 PiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_THRESHOLD_16500
     * @tc.name AppFsSpace_Format_0165
     * @tc.desc bytes=1688849860263936 precision=default; PiB lower threshold half above
     */
    it('AppFsSpace_Format_0165', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0165';
      const bytes: number = 1688849860263936;
      const expected: string = '1.5 PiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_0100
     * @tc.name AppFsSpace_Format_0166
     * @tc.desc bytes=1152 precision=0; KiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0166', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0166';
      const bytes: number = 1152;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_0200
     * @tc.name AppFsSpace_Format_0167
     * @tc.desc bytes=1152 precision=1; KiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0167', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0167';
      const bytes: number = 1152;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_0300
     * @tc.name AppFsSpace_Format_0168
     * @tc.desc bytes=1152 precision=2; KiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0168', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0168';
      const bytes: number = 1152;
      const precision: number = 2;
      const expected: string = '1.13 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_0400
     * @tc.name AppFsSpace_Format_0169
     * @tc.desc bytes=1152 precision=3; KiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0169', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0169';
      const bytes: number = 1152;
      const precision: number = 3;
      const expected: string = '1.125 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_0500
     * @tc.name AppFsSpace_Format_0170
     * @tc.desc bytes=1152 precision=default; KiB 1 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0170', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0170';
      const bytes: number = 1152;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_0100
     * @tc.name AppFsSpace_Format_0171
     * @tc.desc bytes=1151 precision=2; KiB 1 plus one eighth; one byte below tie
     */
    it('AppFsSpace_Format_0171', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0171';
      const bytes: number = 1151;
      const precision: number = 2;
      const expected: string = '1.12 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_0200
     * @tc.name AppFsSpace_Format_0172
     * @tc.desc bytes=1153 precision=2; KiB 1 plus one eighth; one byte above tie
     */
    it('AppFsSpace_Format_0172', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0172';
      const bytes: number = 1153;
      const precision: number = 2;
      const expected: string = '1.13 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_0600
     * @tc.name AppFsSpace_Format_0173
     * @tc.desc bytes=1280 precision=0; KiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0173', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0173';
      const bytes: number = 1280;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_0700
     * @tc.name AppFsSpace_Format_0174
     * @tc.desc bytes=1280 precision=1; KiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0174', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0174';
      const bytes: number = 1280;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_0800
     * @tc.name AppFsSpace_Format_0175
     * @tc.desc bytes=1280 precision=2; KiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0175', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0175';
      const bytes: number = 1280;
      const precision: number = 2;
      const expected: string = '1.25 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_0900
     * @tc.name AppFsSpace_Format_0176
     * @tc.desc bytes=1280 precision=3; KiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0176', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0176';
      const bytes: number = 1280;
      const precision: number = 3;
      const expected: string = '1.250 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1000
     * @tc.name AppFsSpace_Format_0177
     * @tc.desc bytes=1280 precision=default; KiB 1 plus one quarter; exact binary fraction
     */
    it('AppFsSpace_Format_0177', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0177';
      const bytes: number = 1280;
      const expected: string = '1.3 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_0300
     * @tc.name AppFsSpace_Format_0178
     * @tc.desc bytes=1279 precision=1; KiB 1 plus one quarter; one byte below tie
     */
    it('AppFsSpace_Format_0178', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0178';
      const bytes: number = 1279;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_0400
     * @tc.name AppFsSpace_Format_0179
     * @tc.desc bytes=1281 precision=1; KiB 1 plus one quarter; one byte above tie
     */
    it('AppFsSpace_Format_0179', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0179';
      const bytes: number = 1281;
      const precision: number = 1;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1100
     * @tc.name AppFsSpace_Format_0180
     * @tc.desc bytes=1408 precision=0; KiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0180', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0180';
      const bytes: number = 1408;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1200
     * @tc.name AppFsSpace_Format_0181
     * @tc.desc bytes=1408 precision=1; KiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0181', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0181';
      const bytes: number = 1408;
      const precision: number = 1;
      const expected: string = '1.4 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1300
     * @tc.name AppFsSpace_Format_0182
     * @tc.desc bytes=1408 precision=2; KiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0182', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0182';
      const bytes: number = 1408;
      const precision: number = 2;
      const expected: string = '1.38 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1400
     * @tc.name AppFsSpace_Format_0183
     * @tc.desc bytes=1408 precision=3; KiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0183', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0183';
      const bytes: number = 1408;
      const precision: number = 3;
      const expected: string = '1.375 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1500
     * @tc.name AppFsSpace_Format_0184
     * @tc.desc bytes=1408 precision=default; KiB 1 plus three eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0184', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0184';
      const bytes: number = 1408;
      const expected: string = '1.4 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_0500
     * @tc.name AppFsSpace_Format_0185
     * @tc.desc bytes=1407 precision=2; KiB 1 plus three eighths; one byte below tie
     */
    it('AppFsSpace_Format_0185', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0185';
      const bytes: number = 1407;
      const precision: number = 2;
      const expected: string = '1.37 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_0600
     * @tc.name AppFsSpace_Format_0186
     * @tc.desc bytes=1409 precision=2; KiB 1 plus three eighths; one byte above tie
     */
    it('AppFsSpace_Format_0186', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0186';
      const bytes: number = 1409;
      const precision: number = 2;
      const expected: string = '1.38 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_0700
     * @tc.name AppFsSpace_Format_0187
     * @tc.desc bytes=1535 precision=0; KiB 1 plus one half; one byte below tie
     */
    it('AppFsSpace_Format_0187', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0187';
      const bytes: number = 1535;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_0800
     * @tc.name AppFsSpace_Format_0188
     * @tc.desc bytes=1537 precision=0; KiB 1 plus one half; one byte above tie
     */
    it('AppFsSpace_Format_0188', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0188';
      const bytes: number = 1537;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1600
     * @tc.name AppFsSpace_Format_0189
     * @tc.desc bytes=1792 precision=0; KiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0189', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0189';
      const bytes: number = 1792;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1700
     * @tc.name AppFsSpace_Format_0190
     * @tc.desc bytes=1792 precision=1; KiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0190', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0190';
      const bytes: number = 1792;
      const precision: number = 1;
      const expected: string = '1.8 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1800
     * @tc.name AppFsSpace_Format_0191
     * @tc.desc bytes=1792 precision=2; KiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0191', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0191';
      const bytes: number = 1792;
      const precision: number = 2;
      const expected: string = '1.75 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_1900
     * @tc.name AppFsSpace_Format_0192
     * @tc.desc bytes=1792 precision=3; KiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0192', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0192';
      const bytes: number = 1792;
      const precision: number = 3;
      const expected: string = '1.750 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2000
     * @tc.name AppFsSpace_Format_0193
     * @tc.desc bytes=1792 precision=default; KiB 1 plus three quarters; exact binary fraction
     */
    it('AppFsSpace_Format_0193', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0193';
      const bytes: number = 1792;
      const expected: string = '1.8 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_0900
     * @tc.name AppFsSpace_Format_0194
     * @tc.desc bytes=1791 precision=1; KiB 1 plus three quarters; one byte below tie
     */
    it('AppFsSpace_Format_0194', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0194';
      const bytes: number = 1791;
      const precision: number = 1;
      const expected: string = '1.7 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1000
     * @tc.name AppFsSpace_Format_0195
     * @tc.desc bytes=1793 precision=1; KiB 1 plus three quarters; one byte above tie
     */
    it('AppFsSpace_Format_0195', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0195';
      const bytes: number = 1793;
      const precision: number = 1;
      const expected: string = '1.8 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2100
     * @tc.name AppFsSpace_Format_0196
     * @tc.desc bytes=1920 precision=0; KiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0196', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0196';
      const bytes: number = 1920;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2200
     * @tc.name AppFsSpace_Format_0197
     * @tc.desc bytes=1920 precision=1; KiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0197', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0197';
      const bytes: number = 1920;
      const precision: number = 1;
      const expected: string = '1.9 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2300
     * @tc.name AppFsSpace_Format_0198
     * @tc.desc bytes=1920 precision=2; KiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0198', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0198';
      const bytes: number = 1920;
      const precision: number = 2;
      const expected: string = '1.88 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2400
     * @tc.name AppFsSpace_Format_0199
     * @tc.desc bytes=1920 precision=3; KiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0199', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0199';
      const bytes: number = 1920;
      const precision: number = 3;
      const expected: string = '1.875 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2500
     * @tc.name AppFsSpace_Format_0200
     * @tc.desc bytes=1920 precision=default; KiB 1 plus seven eighths; exact binary fraction
     */
    it('AppFsSpace_Format_0200', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0200';
      const bytes: number = 1920;
      const expected: string = '1.9 KiB';
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1100
     * @tc.name AppFsSpace_Format_0201
     * @tc.desc bytes=1919 precision=2; KiB 1 plus seven eighths; one byte below tie
     */
    it('AppFsSpace_Format_0201', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0201';
      const bytes: number = 1919;
      const precision: number = 2;
      const expected: string = '1.87 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_ROUND_SIDE_1200
     * @tc.name AppFsSpace_Format_0202
     * @tc.desc bytes=1921 precision=2; KiB 1 plus seven eighths; one byte above tie
     */
    it('AppFsSpace_Format_0202', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0202';
      const bytes: number = 1921;
      const precision: number = 2;
      const expected: string = '1.88 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2600
     * @tc.name AppFsSpace_Format_0203
     * @tc.desc bytes=3200 precision=0; KiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0203', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0203';
      const bytes: number = 3200;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2700
     * @tc.name AppFsSpace_Format_0204
     * @tc.desc bytes=3200 precision=1; KiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0204', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0204';
      const bytes: number = 3200;
      const precision: number = 1;
      const expected: string = '3.1 KiB';
      logCase(name, 'begin');
      try {
        const actual: string = formatStorageSize(bytes, precision);
        logAssertion(name, `bytes=${bytes} precision=${precision} formatted`, actual, expected);
        expect(actual).assertEqual(expected);
      } finally {
        logCase(name, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2800
     * @tc.name AppFsSpace_Format_0205
     * @tc.desc bytes=3200 precision=2; KiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0205', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0205';
      const bytes: number = 3200;
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
     * @tc.number SUB_CORE_FILE_STORAGE_FORMAT_FRACTION_2900
     * @tc.name AppFsSpace_Format_0206
     * @tc.desc bytes=3200 precision=3; KiB 3 plus one eighth; exact binary fraction
     */
    it('AppFsSpace_Format_0206', 0, (): void => {
      const name: string = 'AppFsSpace_Format_0206';
      const bytes: number = 3200;
      const precision: number = 3;
      const expected: string = '3.125 KiB';
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
