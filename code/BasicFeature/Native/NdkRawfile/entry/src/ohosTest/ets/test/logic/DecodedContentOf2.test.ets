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
import { decodedContentOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for decodedContentOf (75 cases). */
export default function decodedContentOf2Test(): void {
  describe('DecodedContentOf2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0092
     * @tc.name      NdkRawfile_DecodedContentOf_0092
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0092 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 10);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0093
     * @tc.name      NdkRawfile_DecodedContentOf_0093
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0093 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 100);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0094
     * @tc.name      NdkRawfile_DecodedContentOf_0094
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0094 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 3);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0095
     * @tc.name      NdkRawfile_DecodedContentOf_0095
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0095 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 15);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0096
     * @tc.name      NdkRawfile_DecodedContentOf_0096
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0096 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 20);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0096 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0097
     * @tc.name      NdkRawfile_DecodedContentOf_0097
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=191) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0097 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 191);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0098
     * @tc.name      NdkRawfile_DecodedContentOf_0098
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=-86) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0098 begin`);
      const actual: string = decodedContentOf('\u0000', -100, -86);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0099
     * @tc.name      NdkRawfile_DecodedContentOf_0099
     * @tc.desc      decodedContentOf(content=" ", offset=171, length=3) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0099 begin`);
      const actual: string = decodedContentOf(' ', 171, 3);
      logInfo(`decodedContentOf(content=" ", offset=171,...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}DecodedContentOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0100
     * @tc.name      NdkRawfile_DecodedContentOf_0100
     * @tc.desc      decodedContentOf(content="??", offset=171, length=10) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0100 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 171, 10);
      logInfo(`decodedContentOf(content="??", offset=171...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}DecodedContentOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0101
     * @tc.name      NdkRawfile_DecodedContentOf_0101
     * @tc.desc      decodedContentOf(content="?u0000x", offset=100, length=191) returns "?u0000x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0101 begin`);
      const actual: string = decodedContentOf('\u0000x', 100, 191);
      logInfo(`decodedContentOf(content="?u0000x", offse...: actual=${actual}`);
      expect(actual).assertEqual('\u0000x');
      logInfo(`${BUNDLE}DecodedContentOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0102
     * @tc.name      NdkRawfile_DecodedContentOf_0102
     * @tc.desc      decodedContentOf(content="", offset=50, length=-86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0102 begin`);
      const actual: string = decodedContentOf('', 50, -86);
      logInfo(`decodedContentOf(content="", offset=50, l...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0103
     * @tc.name      NdkRawfile_DecodedContentOf_0103
     * @tc.desc      decodedContentOf(content="Hello", offset=15, length=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0103 begin`);
      const actual: string = decodedContentOf('Hello', 15, 0);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}DecodedContentOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0104
     * @tc.name      NdkRawfile_DecodedContentOf_0104
     * @tc.desc      decodedContentOf(content="", offset=100, length=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0104 begin`);
      const actual: string = decodedContentOf('', 100, 20);
      logInfo(`decodedContentOf(content="", offset=100, ...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0105
     * @tc.name      NdkRawfile_DecodedContentOf_0105
     * @tc.desc      decodedContentOf(content="", offset=171, length=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0105 begin`);
      const actual: string = decodedContentOf('', 171, -1);
      logInfo(`decodedContentOf(content="", offset=171, ...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0106
     * @tc.name      NdkRawfile_DecodedContentOf_0106
     * @tc.desc      decodedContentOf(content=" ", offset=2, length=10) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0106 begin`);
      const actual: string = decodedContentOf(' ', 2, 10);
      logInfo(`decodedContentOf(content=" ", offset=2, l...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}DecodedContentOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0107
     * @tc.name      NdkRawfile_DecodedContentOf_0107
     * @tc.desc      decodedContentOf(content="??", offset=2, length=3) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0107 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 2, 3);
      logInfo(`decodedContentOf(content="??", offset=2, ...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}DecodedContentOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0108
     * @tc.name      NdkRawfile_DecodedContentOf_0108
     * @tc.desc      decodedContentOf(content="??", offset=10, length=2) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0108 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 10, 2);
      logInfo(`decodedContentOf(content="??", offset=10,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}DecodedContentOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0109
     * @tc.name      NdkRawfile_DecodedContentOf_0109
     * @tc.desc      decodedContentOf(content="A", offset=10, length=1) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0109 begin`);
      const actual: string = decodedContentOf('A', 10, 1);
      logInfo(`decodedContentOf(content="A", offset=10, ...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0110
     * @tc.name      NdkRawfile_DecodedContentOf_0110
     * @tc.desc      decodedContentOf(content="??", offset=1, length=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0110 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 1, 5);
      logInfo(`decodedContentOf(content="??", offset=1, ...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}DecodedContentOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0111
     * @tc.name      NdkRawfile_DecodedContentOf_0111
     * @tc.desc      decodedContentOf(content="a", offset=171, length=-86) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0111 begin`);
      const actual: string = decodedContentOf('a', 171, -86);
      logInfo(`decodedContentOf(content="a", offset=171,...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DecodedContentOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0112
     * @tc.name      NdkRawfile_DecodedContentOf_0112
     * @tc.desc      decodedContentOf(content="hello world", offset=1, length=100) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0112 begin`);
      const actual: string = decodedContentOf('hello world', 1, 100);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}DecodedContentOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0113
     * @tc.name      NdkRawfile_DecodedContentOf_0113
     * @tc.desc      decodedContentOf(content=" ", offset=10, length=100) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0113 begin`);
      const actual: string = decodedContentOf(' ', 10, 100);
      logInfo(`decodedContentOf(content=" ", offset=10, ...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}DecodedContentOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0114
     * @tc.name      NdkRawfile_DecodedContentOf_0114
     * @tc.desc      decodedContentOf(content="A", offset=100, length=5) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0114 begin`);
      const actual: string = decodedContentOf('A', 100, 5);
      logInfo(`decodedContentOf(content="A", offset=100,...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0115
     * @tc.name      NdkRawfile_DecodedContentOf_0115
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=-100, length=15) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0115 begin`);
      const actual: string = decodedContentOf('Sample Title 123', -100, 15);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0116
     * @tc.name      NdkRawfile_DecodedContentOf_0116
     * @tc.desc      decodedContentOf(content="A", offset=2, length=1) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0116 begin`);
      const actual: string = decodedContentOf('A', 2, 1);
      logInfo(`decodedContentOf(content="A", offset=2, l...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0117
     * @tc.name      NdkRawfile_DecodedContentOf_0117
     * @tc.desc      decodedContentOf(content="Hello", offset=10, length=100) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0117 begin`);
      const actual: string = decodedContentOf('Hello', 10, 100);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}DecodedContentOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0118
     * @tc.name      NdkRawfile_DecodedContentOf_0118
     * @tc.desc      decodedContentOf(content="??", offset=3, length=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0118 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 3, 5);
      logInfo(`decodedContentOf(content="??", offset=3, ...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}DecodedContentOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0119
     * @tc.name      NdkRawfile_DecodedContentOf_0119
     * @tc.desc      decodedContentOf(content="??", offset=10, length=1) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0119 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 10, 1);
      logInfo(`decodedContentOf(content="??", offset=10,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}DecodedContentOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0120
     * @tc.name      NdkRawfile_DecodedContentOf_0120
     * @tc.desc      decodedContentOf(content="?u0000", offset=0, length=20) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0120 begin`);
      const actual: string = decodedContentOf('\u0000', 0, 20);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0121
     * @tc.name      NdkRawfile_DecodedContentOf_0121
     * @tc.desc      decodedContentOf(content="??", offset=171, length=20) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0121 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 171, 20);
      logInfo(`decodedContentOf(content="??", offset=171...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}DecodedContentOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0122
     * @tc.name      NdkRawfile_DecodedContentOf_0122
     * @tc.desc      decodedContentOf(content="??", offset=10, length=10) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0122 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 10, 10);
      logInfo(`decodedContentOf(content="??", offset=10,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}DecodedContentOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0123
     * @tc.name      NdkRawfile_DecodedContentOf_0123
     * @tc.desc      decodedContentOf(content="hello world", offset=1, length=191) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0123 begin`);
      const actual: string = decodedContentOf('hello world', 1, 191);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}DecodedContentOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0124
     * @tc.name      NdkRawfile_DecodedContentOf_0124
     * @tc.desc      decodedContentOf(content="A", offset=50, length=5) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0124 begin`);
      const actual: string = decodedContentOf('A', 50, 5);
      logInfo(`decodedContentOf(content="A", offset=50, ...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0125
     * @tc.name      NdkRawfile_DecodedContentOf_0125
     * @tc.desc      decodedContentOf(content=" ", offset=10, length=191) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0125 begin`);
      const actual: string = decodedContentOf(' ', 10, 191);
      logInfo(`decodedContentOf(content=" ", offset=10, ...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}DecodedContentOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0126
     * @tc.name      NdkRawfile_DecodedContentOf_0126
     * @tc.desc      decodedContentOf(content="A", offset=2, length=100) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0126 begin`);
      const actual: string = decodedContentOf('A', 2, 100);
      logInfo(`decodedContentOf(content="A", offset=2, l...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0127
     * @tc.name      NdkRawfile_DecodedContentOf_0127
     * @tc.desc      decodedContentOf(content="?u0000x", offset=0, length=191) returns "?u0000x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0127 begin`);
      const actual: string = decodedContentOf('\u0000x', 0, 191);
      logInfo(`decodedContentOf(content="?u0000x", offse...: actual=${actual}`);
      expect(actual).assertEqual('\u0000x');
      logInfo(`${BUNDLE}DecodedContentOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0128
     * @tc.name      NdkRawfile_DecodedContentOf_0128
     * @tc.desc      decodedContentOf(content="", offset=0, length=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0128 begin`);
      const actual: string = decodedContentOf('', 0, 2);
      logInfo(`decodedContentOf(content="", offset=0, le...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0129
     * @tc.name      NdkRawfile_DecodedContentOf_0129
     * @tc.desc      decodedContentOf(content="a", offset=0, length=-86) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0129 begin`);
      const actual: string = decodedContentOf('a', 0, -86);
      logInfo(`decodedContentOf(content="a", offset=0, l...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0130
     * @tc.name      NdkRawfile_DecodedContentOf_0130
     * @tc.desc      decodedContentOf(content="?u0000", offset=3, length=-1) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0130 begin`);
      const actual: string = decodedContentOf('\u0000', 3, -1);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0131
     * @tc.name      NdkRawfile_DecodedContentOf_0131
     * @tc.desc      decodedContentOf(content="A", offset=171, length=-86) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0131 begin`);
      const actual: string = decodedContentOf('A', 171, -86);
      logInfo(`decodedContentOf(content="A", offset=171,...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0132
     * @tc.name      NdkRawfile_DecodedContentOf_0132
     * @tc.desc      decodedContentOf(content="", offset=-100, length=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0132 begin`);
      const actual: string = decodedContentOf('', -100, 3);
      logInfo(`decodedContentOf(content="", offset=-100,...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0133
     * @tc.name      NdkRawfile_DecodedContentOf_0133
     * @tc.desc      decodedContentOf(content="A", offset=15, length=15) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0133 begin`);
      const actual: string = decodedContentOf('A', 15, 15);
      logInfo(`decodedContentOf(content="A", offset=15, ...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0134
     * @tc.name      NdkRawfile_DecodedContentOf_0134
     * @tc.desc      decodedContentOf(content="a", offset=50, length=0) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0134 begin`);
      const actual: string = decodedContentOf('a', 50, 0);
      logInfo(`decodedContentOf(content="a", offset=50, ...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DecodedContentOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0135
     * @tc.name      NdkRawfile_DecodedContentOf_0135
     * @tc.desc      decodedContentOf(content="", offset=3, length=191) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0135 begin`);
      const actual: string = decodedContentOf('', 3, 191);
      logInfo(`decodedContentOf(content="", offset=3, le...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0136
     * @tc.name      NdkRawfile_DecodedContentOf_0136
     * @tc.desc      decodedContentOf(content="?u0000", offset=2, length=15) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0136 begin`);
      const actual: string = decodedContentOf('\u0000', 2, 15);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0137
     * @tc.name      NdkRawfile_DecodedContentOf_0137
     * @tc.desc      decodedContentOf(content="a", offset=100, length=15) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0137 begin`);
      const actual: string = decodedContentOf('a', 100, 15);
      logInfo(`decodedContentOf(content="a", offset=100,...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DecodedContentOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0138
     * @tc.name      NdkRawfile_DecodedContentOf_0138
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=-100, length=-86) returns "?u0000?u0000?u000...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0138 begin`);
      const actual: string = decodedContentOf('Sample Title 123', -100, -86);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 8)=${actual.substring(0, 8)}`);
      expect(actual.substring(0, 8)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0139
     * @tc.name      NdkRawfile_DecodedContentOf_0139
     * @tc.desc      decodedContentOf(content="", offset=0, length=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0139 begin`);
      const actual: string = decodedContentOf('', 0, 20);
      logInfo(`decodedContentOf(content="", offset=0, le...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0140
     * @tc.name      NdkRawfile_DecodedContentOf_0140
     * @tc.desc      decodedContentOf(content=" ", offset=1, length=3) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0140 begin`);
      const actual: string = decodedContentOf(' ', 1, 3);
      logInfo(`decodedContentOf(content=" ", offset=1, l...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}DecodedContentOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0141
     * @tc.name      NdkRawfile_DecodedContentOf_0141
     * @tc.desc      decodedContentOf(content="a", offset=15, length=10) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0141 begin`);
      const actual: string = decodedContentOf('a', 15, 10);
      logInfo(`decodedContentOf(content="a", offset=15, ...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DecodedContentOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0142
     * @tc.name      NdkRawfile_DecodedContentOf_0142
     * @tc.desc      decodedContentOf(content="", offset=2, length=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0142 begin`);
      const actual: string = decodedContentOf('', 2, 20);
      logInfo(`decodedContentOf(content="", offset=2, le...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0143
     * @tc.name      NdkRawfile_DecodedContentOf_0143
     * @tc.desc      decodedContentOf(content="?u0000", offset=15, length=10) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0143 begin`);
      const actual: string = decodedContentOf('\u0000', 15, 10);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0144
     * @tc.name      NdkRawfile_DecodedContentOf_0144
     * @tc.desc      decodedContentOf(content="", offset=100, length=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0144 begin`);
      const actual: string = decodedContentOf('', 100, 15);
      logInfo(`decodedContentOf(content="", offset=100, ...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0145
     * @tc.name      NdkRawfile_DecodedContentOf_0145
     * @tc.desc      decodedContentOf(content="A", offset=5, length=2) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0145 begin`);
      const actual: string = decodedContentOf('A', 5, 2);
      logInfo(`decodedContentOf(content="A", offset=5, l...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0146
     * @tc.name      NdkRawfile_DecodedContentOf_0146
     * @tc.desc      decodedContentOf(content="a", offset=100, length=1) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0146 begin`);
      const actual: string = decodedContentOf('a', 100, 1);
      logInfo(`decodedContentOf(content="a", offset=100,...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DecodedContentOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0147
     * @tc.name      NdkRawfile_DecodedContentOf_0147
     * @tc.desc      decodedContentOf(content="hello world", offset=10, length=15) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0147 begin`);
      const actual: string = decodedContentOf('hello world', 10, 15);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}DecodedContentOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0148
     * @tc.name      NdkRawfile_DecodedContentOf_0148
     * @tc.desc      decodedContentOf(content="?u0000x", offset=-100, length=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0148 begin`);
      const actual: string = decodedContentOf('\u0000x', -100, 3);
      logInfo(`decodedContentOf(content="?u0000x", offse...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0149
     * @tc.name      NdkRawfile_DecodedContentOf_0149
     * @tc.desc      decodedContentOf(content="", offset=1, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0149 begin`);
      const actual: string = decodedContentOf('', 1, 0);
      logInfo(`decodedContentOf(content="", offset=1, le...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0150
     * @tc.name      NdkRawfile_DecodedContentOf_0150
     * @tc.desc      decodedContentOf(content="", offset=-1, length=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0150 begin`);
      const actual: string = decodedContentOf('', -1, 10);
      logInfo(`decodedContentOf(content="", offset=-1, l...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0151
     * @tc.name      NdkRawfile_DecodedContentOf_0151
     * @tc.desc      decodedContentOf(content="hello world", offset=100, length=1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0151 begin`);
      const actual: string = decodedContentOf('hello world', 100, 1);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}DecodedContentOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0152
     * @tc.name      NdkRawfile_DecodedContentOf_0152
     * @tc.desc      decodedContentOf(content="a", offset=171, length=-1) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0152 begin`);
      const actual: string = decodedContentOf('a', 171, -1);
      logInfo(`decodedContentOf(content="a", offset=171,...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DecodedContentOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0153
     * @tc.name      NdkRawfile_DecodedContentOf_0153
     * @tc.desc      decodedContentOf(content=" ", offset=2, length=15) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0153 begin`);
      const actual: string = decodedContentOf(' ', 2, 15);
      logInfo(`decodedContentOf(content=" ", offset=2, l...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}DecodedContentOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0154
     * @tc.name      NdkRawfile_DecodedContentOf_0154
     * @tc.desc      decodedContentOf(content="", offset=10, length=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0154 begin`);
      const actual: string = decodedContentOf('', 10, 10);
      logInfo(`decodedContentOf(content="", offset=10, l...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0155
     * @tc.name      NdkRawfile_DecodedContentOf_0155
     * @tc.desc      decodedContentOf(content=" ", offset=5, length=-86) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0155 begin`);
      const actual: string = decodedContentOf(' ', 5, -86);
      logInfo(`decodedContentOf(content=" ", offset=5, l...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0156
     * @tc.name      NdkRawfile_DecodedContentOf_0156
     * @tc.desc      decodedContentOf(content="", offset=1, length=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0156 begin`);
      const actual: string = decodedContentOf('', 1, 10);
      logInfo(`decodedContentOf(content="", offset=1, le...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0157
     * @tc.name      NdkRawfile_DecodedContentOf_0157
     * @tc.desc      decodedContentOf(content="a", offset=10, length=1) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0157 begin`);
      const actual: string = decodedContentOf('a', 10, 1);
      logInfo(`decodedContentOf(content="a", offset=10, ...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DecodedContentOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0158
     * @tc.name      NdkRawfile_DecodedContentOf_0158
     * @tc.desc      decodedContentOf(content="Hello", offset=2, length=100) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0158 begin`);
      const actual: string = decodedContentOf('Hello', 2, 100);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}DecodedContentOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0159
     * @tc.name      NdkRawfile_DecodedContentOf_0159
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=100, length=5) returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0159 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 100, 5);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}DecodedContentOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0160
     * @tc.name      NdkRawfile_DecodedContentOf_0160
     * @tc.desc      decodedContentOf(content="??", offset=2, length=0) returns "?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0160 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 2, 0);
      logInfo(`decodedContentOf(content="??", offset=2, ...: actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0161
     * @tc.name      NdkRawfile_DecodedContentOf_0161
     * @tc.desc      decodedContentOf(content="?u0000x", offset=10, length=1) returns "?u0000x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0161 begin`);
      const actual: string = decodedContentOf('\u0000x', 10, 1);
      logInfo(`decodedContentOf(content="?u0000x", offse...: actual=${actual}`);
      expect(actual).assertEqual('\u0000x');
      logInfo(`${BUNDLE}DecodedContentOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0162
     * @tc.name      NdkRawfile_DecodedContentOf_0162
     * @tc.desc      decodedContentOf(content="a", offset=-100, length=-86) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0162 begin`);
      const actual: string = decodedContentOf('a', -100, -86);
      logInfo(`decodedContentOf(content="a", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0163
     * @tc.name      NdkRawfile_DecodedContentOf_0163
     * @tc.desc      decodedContentOf(content="A", offset=5, length=-1) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0163 begin`);
      const actual: string = decodedContentOf('A', 5, -1);
      logInfo(`decodedContentOf(content="A", offset=5, l...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0164
     * @tc.name      NdkRawfile_DecodedContentOf_0164
     * @tc.desc      decodedContentOf(content="", offset=-1, length=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0164 begin`);
      const actual: string = decodedContentOf('', -1, 100);
      logInfo(`decodedContentOf(content="", offset=-1, l...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0165
     * @tc.name      NdkRawfile_DecodedContentOf_0165
     * @tc.desc      decodedContentOf(content="Hello", offset=5, length=20) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0165 begin`);
      const actual: string = decodedContentOf('Hello', 5, 20);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}DecodedContentOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0166
     * @tc.name      NdkRawfile_DecodedContentOf_0166
     * @tc.desc      decodedContentOf(content="a", offset=100, length=-86) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0166 begin`);
      const actual: string = decodedContentOf('a', 100, -86);
      logInfo(`decodedContentOf(content="a", offset=100,...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DecodedContentOf_0166 end`);
    });
  });
}
