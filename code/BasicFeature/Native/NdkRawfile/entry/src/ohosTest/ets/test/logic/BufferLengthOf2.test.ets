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
import { bufferLengthOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for bufferLengthOf (24 cases). */
export default function bufferLengthOf2Test(): void {
  describe('BufferLengthOf2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0097
     * @tc.name      NdkRawfile_BufferLengthOf_0097
     * @tc.desc      bufferLengthOf(fileSize=174) returns 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0097 begin`);
      const actual: number = bufferLengthOf(174);
      logInfo(`bufferLengthOf(fileSize=174): actual=${actual}`);
      expect(actual).assertEqual(174);
      logInfo(`${BUNDLE}BufferLengthOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0098
     * @tc.name      NdkRawfile_BufferLengthOf_0098
     * @tc.desc      bufferLengthOf(fileSize=53) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0098 begin`);
      const actual: number = bufferLengthOf(53);
      logInfo(`bufferLengthOf(fileSize=53): actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}BufferLengthOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0099
     * @tc.name      NdkRawfile_BufferLengthOf_0099
     * @tc.desc      bufferLengthOf(fileSize=157) returns 157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0099 begin`);
      const actual: number = bufferLengthOf(157);
      logInfo(`bufferLengthOf(fileSize=157): actual=${actual}`);
      expect(actual).assertEqual(157);
      logInfo(`${BUNDLE}BufferLengthOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0100
     * @tc.name      NdkRawfile_BufferLengthOf_0100
     * @tc.desc      bufferLengthOf(fileSize=68) returns 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0100 begin`);
      const actual: number = bufferLengthOf(68);
      logInfo(`bufferLengthOf(fileSize=68): actual=${actual}`);
      expect(actual).assertEqual(68);
      logInfo(`${BUNDLE}BufferLengthOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0101
     * @tc.name      NdkRawfile_BufferLengthOf_0101
     * @tc.desc      bufferLengthOf(fileSize=93.38) returns 93.38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0101 begin`);
      const actual: number = bufferLengthOf(93.38);
      logInfo(`bufferLengthOf(fileSize=93.38): actual=${actual}`);
      expect(actual).assertClose(93.38, PRECISION);
      logInfo(`${BUNDLE}BufferLengthOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0102
     * @tc.name      NdkRawfile_BufferLengthOf_0102
     * @tc.desc      bufferLengthOf(fileSize=82) returns 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_BufferLengthOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0102 begin`);
      const actual: number = bufferLengthOf(82);
      logInfo(`bufferLengthOf(fileSize=82): actual=${actual}`);
      expect(actual).assertEqual(82);
      logInfo(`${BUNDLE}BufferLengthOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0103
     * @tc.name      NdkRawfile_BufferLengthOf_0103
     * @tc.desc      bufferLengthOf(fileSize=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_BufferLengthOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0103 begin`);
      const actual: number = bufferLengthOf(-1);
      logInfo(`bufferLengthOf(fileSize=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0104
     * @tc.name      NdkRawfile_BufferLengthOf_0104
     * @tc.desc      bufferLengthOf(fileSize=-4) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0104 begin`);
      const actual: number = bufferLengthOf(-4);
      logInfo(`bufferLengthOf(fileSize=-4): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0105
     * @tc.name      NdkRawfile_BufferLengthOf_0105
     * @tc.desc      bufferLengthOf(fileSize=-9) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0105 begin`);
      const actual: number = bufferLengthOf(-9);
      logInfo(`bufferLengthOf(fileSize=-9): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0106
     * @tc.name      NdkRawfile_BufferLengthOf_0106
     * @tc.desc      bufferLengthOf(fileSize=-32) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0106 begin`);
      const actual: number = bufferLengthOf(-32);
      logInfo(`bufferLengthOf(fileSize=-32): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0107
     * @tc.name      NdkRawfile_BufferLengthOf_0107
     * @tc.desc      bufferLengthOf(fileSize=-76) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0107 begin`);
      const actual: number = bufferLengthOf(-76);
      logInfo(`bufferLengthOf(fileSize=-76): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0108
     * @tc.name      NdkRawfile_BufferLengthOf_0108
     * @tc.desc      bufferLengthOf(fileSize=-13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0108 begin`);
      const actual: number = bufferLengthOf(-13);
      logInfo(`bufferLengthOf(fileSize=-13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0109
     * @tc.name      NdkRawfile_BufferLengthOf_0109
     * @tc.desc      bufferLengthOf(fileSize=-25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0109 begin`);
      const actual: number = bufferLengthOf(-25);
      logInfo(`bufferLengthOf(fileSize=-25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0110
     * @tc.name      NdkRawfile_BufferLengthOf_0110
     * @tc.desc      bufferLengthOf(fileSize=-46) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0110 begin`);
      const actual: number = bufferLengthOf(-46);
      logInfo(`bufferLengthOf(fileSize=-46): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0111
     * @tc.name      NdkRawfile_BufferLengthOf_0111
     * @tc.desc      bufferLengthOf(fileSize=-7) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0111 begin`);
      const actual: number = bufferLengthOf(-7);
      logInfo(`bufferLengthOf(fileSize=-7): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0112
     * @tc.name      NdkRawfile_BufferLengthOf_0112
     * @tc.desc      bufferLengthOf(fileSize=-47) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0112 begin`);
      const actual: number = bufferLengthOf(-47);
      logInfo(`bufferLengthOf(fileSize=-47): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0113
     * @tc.name      NdkRawfile_BufferLengthOf_0113
     * @tc.desc      bufferLengthOf(fileSize=-34) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0113 begin`);
      const actual: number = bufferLengthOf(-34);
      logInfo(`bufferLengthOf(fileSize=-34): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0114
     * @tc.name      NdkRawfile_BufferLengthOf_0114
     * @tc.desc      bufferLengthOf(fileSize=-61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0114 begin`);
      const actual: number = bufferLengthOf(-61);
      logInfo(`bufferLengthOf(fileSize=-61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0115
     * @tc.name      NdkRawfile_BufferLengthOf_0115
     * @tc.desc      bufferLengthOf(fileSize=-92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0115 begin`);
      const actual: number = bufferLengthOf(-92);
      logInfo(`bufferLengthOf(fileSize=-92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0116
     * @tc.name      NdkRawfile_BufferLengthOf_0116
     * @tc.desc      bufferLengthOf(fileSize=-42) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0116 begin`);
      const actual: number = bufferLengthOf(-42);
      logInfo(`bufferLengthOf(fileSize=-42): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0117
     * @tc.name      NdkRawfile_BufferLengthOf_0117
     * @tc.desc      bufferLengthOf(fileSize=-49) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0117 begin`);
      const actual: number = bufferLengthOf(-49);
      logInfo(`bufferLengthOf(fileSize=-49): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0118
     * @tc.name      NdkRawfile_BufferLengthOf_0118
     * @tc.desc      bufferLengthOf(fileSize=-82) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0118 begin`);
      const actual: number = bufferLengthOf(-82);
      logInfo(`bufferLengthOf(fileSize=-82): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0119
     * @tc.name      NdkRawfile_BufferLengthOf_0119
     * @tc.desc      bufferLengthOf(fileSize=-33) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0119 begin`);
      const actual: number = bufferLengthOf(-33);
      logInfo(`bufferLengthOf(fileSize=-33): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_BUFFER_LENGTH_OF_0120
     * @tc.name      NdkRawfile_BufferLengthOf_0120
     * @tc.desc      bufferLengthOf(fileSize=-68) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_BufferLengthOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BufferLengthOf_0120 begin`);
      const actual: number = bufferLengthOf(-68);
      logInfo(`bufferLengthOf(fileSize=-68): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}BufferLengthOf_0120 end`);
    });
  });
}
