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
import { visibleContentOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for visibleContentOf (70 cases). */
export default function visibleContentOf2Test(): void {
  describe('VisibleContentOf2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0097
     * @tc.name      NdkRawfile_VisibleContentOf_0097
     * @tc.desc      visibleContentOf(content="abc", offset=-71, length=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0097 begin`);
      const actual: string = visibleContentOf('abc', -71, 10);
      logInfo(`visibleContentOf(content="abc", offset=-7...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0098
     * @tc.name      NdkRawfile_VisibleContentOf_0098
     * @tc.desc      visibleContentOf(content="a", offset=-100, length=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0098 begin`);
      const actual: string = visibleContentOf('a', -100, 20);
      logInfo(`visibleContentOf(content="a", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0099
     * @tc.name      NdkRawfile_VisibleContentOf_0099
     * @tc.desc      visibleContentOf(content="hello world", offset=15, length=-20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0099 begin`);
      const actual: string = visibleContentOf('hello world', 15, -20);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0100
     * @tc.name      NdkRawfile_VisibleContentOf_0100
     * @tc.desc      visibleContentOf(content="Hello", offset=10, length=1) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0100 begin`);
      const actual: string = visibleContentOf('Hello', 10, 1);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0101
     * @tc.name      NdkRawfile_VisibleContentOf_0101
     * @tc.desc      visibleContentOf(content="hello world", offset=2, length=-20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0101 begin`);
      const actual: string = visibleContentOf('hello world', 2, -20);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0102
     * @tc.name      NdkRawfile_VisibleContentOf_0102
     * @tc.desc      visibleContentOf(content="Hello", offset=15, length=5) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0102 begin`);
      const actual: string = visibleContentOf('Hello', 15, 5);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0103
     * @tc.name      NdkRawfile_VisibleContentOf_0103
     * @tc.desc      visibleContentOf(content="a", offset=-100, length=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0103 begin`);
      const actual: string = visibleContentOf('a', -100, 3);
      logInfo(`visibleContentOf(content="a", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0104
     * @tc.name      NdkRawfile_VisibleContentOf_0104
     * @tc.desc      visibleContentOf(content="", offset=-1, length=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0104 begin`);
      const actual: string = visibleContentOf('', -1, 15);
      logInfo(`visibleContentOf(content="", offset=-1, l...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0105
     * @tc.name      NdkRawfile_VisibleContentOf_0105
     * @tc.desc      visibleContentOf(content="a", offset=0, length=20) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0105 begin`);
      const actual: string = visibleContentOf('a', 0, 20);
      logInfo(`visibleContentOf(content="a", offset=0, l...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0106
     * @tc.name      NdkRawfile_VisibleContentOf_0106
     * @tc.desc      visibleContentOf(content="a", offset=10, length=0) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0106 begin`);
      const actual: string = visibleContentOf('a', 10, 0);
      logInfo(`visibleContentOf(content="a", offset=10, ...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0107
     * @tc.name      NdkRawfile_VisibleContentOf_0107
     * @tc.desc      visibleContentOf(content="a", offset=2, length=1) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0107 begin`);
      const actual: string = visibleContentOf('a', 2, 1);
      logInfo(`visibleContentOf(content="a", offset=2, l...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0108
     * @tc.name      NdkRawfile_VisibleContentOf_0108
     * @tc.desc      visibleContentOf(content="??", offset=-1, length=100) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0108 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', -1, 100);
      logInfo(`visibleContentOf(content="??", offset=-1,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}VisibleContentOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0109
     * @tc.name      NdkRawfile_VisibleContentOf_0109
     * @tc.desc      visibleContentOf(content="Hello", offset=10, length=2) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0109 begin`);
      const actual: string = visibleContentOf('Hello', 10, 2);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0110
     * @tc.name      NdkRawfile_VisibleContentOf_0110
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=50, length=100) returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0110 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 50, 100);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0111
     * @tc.name      NdkRawfile_VisibleContentOf_0111
     * @tc.desc      visibleContentOf(content="abc", offset=15, length=3) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0111 begin`);
      const actual: string = visibleContentOf('abc', 15, 3);
      logInfo(`visibleContentOf(content="abc", offset=15...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}VisibleContentOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0112
     * @tc.name      NdkRawfile_VisibleContentOf_0112
     * @tc.desc      visibleContentOf(content="a", offset=15, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0112 begin`);
      const actual: string = visibleContentOf('a', 15, -100);
      logInfo(`visibleContentOf(content="a", offset=15, ...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0113
     * @tc.name      NdkRawfile_VisibleContentOf_0113
     * @tc.desc      visibleContentOf(content="abc", offset=1, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0113 begin`);
      const actual: string = visibleContentOf('abc', 1, -100);
      logInfo(`visibleContentOf(content="abc", offset=1,...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0114
     * @tc.name      NdkRawfile_VisibleContentOf_0114
     * @tc.desc      visibleContentOf(content="A", offset=5, length=100) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0114 begin`);
      const actual: string = visibleContentOf('A', 5, 100);
      logInfo(`visibleContentOf(content="A", offset=5, l...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}VisibleContentOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0115
     * @tc.name      NdkRawfile_VisibleContentOf_0115
     * @tc.desc      visibleContentOf(content="a", offset=50, length=2) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0115 begin`);
      const actual: string = visibleContentOf('a', 50, 2);
      logInfo(`visibleContentOf(content="a", offset=50, ...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0116
     * @tc.name      NdkRawfile_VisibleContentOf_0116
     * @tc.desc      visibleContentOf(content="??", offset=-100, length=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0116 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', -100, 5);
      logInfo(`visibleContentOf(content="??", offset=-10...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0117
     * @tc.name      NdkRawfile_VisibleContentOf_0117
     * @tc.desc      visibleContentOf(content="hello world", offset=15, length=2) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0117 begin`);
      const actual: string = visibleContentOf('hello world', 15, 2);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}VisibleContentOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0118
     * @tc.name      NdkRawfile_VisibleContentOf_0118
     * @tc.desc      visibleContentOf(content=" ", offset=-1, length=5) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0118 begin`);
      const actual: string = visibleContentOf(' ', -1, 5);
      logInfo(`visibleContentOf(content=" ", offset=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}VisibleContentOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0119
     * @tc.name      NdkRawfile_VisibleContentOf_0119
     * @tc.desc      visibleContentOf(content="", offset=50, length=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0119 begin`);
      const actual: string = visibleContentOf('', 50, 3);
      logInfo(`visibleContentOf(content="", offset=50, l...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0120
     * @tc.name      NdkRawfile_VisibleContentOf_0120
     * @tc.desc      visibleContentOf(content="a", offset=2, length=3) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0120 begin`);
      const actual: string = visibleContentOf('a', 2, 3);
      logInfo(`visibleContentOf(content="a", offset=2, l...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0121
     * @tc.name      NdkRawfile_VisibleContentOf_0121
     * @tc.desc      visibleContentOf(content="a", offset=3, length=5) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0121 begin`);
      const actual: string = visibleContentOf('a', 3, 5);
      logInfo(`visibleContentOf(content="a", offset=3, l...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0122
     * @tc.name      NdkRawfile_VisibleContentOf_0122
     * @tc.desc      visibleContentOf(content="hello world", offset=15, length=5) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0122 begin`);
      const actual: string = visibleContentOf('hello world', 15, 5);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}VisibleContentOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0123
     * @tc.name      NdkRawfile_VisibleContentOf_0123
     * @tc.desc      visibleContentOf(content=" ", offset=-71, length=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0123 begin`);
      const actual: string = visibleContentOf(' ', -71, 5);
      logInfo(`visibleContentOf(content=" ", offset=-71,...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0124
     * @tc.name      NdkRawfile_VisibleContentOf_0124
     * @tc.desc      visibleContentOf(content="abc", offset=10, length=20) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0124 begin`);
      const actual: string = visibleContentOf('abc', 10, 20);
      logInfo(`visibleContentOf(content="abc", offset=10...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}VisibleContentOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0125
     * @tc.name      NdkRawfile_VisibleContentOf_0125
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=10, length=-20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0125 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 10, -20);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0126
     * @tc.name      NdkRawfile_VisibleContentOf_0126
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=0, length=20) returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0126 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 0, 20);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0127
     * @tc.name      NdkRawfile_VisibleContentOf_0127
     * @tc.desc      visibleContentOf(content="??", offset=15, length=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0127 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', 15, 5);
      logInfo(`visibleContentOf(content="??", offset=15,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}VisibleContentOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0128
     * @tc.name      NdkRawfile_VisibleContentOf_0128
     * @tc.desc      visibleContentOf(content="Hello World", offset=-71, length=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0128 begin`);
      const actual: string = visibleContentOf('Hello World', -71, 10);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0129
     * @tc.name      NdkRawfile_VisibleContentOf_0129
     * @tc.desc      visibleContentOf(content="Hello", offset=3, length=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0129 begin`);
      const actual: string = visibleContentOf('Hello', 3, -1);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0130
     * @tc.name      NdkRawfile_VisibleContentOf_0130
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=50, length=1) returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0130 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 50, 1);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0131
     * @tc.name      NdkRawfile_VisibleContentOf_0131
     * @tc.desc      visibleContentOf(content="A", offset=-1, length=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0131 begin`);
      const actual: string = visibleContentOf('A', -1, -1);
      logInfo(`visibleContentOf(content="A", offset=-1, ...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0132
     * @tc.name      NdkRawfile_VisibleContentOf_0132
     * @tc.desc      visibleContentOf(content="??", offset=100, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0132 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', 100, -100);
      logInfo(`visibleContentOf(content="??", offset=100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0133
     * @tc.name      NdkRawfile_VisibleContentOf_0133
     * @tc.desc      visibleContentOf(content="Hello World", offset=-100, length=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0133 begin`);
      const actual: string = visibleContentOf('Hello World', -100, -1);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0134
     * @tc.name      NdkRawfile_VisibleContentOf_0134
     * @tc.desc      visibleContentOf(content="a", offset=1, length=1) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0134 begin`);
      const actual: string = visibleContentOf('a', 1, 1);
      logInfo(`visibleContentOf(content="a", offset=1, l...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0135
     * @tc.name      NdkRawfile_VisibleContentOf_0135
     * @tc.desc      visibleContentOf(content="Hello", offset=50, length=2) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0135 begin`);
      const actual: string = visibleContentOf('Hello', 50, 2);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0136
     * @tc.name      NdkRawfile_VisibleContentOf_0136
     * @tc.desc      visibleContentOf(content=" ", offset=-100, length=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0136 begin`);
      const actual: string = visibleContentOf(' ', -100, 5);
      logInfo(`visibleContentOf(content=" ", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0137
     * @tc.name      NdkRawfile_VisibleContentOf_0137
     * @tc.desc      visibleContentOf(content="abc", offset=50, length=5) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0137 begin`);
      const actual: string = visibleContentOf('abc', 50, 5);
      logInfo(`visibleContentOf(content="abc", offset=50...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}VisibleContentOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0138
     * @tc.name      NdkRawfile_VisibleContentOf_0138
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=50, length=-1) returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0138 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 50, -1);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0139
     * @tc.name      NdkRawfile_VisibleContentOf_0139
     * @tc.desc      visibleContentOf(content="a", offset=3, length=3) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0139 begin`);
      const actual: string = visibleContentOf('a', 3, 3);
      logInfo(`visibleContentOf(content="a", offset=3, l...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0140
     * @tc.name      NdkRawfile_VisibleContentOf_0140
     * @tc.desc      visibleContentOf(content="A", offset=0, length=10) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0140 begin`);
      const actual: string = visibleContentOf('A', 0, 10);
      logInfo(`visibleContentOf(content="A", offset=0, l...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}VisibleContentOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0141
     * @tc.name      NdkRawfile_VisibleContentOf_0141
     * @tc.desc      visibleContentOf(content="A", offset=2, length=3) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0141 begin`);
      const actual: string = visibleContentOf('A', 2, 3);
      logInfo(`visibleContentOf(content="A", offset=2, l...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}VisibleContentOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0142
     * @tc.name      NdkRawfile_VisibleContentOf_0142
     * @tc.desc      visibleContentOf(content="??", offset=10, length=15) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0142 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', 10, 15);
      logInfo(`visibleContentOf(content="??", offset=10,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}VisibleContentOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0143
     * @tc.name      NdkRawfile_VisibleContentOf_0143
     * @tc.desc      visibleContentOf(content="A", offset=-100, length=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0143 begin`);
      const actual: string = visibleContentOf('A', -100, 20);
      logInfo(`visibleContentOf(content="A", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0144
     * @tc.name      NdkRawfile_VisibleContentOf_0144
     * @tc.desc      visibleContentOf(content="abc", offset=100, length=5) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0144 begin`);
      const actual: string = visibleContentOf('abc', 100, 5);
      logInfo(`visibleContentOf(content="abc", offset=10...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}VisibleContentOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0145
     * @tc.name      NdkRawfile_VisibleContentOf_0145
     * @tc.desc      visibleContentOf(content="??", offset=-1, length=10) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0145 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', -1, 10);
      logInfo(`visibleContentOf(content="??", offset=-1,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}VisibleContentOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0146
     * @tc.name      NdkRawfile_VisibleContentOf_0146
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=-1, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0146 begin`);
      const actual: string = visibleContentOf('Sample Title 123', -1, -100);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0147
     * @tc.name      NdkRawfile_VisibleContentOf_0147
     * @tc.desc      visibleContentOf(content=" ", offset=50, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0147 begin`);
      const actual: string = visibleContentOf(' ', 50, -100);
      logInfo(`visibleContentOf(content=" ", offset=50, ...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0148
     * @tc.name      NdkRawfile_VisibleContentOf_0148
     * @tc.desc      visibleContentOf(content="a", offset=50, length=15) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0148 begin`);
      const actual: string = visibleContentOf('a', 50, 15);
      logInfo(`visibleContentOf(content="a", offset=50, ...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0149
     * @tc.name      NdkRawfile_VisibleContentOf_0149
     * @tc.desc      visibleContentOf(content="a", offset=0, length=1) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0149 begin`);
      const actual: string = visibleContentOf('a', 0, 1);
      logInfo(`visibleContentOf(content="a", offset=0, l...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0150
     * @tc.name      NdkRawfile_VisibleContentOf_0150
     * @tc.desc      visibleContentOf(content="abc", offset=100, length=15) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0150 begin`);
      const actual: string = visibleContentOf('abc', 100, 15);
      logInfo(`visibleContentOf(content="abc", offset=10...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}VisibleContentOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0151
     * @tc.name      NdkRawfile_VisibleContentOf_0151
     * @tc.desc      visibleContentOf(content="abc", offset=3, length=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0151 begin`);
      const actual: string = visibleContentOf('abc', 3, -1);
      logInfo(`visibleContentOf(content="abc", offset=3,...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0152
     * @tc.name      NdkRawfile_VisibleContentOf_0152
     * @tc.desc      visibleContentOf(content="A", offset=50, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0152 begin`);
      const actual: string = visibleContentOf('A', 50, -100);
      logInfo(`visibleContentOf(content="A", offset=50, ...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0153
     * @tc.name      NdkRawfile_VisibleContentOf_0153
     * @tc.desc      visibleContentOf(content="Hello World", offset=100, length=-20) returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0153 begin`);
      const actual: string = visibleContentOf('Hello World', 100, -20);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}VisibleContentOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0154
     * @tc.name      NdkRawfile_VisibleContentOf_0154
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=-71, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0154 begin`);
      const actual: string = visibleContentOf('Sample Title 123', -71, -100);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0155
     * @tc.name      NdkRawfile_VisibleContentOf_0155
     * @tc.desc      visibleContentOf(content=" ", offset=3, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0155 begin`);
      const actual: string = visibleContentOf(' ', 3, -100);
      logInfo(`visibleContentOf(content=" ", offset=3, l...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0156
     * @tc.name      NdkRawfile_VisibleContentOf_0156
     * @tc.desc      visibleContentOf(content="hello world", offset=50, length=-1) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0156 begin`);
      const actual: string = visibleContentOf('hello world', 50, -1);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}VisibleContentOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0157
     * @tc.name      NdkRawfile_VisibleContentOf_0157
     * @tc.desc      visibleContentOf(content="hello world", offset=100, length=15) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0157 begin`);
      const actual: string = visibleContentOf('hello world', 100, 15);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}VisibleContentOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0158
     * @tc.name      NdkRawfile_VisibleContentOf_0158
     * @tc.desc      visibleContentOf(content="A", offset=100, length=-20) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0158 begin`);
      const actual: string = visibleContentOf('A', 100, -20);
      logInfo(`visibleContentOf(content="A", offset=100,...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}VisibleContentOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0159
     * @tc.name      NdkRawfile_VisibleContentOf_0159
     * @tc.desc      visibleContentOf(content="A", offset=1, length=3) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0159 begin`);
      const actual: string = visibleContentOf('A', 1, 3);
      logInfo(`visibleContentOf(content="A", offset=1, l...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}VisibleContentOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0160
     * @tc.name      NdkRawfile_VisibleContentOf_0160
     * @tc.desc      visibleContentOf(content="a", offset=2, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0160 begin`);
      const actual: string = visibleContentOf('a', 2, -100);
      logInfo(`visibleContentOf(content="a", offset=2, l...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0161
     * @tc.name      NdkRawfile_VisibleContentOf_0161
     * @tc.desc      visibleContentOf(content="", offset=-71, length=-20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0161 begin`);
      const actual: string = visibleContentOf('', -71, -20);
      logInfo(`visibleContentOf(content="", offset=-71, ...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0162
     * @tc.name      NdkRawfile_VisibleContentOf_0162
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=2, length=15) returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0162 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 2, 15);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0163
     * @tc.name      NdkRawfile_VisibleContentOf_0163
     * @tc.desc      visibleContentOf(content=" ", offset=50, length=5) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0163 begin`);
      const actual: string = visibleContentOf(' ', 50, 5);
      logInfo(`visibleContentOf(content=" ", offset=50, ...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}VisibleContentOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0164
     * @tc.name      NdkRawfile_VisibleContentOf_0164
     * @tc.desc      visibleContentOf(content="Hello", offset=0, length=5) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0164 begin`);
      const actual: string = visibleContentOf('Hello', 0, 5);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0165
     * @tc.name      NdkRawfile_VisibleContentOf_0165
     * @tc.desc      visibleContentOf(content="Hello", offset=3, length=2) returns "lo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0165 begin`);
      const actual: string = visibleContentOf('Hello', 3, 2);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('lo');
      logInfo(`${BUNDLE}VisibleContentOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0166
     * @tc.name      NdkRawfile_VisibleContentOf_0166
     * @tc.desc      visibleContentOf(content="A", offset=10, length=2) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0166 begin`);
      const actual: string = visibleContentOf('A', 10, 2);
      logInfo(`visibleContentOf(content="A", offset=10, ...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}VisibleContentOf_0166 end`);
    });
  });
}
