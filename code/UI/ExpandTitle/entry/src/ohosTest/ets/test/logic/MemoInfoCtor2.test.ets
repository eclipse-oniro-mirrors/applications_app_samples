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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MemoInfo } from '../../../../main/ets/pages/MemoInfo';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new MemoInfo (47 cases). */
export default function memoInfoCtor2Test(): void {
  describe('MemoInfoCtor2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0064
     * @tc.name      ExpandTitle_MemoInfoCtor_0064
     * @tc.desc      new MemoInfo(" ", " ", "a", "datashare:///media/image/1", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0064 begin`);
      const subject: MemoInfo = new MemoInfo(' ', ' ', 'a', 'datashare:///media/image/1', 'A');
      logInfo(`new MemoInfo(" ", " ", "a", "datashare://...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", " ", "a", "datashare://...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo(" ", " ", "a", "datashare://...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo(" ", " ", "a", "datashare://...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo(" ", " ", "a", "datashare://...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0065
     * @tc.name      ExpandTitle_MemoInfoCtor_0065
     * @tc.desc      new MemoInfo(" ", "Sample Title 123", "123", "http://example.com/a.mp3", "A") initialises 5 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0065 begin`);
      const subject: MemoInfo = new MemoInfo(' ', 'Sample Title 123', '123', 'http://example.com/a.mp3', 'A');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "12...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "12...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "12...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "12...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "12...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0066
     * @tc.name      ExpandTitle_MemoInfoCtor_0066
     * @tc.desc      new MemoInfo(" a ", " ", "a", "file://media/Photo/1/IMG_1.jpg", "Sample Title 123") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0066 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', ' ', 'a', 'file://media/Photo/1/IMG_1.jpg', 'Sample Title 123');
      logInfo(`new MemoInfo(" a ", " ", "a", "file://med...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", " ", "a", "file://med...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo(" a ", " ", "a", "file://med...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo(" a ", " ", "a", "file://med...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo(" a ", " ", "a", "file://med...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0067
     * @tc.name      ExpandTitle_MemoInfoCtor_0067
     * @tc.desc      new MemoInfo("", " ", " a ", "datashare:///media/image/1", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0067 begin`);
      const subject: MemoInfo = new MemoInfo('', ' ', ' a ', 'datashare:///media/image/1', 'A');
      logInfo(`new MemoInfo("", " ", " a ", "datashare:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", " ", " a ", "datashare:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("", " ", " a ", "datashare:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' a ');
      logInfo(`new MemoInfo("", " ", " a ", "datashare:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo("", " ", " a ", "datashare:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0068
     * @tc.name      ExpandTitle_MemoInfoCtor_0068
     * @tc.desc      new MemoInfo("123", "??", "", "a", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0068 begin`);
      const subject: MemoInfo = new MemoInfo('123', '\u4e2d\u6587', '', 'a', 'Hello');
      logInfo(`new MemoInfo("123", "??", "", "a", "Hello"): subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", "??", "", "a", "Hello"): subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo("123", "??", "", "a", "Hello"): subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("123", "??", "", "a", "Hello"): subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo("123", "??", "", "a", "Hello"): subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0069
     * @tc.name      ExpandTitle_MemoInfoCtor_0069
     * @tc.desc      new MemoInfo("a", "hello world", "123", "", "hello world") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0069 begin`);
      const subject: MemoInfo = new MemoInfo('a', 'hello world', '123', '', 'hello world');
      logInfo(`new MemoInfo("a", "hello world", "123", "...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", "hello world", "123", "...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("a", "hello world", "123", "...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("a", "hello world", "123", "...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("a", "hello world", "123", "...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0070
     * @tc.name      ExpandTitle_MemoInfoCtor_0070
     * @tc.desc      new MemoInfo("", "A", "123", "not a url", " ") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0070 begin`);
      const subject: MemoInfo = new MemoInfo('', 'A', '123', 'not a url', ' ');
      logInfo(`new MemoInfo("", "A", "123", "not a url",...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "A", "123", "not a url",...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo("", "A", "123", "not a url",...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("", "A", "123", "not a url",...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo("", "A", "123", "not a url",...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual(' ');
      logInfo(`${BUNDLE}MemoInfoCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0071
     * @tc.name      ExpandTitle_MemoInfoCtor_0071
     * @tc.desc      new MemoInfo("123", "A", "Hello World", "not a url", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0071 begin`);
      const subject: MemoInfo = new MemoInfo('123', 'A', 'Hello World', 'not a url', 'Hello');
      logInfo(`new MemoInfo("123", "A", "Hello World", "...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", "A", "Hello World", "...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo("123", "A", "Hello World", "...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("123", "A", "Hello World", "...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo("123", "A", "Hello World", "...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0072
     * @tc.name      ExpandTitle_MemoInfoCtor_0072
     * @tc.desc      new MemoInfo(" a ", " ", "Hello World", "a", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0072 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', ' ', 'Hello World', 'a', 'A');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0073
     * @tc.name      ExpandTitle_MemoInfoCtor_0073
     * @tc.desc      new MemoInfo("", "hello world", "", "not a url", "") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0073 begin`);
      const subject: MemoInfo = new MemoInfo('', 'hello world', '', 'not a url', '');
      logInfo(`new MemoInfo("", "hello world", "", "not ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "hello world", "", "not ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("", "hello world", "", "not ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "hello world", "", "not ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo("", "hello world", "", "not ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('');
      logInfo(`${BUNDLE}MemoInfoCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0074
     * @tc.name      ExpandTitle_MemoInfoCtor_0074
     * @tc.desc      new MemoInfo("Hello World", "hello world", "a", "http://example.com/a.mp3", "A") initialises 5 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0074 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', 'hello world', 'a', 'http://example.com/a.mp3', 'A');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0075
     * @tc.name      ExpandTitle_MemoInfoCtor_0075
     * @tc.desc      new MemoInfo("123", "A", "abc", "a", "Sample Title 123") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0075 begin`);
      const subject: MemoInfo = new MemoInfo('123', 'A', 'abc', 'a', 'Sample Title 123');
      logInfo(`new MemoInfo("123", "A", "abc", "a", "Sam...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", "A", "abc", "a", "Sam...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo("123", "A", "abc", "a", "Sam...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("123", "A", "abc", "a", "Sam...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo("123", "A", "abc", "a", "Sam...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0076
     * @tc.name      ExpandTitle_MemoInfoCtor_0076
     * @tc.desc      new MemoInfo(" a ", "hello world", "", "datashare:///media/image/1", "Sample Title 123") initial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0076 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', 'hello world', '', 'datashare:///media/image/1',
        'Sample Title 123');
      logInfo(`new MemoInfo(" a ", "hello world", "", "d...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "hello world", "", "d...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo(" a ", "hello world", "", "d...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo(" a ", "hello world", "", "d...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo(" a ", "hello world", "", "d...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0077
     * @tc.name      ExpandTitle_MemoInfoCtor_0077
     * @tc.desc      new MemoInfo("123", "Sample Title 123", "abc", "file://media/Photo/1/IMG_1.jpg", "") initialises...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0077 begin`);
      const subject: MemoInfo = new MemoInfo('123', 'Sample Title 123', 'abc', 'file://media/Photo/1/IMG_1.jpg', '');
      logInfo(`new MemoInfo("123", "Sample Title 123", "...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", "Sample Title 123", "...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo("123", "Sample Title 123", "...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("123", "Sample Title 123", "...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo("123", "Sample Title 123", "...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('');
      logInfo(`${BUNDLE}MemoInfoCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0078
     * @tc.name      ExpandTitle_MemoInfoCtor_0078
     * @tc.desc      new MemoInfo("a", " ", "", "http://example.com/a.mp3", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0078 begin`);
      const subject: MemoInfo = new MemoInfo('a', ' ', '', 'http://example.com/a.mp3', 'A');
      logInfo(`new MemoInfo("a", " ", "", "http://exampl...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", " ", "", "http://exampl...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("a", " ", "", "http://exampl...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("a", " ", "", "http://exampl...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("a", " ", "", "http://exampl...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0079
     * @tc.name      ExpandTitle_MemoInfoCtor_0079
     * @tc.desc      new MemoInfo("123", " ", "abc", "datashare:///media/image/1", "Sample Title 123") initialises 5 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0079 begin`);
      const subject: MemoInfo = new MemoInfo('123', ' ', 'abc', 'datashare:///media/image/1', 'Sample Title 123');
      logInfo(`new MemoInfo("123", " ", "abc", "datashar...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", " ", "abc", "datashar...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("123", " ", "abc", "datashar...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("123", " ", "abc", "datashar...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo("123", " ", "abc", "datashar...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0080
     * @tc.name      ExpandTitle_MemoInfoCtor_0080
     * @tc.desc      new MemoInfo("", "Sample Title 123", " ", "https://example.com/media/video.mp4", "Hello") initia...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0080 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Sample Title 123', ' ', 'https://example.com/media/video.mp4',
        'Hello');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' ');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0081
     * @tc.name      ExpandTitle_MemoInfoCtor_0081
     * @tc.desc      new MemoInfo(" ", " ", " a ", "https://example.com/media/video.mp4", "??") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0081 begin`);
      const subject: MemoInfo = new MemoInfo(' ', ' ', ' a ', 'https://example.com/media/video.mp4', '\u4e2d\u6587');
      logInfo(`new MemoInfo(" ", " ", " a ", "https://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", " ", " a ", "https://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo(" ", " ", " a ", "https://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' a ');
      logInfo(`new MemoInfo(" ", " ", " a ", "https://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo(" ", " ", " a ", "https://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}MemoInfoCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0082
     * @tc.name      ExpandTitle_MemoInfoCtor_0082
     * @tc.desc      new MemoInfo("abc", " ", "123", "datashare:///media/image/1", "hello world") initialises 5 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0082 begin`);
      const subject: MemoInfo = new MemoInfo('abc', ' ', '123', 'datashare:///media/image/1', 'hello world');
      logInfo(`new MemoInfo("abc", " ", "123", "datashar...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('abc');
      logInfo(`new MemoInfo("abc", " ", "123", "datashar...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("abc", " ", "123", "datashar...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("abc", " ", "123", "datashar...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo("abc", " ", "123", "datashar...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0083
     * @tc.name      ExpandTitle_MemoInfoCtor_0083
     * @tc.desc      new MemoInfo("a", " ", "", "https://example.com/media/video.mp4", "Hello") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0083 begin`);
      const subject: MemoInfo = new MemoInfo('a', ' ', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("a", " ", "", "https://examp...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", " ", "", "https://examp...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("a", " ", "", "https://examp...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("a", " ", "", "https://examp...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("a", " ", "", "https://examp...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0084
     * @tc.name      ExpandTitle_MemoInfoCtor_0084
     * @tc.desc      new MemoInfo("123", "A", "abc", "http://example.com/a.mp3", "??") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0084 begin`);
      const subject: MemoInfo = new MemoInfo('123', 'A', 'abc', 'http://example.com/a.mp3', '\u4e2d\u6587');
      logInfo(`new MemoInfo("123", "A", "abc", "http://e...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", "A", "abc", "http://e...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo("123", "A", "abc", "http://e...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("123", "A", "abc", "http://e...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("123", "A", "abc", "http://e...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}MemoInfoCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0085
     * @tc.name      ExpandTitle_MemoInfoCtor_0085
     * @tc.desc      new MemoInfo("123", "Hello", "Hello World", "file://media/Photo/1/IMG_1.jpg", "hello world") ini...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0085 begin`);
      const subject: MemoInfo = new MemoInfo('123', 'Hello', 'Hello World', 'file://media/Photo/1/IMG_1.jpg',
        'hello world');
      logInfo(`new MemoInfo("123", "Hello", "Hello World...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", "Hello", "Hello World...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("123", "Hello", "Hello World...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("123", "Hello", "Hello World...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo("123", "Hello", "Hello World...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0086
     * @tc.name      ExpandTitle_MemoInfoCtor_0086
     * @tc.desc      new MemoInfo("Hello World", " ", "123", "", "hello world") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0086 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', ' ', '123', '', 'hello world');
      logInfo(`new MemoInfo("Hello World", " ", "123", "...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", " ", "123", "...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("Hello World", " ", "123", "...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("Hello World", " ", "123", "...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("Hello World", " ", "123", "...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0087
     * @tc.name      ExpandTitle_MemoInfoCtor_0087
     * @tc.desc      new MemoInfo(" ", "A", "Hello World", "http://example.com/a.mp3", "Hello") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0087 begin`);
      const subject: MemoInfo = new MemoInfo(' ', 'A', 'Hello World', 'http://example.com/a.mp3', 'Hello');
      logInfo(`new MemoInfo(" ", "A", "Hello World", "ht...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "A", "Hello World", "ht...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo(" ", "A", "Hello World", "ht...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo(" ", "A", "Hello World", "ht...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo(" ", "A", "Hello World", "ht...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0088
     * @tc.name      ExpandTitle_MemoInfoCtor_0088
     * @tc.desc      new MemoInfo("", " ", "123", "https://example.com/media/video.mp4", "") initialises 5 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0088 begin`);
      const subject: MemoInfo = new MemoInfo('', ' ', '123', 'https://example.com/media/video.mp4', '');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('');
      logInfo(`${BUNDLE}MemoInfoCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0089
     * @tc.name      ExpandTitle_MemoInfoCtor_0089
     * @tc.desc      new MemoInfo(" ", "Hello", "", "a", "??") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0089 begin`);
      const subject: MemoInfo = new MemoInfo(' ', 'Hello', '', 'a', '\u4e2d\u6587');
      logInfo(`new MemoInfo(" ", "Hello", "", "a", "??"): subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "Hello", "", "a", "??"): subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo(" ", "Hello", "", "a", "??"): subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo(" ", "Hello", "", "a", "??"): subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo(" ", "Hello", "", "a", "??"): subject.content=${subject.content}`);
      expect(subject.content).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}MemoInfoCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0090
     * @tc.name      ExpandTitle_MemoInfoCtor_0090
     * @tc.desc      new MemoInfo("abc", "??", "abc", "not a url", " ") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0090 begin`);
      const subject: MemoInfo = new MemoInfo('abc', '\u4e2d\u6587', 'abc', 'not a url', ' ');
      logInfo(`new MemoInfo("abc", "??", "abc", "not a u...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('abc');
      logInfo(`new MemoInfo("abc", "??", "abc", "not a u...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo("abc", "??", "abc", "not a u...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("abc", "??", "abc", "not a u...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo("abc", "??", "abc", "not a u...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual(' ');
      logInfo(`${BUNDLE}MemoInfoCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0091
     * @tc.name      ExpandTitle_MemoInfoCtor_0091
     * @tc.desc      new MemoInfo(" ", "hello world", "", "not a url", "hello world") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0091 begin`);
      const subject: MemoInfo = new MemoInfo(' ', 'hello world', '', 'not a url', 'hello world');
      logInfo(`new MemoInfo(" ", "hello world", "", "not...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "hello world", "", "not...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo(" ", "hello world", "", "not...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo(" ", "hello world", "", "not...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo(" ", "hello world", "", "not...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0092
     * @tc.name      ExpandTitle_MemoInfoCtor_0092
     * @tc.desc      new MemoInfo(" a ", " ", "Hello World", "https://example.com/media/video.mp4", "") initialises 5...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0092 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', ' ', 'Hello World', 'https://example.com/media/video.mp4', '');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo(" a ", " ", "Hello World", "...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('');
      logInfo(`${BUNDLE}MemoInfoCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0093
     * @tc.name      ExpandTitle_MemoInfoCtor_0093
     * @tc.desc      new MemoInfo("abc", "", "a", "datashare:///media/image/1", "??") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0093 begin`);
      const subject: MemoInfo = new MemoInfo('abc', '', 'a', 'datashare:///media/image/1', '\u4e2d\u6587');
      logInfo(`new MemoInfo("abc", "", "a", "datashare:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('abc');
      logInfo(`new MemoInfo("abc", "", "a", "datashare:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('');
      logInfo(`new MemoInfo("abc", "", "a", "datashare:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo("abc", "", "a", "datashare:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo("abc", "", "a", "datashare:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}MemoInfoCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0094
     * @tc.name      ExpandTitle_MemoInfoCtor_0094
     * @tc.desc      new MemoInfo("", "hello world", " ", "http://example.com/a.mp3", "Sample Title 123") initialises...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0094 begin`);
      const subject: MemoInfo = new MemoInfo('', 'hello world', ' ', 'http://example.com/a.mp3', 'Sample Title 123');
      logInfo(`new MemoInfo("", "hello world", " ", "htt...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "hello world", " ", "htt...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("", "hello world", " ", "htt...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' ');
      logInfo(`new MemoInfo("", "hello world", " ", "htt...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("", "hello world", " ", "htt...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0095
     * @tc.name      ExpandTitle_MemoInfoCtor_0095
     * @tc.desc      new MemoInfo("a", "hello world", "abc", "datashare:///media/image/1", "A") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0095 begin`);
      const subject: MemoInfo = new MemoInfo('a', 'hello world', 'abc', 'datashare:///media/image/1', 'A');
      logInfo(`new MemoInfo("a", "hello world", "abc", "...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", "hello world", "abc", "...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("a", "hello world", "abc", "...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("a", "hello world", "abc", "...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo("a", "hello world", "abc", "...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0096
     * @tc.name      ExpandTitle_MemoInfoCtor_0096
     * @tc.desc      new MemoInfo(" ", "A", "", "file://media/Photo/1/IMG_1.jpg", "hello world") initialises 5 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0096 begin`);
      const subject: MemoInfo = new MemoInfo(' ', 'A', '', 'file://media/Photo/1/IMG_1.jpg', 'hello world');
      logInfo(`new MemoInfo(" ", "A", "", "file://media/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "A", "", "file://media/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo(" ", "A", "", "file://media/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo(" ", "A", "", "file://media/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo(" ", "A", "", "file://media/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0097
     * @tc.name      ExpandTitle_MemoInfoCtor_0097
     * @tc.desc      new MemoInfo(" ", "??", "", "https://example.com/media/video.mp4", "Hello") initialises 5 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0097 begin`);
      const subject: MemoInfo = new MemoInfo(' ', '\u4e2d\u6587', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo(" ", "??", "", "https://exam...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "??", "", "https://exam...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo(" ", "??", "", "https://exam...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo(" ", "??", "", "https://exam...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo(" ", "??", "", "https://exam...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0098
     * @tc.name      ExpandTitle_MemoInfoCtor_0098
     * @tc.desc      new MemoInfo("a", "hello world", "a", "http://example.com/a.mp3", "Hello") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0098 begin`);
      const subject: MemoInfo = new MemoInfo('a', 'hello world', 'a', 'http://example.com/a.mp3', 'Hello');
      logInfo(`new MemoInfo("a", "hello world", "a", "ht...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", "hello world", "a", "ht...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("a", "hello world", "a", "ht...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo("a", "hello world", "a", "ht...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("a", "hello world", "a", "ht...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0099
     * @tc.name      ExpandTitle_MemoInfoCtor_0099
     * @tc.desc      new MemoInfo("", "??", "123", "file://media/Photo/1/IMG_1.jpg", "") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0099 begin`);
      const subject: MemoInfo = new MemoInfo('', '\u4e2d\u6587', '123', 'file://media/Photo/1/IMG_1.jpg', '');
      logInfo(`new MemoInfo("", "??", "123", "file://med...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "??", "123", "file://med...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo("", "??", "123", "file://med...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("", "??", "123", "file://med...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo("", "??", "123", "file://med...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('');
      logInfo(`${BUNDLE}MemoInfoCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0100
     * @tc.name      ExpandTitle_MemoInfoCtor_0100
     * @tc.desc      new MemoInfo(" ", "", "Hello World", "not a url", " ") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0100 begin`);
      const subject: MemoInfo = new MemoInfo(' ', '', 'Hello World', 'not a url', ' ');
      logInfo(`new MemoInfo(" ", "", "Hello World", "not...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "", "Hello World", "not...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('');
      logInfo(`new MemoInfo(" ", "", "Hello World", "not...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo(" ", "", "Hello World", "not...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo(" ", "", "Hello World", "not...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual(' ');
      logInfo(`${BUNDLE}MemoInfoCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0101
     * @tc.name      ExpandTitle_MemoInfoCtor_0101
     * @tc.desc      new MemoInfo(" a ", "??", "a", "http://example.com/a.mp3", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0101 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', '\u4e2d\u6587', 'a', 'http://example.com/a.mp3', 'A');
      logInfo(`new MemoInfo(" a ", "??", "a", "http://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "??", "a", "http://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo(" a ", "??", "a", "http://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo(" a ", "??", "a", "http://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo(" a ", "??", "a", "http://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0102
     * @tc.name      ExpandTitle_MemoInfoCtor_0102
     * @tc.desc      new MemoInfo("a", "Hello", "", "a", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0102 begin`);
      const subject: MemoInfo = new MemoInfo('a', 'Hello', '', 'a', 'A');
      logInfo(`new MemoInfo("a", "Hello", "", "a", "A"): subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", "Hello", "", "a", "A"): subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("a", "Hello", "", "a", "A"): subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("a", "Hello", "", "a", "A"): subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo("a", "Hello", "", "a", "A"): subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0103
     * @tc.name      ExpandTitle_MemoInfoCtor_0103
     * @tc.desc      new MemoInfo("", "", "Hello World", "a", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0103 begin`);
      const subject: MemoInfo = new MemoInfo('', '', 'Hello World', 'a', 'Hello');
      logInfo(`new MemoInfo("", "", "Hello World", "a", ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "", "Hello World", "a", ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('');
      logInfo(`new MemoInfo("", "", "Hello World", "a", ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("", "", "Hello World", "a", ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo("", "", "Hello World", "a", ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0104
     * @tc.name      ExpandTitle_MemoInfoCtor_0104
     * @tc.desc      new MemoInfo("abc", "Sample Title 123", "", "file://media/Photo/1/IMG_1.jpg", "hello world") ini...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0104 begin`);
      const subject: MemoInfo = new MemoInfo('abc', 'Sample Title 123', '', 'file://media/Photo/1/IMG_1.jpg',
        'hello world');
      logInfo(`new MemoInfo("abc", "Sample Title 123", "...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('abc');
      logInfo(`new MemoInfo("abc", "Sample Title 123", "...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo("abc", "Sample Title 123", "...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("abc", "Sample Title 123", "...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo("abc", "Sample Title 123", "...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0105
     * @tc.name      ExpandTitle_MemoInfoCtor_0105
     * @tc.desc      new MemoInfo("abc", " ", "abc", "http://example.com/a.mp3", "??") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0105 begin`);
      const subject: MemoInfo = new MemoInfo('abc', ' ', 'abc', 'http://example.com/a.mp3', '\u4e2d\u6587');
      logInfo(`new MemoInfo("abc", " ", "abc", "http://e...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('abc');
      logInfo(`new MemoInfo("abc", " ", "abc", "http://e...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("abc", " ", "abc", "http://e...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("abc", " ", "abc", "http://e...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("abc", " ", "abc", "http://e...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}MemoInfoCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0106
     * @tc.name      ExpandTitle_MemoInfoCtor_0106
     * @tc.desc      new MemoInfo(" a ", "??", "123", "not a url", "??") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0106 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', '\u4e2d\u6587', '123', 'not a url', '\u4e2d\u6587');
      logInfo(`new MemoInfo(" a ", "??", "123", "not a u...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "??", "123", "not a u...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo(" a ", "??", "123", "not a u...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo(" a ", "??", "123", "not a u...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo(" a ", "??", "123", "not a u...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}MemoInfoCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0107
     * @tc.name      ExpandTitle_MemoInfoCtor_0107
     * @tc.desc      new MemoInfo("a", "Hello", "abc", "http://example.com/a.mp3", " ") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0107 begin`);
      const subject: MemoInfo = new MemoInfo('a', 'Hello', 'abc', 'http://example.com/a.mp3', ' ');
      logInfo(`new MemoInfo("a", "Hello", "abc", "http:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", "Hello", "abc", "http:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("a", "Hello", "abc", "http:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("a", "Hello", "abc", "http:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("a", "Hello", "abc", "http:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual(' ');
      logInfo(`${BUNDLE}MemoInfoCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0108
     * @tc.name      ExpandTitle_MemoInfoCtor_0108
     * @tc.desc      new MemoInfo("", "Sample Title 123", "", "", "Sample Title 123") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0108 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Sample Title 123', '', '', 'Sample Title 123');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0109
     * @tc.name      ExpandTitle_MemoInfoCtor_0109
     * @tc.desc      new MemoInfo(" a ", "", "123", "http://example.com/a.mp3", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0109 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', '', '123', 'http://example.com/a.mp3', 'A');
      logInfo(`new MemoInfo(" a ", "", "123", "http://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "", "123", "http://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('');
      logInfo(`new MemoInfo(" a ", "", "123", "http://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo(" a ", "", "123", "http://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo(" a ", "", "123", "http://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0110
     * @tc.name      ExpandTitle_MemoInfoCtor_0110
     * @tc.desc      new MemoInfo("Hello World", "??", "Hello World", "", "Sample Title 123") initialises 5 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0110 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', '\u4e2d\u6587', 'Hello World', '', 'Sample Title 123');
      logInfo(`new MemoInfo("Hello World", "??", "Hello ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "??", "Hello ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo("Hello World", "??", "Hello ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "??", "Hello ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("Hello World", "??", "Hello ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0110 end`);
    });
  });
}
