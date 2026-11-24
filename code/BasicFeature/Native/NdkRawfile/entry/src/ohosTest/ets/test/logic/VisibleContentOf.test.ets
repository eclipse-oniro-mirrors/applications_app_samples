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

/** Logic checks for visibleContentOf (96 cases). */
export default function visibleContentOfTest(): void {
  describe('VisibleContentOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0001
     * @tc.name      NdkRawfile_VisibleContentOf_0001
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_VisibleContentOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0001 begin`);
      const actual: string = visibleContentOf('Hello', -100, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0002
     * @tc.name      NdkRawfile_VisibleContentOf_0002
     * @tc.desc      visibleContentOf(content="Hello", offset=-1, length=0) returns "Hell"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_VisibleContentOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0002 begin`);
      const actual: string = visibleContentOf('Hello', -1, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hell');
      logInfo(`${BUNDLE}VisibleContentOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0003
     * @tc.name      NdkRawfile_VisibleContentOf_0003
     * @tc.desc      visibleContentOf(content="Hello", offset=0, length=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0003 begin`);
      const actual: string = visibleContentOf('Hello', 0, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0004
     * @tc.name      NdkRawfile_VisibleContentOf_0004
     * @tc.desc      visibleContentOf(content="Hello", offset=1, length=0) returns "ello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0004 begin`);
      const actual: string = visibleContentOf('Hello', 1, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('ello');
      logInfo(`${BUNDLE}VisibleContentOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0005
     * @tc.name      NdkRawfile_VisibleContentOf_0005
     * @tc.desc      visibleContentOf(content="Hello", offset=2, length=0) returns "llo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0005 begin`);
      const actual: string = visibleContentOf('Hello', 2, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('llo');
      logInfo(`${BUNDLE}VisibleContentOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0006
     * @tc.name      NdkRawfile_VisibleContentOf_0006
     * @tc.desc      visibleContentOf(content="Hello", offset=3, length=0) returns "lo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0006 begin`);
      const actual: string = visibleContentOf('Hello', 3, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('lo');
      logInfo(`${BUNDLE}VisibleContentOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0007
     * @tc.name      NdkRawfile_VisibleContentOf_0007
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=0, length=0) returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0007 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 0, 0);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0008
     * @tc.name      NdkRawfile_VisibleContentOf_0008
     * @tc.desc      visibleContentOf(content="a", offset=0, length=100) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0008 begin`);
      const actual: string = visibleContentOf('a', 0, 100);
      logInfo(`visibleContentOf(content="a", offset=0, l...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}VisibleContentOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0009
     * @tc.name      NdkRawfile_VisibleContentOf_0009
     * @tc.desc      visibleContentOf(content="hello world", offset=15, length=3) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0009 begin`);
      const actual: string = visibleContentOf('hello world', 15, 3);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}VisibleContentOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0010
     * @tc.name      NdkRawfile_VisibleContentOf_0010
     * @tc.desc      visibleContentOf(content=" ", offset=3, length=1) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0010 begin`);
      const actual: string = visibleContentOf(' ', 3, 1);
      logInfo(`visibleContentOf(content=" ", offset=3, l...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}VisibleContentOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0011
     * @tc.name      NdkRawfile_VisibleContentOf_0011
     * @tc.desc      visibleContentOf(content="abc", offset=100, length=100) returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0011 begin`);
      const actual: string = visibleContentOf('abc', 100, 100);
      logInfo(`visibleContentOf(content="abc", offset=10...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}VisibleContentOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0012
     * @tc.name      NdkRawfile_VisibleContentOf_0012
     * @tc.desc      visibleContentOf(content="Hello World", offset=15, length=3) returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0012 begin`);
      const actual: string = visibleContentOf('Hello World', 15, 3);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}VisibleContentOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0013
     * @tc.name      NdkRawfile_VisibleContentOf_0013
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=3, length=0) returns "ple Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0013 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 3, 0);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('ple Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0014
     * @tc.name      NdkRawfile_VisibleContentOf_0014
     * @tc.desc      visibleContentOf(content="??", offset=0, length=20) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0014 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', 0, 20);
      logInfo(`visibleContentOf(content="??", offset=0, ...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}VisibleContentOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0015
     * @tc.name      NdkRawfile_VisibleContentOf_0015
     * @tc.desc      visibleContentOf(content="A", offset=5, length=3) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0015 begin`);
      const actual: string = visibleContentOf('A', 5, 3);
      logInfo(`visibleContentOf(content="A", offset=5, l...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}VisibleContentOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0016
     * @tc.name      NdkRawfile_VisibleContentOf_0016
     * @tc.desc      visibleContentOf(content="Hello", offset=-1, length=3) returns "He"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0016 begin`);
      const actual: string = visibleContentOf('Hello', -1, 3);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('He');
      logInfo(`${BUNDLE}VisibleContentOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0017
     * @tc.name      NdkRawfile_VisibleContentOf_0017
     * @tc.desc      visibleContentOf(content="Hello World", offset=1, length=3) returns "ell"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0017 begin`);
      const actual: string = visibleContentOf('Hello World', 1, 3);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('ell');
      logInfo(`${BUNDLE}VisibleContentOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0018
     * @tc.name      NdkRawfile_VisibleContentOf_0018
     * @tc.desc      visibleContentOf(content="hello world", offset=1, length=5) returns "ello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0018 begin`);
      const actual: string = visibleContentOf('hello world', 1, 5);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('ello ');
      logInfo(`${BUNDLE}VisibleContentOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0019
     * @tc.name      NdkRawfile_VisibleContentOf_0019
     * @tc.desc      visibleContentOf(content="abc", offset=-1, length=3) returns "ab"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0019 begin`);
      const actual: string = visibleContentOf('abc', -1, 3);
      logInfo(`visibleContentOf(content="abc", offset=-1...: actual=${actual}`);
      expect(actual).assertEqual('ab');
      logInfo(`${BUNDLE}VisibleContentOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0020
     * @tc.name      NdkRawfile_VisibleContentOf_0020
     * @tc.desc      visibleContentOf(content="abc", offset=2, length=0) returns "c"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0020 begin`);
      const actual: string = visibleContentOf('abc', 2, 0);
      logInfo(`visibleContentOf(content="abc", offset=2,...: actual=${actual}`);
      expect(actual).assertEqual('c');
      logInfo(`${BUNDLE}VisibleContentOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0021
     * @tc.name      NdkRawfile_VisibleContentOf_0021
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=10, length=0) returns "le 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0021 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 10, 0);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('le 123');
      logInfo(`${BUNDLE}VisibleContentOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0022
     * @tc.name      NdkRawfile_VisibleContentOf_0022
     * @tc.desc      visibleContentOf(content="Hello World", offset=1, length=2) returns "el"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0022 begin`);
      const actual: string = visibleContentOf('Hello World', 1, 2);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('el');
      logInfo(`${BUNDLE}VisibleContentOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0023
     * @tc.name      NdkRawfile_VisibleContentOf_0023
     * @tc.desc      visibleContentOf(content="hello world", offset=0, length=1) returns "h"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0023 begin`);
      const actual: string = visibleContentOf('hello world', 0, 1);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('h');
      logInfo(`${BUNDLE}VisibleContentOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0024
     * @tc.name      NdkRawfile_VisibleContentOf_0024
     * @tc.desc      visibleContentOf(content="Hello World", offset=5, length=0) returns " World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0024 begin`);
      const actual: string = visibleContentOf('Hello World', 5, 0);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual(' World');
      logInfo(`${BUNDLE}VisibleContentOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0025
     * @tc.name      NdkRawfile_VisibleContentOf_0025
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=2, length=5) returns "mple "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0025 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 2, 5);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('mple ');
      logInfo(`${BUNDLE}VisibleContentOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0026
     * @tc.name      NdkRawfile_VisibleContentOf_0026
     * @tc.desc      visibleContentOf(content="Hello World", offset=5, length=3) returns " Wo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0026 begin`);
      const actual: string = visibleContentOf('Hello World', 5, 3);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual(' Wo');
      logInfo(`${BUNDLE}VisibleContentOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0027
     * @tc.name      NdkRawfile_VisibleContentOf_0027
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=2, length=0) returns "mple Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0027 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 2, 0);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('mple Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0028
     * @tc.name      NdkRawfile_VisibleContentOf_0028
     * @tc.desc      visibleContentOf(content="Hello World", offset=1, length=10) returns "ello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0028 begin`);
      const actual: string = visibleContentOf('Hello World', 1, 10);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('ello World');
      logInfo(`${BUNDLE}VisibleContentOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0029
     * @tc.name      NdkRawfile_VisibleContentOf_0029
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=0, length=2) returns "Sa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0029 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 0, 2);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sa');
      logInfo(`${BUNDLE}VisibleContentOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0030
     * @tc.name      NdkRawfile_VisibleContentOf_0030
     * @tc.desc      visibleContentOf(content="hello world", offset=2, length=0) returns "llo world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0030 begin`);
      const actual: string = visibleContentOf('hello world', 2, 0);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('llo world');
      logInfo(`${BUNDLE}VisibleContentOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0031
     * @tc.name      NdkRawfile_VisibleContentOf_0031
     * @tc.desc      visibleContentOf(content="hello world", offset=0, length=2) returns "he"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0031 begin`);
      const actual: string = visibleContentOf('hello world', 0, 2);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('he');
      logInfo(`${BUNDLE}VisibleContentOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0032
     * @tc.name      NdkRawfile_VisibleContentOf_0032
     * @tc.desc      visibleContentOf(content="Hello", offset=2, length=2) returns "ll"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0032 begin`);
      const actual: string = visibleContentOf('Hello', 2, 2);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('ll');
      logInfo(`${BUNDLE}VisibleContentOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0033
     * @tc.name      NdkRawfile_VisibleContentOf_0033
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=1, length=2) returns "am"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0033 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 1, 2);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('am');
      logInfo(`${BUNDLE}VisibleContentOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0034
     * @tc.name      NdkRawfile_VisibleContentOf_0034
     * @tc.desc      visibleContentOf(content="Hello World", offset=-1, length=2) returns "H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0034 begin`);
      const actual: string = visibleContentOf('Hello World', -1, 2);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('H');
      logInfo(`${BUNDLE}VisibleContentOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0035
     * @tc.name      NdkRawfile_VisibleContentOf_0035
     * @tc.desc      visibleContentOf(content="hello world", offset=2, length=5) returns "llo w"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0035 begin`);
      const actual: string = visibleContentOf('hello world', 2, 5);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('llo w');
      logInfo(`${BUNDLE}VisibleContentOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0036
     * @tc.name      NdkRawfile_VisibleContentOf_0036
     * @tc.desc      visibleContentOf(content="Hello World", offset=3, length=1) returns "l"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0036 begin`);
      const actual: string = visibleContentOf('Hello World', 3, 1);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('l');
      logInfo(`${BUNDLE}VisibleContentOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0037
     * @tc.name      NdkRawfile_VisibleContentOf_0037
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=10, length=5) returns "le 12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0037 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 10, 5);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('le 12');
      logInfo(`${BUNDLE}VisibleContentOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0038
     * @tc.name      NdkRawfile_VisibleContentOf_0038
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=0, length=15) returns "Sample Title 12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0038 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 0, 15);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 12');
      logInfo(`${BUNDLE}VisibleContentOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0039
     * @tc.name      NdkRawfile_VisibleContentOf_0039
     * @tc.desc      visibleContentOf(content="hello world", offset=5, length=2) returns " w"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0039 begin`);
      const actual: string = visibleContentOf('hello world', 5, 2);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual(' w');
      logInfo(`${BUNDLE}VisibleContentOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0040
     * @tc.name      NdkRawfile_VisibleContentOf_0040
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=5, length=1) returns "e"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0040 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 5, 1);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('e');
      logInfo(`${BUNDLE}VisibleContentOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0041
     * @tc.name      NdkRawfile_VisibleContentOf_0041
     * @tc.desc      visibleContentOf(content="??", offset=-1, length=0) returns "?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0041 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', -1, 0);
      logInfo(`visibleContentOf(content="??", offset=-1,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d');
      logInfo(`${BUNDLE}VisibleContentOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0042
     * @tc.name      NdkRawfile_VisibleContentOf_0042
     * @tc.desc      visibleContentOf(content="abc", offset=1, length=1) returns "b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0042 begin`);
      const actual: string = visibleContentOf('abc', 1, 1);
      logInfo(`visibleContentOf(content="abc", offset=1,...: actual=${actual}`);
      expect(actual).assertEqual('b');
      logInfo(`${BUNDLE}VisibleContentOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0043
     * @tc.name      NdkRawfile_VisibleContentOf_0043
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=15, length=0) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0043 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 15, 0);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}VisibleContentOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0044
     * @tc.name      NdkRawfile_VisibleContentOf_0044
     * @tc.desc      visibleContentOf(content="hello world", offset=-1, length=10) returns "hello wor"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0044 begin`);
      const actual: string = visibleContentOf('hello world', -1, 10);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello wor');
      logInfo(`${BUNDLE}VisibleContentOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0045
     * @tc.name      NdkRawfile_VisibleContentOf_0045
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=5, length=10) returns "e Title 12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0045 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 5, 10);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('e Title 12');
      logInfo(`${BUNDLE}VisibleContentOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0046
     * @tc.name      NdkRawfile_VisibleContentOf_0046
     * @tc.desc      visibleContentOf(content="hello world", offset=1, length=10) returns "ello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0046 begin`);
      const actual: string = visibleContentOf('hello world', 1, 10);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('ello world');
      logInfo(`${BUNDLE}VisibleContentOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0047
     * @tc.name      NdkRawfile_VisibleContentOf_0047
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=2, length=3) returns "mpl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0047 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 2, 3);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('mpl');
      logInfo(`${BUNDLE}VisibleContentOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0048
     * @tc.name      NdkRawfile_VisibleContentOf_0048
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=3, length=10) returns "ple Title "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0048 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 3, 10);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('ple Title ');
      logInfo(`${BUNDLE}VisibleContentOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0049
     * @tc.name      NdkRawfile_VisibleContentOf_0049
     * @tc.desc      visibleContentOf(content="??", offset=1, length=0) returns "?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0049 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', 1, 0);
      logInfo(`visibleContentOf(content="??", offset=1, ...: actual=${actual}`);
      expect(actual).assertEqual('\u6587');
      logInfo(`${BUNDLE}VisibleContentOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0050
     * @tc.name      NdkRawfile_VisibleContentOf_0050
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=0, length=5) returns "Sampl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0050 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 0, 5);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sampl');
      logInfo(`${BUNDLE}VisibleContentOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0051
     * @tc.name      NdkRawfile_VisibleContentOf_0051
     * @tc.desc      visibleContentOf(content="hello world", offset=3, length=5) returns "lo wo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0051 begin`);
      const actual: string = visibleContentOf('hello world', 3, 5);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('lo wo');
      logInfo(`${BUNDLE}VisibleContentOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0052
     * @tc.name      NdkRawfile_VisibleContentOf_0052
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=1, length=15) returns "ample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0052 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 1, 15);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('ample Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0053
     * @tc.name      NdkRawfile_VisibleContentOf_0053
     * @tc.desc      visibleContentOf(content="Hello World", offset=10, length=1) returns "d"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0053 begin`);
      const actual: string = visibleContentOf('Hello World', 10, 1);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('d');
      logInfo(`${BUNDLE}VisibleContentOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0054
     * @tc.name      NdkRawfile_VisibleContentOf_0054
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=5, length=3) returns "e T"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0054 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 5, 3);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('e T');
      logInfo(`${BUNDLE}VisibleContentOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0055
     * @tc.name      NdkRawfile_VisibleContentOf_0055
     * @tc.desc      visibleContentOf(content="Hello World", offset=5, length=5) returns " Worl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0055 begin`);
      const actual: string = visibleContentOf('Hello World', 5, 5);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual(' Worl');
      logInfo(`${BUNDLE}VisibleContentOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0056
     * @tc.name      NdkRawfile_VisibleContentOf_0056
     * @tc.desc      visibleContentOf(content="hello world", offset=-1, length=5) returns "hell"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0056 begin`);
      const actual: string = visibleContentOf('hello world', -1, 5);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hell');
      logInfo(`${BUNDLE}VisibleContentOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0057
     * @tc.name      NdkRawfile_VisibleContentOf_0057
     * @tc.desc      visibleContentOf(content="hello world", offset=0, length=10) returns "hello worl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0057 begin`);
      const actual: string = visibleContentOf('hello world', 0, 10);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello worl');
      logInfo(`${BUNDLE}VisibleContentOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0058
     * @tc.name      NdkRawfile_VisibleContentOf_0058
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=1, length=3) returns "amp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0058 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 1, 3);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('amp');
      logInfo(`${BUNDLE}VisibleContentOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0059
     * @tc.name      NdkRawfile_VisibleContentOf_0059
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=5, length=5) returns "e Tit"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0059 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 5, 5);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('e Tit');
      logInfo(`${BUNDLE}VisibleContentOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0060
     * @tc.name      NdkRawfile_VisibleContentOf_0060
     * @tc.desc      visibleContentOf(content="Hello", offset=0, length=3) returns "Hel"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0060 begin`);
      const actual: string = visibleContentOf('Hello', 0, 3);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hel');
      logInfo(`${BUNDLE}VisibleContentOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0061
     * @tc.name      NdkRawfile_VisibleContentOf_0061
     * @tc.desc      visibleContentOf(content="hello world", offset=3, length=0) returns "lo world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0061 begin`);
      const actual: string = visibleContentOf('hello world', 3, 0);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('lo world');
      logInfo(`${BUNDLE}VisibleContentOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0062
     * @tc.name      NdkRawfile_VisibleContentOf_0062
     * @tc.desc      visibleContentOf(content="Hello World", offset=3, length=0) returns "lo World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0062 begin`);
      const actual: string = visibleContentOf('Hello World', 3, 0);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('lo World');
      logInfo(`${BUNDLE}VisibleContentOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0063
     * @tc.name      NdkRawfile_VisibleContentOf_0063
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=10, length=2) returns "le"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0063 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 10, 2);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('le');
      logInfo(`${BUNDLE}VisibleContentOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0064
     * @tc.name      NdkRawfile_VisibleContentOf_0064
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=5, length=0) returns "e Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0064 begin`);
      const actual: string = visibleContentOf('Sample Title 123', 5, 0);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('e Title 123');
      logInfo(`${BUNDLE}VisibleContentOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0065
     * @tc.name      NdkRawfile_VisibleContentOf_0065
     * @tc.desc      visibleContentOf(content="hello world", offset=5, length=3) returns " wo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0065 begin`);
      const actual: string = visibleContentOf('hello world', 5, 3);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual(' wo');
      logInfo(`${BUNDLE}VisibleContentOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0066
     * @tc.name      NdkRawfile_VisibleContentOf_0066
     * @tc.desc      visibleContentOf(content="hello world", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0066 begin`);
      const actual: string = visibleContentOf('hello world', -100, 0);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0067
     * @tc.name      NdkRawfile_VisibleContentOf_0067
     * @tc.desc      visibleContentOf(content="", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0067 begin`);
      const actual: string = visibleContentOf('', -100, 0);
      logInfo(`visibleContentOf(content="", offset=-100,...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0068
     * @tc.name      NdkRawfile_VisibleContentOf_0068
     * @tc.desc      visibleContentOf(content=" ", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0068 begin`);
      const actual: string = visibleContentOf(' ', -100, 0);
      logInfo(`visibleContentOf(content=" ", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0069
     * @tc.name      NdkRawfile_VisibleContentOf_0069
     * @tc.desc      visibleContentOf(content="A", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0069 begin`);
      const actual: string = visibleContentOf('A', -100, 0);
      logInfo(`visibleContentOf(content="A", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0070
     * @tc.name      NdkRawfile_VisibleContentOf_0070
     * @tc.desc      visibleContentOf(content="Sample Title 123", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0070 begin`);
      const actual: string = visibleContentOf('Sample Title 123', -100, 0);
      logInfo(`visibleContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0071
     * @tc.name      NdkRawfile_VisibleContentOf_0071
     * @tc.desc      visibleContentOf(content="??", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0071 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', -100, 0);
      logInfo(`visibleContentOf(content="??", offset=-10...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0072
     * @tc.name      NdkRawfile_VisibleContentOf_0072
     * @tc.desc      visibleContentOf(content="a", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0072 begin`);
      const actual: string = visibleContentOf('a', -100, 0);
      logInfo(`visibleContentOf(content="a", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0073
     * @tc.name      NdkRawfile_VisibleContentOf_0073
     * @tc.desc      visibleContentOf(content="abc", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0073 begin`);
      const actual: string = visibleContentOf('abc', -100, 0);
      logInfo(`visibleContentOf(content="abc", offset=-1...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0074
     * @tc.name      NdkRawfile_VisibleContentOf_0074
     * @tc.desc      visibleContentOf(content="Hello World", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0074 begin`);
      const actual: string = visibleContentOf('Hello World', -100, 0);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0075
     * @tc.name      NdkRawfile_VisibleContentOf_0075
     * @tc.desc      visibleContentOf(content="Hello", offset=50, length=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0075 begin`);
      const actual: string = visibleContentOf('Hello', 50, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0076
     * @tc.name      NdkRawfile_VisibleContentOf_0076
     * @tc.desc      visibleContentOf(content="Hello", offset=100, length=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0076 begin`);
      const actual: string = visibleContentOf('Hello', 100, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0077
     * @tc.name      NdkRawfile_VisibleContentOf_0077
     * @tc.desc      visibleContentOf(content="Hello", offset=10, length=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0077 begin`);
      const actual: string = visibleContentOf('Hello', 10, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0078
     * @tc.name      NdkRawfile_VisibleContentOf_0078
     * @tc.desc      visibleContentOf(content="Hello", offset=5, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0078 begin`);
      const actual: string = visibleContentOf('Hello', 5, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0079
     * @tc.name      NdkRawfile_VisibleContentOf_0079
     * @tc.desc      visibleContentOf(content="Hello", offset=15, length=0) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_VisibleContentOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0079 begin`);
      const actual: string = visibleContentOf('Hello', 15, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}VisibleContentOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0080
     * @tc.name      NdkRawfile_VisibleContentOf_0080
     * @tc.desc      visibleContentOf(content="Hello", offset=-71, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0080 begin`);
      const actual: string = visibleContentOf('Hello', -71, 0);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0081
     * @tc.name      NdkRawfile_VisibleContentOf_0081
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0081 begin`);
      const actual: string = visibleContentOf('Hello', -100, 1);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0082
     * @tc.name      NdkRawfile_VisibleContentOf_0082
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0082 begin`);
      const actual: string = visibleContentOf('Hello', -100, -1);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0083
     * @tc.name      NdkRawfile_VisibleContentOf_0083
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0083 begin`);
      const actual: string = visibleContentOf('Hello', -100, 2);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0084
     * @tc.name      NdkRawfile_VisibleContentOf_0084
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0084 begin`);
      const actual: string = visibleContentOf('Hello', -100, 5);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0085
     * @tc.name      NdkRawfile_VisibleContentOf_0085
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0085 begin`);
      const actual: string = visibleContentOf('Hello', -100, 10);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0086
     * @tc.name      NdkRawfile_VisibleContentOf_0086
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0086 begin`);
      const actual: string = visibleContentOf('Hello', -100, 100);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0087
     * @tc.name      NdkRawfile_VisibleContentOf_0087
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0087 begin`);
      const actual: string = visibleContentOf('Hello', -100, 3);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0088
     * @tc.name      NdkRawfile_VisibleContentOf_0088
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0088 begin`);
      const actual: string = visibleContentOf('Hello', -100, 15);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0089
     * @tc.name      NdkRawfile_VisibleContentOf_0089
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0089 begin`);
      const actual: string = visibleContentOf('Hello', -100, 20);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0090
     * @tc.name      NdkRawfile_VisibleContentOf_0090
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=-20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0090 begin`);
      const actual: string = visibleContentOf('Hello', -100, -20);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0091
     * @tc.name      NdkRawfile_VisibleContentOf_0091
     * @tc.desc      visibleContentOf(content="Hello", offset=-100, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0091 begin`);
      const actual: string = visibleContentOf('Hello', -100, -100);
      logInfo(`visibleContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0092
     * @tc.name      NdkRawfile_VisibleContentOf_0092
     * @tc.desc      visibleContentOf(content="??", offset=1, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0092 begin`);
      const actual: string = visibleContentOf('\u4e2d\u6587', 1, -100);
      logInfo(`visibleContentOf(content="??", offset=1, ...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0093
     * @tc.name      NdkRawfile_VisibleContentOf_0093
     * @tc.desc      visibleContentOf(content="", offset=5, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0093 begin`);
      const actual: string = visibleContentOf('', 5, -100);
      logInfo(`visibleContentOf(content="", offset=5, le...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0094
     * @tc.name      NdkRawfile_VisibleContentOf_0094
     * @tc.desc      visibleContentOf(content="hello world", offset=-1, length=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0094 begin`);
      const actual: string = visibleContentOf('hello world', -1, -100);
      logInfo(`visibleContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0095
     * @tc.name      NdkRawfile_VisibleContentOf_0095
     * @tc.desc      visibleContentOf(content=" ", offset=-100, length=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_VisibleContentOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0095 begin`);
      const actual: string = visibleContentOf(' ', -100, 2);
      logInfo(`visibleContentOf(content=" ", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VisibleContentOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_VISIBLE_CONTENT_OF_0096
     * @tc.name      NdkRawfile_VisibleContentOf_0096
     * @tc.desc      visibleContentOf(content="Hello World", offset=3, length=2) returns "lo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_VisibleContentOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}VisibleContentOf_0096 begin`);
      const actual: string = visibleContentOf('Hello World', 3, 2);
      logInfo(`visibleContentOf(content="Hello World", o...: actual=${actual}`);
      expect(actual).assertEqual('lo');
      logInfo(`${BUNDLE}VisibleContentOf_0096 end`);
    });
  });
}
