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

/** Logic checks for decodedContentOf (91 cases). */
export default function decodedContentOfTest(): void {
  describe('DecodedContentOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0001
     * @tc.name      NdkRawfile_DecodedContentOf_0001
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_DecodedContentOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0001 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0002
     * @tc.name      NdkRawfile_DecodedContentOf_0002
     * @tc.desc      decodedContentOf(content="?u0000", offset=0, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_DecodedContentOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0002 begin`);
      const actual: string = decodedContentOf('\u0000', 0, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0003
     * @tc.name      NdkRawfile_DecodedContentOf_0003
     * @tc.desc      decodedContentOf(content="??", offset=50, length=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0003 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 50, 5);
      logInfo(`decodedContentOf(content="??", offset=50,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}DecodedContentOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0004
     * @tc.name      NdkRawfile_DecodedContentOf_0004
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=2, length=20) returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0004 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 2, 20);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}DecodedContentOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0005
     * @tc.name      NdkRawfile_DecodedContentOf_0005
     * @tc.desc      decodedContentOf(content=" ", offset=50, length=1) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0005 begin`);
      const actual: string = decodedContentOf(' ', 50, 1);
      logInfo(`decodedContentOf(content=" ", offset=50, ...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}DecodedContentOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0006
     * @tc.name      NdkRawfile_DecodedContentOf_0006
     * @tc.desc      decodedContentOf(content="?u0000x", offset=3, length=5) returns "?u0000x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0006 begin`);
      const actual: string = decodedContentOf('\u0000x', 3, 5);
      logInfo(`decodedContentOf(content="?u0000x", offse...: actual=${actual}`);
      expect(actual).assertEqual('\u0000x');
      logInfo(`${BUNDLE}DecodedContentOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0007
     * @tc.name      NdkRawfile_DecodedContentOf_0007
     * @tc.desc      decodedContentOf(content="Hello", offset=171, length=-86) returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0007 begin`);
      const actual: string = decodedContentOf('Hello', 171, -86);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}DecodedContentOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0008
     * @tc.name      NdkRawfile_DecodedContentOf_0008
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=5, length=-86) returns "?u0000?u0000?u0000?u...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0008 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 5, -86);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 8)=${actual.substring(0, 8)}`);
      expect(actual.substring(0, 8)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0009
     * @tc.name      NdkRawfile_DecodedContentOf_0009
     * @tc.desc      decodedContentOf(content="hello world", offset=0, length=100) returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0009 begin`);
      const actual: string = decodedContentOf('hello world', 0, 100);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}DecodedContentOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0010
     * @tc.name      NdkRawfile_DecodedContentOf_0010
     * @tc.desc      decodedContentOf(content="a", offset=50, length=20) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0010 begin`);
      const actual: string = decodedContentOf('a', 50, 20);
      logInfo(`decodedContentOf(content="a", offset=50, ...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DecodedContentOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0011
     * @tc.name      NdkRawfile_DecodedContentOf_0011
     * @tc.desc      decodedContentOf(content="A", offset=15, length=3) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0011 begin`);
      const actual: string = decodedContentOf('A', 15, 3);
      logInfo(`decodedContentOf(content="A", offset=15, ...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}DecodedContentOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0012
     * @tc.name      NdkRawfile_DecodedContentOf_0012
     * @tc.desc      decodedContentOf(content="hello world", offset=5, length=-1) returns "?u0000?u0000?u0000?u0000?u...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0012 begin`);
      const actual: string = decodedContentOf('hello world', 5, -1);
      logInfo(`decodedContentOf(content="hello world", o...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`decodedContentOf(content="hello world", o...: actual.substring(0, 8)=${actual.substring(0, 8)}`);
      expect(actual.substring(0, 8)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="hello world", o...: actual.substring(5)=${actual.substring(5)}`);
      expect(actual.substring(5)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0013
     * @tc.name      NdkRawfile_DecodedContentOf_0013
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=-100, length=1) returns "?u0000?u0000?u0000?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0013 begin`);
      const actual: string = decodedContentOf('Sample Title 123', -100, 1);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 8)=${actual.substring(0, 8)}`);
      expect(actual.substring(0, 8)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(9)=${actual.substring(9)}`);
      expect(actual.substring(9)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0014
     * @tc.name      NdkRawfile_DecodedContentOf_0014
     * @tc.desc      decodedContentOf(content="?u0000x", offset=0, length=1) returns "?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0014 begin`);
      const actual: string = decodedContentOf('\u0000x', 0, 1);
      logInfo(`decodedContentOf(content="?u0000x", offse...: actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0015
     * @tc.name      NdkRawfile_DecodedContentOf_0015
     * @tc.desc      decodedContentOf(content="Hello", offset=2, length=2) returns "ll?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0015 begin`);
      const actual: string = decodedContentOf('Hello', 2, 2);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('ll\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0016
     * @tc.name      NdkRawfile_DecodedContentOf_0016
     * @tc.desc      decodedContentOf(content="??", offset=0, length=1) returns "??u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0016 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', 0, 1);
      logInfo(`decodedContentOf(content="??", offset=0, ...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0017
     * @tc.name      NdkRawfile_DecodedContentOf_0017
     * @tc.desc      decodedContentOf(content="hello world", offset=5, length=2) returns " w?u0000?u0000?u0000?u0000?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0017 begin`);
      const actual: string = decodedContentOf('hello world', 5, 2);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual(' w\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0018
     * @tc.name      NdkRawfile_DecodedContentOf_0018
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=2, length=0) returns "mple Title 123?u0000?u...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0018 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 2, 0);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('mple Title 123\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0019
     * @tc.name      NdkRawfile_DecodedContentOf_0019
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=0, length=15) returns "Sample Title 12?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0019 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 0, 15);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 12\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0020
     * @tc.name      NdkRawfile_DecodedContentOf_0020
     * @tc.desc      decodedContentOf(content="hello world", offset=-1, length=3) returns "he?u0000?u0000?u0000?u0000...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0020 begin`);
      const actual: string = decodedContentOf('hello world', -1, 3);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('he\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0021
     * @tc.name      NdkRawfile_DecodedContentOf_0021
     * @tc.desc      decodedContentOf(content="Hello", offset=0, length=1) returns "H?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0021 begin`);
      const actual: string = decodedContentOf('Hello', 0, 1);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('H\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0022
     * @tc.name      NdkRawfile_DecodedContentOf_0022
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=1, length=15) returns "ample Title 123?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0022 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 1, 15);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('ample Title 123\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0023
     * @tc.name      NdkRawfile_DecodedContentOf_0023
     * @tc.desc      decodedContentOf(content="Hello", offset=1, length=3) returns "ell?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0023 begin`);
      const actual: string = decodedContentOf('Hello', 1, 3);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('ell\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0024
     * @tc.name      NdkRawfile_DecodedContentOf_0024
     * @tc.desc      decodedContentOf(content="hello world", offset=1, length=10) returns "ello world?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0024 begin`);
      const actual: string = decodedContentOf('hello world', 1, 10);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('ello world\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0025
     * @tc.name      NdkRawfile_DecodedContentOf_0025
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=-1, length=15) returns "Sample Title 1?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0025 begin`);
      const actual: string = decodedContentOf('Sample Title 123', -1, 15);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 1\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0026
     * @tc.name      NdkRawfile_DecodedContentOf_0026
     * @tc.desc      decodedContentOf(content="hello world", offset=3, length=0) returns "lo world?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0026 begin`);
      const actual: string = decodedContentOf('hello world', 3, 0);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('lo world\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0027
     * @tc.name      NdkRawfile_DecodedContentOf_0027
     * @tc.desc      decodedContentOf(content="hello world", offset=3, length=2) returns "lo?u0000?u0000?u0000?u0000?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0027 begin`);
      const actual: string = decodedContentOf('hello world', 3, 2);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('lo\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0028
     * @tc.name      NdkRawfile_DecodedContentOf_0028
     * @tc.desc      decodedContentOf(content="Hello", offset=3, length=0) returns "lo?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0028 begin`);
      const actual: string = decodedContentOf('Hello', 3, 0);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('lo\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0029
     * @tc.name      NdkRawfile_DecodedContentOf_0029
     * @tc.desc      decodedContentOf(content="hello world", offset=-1, length=5) returns "hell?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0029 begin`);
      const actual: string = decodedContentOf('hello world', -1, 5);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('hell\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0030
     * @tc.name      NdkRawfile_DecodedContentOf_0030
     * @tc.desc      decodedContentOf(content="Hello", offset=1, length=1) returns "e?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0030 begin`);
      const actual: string = decodedContentOf('Hello', 1, 1);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('e\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0031
     * @tc.name      NdkRawfile_DecodedContentOf_0031
     * @tc.desc      decodedContentOf(content="Hello", offset=-1, length=-86) returns "?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0031 begin`);
      const actual: string = decodedContentOf('Hello', -1, -86);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0032
     * @tc.name      NdkRawfile_DecodedContentOf_0032
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=3, length=5) returns "?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0032 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 3, 5);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 12)=${actual.substring(0, 12)}`);
      expect(actual.substring(0, 12)).assertEqual('ple T\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0033
     * @tc.name      NdkRawfile_DecodedContentOf_0033
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=15, length=0) returns "?u0000?u0000?u0000?u0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0033 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 15, 0);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 8)=${actual.substring(0, 8)}`);
      expect(actual.substring(0, 8)).assertEqual('3\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0034
     * @tc.name      NdkRawfile_DecodedContentOf_0034
     * @tc.desc      decodedContentOf(content="??", offset=-1, length=0) returns "?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0034 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', -1, 0);
      logInfo(`decodedContentOf(content="??", offset=-1,...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d');
      logInfo(`${BUNDLE}DecodedContentOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0035
     * @tc.name      NdkRawfile_DecodedContentOf_0035
     * @tc.desc      decodedContentOf(content="hello world", offset=0, length=2) returns "he?u0000?u0000?u0000?u0000?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0035 begin`);
      const actual: string = decodedContentOf('hello world', 0, 2);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('he\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0036
     * @tc.name      NdkRawfile_DecodedContentOf_0036
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=2, length=3) returns "?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0036 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 2, 3);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 10)=${actual.substring(0, 10)}`);
      expect(actual.substring(0, 10)).assertEqual('mpl\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0037
     * @tc.name      NdkRawfile_DecodedContentOf_0037
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=5, length=2) returns "?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0037 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 5, 2);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 9)=${actual.substring(0, 9)}`);
      expect(actual.substring(0, 9)).assertEqual('e \u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0038
     * @tc.name      NdkRawfile_DecodedContentOf_0038
     * @tc.desc      decodedContentOf(content="hello world", offset=-100, length=2) returns "?u0000?u0000?u0000?u0000...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0038 begin`);
      const actual: string = decodedContentOf('hello world', -100, 2);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0039
     * @tc.name      NdkRawfile_DecodedContentOf_0039
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=1, length=2) returns "?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0039 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 1, 2);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 9)=${actual.substring(0, 9)}`);
      expect(actual.substring(0, 9)).assertEqual('am\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0040
     * @tc.name      NdkRawfile_DecodedContentOf_0040
     * @tc.desc      decodedContentOf(content="hello world", offset=-100, length=5) returns "?u0000?u0000?u0000?u0000...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0040 begin`);
      const actual: string = decodedContentOf('hello world', -100, 5);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0041
     * @tc.name      NdkRawfile_DecodedContentOf_0041
     * @tc.desc      decodedContentOf(content="Hello", offset=2, length=0) returns "llo?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0041 begin`);
      const actual: string = decodedContentOf('Hello', 2, 0);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('llo\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0042
     * @tc.name      NdkRawfile_DecodedContentOf_0042
     * @tc.desc      decodedContentOf(content="hello world", offset=-1, length=2) returns "h?u0000?u0000?u0000?u0000?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0042 begin`);
      const actual: string = decodedContentOf('hello world', -1, 2);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('h\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0043
     * @tc.name      NdkRawfile_DecodedContentOf_0043
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=-1, length=3) returns "?u0000?u0000?u0000?u0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0043 begin`);
      const actual: string = decodedContentOf('Sample Title 123', -1, 3);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 9)=${actual.substring(0, 9)}`);
      expect(actual.substring(0, 9)).assertEqual('Sa\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(9)=${actual.substring(9)}`);
      expect(actual.substring(9)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0044
     * @tc.name      NdkRawfile_DecodedContentOf_0044
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=-1, length=5) returns "?u0000?u0000?u0000?u0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0044 begin`);
      const actual: string = decodedContentOf('Sample Title 123', -1, 5);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 11)=${actual.substring(0, 11)}`);
      expect(actual.substring(0, 11)).assertEqual('Samp\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(9)=${actual.substring(9)}`);
      expect(actual.substring(9)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0045
     * @tc.name      NdkRawfile_DecodedContentOf_0045
     * @tc.desc      decodedContentOf(content="hello world", offset=5, length=0) returns " world?u0000?u0000?u0000?u0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0045 begin`);
      const actual: string = decodedContentOf('hello world', 5, 0);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual(' world\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0046
     * @tc.name      NdkRawfile_DecodedContentOf_0046
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=5, length=3) returns "?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0046 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 5, 3);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 10)=${actual.substring(0, 10)}`);
      expect(actual.substring(0, 10)).assertEqual('e T\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0047
     * @tc.name      NdkRawfile_DecodedContentOf_0047
     * @tc.desc      decodedContentOf(content="hello world", offset=10, length=0) returns "d?u0000?u0000?u0000?u0000?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0047 begin`);
      const actual: string = decodedContentOf('hello world', 10, 0);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('d\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0048
     * @tc.name      NdkRawfile_DecodedContentOf_0048
     * @tc.desc      decodedContentOf(content="hello world", offset=-1, length=1) returns "?u0000?u0000?u0000?u0000?u...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0048 begin`);
      const actual: string = decodedContentOf('hello world', -1, 1);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0049
     * @tc.name      NdkRawfile_DecodedContentOf_0049
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=10, length=3) returns "?u0000?u0000?u0000?u0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0049 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 10, 3);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 10)=${actual.substring(0, 10)}`);
      expect(actual.substring(0, 10)).assertEqual('le \u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0050
     * @tc.name      NdkRawfile_DecodedContentOf_0050
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=-100, length=3) returns "?u0000?u0000?u0000?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0050 begin`);
      const actual: string = decodedContentOf('Sample Title 123', -100, 3);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 8)=${actual.substring(0, 8)}`);
      expect(actual.substring(0, 8)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(7)=${actual.substring(7)}`);
      expect(actual.substring(7)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0051
     * @tc.name      NdkRawfile_DecodedContentOf_0051
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=2, length=2) returns "?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0051 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 2, 2);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 9)=${actual.substring(0, 9)}`);
      expect(actual.substring(0, 9)).assertEqual('mp\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0052
     * @tc.name      NdkRawfile_DecodedContentOf_0052
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=10, length=5) returns "?u0000?u0000?u0000?u0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0052 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 10, 5);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 12)=${actual.substring(0, 12)}`);
      expect(actual.substring(0, 12)).assertEqual('le 12\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0053
     * @tc.name      NdkRawfile_DecodedContentOf_0053
     * @tc.desc      decodedContentOf(content="hello world", offset=1, length=3) returns "ell?u0000?u0000?u0000?u0000...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0053 begin`);
      const actual: string = decodedContentOf('hello world', 1, 3);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('ell\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0054
     * @tc.name      NdkRawfile_DecodedContentOf_0054
     * @tc.desc      decodedContentOf(content="hello world", offset=3, length=1) returns "l?u0000?u0000?u0000?u0000?u...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0054 begin`);
      const actual: string = decodedContentOf('hello world', 3, 1);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('l\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0055
     * @tc.name      NdkRawfile_DecodedContentOf_0055
     * @tc.desc      decodedContentOf(content="Hello", offset=0, length=2) returns "He?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0055 begin`);
      const actual: string = decodedContentOf('Hello', 0, 2);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('He\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0056
     * @tc.name      NdkRawfile_DecodedContentOf_0056
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=-1, length=2) returns "?u0000?u0000?u0000?u0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0056 begin`);
      const actual: string = decodedContentOf('Sample Title 123', -1, 2);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 8)=${actual.substring(0, 8)}`);
      expect(actual.substring(0, 8)).assertEqual('S\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(9)=${actual.substring(9)}`);
      expect(actual.substring(9)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0057
     * @tc.name      NdkRawfile_DecodedContentOf_0057
     * @tc.desc      decodedContentOf(content="Hello", offset=-100, length=2) returns "?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0057 begin`);
      const actual: string = decodedContentOf('Hello', -100, 2);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0058
     * @tc.name      NdkRawfile_DecodedContentOf_0058
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=5, length=0) returns "e Title 123?u0000?u000...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0058 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 5, 0);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('e Title 123\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0059
     * @tc.name      NdkRawfile_DecodedContentOf_0059
     * @tc.desc      decodedContentOf(content="Hello", offset=-1, length=5) returns "Hell"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0059 begin`);
      const actual: string = decodedContentOf('Hello', -1, 5);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('Hell');
      logInfo(`${BUNDLE}DecodedContentOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0060
     * @tc.name      NdkRawfile_DecodedContentOf_0060
     * @tc.desc      decodedContentOf(content="hello world", offset=-100, length=3) returns "?u0000?u0000?u0000?u0000...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0060 begin`);
      const actual: string = decodedContentOf('hello world', -100, 3);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0061
     * @tc.name      NdkRawfile_DecodedContentOf_0061
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=0, length=3) returns "?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0061 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 0, 3);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 10)=${actual.substring(0, 10)}`);
      expect(actual.substring(0, 10)).assertEqual('Sam\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0062
     * @tc.name      NdkRawfile_DecodedContentOf_0062
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=3, length=1) returns "?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0062 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 3, 1);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 8)=${actual.substring(0, 8)}`);
      expect(actual.substring(0, 8)).assertEqual('p\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0063
     * @tc.name      NdkRawfile_DecodedContentOf_0063
     * @tc.desc      decodedContentOf(content="hello world", offset=2, length=5) returns "llo w?u0000?u0000?u0000?u00...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0063 begin`);
      const actual: string = decodedContentOf('hello world', 2, 5);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('llo w\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0064
     * @tc.name      NdkRawfile_DecodedContentOf_0064
     * @tc.desc      decodedContentOf(content="?u0000x", offset=1, length=1) returns "x?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0064 begin`);
      const actual: string = decodedContentOf('\u0000x', 1, 1);
      logInfo(`decodedContentOf(content="?u0000x", offse...: actual=${actual}`);
      expect(actual).assertEqual('x\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0065
     * @tc.name      NdkRawfile_DecodedContentOf_0065
     * @tc.desc      decodedContentOf(content="hello world", offset=3, length=3) returns "lo ?u0000?u0000?u0000?u0000...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0065 begin`);
      const actual: string = decodedContentOf('hello world', 3, 3);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('lo \u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0066
     * @tc.name      NdkRawfile_DecodedContentOf_0066
     * @tc.desc      decodedContentOf(content="hello world", offset=1, length=1) returns "e?u0000?u0000?u0000?u0000?u...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0066 begin`);
      const actual: string = decodedContentOf('hello world', 1, 1);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('e\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0067
     * @tc.name      NdkRawfile_DecodedContentOf_0067
     * @tc.desc      decodedContentOf(content="Hello", offset=3, length=1) returns "l?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0067 begin`);
      const actual: string = decodedContentOf('Hello', 3, 1);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('l\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0068
     * @tc.name      NdkRawfile_DecodedContentOf_0068
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=10, length=1) returns "?u0000?u0000?u0000?u0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_DecodedContentOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0068 begin`);
      const actual: string = decodedContentOf('Sample Title 123', 10, 1);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(0, 8)=${actual.substring(0, 8)}`);
      expect(actual.substring(0, 8)).assertEqual('l\u0000\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`decodedContentOf(content="Sample Title 12...: actual.substring(10)=${actual.substring(10)}`);
      expect(actual.substring(10)).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0069
     * @tc.name      NdkRawfile_DecodedContentOf_0069
     * @tc.desc      decodedContentOf(content="?u0000x", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0069 begin`);
      const actual: string = decodedContentOf('\u0000x', -100, 0);
      logInfo(`decodedContentOf(content="?u0000x", offse...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0070
     * @tc.name      NdkRawfile_DecodedContentOf_0070
     * @tc.desc      decodedContentOf(content="Hello", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0070 begin`);
      const actual: string = decodedContentOf('Hello', -100, 0);
      logInfo(`decodedContentOf(content="Hello", offset=...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0071
     * @tc.name      NdkRawfile_DecodedContentOf_0071
     * @tc.desc      decodedContentOf(content="hello world", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0071 begin`);
      const actual: string = decodedContentOf('hello world', -100, 0);
      logInfo(`decodedContentOf(content="hello world", o...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0072
     * @tc.name      NdkRawfile_DecodedContentOf_0072
     * @tc.desc      decodedContentOf(content="", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0072 begin`);
      const actual: string = decodedContentOf('', -100, 0);
      logInfo(`decodedContentOf(content="", offset=-100,...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0073
     * @tc.name      NdkRawfile_DecodedContentOf_0073
     * @tc.desc      decodedContentOf(content=" ", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0073 begin`);
      const actual: string = decodedContentOf(' ', -100, 0);
      logInfo(`decodedContentOf(content=" ", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0074
     * @tc.name      NdkRawfile_DecodedContentOf_0074
     * @tc.desc      decodedContentOf(content="A", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0074 begin`);
      const actual: string = decodedContentOf('A', -100, 0);
      logInfo(`decodedContentOf(content="A", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0075
     * @tc.name      NdkRawfile_DecodedContentOf_0075
     * @tc.desc      decodedContentOf(content="Sample Title 123", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0075 begin`);
      const actual: string = decodedContentOf('Sample Title 123', -100, 0);
      logInfo(`decodedContentOf(content="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0076
     * @tc.name      NdkRawfile_DecodedContentOf_0076
     * @tc.desc      decodedContentOf(content="??", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0076 begin`);
      const actual: string = decodedContentOf('\u4e2d\u6587', -100, 0);
      logInfo(`decodedContentOf(content="??", offset=-10...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0077
     * @tc.name      NdkRawfile_DecodedContentOf_0077
     * @tc.desc      decodedContentOf(content="a", offset=-100, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0077 begin`);
      const actual: string = decodedContentOf('a', -100, 0);
      logInfo(`decodedContentOf(content="a", offset=-100...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0078
     * @tc.name      NdkRawfile_DecodedContentOf_0078
     * @tc.desc      decodedContentOf(content="?u0000", offset=-1, length=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0078 begin`);
      const actual: string = decodedContentOf('\u0000', -1, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0079
     * @tc.name      NdkRawfile_DecodedContentOf_0079
     * @tc.desc      decodedContentOf(content="?u0000", offset=1, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0079 begin`);
      const actual: string = decodedContentOf('\u0000', 1, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0080
     * @tc.name      NdkRawfile_DecodedContentOf_0080
     * @tc.desc      decodedContentOf(content="?u0000", offset=50, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0080 begin`);
      const actual: string = decodedContentOf('\u0000', 50, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0081
     * @tc.name      NdkRawfile_DecodedContentOf_0081
     * @tc.desc      decodedContentOf(content="?u0000", offset=100, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0081 begin`);
      const actual: string = decodedContentOf('\u0000', 100, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0082
     * @tc.name      NdkRawfile_DecodedContentOf_0082
     * @tc.desc      decodedContentOf(content="?u0000", offset=2, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0082 begin`);
      const actual: string = decodedContentOf('\u0000', 2, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0083
     * @tc.name      NdkRawfile_DecodedContentOf_0083
     * @tc.desc      decodedContentOf(content="?u0000", offset=3, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0083 begin`);
      const actual: string = decodedContentOf('\u0000', 3, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0084
     * @tc.name      NdkRawfile_DecodedContentOf_0084
     * @tc.desc      decodedContentOf(content="?u0000", offset=10, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0084 begin`);
      const actual: string = decodedContentOf('\u0000', 10, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0085
     * @tc.name      NdkRawfile_DecodedContentOf_0085
     * @tc.desc      decodedContentOf(content="?u0000", offset=5, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0085 begin`);
      const actual: string = decodedContentOf('\u0000', 5, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0086
     * @tc.name      NdkRawfile_DecodedContentOf_0086
     * @tc.desc      decodedContentOf(content="?u0000", offset=15, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0086 begin`);
      const actual: string = decodedContentOf('\u0000', 15, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0087
     * @tc.name      NdkRawfile_DecodedContentOf_0087
     * @tc.desc      decodedContentOf(content="?u0000", offset=171, length=0) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DecodedContentOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0087 begin`);
      const actual: string = decodedContentOf('\u0000', 171, 0);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0088
     * @tc.name      NdkRawfile_DecodedContentOf_0088
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0088 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 1);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0089
     * @tc.name      NdkRawfile_DecodedContentOf_0089
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=-1) returns "?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0089 begin`);
      const actual: string = decodedContentOf('\u0000', -100, -1);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('\u0000');
      logInfo(`${BUNDLE}DecodedContentOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0090
     * @tc.name      NdkRawfile_DecodedContentOf_0090
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0090 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 2);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DECODED_CONTENT_OF_0091
     * @tc.name      NdkRawfile_DecodedContentOf_0091
     * @tc.desc      decodedContentOf(content="?u0000", offset=-100, length=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DecodedContentOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecodedContentOf_0091 begin`);
      const actual: string = decodedContentOf('\u0000', -100, 5);
      logInfo(`decodedContentOf(content="?u0000", offset...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DecodedContentOf_0091 end`);
    });
  });
}
