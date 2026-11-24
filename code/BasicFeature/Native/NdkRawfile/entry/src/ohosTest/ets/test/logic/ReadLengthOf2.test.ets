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
import { readLengthOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for readLengthOf (70 cases). */
export default function readLengthOf2Test(): void {
  describe('ReadLengthOf2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0097
     * @tc.name      NdkRawfile_ReadLengthOf_0097
     * @tc.desc      readLengthOf(fileSize=139, offset=51.07, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0097 begin`);
      const actual: number = readLengthOf(139, 51.07, 5);
      logInfo(`readLengthOf(fileSize=139, offset=51.07, ...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0098
     * @tc.name      NdkRawfile_ReadLengthOf_0098
     * @tc.desc      readLengthOf(fileSize=20, offset=10, length=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0098 begin`);
      const actual: number = readLengthOf(20, 10, 20);
      logInfo(`readLengthOf(fileSize=20, offset=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0099
     * @tc.name      NdkRawfile_ReadLengthOf_0099
     * @tc.desc      readLengthOf(fileSize=-1, offset=2, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0099 begin`);
      const actual: number = readLengthOf(-1, 2, 15);
      logInfo(`readLengthOf(fileSize=-1, offset=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0100
     * @tc.name      NdkRawfile_ReadLengthOf_0100
     * @tc.desc      readLengthOf(fileSize=176, offset=51.07, length=0) returns 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0100 begin`);
      const actual: number = readLengthOf(176, 51.07, 0);
      logInfo(`readLengthOf(fileSize=176, offset=51.07, ...: actual=${actual}`);
      expect(actual).assertEqual(176);
      logInfo(`${BUNDLE}ReadLengthOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0101
     * @tc.name      NdkRawfile_ReadLengthOf_0101
     * @tc.desc      readLengthOf(fileSize=5, offset=1, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0101 begin`);
      const actual: number = readLengthOf(5, 1, 2);
      logInfo(`readLengthOf(fileSize=5, offset=1, length=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0102
     * @tc.name      NdkRawfile_ReadLengthOf_0102
     * @tc.desc      readLengthOf(fileSize=15, offset=0, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0102 begin`);
      const actual: number = readLengthOf(15, 0, 2);
      logInfo(`readLengthOf(fileSize=15, offset=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0103
     * @tc.name      NdkRawfile_ReadLengthOf_0103
     * @tc.desc      readLengthOf(fileSize=20, offset=1, length=164) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0103 begin`);
      const actual: number = readLengthOf(20, 1, 164);
      logInfo(`readLengthOf(fileSize=20, offset=1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0104
     * @tc.name      NdkRawfile_ReadLengthOf_0104
     * @tc.desc      readLengthOf(fileSize=2, offset=0, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0104 begin`);
      const actual: number = readLengthOf(2, 0, 2);
      logInfo(`readLengthOf(fileSize=2, offset=0, length=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0105
     * @tc.name      NdkRawfile_ReadLengthOf_0105
     * @tc.desc      readLengthOf(fileSize=5, offset=10, length=15) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0105 begin`);
      const actual: number = readLengthOf(5, 10, 15);
      logInfo(`readLengthOf(fileSize=5, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0106
     * @tc.name      NdkRawfile_ReadLengthOf_0106
     * @tc.desc      readLengthOf(fileSize=176, offset=1, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0106 begin`);
      const actual: number = readLengthOf(176, 1, -1);
      logInfo(`readLengthOf(fileSize=176, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0107
     * @tc.name      NdkRawfile_ReadLengthOf_0107
     * @tc.desc      readLengthOf(fileSize=15, offset=15, length=3) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0107 begin`);
      const actual: number = readLengthOf(15, 15, 3);
      logInfo(`readLengthOf(fileSize=15, offset=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0108
     * @tc.name      NdkRawfile_ReadLengthOf_0108
     * @tc.desc      readLengthOf(fileSize=100, offset=1, length=164) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0108 begin`);
      const actual: number = readLengthOf(100, 1, 164);
      logInfo(`readLengthOf(fileSize=100, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0109
     * @tc.name      NdkRawfile_ReadLengthOf_0109
     * @tc.desc      readLengthOf(fileSize=139, offset=3, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0109 begin`);
      const actual: number = readLengthOf(139, 3, 2);
      logInfo(`readLengthOf(fileSize=139, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0110
     * @tc.name      NdkRawfile_ReadLengthOf_0110
     * @tc.desc      readLengthOf(fileSize=139, offset=1, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0110 begin`);
      const actual: number = readLengthOf(139, 1, 5);
      logInfo(`readLengthOf(fileSize=139, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0111
     * @tc.name      NdkRawfile_ReadLengthOf_0111
     * @tc.desc      readLengthOf(fileSize=2, offset=3, length=152) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0111 begin`);
      const actual: number = readLengthOf(2, 3, 152);
      logInfo(`readLengthOf(fileSize=2, offset=3, length...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0112
     * @tc.name      NdkRawfile_ReadLengthOf_0112
     * @tc.desc      readLengthOf(fileSize=-1, offset=10, length=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0112 begin`);
      const actual: number = readLengthOf(-1, 10, 1);
      logInfo(`readLengthOf(fileSize=-1, offset=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0113
     * @tc.name      NdkRawfile_ReadLengthOf_0113
     * @tc.desc      readLengthOf(fileSize=5, offset=10, length=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0113 begin`);
      const actual: number = readLengthOf(5, 10, 2);
      logInfo(`readLengthOf(fileSize=5, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0114
     * @tc.name      NdkRawfile_ReadLengthOf_0114
     * @tc.desc      readLengthOf(fileSize=1, offset=50, length=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0114 begin`);
      const actual: number = readLengthOf(1, 50, 3);
      logInfo(`readLengthOf(fileSize=1, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0115
     * @tc.name      NdkRawfile_ReadLengthOf_0115
     * @tc.desc      readLengthOf(fileSize=2, offset=50, length=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0115 begin`);
      const actual: number = readLengthOf(2, 50, 0);
      logInfo(`readLengthOf(fileSize=2, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0116
     * @tc.name      NdkRawfile_ReadLengthOf_0116
     * @tc.desc      readLengthOf(fileSize=20, offset=-1, length=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0116 begin`);
      const actual: number = readLengthOf(20, -1, 2);
      logInfo(`readLengthOf(fileSize=20, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0117
     * @tc.name      NdkRawfile_ReadLengthOf_0117
     * @tc.desc      readLengthOf(fileSize=15, offset=-1, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0117 begin`);
      const actual: number = readLengthOf(15, -1, -1);
      logInfo(`readLengthOf(fileSize=15, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0118
     * @tc.name      NdkRawfile_ReadLengthOf_0118
     * @tc.desc      readLengthOf(fileSize=176, offset=-1, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0118 begin`);
      const actual: number = readLengthOf(176, -1, 1);
      logInfo(`readLengthOf(fileSize=176, offset=-1, len...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0119
     * @tc.name      NdkRawfile_ReadLengthOf_0119
     * @tc.desc      readLengthOf(fileSize=10, offset=2, length=15) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0119 begin`);
      const actual: number = readLengthOf(10, 2, 15);
      logInfo(`readLengthOf(fileSize=10, offset=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0120
     * @tc.name      NdkRawfile_ReadLengthOf_0120
     * @tc.desc      readLengthOf(fileSize=5, offset=50, length=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0120 begin`);
      const actual: number = readLengthOf(5, 50, 0);
      logInfo(`readLengthOf(fileSize=5, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0121
     * @tc.name      NdkRawfile_ReadLengthOf_0121
     * @tc.desc      readLengthOf(fileSize=5, offset=1, length=100) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0121 begin`);
      const actual: number = readLengthOf(5, 1, 100);
      logInfo(`readLengthOf(fileSize=5, offset=1, length...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0122
     * @tc.name      NdkRawfile_ReadLengthOf_0122
     * @tc.desc      readLengthOf(fileSize=10, offset=50, length=2) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0122 begin`);
      const actual: number = readLengthOf(10, 50, 2);
      logInfo(`readLengthOf(fileSize=10, offset=50, leng...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0123
     * @tc.name      NdkRawfile_ReadLengthOf_0123
     * @tc.desc      readLengthOf(fileSize=100, offset=51.07, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0123 begin`);
      const actual: number = readLengthOf(100, 51.07, 5);
      logInfo(`readLengthOf(fileSize=100, offset=51.07, ...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0124
     * @tc.name      NdkRawfile_ReadLengthOf_0124
     * @tc.desc      readLengthOf(fileSize=100, offset=5, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0124 begin`);
      const actual: number = readLengthOf(100, 5, 5);
      logInfo(`readLengthOf(fileSize=100, offset=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0125
     * @tc.name      NdkRawfile_ReadLengthOf_0125
     * @tc.desc      readLengthOf(fileSize=-1, offset=3, length=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0125 begin`);
      const actual: number = readLengthOf(-1, 3, 0);
      logInfo(`readLengthOf(fileSize=-1, offset=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0126
     * @tc.name      NdkRawfile_ReadLengthOf_0126
     * @tc.desc      readLengthOf(fileSize=-1, offset=3, length=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0126 begin`);
      const actual: number = readLengthOf(-1, 3, 15);
      logInfo(`readLengthOf(fileSize=-1, offset=3, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0127
     * @tc.name      NdkRawfile_ReadLengthOf_0127
     * @tc.desc      readLengthOf(fileSize=15, offset=100, length=1) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0127 begin`);
      const actual: number = readLengthOf(15, 100, 1);
      logInfo(`readLengthOf(fileSize=15, offset=100, len...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0128
     * @tc.name      NdkRawfile_ReadLengthOf_0128
     * @tc.desc      readLengthOf(fileSize=20, offset=15, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0128 begin`);
      const actual: number = readLengthOf(20, 15, 5);
      logInfo(`readLengthOf(fileSize=20, offset=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0129
     * @tc.name      NdkRawfile_ReadLengthOf_0129
     * @tc.desc      readLengthOf(fileSize=0, offset=51.07, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0129 begin`);
      const actual: number = readLengthOf(0, 51.07, 5);
      logInfo(`readLengthOf(fileSize=0, offset=51.07, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0130
     * @tc.name      NdkRawfile_ReadLengthOf_0130
     * @tc.desc      readLengthOf(fileSize=-1, offset=1, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0130 begin`);
      const actual: number = readLengthOf(-1, 1, 5);
      logInfo(`readLengthOf(fileSize=-1, offset=1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0131
     * @tc.name      NdkRawfile_ReadLengthOf_0131
     * @tc.desc      readLengthOf(fileSize=15, offset=10, length=152) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0131 begin`);
      const actual: number = readLengthOf(15, 10, 152);
      logInfo(`readLengthOf(fileSize=15, offset=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0132
     * @tc.name      NdkRawfile_ReadLengthOf_0132
     * @tc.desc      readLengthOf(fileSize=2, offset=-100, length=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0132 begin`);
      const actual: number = readLengthOf(2, -100, 100);
      logInfo(`readLengthOf(fileSize=2, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0133
     * @tc.name      NdkRawfile_ReadLengthOf_0133
     * @tc.desc      readLengthOf(fileSize=0, offset=51.07, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0133 begin`);
      const actual: number = readLengthOf(0, 51.07, 3);
      logInfo(`readLengthOf(fileSize=0, offset=51.07, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0134
     * @tc.name      NdkRawfile_ReadLengthOf_0134
     * @tc.desc      readLengthOf(fileSize=139, offset=3, length=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0134 begin`);
      const actual: number = readLengthOf(139, 3, 10);
      logInfo(`readLengthOf(fileSize=139, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0135
     * @tc.name      NdkRawfile_ReadLengthOf_0135
     * @tc.desc      readLengthOf(fileSize=139, offset=15, length=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0135 begin`);
      const actual: number = readLengthOf(139, 15, 100);
      logInfo(`readLengthOf(fileSize=139, offset=15, len...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0136
     * @tc.name      NdkRawfile_ReadLengthOf_0136
     * @tc.desc      readLengthOf(fileSize=1, offset=-1, length=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0136 begin`);
      const actual: number = readLengthOf(1, -1, 15);
      logInfo(`readLengthOf(fileSize=1, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0137
     * @tc.name      NdkRawfile_ReadLengthOf_0137
     * @tc.desc      readLengthOf(fileSize=3, offset=10, length=10) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0137 begin`);
      const actual: number = readLengthOf(3, 10, 10);
      logInfo(`readLengthOf(fileSize=3, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0138
     * @tc.name      NdkRawfile_ReadLengthOf_0138
     * @tc.desc      readLengthOf(fileSize=10, offset=15, length=152) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0138 begin`);
      const actual: number = readLengthOf(10, 15, 152);
      logInfo(`readLengthOf(fileSize=10, offset=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0139
     * @tc.name      NdkRawfile_ReadLengthOf_0139
     * @tc.desc      readLengthOf(fileSize=0, offset=10, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0139 begin`);
      const actual: number = readLengthOf(0, 10, 1);
      logInfo(`readLengthOf(fileSize=0, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadLengthOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0140
     * @tc.name      NdkRawfile_ReadLengthOf_0140
     * @tc.desc      readLengthOf(fileSize=2, offset=100, length=20) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0140 begin`);
      const actual: number = readLengthOf(2, 100, 20);
      logInfo(`readLengthOf(fileSize=2, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0141
     * @tc.name      NdkRawfile_ReadLengthOf_0141
     * @tc.desc      readLengthOf(fileSize=2, offset=100, length=152) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0141 begin`);
      const actual: number = readLengthOf(2, 100, 152);
      logInfo(`readLengthOf(fileSize=2, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0142
     * @tc.name      NdkRawfile_ReadLengthOf_0142
     * @tc.desc      readLengthOf(fileSize=176, offset=5, length=164) returns 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0142 begin`);
      const actual: number = readLengthOf(176, 5, 164);
      logInfo(`readLengthOf(fileSize=176, offset=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(164);
      logInfo(`${BUNDLE}ReadLengthOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0143
     * @tc.name      NdkRawfile_ReadLengthOf_0143
     * @tc.desc      readLengthOf(fileSize=2, offset=100, length=164) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0143 begin`);
      const actual: number = readLengthOf(2, 100, 164);
      logInfo(`readLengthOf(fileSize=2, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0144
     * @tc.name      NdkRawfile_ReadLengthOf_0144
     * @tc.desc      readLengthOf(fileSize=2, offset=51.07, length=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0144 begin`);
      const actual: number = readLengthOf(2, 51.07, 100);
      logInfo(`readLengthOf(fileSize=2, offset=51.07, le...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0145
     * @tc.name      NdkRawfile_ReadLengthOf_0145
     * @tc.desc      readLengthOf(fileSize=-1, offset=50, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0145 begin`);
      const actual: number = readLengthOf(-1, 50, 5);
      logInfo(`readLengthOf(fileSize=-1, offset=50, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0146
     * @tc.name      NdkRawfile_ReadLengthOf_0146
     * @tc.desc      readLengthOf(fileSize=139, offset=0, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0146 begin`);
      const actual: number = readLengthOf(139, 0, -1);
      logInfo(`readLengthOf(fileSize=139, offset=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0147
     * @tc.name      NdkRawfile_ReadLengthOf_0147
     * @tc.desc      readLengthOf(fileSize=100, offset=-1, length=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0147 begin`);
      const actual: number = readLengthOf(100, -1, 0);
      logInfo(`readLengthOf(fileSize=100, offset=-1, len...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0148
     * @tc.name      NdkRawfile_ReadLengthOf_0148
     * @tc.desc      readLengthOf(fileSize=15, offset=1, length=0) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0148 begin`);
      const actual: number = readLengthOf(15, 1, 0);
      logInfo(`readLengthOf(fileSize=15, offset=1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0149
     * @tc.name      NdkRawfile_ReadLengthOf_0149
     * @tc.desc      readLengthOf(fileSize=5, offset=5, length=152) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0149 begin`);
      const actual: number = readLengthOf(5, 5, 152);
      logInfo(`readLengthOf(fileSize=5, offset=5, length...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0150
     * @tc.name      NdkRawfile_ReadLengthOf_0150
     * @tc.desc      readLengthOf(fileSize=100, offset=50, length=152) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0150 begin`);
      const actual: number = readLengthOf(100, 50, 152);
      logInfo(`readLengthOf(fileSize=100, offset=50, len...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0151
     * @tc.name      NdkRawfile_ReadLengthOf_0151
     * @tc.desc      readLengthOf(fileSize=3, offset=5, length=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0151 begin`);
      const actual: number = readLengthOf(3, 5, 1);
      logInfo(`readLengthOf(fileSize=3, offset=5, length=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0152
     * @tc.name      NdkRawfile_ReadLengthOf_0152
     * @tc.desc      readLengthOf(fileSize=3, offset=51.07, length=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0152 begin`);
      const actual: number = readLengthOf(3, 51.07, 1);
      logInfo(`readLengthOf(fileSize=3, offset=51.07, le...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadLengthOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0153
     * @tc.name      NdkRawfile_ReadLengthOf_0153
     * @tc.desc      readLengthOf(fileSize=10, offset=10, length=164) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0153 begin`);
      const actual: number = readLengthOf(10, 10, 164);
      logInfo(`readLengthOf(fileSize=10, offset=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0154
     * @tc.name      NdkRawfile_ReadLengthOf_0154
     * @tc.desc      readLengthOf(fileSize=100, offset=1, length=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0154 begin`);
      const actual: number = readLengthOf(100, 1, -1);
      logInfo(`readLengthOf(fileSize=100, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadLengthOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0155
     * @tc.name      NdkRawfile_ReadLengthOf_0155
     * @tc.desc      readLengthOf(fileSize=1, offset=50, length=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0155 begin`);
      const actual: number = readLengthOf(1, 50, 0);
      logInfo(`readLengthOf(fileSize=1, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0156
     * @tc.name      NdkRawfile_ReadLengthOf_0156
     * @tc.desc      readLengthOf(fileSize=176, offset=15, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0156 begin`);
      const actual: number = readLengthOf(176, 15, 5);
      logInfo(`readLengthOf(fileSize=176, offset=15, len...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0157
     * @tc.name      NdkRawfile_ReadLengthOf_0157
     * @tc.desc      readLengthOf(fileSize=15, offset=-100, length=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0157 begin`);
      const actual: number = readLengthOf(15, -100, 10);
      logInfo(`readLengthOf(fileSize=15, offset=-100, le...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0158
     * @tc.name      NdkRawfile_ReadLengthOf_0158
     * @tc.desc      readLengthOf(fileSize=3, offset=1, length=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0158 begin`);
      const actual: number = readLengthOf(3, 1, 1);
      logInfo(`readLengthOf(fileSize=3, offset=1, length=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadLengthOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0159
     * @tc.name      NdkRawfile_ReadLengthOf_0159
     * @tc.desc      readLengthOf(fileSize=2, offset=-100, length=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0159 begin`);
      const actual: number = readLengthOf(2, -100, 5);
      logInfo(`readLengthOf(fileSize=2, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadLengthOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0160
     * @tc.name      NdkRawfile_ReadLengthOf_0160
     * @tc.desc      readLengthOf(fileSize=1, offset=-100, length=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadLengthOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0160 begin`);
      const actual: number = readLengthOf(1, -100, 10);
      logInfo(`readLengthOf(fileSize=1, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0161
     * @tc.name      NdkRawfile_ReadLengthOf_0161
     * @tc.desc      readLengthOf(fileSize=15, offset=0, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0161 begin`);
      const actual: number = readLengthOf(15, 0, 15);
      logInfo(`readLengthOf(fileSize=15, offset=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadLengthOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0162
     * @tc.name      NdkRawfile_ReadLengthOf_0162
     * @tc.desc      readLengthOf(fileSize=100, offset=1, length=152) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0162 begin`);
      const actual: number = readLengthOf(100, 1, 152);
      logInfo(`readLengthOf(fileSize=100, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadLengthOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0163
     * @tc.name      NdkRawfile_ReadLengthOf_0163
     * @tc.desc      readLengthOf(fileSize=20, offset=51.07, length=5) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0163 begin`);
      const actual: number = readLengthOf(20, 51.07, 5);
      logInfo(`readLengthOf(fileSize=20, offset=51.07, l...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0164
     * @tc.name      NdkRawfile_ReadLengthOf_0164
     * @tc.desc      readLengthOf(fileSize=2, offset=5, length=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0164 begin`);
      const actual: number = readLengthOf(2, 5, -1);
      logInfo(`readLengthOf(fileSize=2, offset=5, length...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadLengthOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0165
     * @tc.name      NdkRawfile_ReadLengthOf_0165
     * @tc.desc      readLengthOf(fileSize=139, offset=50, length=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadLengthOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0165 begin`);
      const actual: number = readLengthOf(139, 50, 20);
      logInfo(`readLengthOf(fileSize=139, offset=50, len...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ReadLengthOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_LENGTH_OF_0166
     * @tc.name      NdkRawfile_ReadLengthOf_0166
     * @tc.desc      readLengthOf(fileSize=176, offset=0, length=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadLengthOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadLengthOf_0166 begin`);
      const actual: number = readLengthOf(176, 0, 10);
      logInfo(`readLengthOf(fileSize=176, offset=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadLengthOf_0166 end`);
    });
  });
}
