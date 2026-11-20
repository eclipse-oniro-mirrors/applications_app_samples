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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../EventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bytesReadOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for bytesReadOf (70 cases). */
export default function bytesReadOf2Test(): void {
  describe('BytesReadOf2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0097
     * @tc.name      NdkRawfile_BytesReadOf_0097
     * @tc.desc      bytesReadOf(fileSize=2, offset=4.99, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0097 begin`);
      const actual: number = bytesReadOf(2, 4.99, 2);
      logInfo(`bytesReadOf(fileSize=2, offset=4.99, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BytesReadOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0098
     * @tc.name      NdkRawfile_BytesReadOf_0098
     * @tc.desc      bytesReadOf(fileSize=-1, offset=3, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0098 begin`);
      const actual: number = bytesReadOf(-1, 3, -1);
      logInfo(`bytesReadOf(fileSize=-1, offset=3, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0099
     * @tc.name      NdkRawfile_BytesReadOf_0099
     * @tc.desc      bytesReadOf(fileSize=32, offset=0, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0099 begin`);
      const actual: number = bytesReadOf(32, 0, 5);
      logInfo(`bytesReadOf(fileSize=32, offset=0, length=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}BytesReadOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0100
     * @tc.name      NdkRawfile_BytesReadOf_0100
     * @tc.desc      bytesReadOf(fileSize=-1, offset=100, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0100 begin`);
      const actual: number = bytesReadOf(-1, 100, 100);
      logInfo(`bytesReadOf(fileSize=-1, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0101
     * @tc.name      NdkRawfile_BytesReadOf_0101
     * @tc.desc      bytesReadOf(fileSize=10, offset=-1, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0101 begin`);
      const actual: number = bytesReadOf(10, -1, 2);
      logInfo(`bytesReadOf(fileSize=10, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BytesReadOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0102
     * @tc.name      NdkRawfile_BytesReadOf_0102
     * @tc.desc      bytesReadOf(fileSize=0, offset=4.99, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0102 begin`);
      const actual: number = bytesReadOf(0, 4.99, 10);
      logInfo(`bytesReadOf(fileSize=0, offset=4.99, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0103
     * @tc.name      NdkRawfile_BytesReadOf_0103
     * @tc.desc      bytesReadOf(fileSize=5, offset=3, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0103 begin`);
      const actual: number = bytesReadOf(5, 3, 1);
      logInfo(`bytesReadOf(fileSize=5, offset=3, length=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}BytesReadOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0104
     * @tc.name      NdkRawfile_BytesReadOf_0104
     * @tc.desc      bytesReadOf(fileSize=20, offset=15, length=10) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0104 begin`);
      const actual: number = bytesReadOf(20, 15, 10);
      logInfo(`bytesReadOf(fileSize=20, offset=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}BytesReadOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0105
     * @tc.name      NdkRawfile_BytesReadOf_0105
     * @tc.desc      bytesReadOf(fileSize=100, offset=-100, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0105 begin`);
      const actual: number = bytesReadOf(100, -100, -1);
      logInfo(`bytesReadOf(fileSize=100, offset=-100, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0106
     * @tc.name      NdkRawfile_BytesReadOf_0106
     * @tc.desc      bytesReadOf(fileSize=0, offset=15, length=-13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0106 begin`);
      const actual: number = bytesReadOf(0, 15, -13);
      logInfo(`bytesReadOf(fileSize=0, offset=15, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0107
     * @tc.name      NdkRawfile_BytesReadOf_0107
     * @tc.desc      bytesReadOf(fileSize=0, offset=-1, length=75.12) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0107 begin`);
      const actual: number = bytesReadOf(0, -1, 75.12);
      logInfo(`bytesReadOf(fileSize=0, offset=-1, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0108
     * @tc.name      NdkRawfile_BytesReadOf_0108
     * @tc.desc      bytesReadOf(fileSize=2, offset=100, length=-13) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0108 begin`);
      const actual: number = bytesReadOf(2, 100, -13);
      logInfo(`bytesReadOf(fileSize=2, offset=100, lengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BytesReadOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0109
     * @tc.name      NdkRawfile_BytesReadOf_0109
     * @tc.desc      bytesReadOf(fileSize=0, offset=5, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0109 begin`);
      const actual: number = bytesReadOf(0, 5, 100);
      logInfo(`bytesReadOf(fileSize=0, offset=5, length=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0110
     * @tc.name      NdkRawfile_BytesReadOf_0110
     * @tc.desc      bytesReadOf(fileSize=32, offset=50, length=20) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0110 begin`);
      const actual: number = bytesReadOf(32, 50, 20);
      logInfo(`bytesReadOf(fileSize=32, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}BytesReadOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0111
     * @tc.name      NdkRawfile_BytesReadOf_0111
     * @tc.desc      bytesReadOf(fileSize=10, offset=10, length=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0111 begin`);
      const actual: number = bytesReadOf(10, 10, 1);
      logInfo(`bytesReadOf(fileSize=10, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}BytesReadOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0112
     * @tc.name      NdkRawfile_BytesReadOf_0112
     * @tc.desc      bytesReadOf(fileSize=73, offset=10, length=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0112 begin`);
      const actual: number = bytesReadOf(73, 10, 20);
      logInfo(`bytesReadOf(fileSize=73, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}BytesReadOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0113
     * @tc.name      NdkRawfile_BytesReadOf_0113
     * @tc.desc      bytesReadOf(fileSize=73, offset=0, length=100) returns 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0113 begin`);
      const actual: number = bytesReadOf(73, 0, 100);
      logInfo(`bytesReadOf(fileSize=73, offset=0, length...: actual=${actual}`);
      expect(actual).assertEqual(73);
      logInfo(`${BUNDLE}BytesReadOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0114
     * @tc.name      NdkRawfile_BytesReadOf_0114
     * @tc.desc      bytesReadOf(fileSize=32, offset=15, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0114 begin`);
      const actual: number = bytesReadOf(32, 15, 5);
      logInfo(`bytesReadOf(fileSize=32, offset=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}BytesReadOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0115
     * @tc.name      NdkRawfile_BytesReadOf_0115
     * @tc.desc      bytesReadOf(fileSize=10, offset=5, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0115 begin`);
      const actual: number = bytesReadOf(10, 5, 2);
      logInfo(`bytesReadOf(fileSize=10, offset=5, length=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BytesReadOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0116
     * @tc.name      NdkRawfile_BytesReadOf_0116
     * @tc.desc      bytesReadOf(fileSize=-1, offset=2, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0116 begin`);
      const actual: number = bytesReadOf(-1, 2, 10);
      logInfo(`bytesReadOf(fileSize=-1, offset=2, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0117
     * @tc.name      NdkRawfile_BytesReadOf_0117
     * @tc.desc      bytesReadOf(fileSize=5, offset=10, length=75.12) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0117 begin`);
      const actual: number = bytesReadOf(5, 10, 75.12);
      logInfo(`bytesReadOf(fileSize=5, offset=10, length...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}BytesReadOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0118
     * @tc.name      NdkRawfile_BytesReadOf_0118
     * @tc.desc      bytesReadOf(fileSize=10, offset=2, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0118 begin`);
      const actual: number = bytesReadOf(10, 2, 3);
      logInfo(`bytesReadOf(fileSize=10, offset=2, length=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0119
     * @tc.name      NdkRawfile_BytesReadOf_0119
     * @tc.desc      bytesReadOf(fileSize=32, offset=1, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0119 begin`);
      const actual: number = bytesReadOf(32, 1, 2);
      logInfo(`bytesReadOf(fileSize=32, offset=1, length=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BytesReadOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0120
     * @tc.name      NdkRawfile_BytesReadOf_0120
     * @tc.desc      bytesReadOf(fileSize=1, offset=50, length=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0120 begin`);
      const actual: number = bytesReadOf(1, 50, 3);
      logInfo(`bytesReadOf(fileSize=1, offset=50, length=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}BytesReadOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0121
     * @tc.name      NdkRawfile_BytesReadOf_0121
     * @tc.desc      bytesReadOf(fileSize=-1, offset=-100, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0121 begin`);
      const actual: number = bytesReadOf(-1, -100, 3);
      logInfo(`bytesReadOf(fileSize=-1, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0122
     * @tc.name      NdkRawfile_BytesReadOf_0122
     * @tc.desc      bytesReadOf(fileSize=15, offset=15, length=20) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0122 begin`);
      const actual: number = bytesReadOf(15, 15, 20);
      logInfo(`bytesReadOf(fileSize=15, offset=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}BytesReadOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0123
     * @tc.name      NdkRawfile_BytesReadOf_0123
     * @tc.desc      bytesReadOf(fileSize=73, offset=4.99, length=75.12) returns 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0123 begin`);
      const actual: number = bytesReadOf(73, 4.99, 75.12);
      logInfo(`bytesReadOf(fileSize=73, offset=4.99, len...: actual=${actual}`);
      expect(actual).assertEqual(73);
      logInfo(`${BUNDLE}BytesReadOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0124
     * @tc.name      NdkRawfile_BytesReadOf_0124
     * @tc.desc      bytesReadOf(fileSize=32, offset=-100, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0124 begin`);
      const actual: number = bytesReadOf(32, -100, 2);
      logInfo(`bytesReadOf(fileSize=32, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BytesReadOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0125
     * @tc.name      NdkRawfile_BytesReadOf_0125
     * @tc.desc      bytesReadOf(fileSize=15, offset=5, length=75.12) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0125 begin`);
      const actual: number = bytesReadOf(15, 5, 75.12);
      logInfo(`bytesReadOf(fileSize=15, offset=5, length...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}BytesReadOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0126
     * @tc.name      NdkRawfile_BytesReadOf_0126
     * @tc.desc      bytesReadOf(fileSize=1, offset=0, length=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0126 begin`);
      const actual: number = bytesReadOf(1, 0, 20);
      logInfo(`bytesReadOf(fileSize=1, offset=0, length=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}BytesReadOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0127
     * @tc.name      NdkRawfile_BytesReadOf_0127
     * @tc.desc      bytesReadOf(fileSize=73, offset=1, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0127 begin`);
      const actual: number = bytesReadOf(73, 1, 2);
      logInfo(`bytesReadOf(fileSize=73, offset=1, length=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BytesReadOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0128
     * @tc.name      NdkRawfile_BytesReadOf_0128
     * @tc.desc      bytesReadOf(fileSize=15, offset=5, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0128 begin`);
      const actual: number = bytesReadOf(15, 5, 15);
      logInfo(`bytesReadOf(fileSize=15, offset=5, length...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}BytesReadOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0129
     * @tc.name      NdkRawfile_BytesReadOf_0129
     * @tc.desc      bytesReadOf(fileSize=20, offset=100, length=1) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0129 begin`);
      const actual: number = bytesReadOf(20, 100, 1);
      logInfo(`bytesReadOf(fileSize=20, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}BytesReadOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0130
     * @tc.name      NdkRawfile_BytesReadOf_0130
     * @tc.desc      bytesReadOf(fileSize=73, offset=-100, length=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0130 begin`);
      const actual: number = bytesReadOf(73, -100, 100);
      logInfo(`bytesReadOf(fileSize=73, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}BytesReadOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0131
     * @tc.name      NdkRawfile_BytesReadOf_0131
     * @tc.desc      bytesReadOf(fileSize=15, offset=10, length=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0131 begin`);
      const actual: number = bytesReadOf(15, 10, 0);
      logInfo(`bytesReadOf(fileSize=15, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}BytesReadOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0132
     * @tc.name      NdkRawfile_BytesReadOf_0132
     * @tc.desc      bytesReadOf(fileSize=10, offset=-1, length=-13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0132 begin`);
      const actual: number = bytesReadOf(10, -1, -13);
      logInfo(`bytesReadOf(fileSize=10, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0133
     * @tc.name      NdkRawfile_BytesReadOf_0133
     * @tc.desc      bytesReadOf(fileSize=-1, offset=-1, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0133 begin`);
      const actual: number = bytesReadOf(-1, -1, 3);
      logInfo(`bytesReadOf(fileSize=-1, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0134
     * @tc.name      NdkRawfile_BytesReadOf_0134
     * @tc.desc      bytesReadOf(fileSize=3, offset=10, length=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0134 begin`);
      const actual: number = bytesReadOf(3, 10, 0);
      logInfo(`bytesReadOf(fileSize=3, offset=10, length=0): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0135
     * @tc.name      NdkRawfile_BytesReadOf_0135
     * @tc.desc      bytesReadOf(fileSize=32, offset=100, length=0) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0135 begin`);
      const actual: number = bytesReadOf(32, 100, 0);
      logInfo(`bytesReadOf(fileSize=32, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}BytesReadOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0136
     * @tc.name      NdkRawfile_BytesReadOf_0136
     * @tc.desc      bytesReadOf(fileSize=20, offset=-100, length=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0136 begin`);
      const actual: number = bytesReadOf(20, -100, 10);
      logInfo(`bytesReadOf(fileSize=20, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}BytesReadOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0137
     * @tc.name      NdkRawfile_BytesReadOf_0137
     * @tc.desc      bytesReadOf(fileSize=0, offset=10, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0137 begin`);
      const actual: number = bytesReadOf(0, 10, 100);
      logInfo(`bytesReadOf(fileSize=0, offset=10, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0138
     * @tc.name      NdkRawfile_BytesReadOf_0138
     * @tc.desc      bytesReadOf(fileSize=15, offset=3, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0138 begin`);
      const actual: number = bytesReadOf(15, 3, 3);
      logInfo(`bytesReadOf(fileSize=15, offset=3, length=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0139
     * @tc.name      NdkRawfile_BytesReadOf_0139
     * @tc.desc      bytesReadOf(fileSize=1, offset=15, length=-13) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0139 begin`);
      const actual: number = bytesReadOf(1, 15, -13);
      logInfo(`bytesReadOf(fileSize=1, offset=15, length...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}BytesReadOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0140
     * @tc.name      NdkRawfile_BytesReadOf_0140
     * @tc.desc      bytesReadOf(fileSize=3, offset=3, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0140 begin`);
      const actual: number = bytesReadOf(3, 3, 0);
      logInfo(`bytesReadOf(fileSize=3, offset=3, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0141
     * @tc.name      NdkRawfile_BytesReadOf_0141
     * @tc.desc      bytesReadOf(fileSize=20, offset=-1, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0141 begin`);
      const actual: number = bytesReadOf(20, -1, 2);
      logInfo(`bytesReadOf(fileSize=20, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BytesReadOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0142
     * @tc.name      NdkRawfile_BytesReadOf_0142
     * @tc.desc      bytesReadOf(fileSize=73, offset=100, length=75.12) returns 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0142 begin`);
      const actual: number = bytesReadOf(73, 100, 75.12);
      logInfo(`bytesReadOf(fileSize=73, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(73);
      logInfo(`${BUNDLE}BytesReadOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0143
     * @tc.name      NdkRawfile_BytesReadOf_0143
     * @tc.desc      bytesReadOf(fileSize=3, offset=5, length=100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0143 begin`);
      const actual: number = bytesReadOf(3, 5, 100);
      logInfo(`bytesReadOf(fileSize=3, offset=5, length=...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0144
     * @tc.name      NdkRawfile_BytesReadOf_0144
     * @tc.desc      bytesReadOf(fileSize=1, offset=3, length=75.12) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0144 begin`);
      const actual: number = bytesReadOf(1, 3, 75.12);
      logInfo(`bytesReadOf(fileSize=1, offset=3, length=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}BytesReadOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0145
     * @tc.name      NdkRawfile_BytesReadOf_0145
     * @tc.desc      bytesReadOf(fileSize=0, offset=0, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0145 begin`);
      const actual: number = bytesReadOf(0, 0, 1);
      logInfo(`bytesReadOf(fileSize=0, offset=0, length=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0146
     * @tc.name      NdkRawfile_BytesReadOf_0146
     * @tc.desc      bytesReadOf(fileSize=73, offset=10, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0146 begin`);
      const actual: number = bytesReadOf(73, 10, 3);
      logInfo(`bytesReadOf(fileSize=73, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0147
     * @tc.name      NdkRawfile_BytesReadOf_0147
     * @tc.desc      bytesReadOf(fileSize=3, offset=0, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0147 begin`);
      const actual: number = bytesReadOf(3, 0, -1);
      logInfo(`bytesReadOf(fileSize=3, offset=0, length=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0148
     * @tc.name      NdkRawfile_BytesReadOf_0148
     * @tc.desc      bytesReadOf(fileSize=0, offset=0, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0148 begin`);
      const actual: number = bytesReadOf(0, 0, -1);
      logInfo(`bytesReadOf(fileSize=0, offset=0, length=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0149
     * @tc.name      NdkRawfile_BytesReadOf_0149
     * @tc.desc      bytesReadOf(fileSize=10, offset=50, length=15) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0149 begin`);
      const actual: number = bytesReadOf(10, 50, 15);
      logInfo(`bytesReadOf(fileSize=10, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}BytesReadOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0150
     * @tc.name      NdkRawfile_BytesReadOf_0150
     * @tc.desc      bytesReadOf(fileSize=15, offset=3, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0150 begin`);
      const actual: number = bytesReadOf(15, 3, -1);
      logInfo(`bytesReadOf(fileSize=15, offset=3, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0151
     * @tc.name      NdkRawfile_BytesReadOf_0151
     * @tc.desc      bytesReadOf(fileSize=15, offset=50, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0151 begin`);
      const actual: number = bytesReadOf(15, 50, 15);
      logInfo(`bytesReadOf(fileSize=15, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}BytesReadOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0152
     * @tc.name      NdkRawfile_BytesReadOf_0152
     * @tc.desc      bytesReadOf(fileSize=3, offset=4.99, length=10) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0152 begin`);
      const actual: number = bytesReadOf(3, 4.99, 10);
      logInfo(`bytesReadOf(fileSize=3, offset=4.99, leng...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0153
     * @tc.name      NdkRawfile_BytesReadOf_0153
     * @tc.desc      bytesReadOf(fileSize=10, offset=15, length=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0153 begin`);
      const actual: number = bytesReadOf(10, 15, 1);
      logInfo(`bytesReadOf(fileSize=10, offset=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}BytesReadOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0154
     * @tc.name      NdkRawfile_BytesReadOf_0154
     * @tc.desc      bytesReadOf(fileSize=0, offset=1, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0154 begin`);
      const actual: number = bytesReadOf(0, 1, 5);
      logInfo(`bytesReadOf(fileSize=0, offset=1, length=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0155
     * @tc.name      NdkRawfile_BytesReadOf_0155
     * @tc.desc      bytesReadOf(fileSize=20, offset=10, length=100) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0155 begin`);
      const actual: number = bytesReadOf(20, 10, 100);
      logInfo(`bytesReadOf(fileSize=20, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}BytesReadOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0156
     * @tc.name      NdkRawfile_BytesReadOf_0156
     * @tc.desc      bytesReadOf(fileSize=1, offset=-100, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0156 begin`);
      const actual: number = bytesReadOf(1, -100, 3);
      logInfo(`bytesReadOf(fileSize=1, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0157
     * @tc.name      NdkRawfile_BytesReadOf_0157
     * @tc.desc      bytesReadOf(fileSize=32, offset=100, length=15) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0157 begin`);
      const actual: number = bytesReadOf(32, 100, 15);
      logInfo(`bytesReadOf(fileSize=32, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}BytesReadOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0158
     * @tc.name      NdkRawfile_BytesReadOf_0158
     * @tc.desc      bytesReadOf(fileSize=10, offset=5, length=20) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0158 begin`);
      const actual: number = bytesReadOf(10, 5, 20);
      logInfo(`bytesReadOf(fileSize=10, offset=5, length...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}BytesReadOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0159
     * @tc.name      NdkRawfile_BytesReadOf_0159
     * @tc.desc      bytesReadOf(fileSize=3, offset=3, length=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0159 begin`);
      const actual: number = bytesReadOf(3, 3, 2);
      logInfo(`bytesReadOf(fileSize=3, offset=3, length=2): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0160
     * @tc.name      NdkRawfile_BytesReadOf_0160
     * @tc.desc      bytesReadOf(fileSize=1, offset=-1, length=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0160 begin`);
      const actual: number = bytesReadOf(1, -1, 10);
      logInfo(`bytesReadOf(fileSize=1, offset=-1, length...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}BytesReadOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0161
     * @tc.name      NdkRawfile_BytesReadOf_0161
     * @tc.desc      bytesReadOf(fileSize=15, offset=-1, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0161 begin`);
      const actual: number = bytesReadOf(15, -1, 3);
      logInfo(`bytesReadOf(fileSize=15, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0162
     * @tc.name      NdkRawfile_BytesReadOf_0162
     * @tc.desc      bytesReadOf(fileSize=15, offset=-1, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BytesReadOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BytesReadOf_0162 begin`);
      const actual: number = bytesReadOf(15, -1, 5);
      logInfo(`bytesReadOf(fileSize=15, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}BytesReadOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0163
     * @tc.name      NdkRawfile_BytesReadOf_0163
     * @tc.desc      bytesReadOf(fileSize=100, offset=50, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0163 begin`);
      const actual: number = bytesReadOf(100, 50, 2);
      logInfo(`bytesReadOf(fileSize=100, offset=50, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}BytesReadOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0164
     * @tc.name      NdkRawfile_BytesReadOf_0164
     * @tc.desc      bytesReadOf(fileSize=1, offset=15, length=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0164 begin`);
      const actual: number = bytesReadOf(1, 15, 5);
      logInfo(`bytesReadOf(fileSize=1, offset=15, length=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}BytesReadOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0165
     * @tc.name      NdkRawfile_BytesReadOf_0165
     * @tc.desc      bytesReadOf(fileSize=0, offset=1, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BytesReadOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BytesReadOf_0165 begin`);
      const actual: number = bytesReadOf(0, 1, 15);
      logInfo(`bytesReadOf(fileSize=0, offset=1, length=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BytesReadOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BYTES_READ_OF_0166
     * @tc.name      NdkRawfile_BytesReadOf_0166
     * @tc.desc      bytesReadOf(fileSize=3, offset=100, length=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BytesReadOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BytesReadOf_0166 begin`);
      const actual: number = bytesReadOf(3, 100, 3);
      logInfo(`bytesReadOf(fileSize=3, offset=100, lengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}BytesReadOf_0166 end`);
    });
  });
}
