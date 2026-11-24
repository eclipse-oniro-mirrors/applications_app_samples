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
import { readStartOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for readStartOf (70 cases). */
export default function readStartOf2Test(): void {
  describe('ReadStartOf2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0097
     * @tc.name      NdkRawfile_ReadStartOf_0097
     * @tc.desc      readStartOf(fileSize=5, offset=-100, length=106) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0097 begin`);
      const actual: number = readStartOf(5, -100, 106);
      logInfo(`readStartOf(fileSize=5, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0098
     * @tc.name      NdkRawfile_ReadStartOf_0098
     * @tc.desc      readStartOf(fileSize=100, offset=1, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0098 begin`);
      const actual: number = readStartOf(100, 1, 100);
      logInfo(`readStartOf(fileSize=100, offset=1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0099
     * @tc.name      NdkRawfile_ReadStartOf_0099
     * @tc.desc      readStartOf(fileSize=20, offset=100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0099 begin`);
      const actual: number = readStartOf(20, 100, 0);
      logInfo(`readStartOf(fileSize=20, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0100
     * @tc.name      NdkRawfile_ReadStartOf_0100
     * @tc.desc      readStartOf(fileSize=20, offset=-100, length=-1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0100 begin`);
      const actual: number = readStartOf(20, -100, -1);
      logInfo(`readStartOf(fileSize=20, offset=-100, len...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}ReadStartOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0101
     * @tc.name      NdkRawfile_ReadStartOf_0101
     * @tc.desc      readStartOf(fileSize=133, offset=0, length=106) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0101 begin`);
      const actual: number = readStartOf(133, 0, 106);
      logInfo(`readStartOf(fileSize=133, offset=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0102
     * @tc.name      NdkRawfile_ReadStartOf_0102
     * @tc.desc      readStartOf(fileSize=2, offset=10, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0102 begin`);
      const actual: number = readStartOf(2, 10, -1);
      logInfo(`readStartOf(fileSize=2, offset=10, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0103
     * @tc.name      NdkRawfile_ReadStartOf_0103
     * @tc.desc      readStartOf(fileSize=5, offset=15, length=-8) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0103 begin`);
      const actual: number = readStartOf(5, 15, -8);
      logInfo(`readStartOf(fileSize=5, offset=15, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0104
     * @tc.name      NdkRawfile_ReadStartOf_0104
     * @tc.desc      readStartOf(fileSize=10, offset=1, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0104 begin`);
      const actual: number = readStartOf(10, 1, 10);
      logInfo(`readStartOf(fileSize=10, offset=1, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0105
     * @tc.name      NdkRawfile_ReadStartOf_0105
     * @tc.desc      readStartOf(fileSize=25, offset=50, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0105 begin`);
      const actual: number = readStartOf(25, 50, 0);
      logInfo(`readStartOf(fileSize=25, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0106
     * @tc.name      NdkRawfile_ReadStartOf_0106
     * @tc.desc      readStartOf(fileSize=25, offset=15, length=2) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0106 begin`);
      const actual: number = readStartOf(25, 15, 2);
      logInfo(`readStartOf(fileSize=25, offset=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadStartOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0107
     * @tc.name      NdkRawfile_ReadStartOf_0107
     * @tc.desc      readStartOf(fileSize=133, offset=15, length=100) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0107 begin`);
      const actual: number = readStartOf(133, 15, 100);
      logInfo(`readStartOf(fileSize=133, offset=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadStartOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0108
     * @tc.name      NdkRawfile_ReadStartOf_0108
     * @tc.desc      readStartOf(fileSize=2, offset=1, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0108 begin`);
      const actual: number = readStartOf(2, 1, 100);
      logInfo(`readStartOf(fileSize=2, offset=1, length=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0109
     * @tc.name      NdkRawfile_ReadStartOf_0109
     * @tc.desc      readStartOf(fileSize=-1, offset=3, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0109 begin`);
      const actual: number = readStartOf(-1, 3, 0);
      logInfo(`readStartOf(fileSize=-1, offset=3, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0110
     * @tc.name      NdkRawfile_ReadStartOf_0110
     * @tc.desc      readStartOf(fileSize=15, offset=0, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0110 begin`);
      const actual: number = readStartOf(15, 0, -1);
      logInfo(`readStartOf(fileSize=15, offset=0, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0111
     * @tc.name      NdkRawfile_ReadStartOf_0111
     * @tc.desc      readStartOf(fileSize=25, offset=1, length=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0111 begin`);
      const actual: number = readStartOf(25, 1, 2);
      logInfo(`readStartOf(fileSize=25, offset=1, length=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadStartOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0112
     * @tc.name      NdkRawfile_ReadStartOf_0112
     * @tc.desc      readStartOf(fileSize=100, offset=0, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0112 begin`);
      const actual: number = readStartOf(100, 0, 10);
      logInfo(`readStartOf(fileSize=100, offset=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0113
     * @tc.name      NdkRawfile_ReadStartOf_0113
     * @tc.desc      readStartOf(fileSize=10, offset=100, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0113 begin`);
      const actual: number = readStartOf(10, 100, 100);
      logInfo(`readStartOf(fileSize=10, offset=100, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0114
     * @tc.name      NdkRawfile_ReadStartOf_0114
     * @tc.desc      readStartOf(fileSize=0, offset=2, length=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0114 begin`);
      const actual: number = readStartOf(0, 2, 20);
      logInfo(`readStartOf(fileSize=0, offset=2, length=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0115
     * @tc.name      NdkRawfile_ReadStartOf_0115
     * @tc.desc      readStartOf(fileSize=-1, offset=177, length=-8) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0115 begin`);
      const actual: number = readStartOf(-1, 177, -8);
      logInfo(`readStartOf(fileSize=-1, offset=177, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0116
     * @tc.name      NdkRawfile_ReadStartOf_0116
     * @tc.desc      readStartOf(fileSize=100, offset=2, length=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0116 begin`);
      const actual: number = readStartOf(100, 2, 3);
      logInfo(`readStartOf(fileSize=100, offset=2, lengt...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadStartOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0117
     * @tc.name      NdkRawfile_ReadStartOf_0117
     * @tc.desc      readStartOf(fileSize=5, offset=10, length=-8) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0117 begin`);
      const actual: number = readStartOf(5, 10, -8);
      logInfo(`readStartOf(fileSize=5, offset=10, length...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadStartOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0118
     * @tc.name      NdkRawfile_ReadStartOf_0118
     * @tc.desc      readStartOf(fileSize=100, offset=-1, length=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0118 begin`);
      const actual: number = readStartOf(100, -1, 100);
      logInfo(`readStartOf(fileSize=100, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadStartOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0119
     * @tc.name      NdkRawfile_ReadStartOf_0119
     * @tc.desc      readStartOf(fileSize=10, offset=5, length=106) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0119 begin`);
      const actual: number = readStartOf(10, 5, 106);
      logInfo(`readStartOf(fileSize=10, offset=5, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0120
     * @tc.name      NdkRawfile_ReadStartOf_0120
     * @tc.desc      readStartOf(fileSize=-1, offset=177, length=106) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0120 begin`);
      const actual: number = readStartOf(-1, 177, 106);
      logInfo(`readStartOf(fileSize=-1, offset=177, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0121
     * @tc.name      NdkRawfile_ReadStartOf_0121
     * @tc.desc      readStartOf(fileSize=20, offset=3, length=-1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0121 begin`);
      const actual: number = readStartOf(20, 3, -1);
      logInfo(`readStartOf(fileSize=20, offset=3, length...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadStartOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0122
     * @tc.name      NdkRawfile_ReadStartOf_0122
     * @tc.desc      readStartOf(fileSize=15, offset=0, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0122 begin`);
      const actual: number = readStartOf(15, 0, 15);
      logInfo(`readStartOf(fileSize=15, offset=0, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0123
     * @tc.name      NdkRawfile_ReadStartOf_0123
     * @tc.desc      readStartOf(fileSize=5, offset=100, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0123 begin`);
      const actual: number = readStartOf(5, 100, 10);
      logInfo(`readStartOf(fileSize=5, offset=100, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0124
     * @tc.name      NdkRawfile_ReadStartOf_0124
     * @tc.desc      readStartOf(fileSize=1, offset=100, length=106) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0124 begin`);
      const actual: number = readStartOf(1, 100, 106);
      logInfo(`readStartOf(fileSize=1, offset=100, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0125
     * @tc.name      NdkRawfile_ReadStartOf_0125
     * @tc.desc      readStartOf(fileSize=15, offset=2, length=5) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0125 begin`);
      const actual: number = readStartOf(15, 2, 5);
      logInfo(`readStartOf(fileSize=15, offset=2, length=5): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadStartOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0126
     * @tc.name      NdkRawfile_ReadStartOf_0126
     * @tc.desc      readStartOf(fileSize=100, offset=177, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0126 begin`);
      const actual: number = readStartOf(100, 177, 3);
      logInfo(`readStartOf(fileSize=100, offset=177, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0127
     * @tc.name      NdkRawfile_ReadStartOf_0127
     * @tc.desc      readStartOf(fileSize=1, offset=-1, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0127 begin`);
      const actual: number = readStartOf(1, -1, 5);
      logInfo(`readStartOf(fileSize=1, offset=-1, length=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0128
     * @tc.name      NdkRawfile_ReadStartOf_0128
     * @tc.desc      readStartOf(fileSize=0, offset=50, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0128 begin`);
      const actual: number = readStartOf(0, 50, 1);
      logInfo(`readStartOf(fileSize=0, offset=50, length=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0129
     * @tc.name      NdkRawfile_ReadStartOf_0129
     * @tc.desc      readStartOf(fileSize=20, offset=177, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0129 begin`);
      const actual: number = readStartOf(20, 177, 1);
      logInfo(`readStartOf(fileSize=20, offset=177, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0130
     * @tc.name      NdkRawfile_ReadStartOf_0130
     * @tc.desc      readStartOf(fileSize=3, offset=3, length=-1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0130 begin`);
      const actual: number = readStartOf(3, 3, -1);
      logInfo(`readStartOf(fileSize=3, offset=3, length=-1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadStartOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0131
     * @tc.name      NdkRawfile_ReadStartOf_0131
     * @tc.desc      readStartOf(fileSize=1, offset=1, length=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0131 begin`);
      const actual: number = readStartOf(1, 1, -1);
      logInfo(`readStartOf(fileSize=1, offset=1, length=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadStartOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0132
     * @tc.name      NdkRawfile_ReadStartOf_0132
     * @tc.desc      readStartOf(fileSize=25, offset=5, length=3) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0132 begin`);
      const actual: number = readStartOf(25, 5, 3);
      logInfo(`readStartOf(fileSize=25, offset=5, length=3): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadStartOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0133
     * @tc.name      NdkRawfile_ReadStartOf_0133
     * @tc.desc      readStartOf(fileSize=3, offset=3, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0133 begin`);
      const actual: number = readStartOf(3, 3, 15);
      logInfo(`readStartOf(fileSize=3, offset=3, length=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0134
     * @tc.name      NdkRawfile_ReadStartOf_0134
     * @tc.desc      readStartOf(fileSize=0, offset=3, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0134 begin`);
      const actual: number = readStartOf(0, 3, 1);
      logInfo(`readStartOf(fileSize=0, offset=3, length=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0135
     * @tc.name      NdkRawfile_ReadStartOf_0135
     * @tc.desc      readStartOf(fileSize=3, offset=10, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0135 begin`);
      const actual: number = readStartOf(3, 10, 0);
      logInfo(`readStartOf(fileSize=3, offset=10, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0136
     * @tc.name      NdkRawfile_ReadStartOf_0136
     * @tc.desc      readStartOf(fileSize=20, offset=3, length=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0136 begin`);
      const actual: number = readStartOf(20, 3, 1);
      logInfo(`readStartOf(fileSize=20, offset=3, length=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ReadStartOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0137
     * @tc.name      NdkRawfile_ReadStartOf_0137
     * @tc.desc      readStartOf(fileSize=3, offset=2, length=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0137 begin`);
      const actual: number = readStartOf(3, 2, 0);
      logInfo(`readStartOf(fileSize=3, offset=2, length=0): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ReadStartOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0138
     * @tc.name      NdkRawfile_ReadStartOf_0138
     * @tc.desc      readStartOf(fileSize=1, offset=-1, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0138 begin`);
      const actual: number = readStartOf(1, -1, 15);
      logInfo(`readStartOf(fileSize=1, offset=-1, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0139
     * @tc.name      NdkRawfile_ReadStartOf_0139
     * @tc.desc      readStartOf(fileSize=100, offset=-100, length=15) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0139 begin`);
      const actual: number = readStartOf(100, -100, 15);
      logInfo(`readStartOf(fileSize=100, offset=-100, le...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}ReadStartOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0140
     * @tc.name      NdkRawfile_ReadStartOf_0140
     * @tc.desc      readStartOf(fileSize=133, offset=10, length=-8) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0140 begin`);
      const actual: number = readStartOf(133, 10, -8);
      logInfo(`readStartOf(fileSize=133, offset=10, leng...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadStartOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0141
     * @tc.name      NdkRawfile_ReadStartOf_0141
     * @tc.desc      readStartOf(fileSize=3, offset=177, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0141 begin`);
      const actual: number = readStartOf(3, 177, 5);
      logInfo(`readStartOf(fileSize=3, offset=177, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0142
     * @tc.name      NdkRawfile_ReadStartOf_0142
     * @tc.desc      readStartOf(fileSize=10, offset=177, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0142 begin`);
      const actual: number = readStartOf(10, 177, 5);
      logInfo(`readStartOf(fileSize=10, offset=177, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0143
     * @tc.name      NdkRawfile_ReadStartOf_0143
     * @tc.desc      readStartOf(fileSize=5, offset=100, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0143 begin`);
      const actual: number = readStartOf(5, 100, -1);
      logInfo(`readStartOf(fileSize=5, offset=100, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0144
     * @tc.name      NdkRawfile_ReadStartOf_0144
     * @tc.desc      readStartOf(fileSize=2, offset=3, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0144 begin`);
      const actual: number = readStartOf(2, 3, 0);
      logInfo(`readStartOf(fileSize=2, offset=3, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0145
     * @tc.name      NdkRawfile_ReadStartOf_0145
     * @tc.desc      readStartOf(fileSize=-1, offset=5, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0145 begin`);
      const actual: number = readStartOf(-1, 5, 3);
      logInfo(`readStartOf(fileSize=-1, offset=5, length=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0146
     * @tc.name      NdkRawfile_ReadStartOf_0146
     * @tc.desc      readStartOf(fileSize=2, offset=15, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0146 begin`);
      const actual: number = readStartOf(2, 15, 0);
      logInfo(`readStartOf(fileSize=2, offset=15, length=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0147
     * @tc.name      NdkRawfile_ReadStartOf_0147
     * @tc.desc      readStartOf(fileSize=100, offset=-1, length=-8) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0147 begin`);
      const actual: number = readStartOf(100, -1, -8);
      logInfo(`readStartOf(fileSize=100, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadStartOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0148
     * @tc.name      NdkRawfile_ReadStartOf_0148
     * @tc.desc      readStartOf(fileSize=15, offset=50, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0148 begin`);
      const actual: number = readStartOf(15, 50, -1);
      logInfo(`readStartOf(fileSize=15, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0149
     * @tc.name      NdkRawfile_ReadStartOf_0149
     * @tc.desc      readStartOf(fileSize=100, offset=0, length=106) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0149 begin`);
      const actual: number = readStartOf(100, 0, 106);
      logInfo(`readStartOf(fileSize=100, offset=0, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0150
     * @tc.name      NdkRawfile_ReadStartOf_0150
     * @tc.desc      readStartOf(fileSize=2, offset=2, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0150 begin`);
      const actual: number = readStartOf(2, 2, 5);
      logInfo(`readStartOf(fileSize=2, offset=2, length=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0151
     * @tc.name      NdkRawfile_ReadStartOf_0151
     * @tc.desc      readStartOf(fileSize=133, offset=100, length=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0151 begin`);
      const actual: number = readStartOf(133, 100, 0);
      logInfo(`readStartOf(fileSize=133, offset=100, len...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadStartOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0152
     * @tc.name      NdkRawfile_ReadStartOf_0152
     * @tc.desc      readStartOf(fileSize=10, offset=5, length=3) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0152 begin`);
      const actual: number = readStartOf(10, 5, 3);
      logInfo(`readStartOf(fileSize=10, offset=5, length=3): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadStartOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0153
     * @tc.name      NdkRawfile_ReadStartOf_0153
     * @tc.desc      readStartOf(fileSize=100, offset=5, length=20) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0153 begin`);
      const actual: number = readStartOf(100, 5, 20);
      logInfo(`readStartOf(fileSize=100, offset=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadStartOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0154
     * @tc.name      NdkRawfile_ReadStartOf_0154
     * @tc.desc      readStartOf(fileSize=100, offset=100, length=-8) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0154 begin`);
      const actual: number = readStartOf(100, 100, -8);
      logInfo(`readStartOf(fileSize=100, offset=100, len...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ReadStartOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0155
     * @tc.name      NdkRawfile_ReadStartOf_0155
     * @tc.desc      readStartOf(fileSize=25, offset=1, length=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0155 begin`);
      const actual: number = readStartOf(25, 1, 15);
      logInfo(`readStartOf(fileSize=25, offset=1, length...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ReadStartOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0156
     * @tc.name      NdkRawfile_ReadStartOf_0156
     * @tc.desc      readStartOf(fileSize=20, offset=0, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0156 begin`);
      const actual: number = readStartOf(20, 0, 5);
      logInfo(`readStartOf(fileSize=20, offset=0, length=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0157
     * @tc.name      NdkRawfile_ReadStartOf_0157
     * @tc.desc      readStartOf(fileSize=133, offset=15, length=0) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0157 begin`);
      const actual: number = readStartOf(133, 15, 0);
      logInfo(`readStartOf(fileSize=133, offset=15, leng...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ReadStartOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0158
     * @tc.name      NdkRawfile_ReadStartOf_0158
     * @tc.desc      readStartOf(fileSize=20, offset=10, length=-1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0158 begin`);
      const actual: number = readStartOf(20, 10, -1);
      logInfo(`readStartOf(fileSize=20, offset=10, lengt...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ReadStartOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0159
     * @tc.name      NdkRawfile_ReadStartOf_0159
     * @tc.desc      readStartOf(fileSize=-1, offset=15, length=-8) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0159 begin`);
      const actual: number = readStartOf(-1, 15, -8);
      logInfo(`readStartOf(fileSize=-1, offset=15, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0160
     * @tc.name      NdkRawfile_ReadStartOf_0160
     * @tc.desc      readStartOf(fileSize=20, offset=-1, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0160 begin`);
      const actual: number = readStartOf(20, -1, 100);
      logInfo(`readStartOf(fileSize=20, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0161
     * @tc.name      NdkRawfile_ReadStartOf_0161
     * @tc.desc      readStartOf(fileSize=1, offset=0, length=106) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0161 begin`);
      const actual: number = readStartOf(1, 0, 106);
      logInfo(`readStartOf(fileSize=1, offset=0, length=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0162
     * @tc.name      NdkRawfile_ReadStartOf_0162
     * @tc.desc      readStartOf(fileSize=-1, offset=50, length=106) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_ReadStartOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReadStartOf_0162 begin`);
      const actual: number = readStartOf(-1, 50, 106);
      logInfo(`readStartOf(fileSize=-1, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0163
     * @tc.name      NdkRawfile_ReadStartOf_0163
     * @tc.desc      readStartOf(fileSize=15, offset=3, length=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0163 begin`);
      const actual: number = readStartOf(15, 3, 20);
      logInfo(`readStartOf(fileSize=15, offset=3, length...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0164
     * @tc.name      NdkRawfile_ReadStartOf_0164
     * @tc.desc      readStartOf(fileSize=133, offset=5, length=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0164 begin`);
      const actual: number = readStartOf(133, 5, 1);
      logInfo(`readStartOf(fileSize=133, offset=5, lengt...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ReadStartOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0165
     * @tc.name      NdkRawfile_ReadStartOf_0165
     * @tc.desc      readStartOf(fileSize=20, offset=-1, length=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReadStartOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReadStartOf_0165 begin`);
      const actual: number = readStartOf(20, -1, 5);
      logInfo(`readStartOf(fileSize=20, offset=-1, lengt...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ReadStartOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_READ_START_OF_0166
     * @tc.name      NdkRawfile_ReadStartOf_0166
     * @tc.desc      readStartOf(fileSize=100, offset=50, length=106) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReadStartOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadStartOf_0166 begin`);
      const actual: number = readStartOf(100, 50, 106);
      logInfo(`readStartOf(fileSize=100, offset=50, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ReadStartOf_0166 end`);
    });
  });
}
