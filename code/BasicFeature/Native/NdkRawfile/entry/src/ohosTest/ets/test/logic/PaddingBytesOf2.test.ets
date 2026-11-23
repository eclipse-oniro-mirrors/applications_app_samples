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
import { paddingBytesOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for paddingBytesOf (70 cases). */
export default function paddingBytesOf2Test(): void {
  describe('PaddingBytesOf2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0097
     * @tc.name      NdkRawfile_PaddingBytesOf_0097
     * @tc.desc      paddingBytesOf(fileSize=2, offset=15, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0097 begin`);
      const actual: number = paddingBytesOf(2, 15, 0);
      logInfo(`paddingBytesOf(fileSize=2, offset=15, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0098
     * @tc.name      NdkRawfile_PaddingBytesOf_0098
     * @tc.desc      paddingBytesOf(fileSize=1, offset=33, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0098 begin`);
      const actual: number = paddingBytesOf(1, 33, 15);
      logInfo(`paddingBytesOf(fileSize=1, offset=33, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0099
     * @tc.name      NdkRawfile_PaddingBytesOf_0099
     * @tc.desc      paddingBytesOf(fileSize=20, offset=100, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0099 begin`);
      const actual: number = paddingBytesOf(20, 100, 5);
      logInfo(`paddingBytesOf(fileSize=20, offset=100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0100
     * @tc.name      NdkRawfile_PaddingBytesOf_0100
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=0, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0100 begin`);
      const actual: number = paddingBytesOf(-1, 0, 0);
      logInfo(`paddingBytesOf(fileSize=-1, offset=0, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0101
     * @tc.name      NdkRawfile_PaddingBytesOf_0101
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=-100, length=18.1) returns -18.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0101 begin`);
      const actual: number = paddingBytesOf(-1, -100, 18.1);
      logInfo(`paddingBytesOf(fileSize=-1, offset=-100, ...: actual=${actual}`);
      expect(actual).assertClose(-18.1, PRECISION);
      logInfo(`${BUNDLE}PaddingBytesOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0102
     * @tc.name      NdkRawfile_PaddingBytesOf_0102
     * @tc.desc      paddingBytesOf(fileSize=2, offset=5, length=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0102 begin`);
      const actual: number = paddingBytesOf(2, 5, 20);
      logInfo(`paddingBytesOf(fileSize=2, offset=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0103
     * @tc.name      NdkRawfile_PaddingBytesOf_0103
     * @tc.desc      paddingBytesOf(fileSize=10, offset=50, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0103 begin`);
      const actual: number = paddingBytesOf(10, 50, 1);
      logInfo(`paddingBytesOf(fileSize=10, offset=50, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0104
     * @tc.name      NdkRawfile_PaddingBytesOf_0104
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=-100, length=3) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0104 begin`);
      const actual: number = paddingBytesOf(-1, -100, 3);
      logInfo(`paddingBytesOf(fileSize=-1, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}PaddingBytesOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0105
     * @tc.name      NdkRawfile_PaddingBytesOf_0105
     * @tc.desc      paddingBytesOf(fileSize=0, offset=2, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0105 begin`);
      const actual: number = paddingBytesOf(0, 2, 5);
      logInfo(`paddingBytesOf(fileSize=0, offset=2, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0106
     * @tc.name      NdkRawfile_PaddingBytesOf_0106
     * @tc.desc      paddingBytesOf(fileSize=2, offset=33, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0106 begin`);
      const actual: number = paddingBytesOf(2, 33, 100);
      logInfo(`paddingBytesOf(fileSize=2, offset=33, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0107
     * @tc.name      NdkRawfile_PaddingBytesOf_0107
     * @tc.desc      paddingBytesOf(fileSize=15, offset=100, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0107 begin`);
      const actual: number = paddingBytesOf(15, 100, 15);
      logInfo(`paddingBytesOf(fileSize=15, offset=100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0108
     * @tc.name      NdkRawfile_PaddingBytesOf_0108
     * @tc.desc      paddingBytesOf(fileSize=2, offset=15, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0108 begin`);
      const actual: number = paddingBytesOf(2, 15, 3);
      logInfo(`paddingBytesOf(fileSize=2, offset=15, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0109
     * @tc.name      NdkRawfile_PaddingBytesOf_0109
     * @tc.desc      paddingBytesOf(fileSize=15, offset=-100, length=10) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0109 begin`);
      const actual: number = paddingBytesOf(15, -100, 10);
      logInfo(`paddingBytesOf(fileSize=15, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}PaddingBytesOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0110
     * @tc.name      NdkRawfile_PaddingBytesOf_0110
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=33, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0110 begin`);
      const actual: number = paddingBytesOf(-1, 33, 3);
      logInfo(`paddingBytesOf(fileSize=-1, offset=33, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0111
     * @tc.name      NdkRawfile_PaddingBytesOf_0111
     * @tc.desc      paddingBytesOf(fileSize=196, offset=-1, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0111 begin`);
      const actual: number = paddingBytesOf(196, -1, 0);
      logInfo(`paddingBytesOf(fileSize=196, offset=-1, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0112
     * @tc.name      NdkRawfile_PaddingBytesOf_0112
     * @tc.desc      paddingBytesOf(fileSize=10, offset=100, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0112 begin`);
      const actual: number = paddingBytesOf(10, 100, 5);
      logInfo(`paddingBytesOf(fileSize=10, offset=100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0113
     * @tc.name      NdkRawfile_PaddingBytesOf_0113
     * @tc.desc      paddingBytesOf(fileSize=20, offset=0, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0113 begin`);
      const actual: number = paddingBytesOf(20, 0, 100);
      logInfo(`paddingBytesOf(fileSize=20, offset=0, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0114
     * @tc.name      NdkRawfile_PaddingBytesOf_0114
     * @tc.desc      paddingBytesOf(fileSize=1, offset=1, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0114 begin`);
      const actual: number = paddingBytesOf(1, 1, 3);
      logInfo(`paddingBytesOf(fileSize=1, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0115
     * @tc.name      NdkRawfile_PaddingBytesOf_0115
     * @tc.desc      paddingBytesOf(fileSize=10, offset=5, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0115 begin`);
      const actual: number = paddingBytesOf(10, 5, 15);
      logInfo(`paddingBytesOf(fileSize=10, offset=5, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0116
     * @tc.name      NdkRawfile_PaddingBytesOf_0116
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=15, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0116 begin`);
      const actual: number = paddingBytesOf(-1, 15, 1);
      logInfo(`paddingBytesOf(fileSize=-1, offset=15, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0117
     * @tc.name      NdkRawfile_PaddingBytesOf_0117
     * @tc.desc      paddingBytesOf(fileSize=5, offset=3, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0117 begin`);
      const actual: number = paddingBytesOf(5, 3, 100);
      logInfo(`paddingBytesOf(fileSize=5, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0118
     * @tc.name      NdkRawfile_PaddingBytesOf_0118
     * @tc.desc      paddingBytesOf(fileSize=1, offset=10, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0118 begin`);
      const actual: number = paddingBytesOf(1, 10, 3);
      logInfo(`paddingBytesOf(fileSize=1, offset=10, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0119
     * @tc.name      NdkRawfile_PaddingBytesOf_0119
     * @tc.desc      paddingBytesOf(fileSize=1, offset=-1, length=18.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0119 begin`);
      const actual: number = paddingBytesOf(1, -1, 18.1);
      logInfo(`paddingBytesOf(fileSize=1, offset=-1, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0120
     * @tc.name      NdkRawfile_PaddingBytesOf_0120
     * @tc.desc      paddingBytesOf(fileSize=1, offset=3, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0120 begin`);
      const actual: number = paddingBytesOf(1, 3, 15);
      logInfo(`paddingBytesOf(fileSize=1, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0121
     * @tc.name      NdkRawfile_PaddingBytesOf_0121
     * @tc.desc      paddingBytesOf(fileSize=30, offset=50, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0121 begin`);
      const actual: number = paddingBytesOf(30, 50, 1);
      logInfo(`paddingBytesOf(fileSize=30, offset=50, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0122
     * @tc.name      NdkRawfile_PaddingBytesOf_0122
     * @tc.desc      paddingBytesOf(fileSize=100, offset=50, length=3) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0122 begin`);
      const actual: number = paddingBytesOf(100, 50, 3);
      logInfo(`paddingBytesOf(fileSize=100, offset=50, l...: actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}PaddingBytesOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0123
     * @tc.name      NdkRawfile_PaddingBytesOf_0123
     * @tc.desc      paddingBytesOf(fileSize=1, offset=100, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0123 begin`);
      const actual: number = paddingBytesOf(1, 100, 0);
      logInfo(`paddingBytesOf(fileSize=1, offset=100, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0124
     * @tc.name      NdkRawfile_PaddingBytesOf_0124
     * @tc.desc      paddingBytesOf(fileSize=2, offset=10, length=18.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0124 begin`);
      const actual: number = paddingBytesOf(2, 10, 18.1);
      logInfo(`paddingBytesOf(fileSize=2, offset=10, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0125
     * @tc.name      NdkRawfile_PaddingBytesOf_0125
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=1, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0125 begin`);
      const actual: number = paddingBytesOf(-1, 1, 5);
      logInfo(`paddingBytesOf(fileSize=-1, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0126
     * @tc.name      NdkRawfile_PaddingBytesOf_0126
     * @tc.desc      paddingBytesOf(fileSize=30, offset=33, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0126 begin`);
      const actual: number = paddingBytesOf(30, 33, 15);
      logInfo(`paddingBytesOf(fileSize=30, offset=33, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0127
     * @tc.name      NdkRawfile_PaddingBytesOf_0127
     * @tc.desc      paddingBytesOf(fileSize=30, offset=10, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0127 begin`);
      const actual: number = paddingBytesOf(30, 10, 15);
      logInfo(`paddingBytesOf(fileSize=30, offset=10, le...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}PaddingBytesOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0128
     * @tc.name      NdkRawfile_PaddingBytesOf_0128
     * @tc.desc      paddingBytesOf(fileSize=2, offset=-1, length=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0128 begin`);
      const actual: number = paddingBytesOf(2, -1, -1);
      logInfo(`paddingBytesOf(fileSize=2, offset=-1, len...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PaddingBytesOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0129
     * @tc.name      NdkRawfile_PaddingBytesOf_0129
     * @tc.desc      paddingBytesOf(fileSize=30, offset=100, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0129 begin`);
      const actual: number = paddingBytesOf(30, 100, 5);
      logInfo(`paddingBytesOf(fileSize=30, offset=100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0130
     * @tc.name      NdkRawfile_PaddingBytesOf_0130
     * @tc.desc      paddingBytesOf(fileSize=1, offset=100, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0130 begin`);
      const actual: number = paddingBytesOf(1, 100, 3);
      logInfo(`paddingBytesOf(fileSize=1, offset=100, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0131
     * @tc.name      NdkRawfile_PaddingBytesOf_0131
     * @tc.desc      paddingBytesOf(fileSize=10, offset=2, length=-1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0131 begin`);
      const actual: number = paddingBytesOf(10, 2, -1);
      logInfo(`paddingBytesOf(fileSize=10, offset=2, len...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PaddingBytesOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0132
     * @tc.name      NdkRawfile_PaddingBytesOf_0132
     * @tc.desc      paddingBytesOf(fileSize=100, offset=-100, length=3) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0132 begin`);
      const actual: number = paddingBytesOf(100, -100, 3);
      logInfo(`paddingBytesOf(fileSize=100, offset=-100,...: actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}PaddingBytesOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0133
     * @tc.name      NdkRawfile_PaddingBytesOf_0133
     * @tc.desc      paddingBytesOf(fileSize=15, offset=1, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0133 begin`);
      const actual: number = paddingBytesOf(15, 1, 15);
      logInfo(`paddingBytesOf(fileSize=15, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0134
     * @tc.name      NdkRawfile_PaddingBytesOf_0134
     * @tc.desc      paddingBytesOf(fileSize=1, offset=3, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0134 begin`);
      const actual: number = paddingBytesOf(1, 3, -1);
      logInfo(`paddingBytesOf(fileSize=1, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0135
     * @tc.name      NdkRawfile_PaddingBytesOf_0135
     * @tc.desc      paddingBytesOf(fileSize=20, offset=-100, length=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0135 begin`);
      const actual: number = paddingBytesOf(20, -100, 20);
      logInfo(`paddingBytesOf(fileSize=20, offset=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0136
     * @tc.name      NdkRawfile_PaddingBytesOf_0136
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=0, length=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0136 begin`);
      const actual: number = paddingBytesOf(-1, 0, 2);
      logInfo(`paddingBytesOf(fileSize=-1, offset=0, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0137
     * @tc.name      NdkRawfile_PaddingBytesOf_0137
     * @tc.desc      paddingBytesOf(fileSize=0, offset=100, length=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0137 begin`);
      const actual: number = paddingBytesOf(0, 100, 15);
      logInfo(`paddingBytesOf(fileSize=0, offset=100, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0138
     * @tc.name      NdkRawfile_PaddingBytesOf_0138
     * @tc.desc      paddingBytesOf(fileSize=15, offset=1, length=18.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0138 begin`);
      const actual: number = paddingBytesOf(15, 1, 18.1);
      logInfo(`paddingBytesOf(fileSize=15, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0139
     * @tc.name      NdkRawfile_PaddingBytesOf_0139
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=1, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0139 begin`);
      const actual: number = paddingBytesOf(-1, 1, 0);
      logInfo(`paddingBytesOf(fileSize=-1, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0140
     * @tc.name      NdkRawfile_PaddingBytesOf_0140
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=10, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0140 begin`);
      const actual: number = paddingBytesOf(-1, 10, -1);
      logInfo(`paddingBytesOf(fileSize=-1, offset=10, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0141
     * @tc.name      NdkRawfile_PaddingBytesOf_0141
     * @tc.desc      paddingBytesOf(fileSize=30, offset=1, length=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0141 begin`);
      const actual: number = paddingBytesOf(30, 1, 0);
      logInfo(`paddingBytesOf(fileSize=30, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PaddingBytesOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0142
     * @tc.name      NdkRawfile_PaddingBytesOf_0142
     * @tc.desc      paddingBytesOf(fileSize=15, offset=100, length=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0142 begin`);
      const actual: number = paddingBytesOf(15, 100, 20);
      logInfo(`paddingBytesOf(fileSize=15, offset=100, l...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0143
     * @tc.name      NdkRawfile_PaddingBytesOf_0143
     * @tc.desc      paddingBytesOf(fileSize=2, offset=50, length=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0143 begin`);
      const actual: number = paddingBytesOf(2, 50, 0);
      logInfo(`paddingBytesOf(fileSize=2, offset=50, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0144
     * @tc.name      NdkRawfile_PaddingBytesOf_0144
     * @tc.desc      paddingBytesOf(fileSize=5, offset=15, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0144 begin`);
      const actual: number = paddingBytesOf(5, 15, -1);
      logInfo(`paddingBytesOf(fileSize=5, offset=15, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0145
     * @tc.name      NdkRawfile_PaddingBytesOf_0145
     * @tc.desc      paddingBytesOf(fileSize=20, offset=15, length=18.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0145 begin`);
      const actual: number = paddingBytesOf(20, 15, 18.1);
      logInfo(`paddingBytesOf(fileSize=20, offset=15, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0146
     * @tc.name      NdkRawfile_PaddingBytesOf_0146
     * @tc.desc      paddingBytesOf(fileSize=5, offset=1, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0146 begin`);
      const actual: number = paddingBytesOf(5, 1, 5);
      logInfo(`paddingBytesOf(fileSize=5, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0147
     * @tc.name      NdkRawfile_PaddingBytesOf_0147
     * @tc.desc      paddingBytesOf(fileSize=10, offset=0, length=3) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0147 begin`);
      const actual: number = paddingBytesOf(10, 0, 3);
      logInfo(`paddingBytesOf(fileSize=10, offset=0, len...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}PaddingBytesOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0148
     * @tc.name      NdkRawfile_PaddingBytesOf_0148
     * @tc.desc      paddingBytesOf(fileSize=100, offset=5, length=2) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0148 begin`);
      const actual: number = paddingBytesOf(100, 5, 2);
      logInfo(`paddingBytesOf(fileSize=100, offset=5, le...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}PaddingBytesOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0149
     * @tc.name      NdkRawfile_PaddingBytesOf_0149
     * @tc.desc      paddingBytesOf(fileSize=15, offset=2, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0149 begin`);
      const actual: number = paddingBytesOf(15, 2, 100);
      logInfo(`paddingBytesOf(fileSize=15, offset=2, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0150
     * @tc.name      NdkRawfile_PaddingBytesOf_0150
     * @tc.desc      paddingBytesOf(fileSize=100, offset=10, length=2) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0150 begin`);
      const actual: number = paddingBytesOf(100, 10, 2);
      logInfo(`paddingBytesOf(fileSize=100, offset=10, l...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}PaddingBytesOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0151
     * @tc.name      NdkRawfile_PaddingBytesOf_0151
     * @tc.desc      paddingBytesOf(fileSize=3, offset=1, length=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0151 begin`);
      const actual: number = paddingBytesOf(3, 1, 100);
      logInfo(`paddingBytesOf(fileSize=3, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0152
     * @tc.name      NdkRawfile_PaddingBytesOf_0152
     * @tc.desc      paddingBytesOf(fileSize=10, offset=2, length=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0152 begin`);
      const actual: number = paddingBytesOf(10, 2, 20);
      logInfo(`paddingBytesOf(fileSize=10, offset=2, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0153
     * @tc.name      NdkRawfile_PaddingBytesOf_0153
     * @tc.desc      paddingBytesOf(fileSize=3, offset=10, length=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0153 begin`);
      const actual: number = paddingBytesOf(3, 10, -1);
      logInfo(`paddingBytesOf(fileSize=3, offset=10, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0154
     * @tc.name      NdkRawfile_PaddingBytesOf_0154
     * @tc.desc      paddingBytesOf(fileSize=30, offset=-1, length=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0154 begin`);
      const actual: number = paddingBytesOf(30, -1, 15);
      logInfo(`paddingBytesOf(fileSize=30, offset=-1, le...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}PaddingBytesOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0155
     * @tc.name      NdkRawfile_PaddingBytesOf_0155
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=50, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0155 begin`);
      const actual: number = paddingBytesOf(-1, 50, 10);
      logInfo(`paddingBytesOf(fileSize=-1, offset=50, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0156
     * @tc.name      NdkRawfile_PaddingBytesOf_0156
     * @tc.desc      paddingBytesOf(fileSize=-1, offset=1, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0156 begin`);
      const actual: number = paddingBytesOf(-1, 1, 3);
      logInfo(`paddingBytesOf(fileSize=-1, offset=1, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0157
     * @tc.name      NdkRawfile_PaddingBytesOf_0157
     * @tc.desc      paddingBytesOf(fileSize=2, offset=10, length=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0157 begin`);
      const actual: number = paddingBytesOf(2, 10, 5);
      logInfo(`paddingBytesOf(fileSize=2, offset=10, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0158
     * @tc.name      NdkRawfile_PaddingBytesOf_0158
     * @tc.desc      paddingBytesOf(fileSize=3, offset=1, length=-1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_PaddingBytesOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0158 begin`);
      const actual: number = paddingBytesOf(3, 1, -1);
      logInfo(`paddingBytesOf(fileSize=3, offset=1, leng...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PaddingBytesOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0159
     * @tc.name      NdkRawfile_PaddingBytesOf_0159
     * @tc.desc      paddingBytesOf(fileSize=100, offset=2, length=2) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0159 begin`);
      const actual: number = paddingBytesOf(100, 2, 2);
      logInfo(`paddingBytesOf(fileSize=100, offset=2, le...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}PaddingBytesOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0160
     * @tc.name      NdkRawfile_PaddingBytesOf_0160
     * @tc.desc      paddingBytesOf(fileSize=10, offset=5, length=18.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0160 begin`);
      const actual: number = paddingBytesOf(10, 5, 18.1);
      logInfo(`paddingBytesOf(fileSize=10, offset=5, len...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0161
     * @tc.name      NdkRawfile_PaddingBytesOf_0161
     * @tc.desc      paddingBytesOf(fileSize=2, offset=0, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0161 begin`);
      const actual: number = paddingBytesOf(2, 0, 10);
      logInfo(`paddingBytesOf(fileSize=2, offset=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0162
     * @tc.name      NdkRawfile_PaddingBytesOf_0162
     * @tc.desc      paddingBytesOf(fileSize=1, offset=3, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0162 begin`);
      const actual: number = paddingBytesOf(1, 3, 1);
      logInfo(`paddingBytesOf(fileSize=1, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0163
     * @tc.name      NdkRawfile_PaddingBytesOf_0163
     * @tc.desc      paddingBytesOf(fileSize=1, offset=0, length=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0163 begin`);
      const actual: number = paddingBytesOf(1, 0, 10);
      logInfo(`paddingBytesOf(fileSize=1, offset=0, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0164
     * @tc.name      NdkRawfile_PaddingBytesOf_0164
     * @tc.desc      paddingBytesOf(fileSize=3, offset=100, length=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0164 begin`);
      const actual: number = paddingBytesOf(3, 100, 1);
      logInfo(`paddingBytesOf(fileSize=3, offset=100, le...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0165
     * @tc.name      NdkRawfile_PaddingBytesOf_0165
     * @tc.desc      paddingBytesOf(fileSize=2, offset=3, length=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0165 begin`);
      const actual: number = paddingBytesOf(2, 3, 3);
      logInfo(`paddingBytesOf(fileSize=2, offset=3, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PADDING_BYTES_OF_0166
     * @tc.name      NdkRawfile_PaddingBytesOf_0166
     * @tc.desc      paddingBytesOf(fileSize=5, offset=5, length=18.1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_PaddingBytesOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PaddingBytesOf_0166 begin`);
      const actual: number = paddingBytesOf(5, 5, 18.1);
      logInfo(`paddingBytesOf(fileSize=5, offset=5, leng...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PaddingBytesOf_0166 end`);
    });
  });
}
