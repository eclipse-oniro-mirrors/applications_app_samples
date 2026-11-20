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

/** Logic checks for new MemoInfo (63 cases). */
export default function memoInfoCtorTest(): void {
  describe('MemoInfoCtorTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0001
     * @tc.name      ExpandTitle_MemoInfoCtor_0001
     * @tc.desc      new MemoInfo("", "Hello", "", "https://example.com/media/video.mp4", "Hello") initialises 5 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_MemoInfoCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0001 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0002
     * @tc.name      ExpandTitle_MemoInfoCtor_0002
     * @tc.desc      new MemoInfo("a", "Hello", "", "https://example.com/media/video.mp4", "Hello") initialises 5 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_MemoInfoCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0002 begin`);
      const subject: MemoInfo = new MemoInfo('a', 'Hello', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("a", "Hello", "", "https://e...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", "Hello", "", "https://e...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("a", "Hello", "", "https://e...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("a", "Hello", "", "https://e...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("a", "Hello", "", "https://e...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0003
     * @tc.name      ExpandTitle_MemoInfoCtor_0003
     * @tc.desc      new MemoInfo("abc", "Hello", "", "https://example.com/media/video.mp4", "Hello") initialises 5 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0003 begin`);
      const subject: MemoInfo = new MemoInfo('abc', 'Hello', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("abc", "Hello", "", "https:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('abc');
      logInfo(`new MemoInfo("abc", "Hello", "", "https:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("abc", "Hello", "", "https:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("abc", "Hello", "", "https:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("abc", "Hello", "", "https:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0004
     * @tc.name      ExpandTitle_MemoInfoCtor_0004
     * @tc.desc      new MemoInfo("Hello World", "Hello", "", "https://example.com/media/video.mp4", "Hello") initial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0004 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', 'Hello', '', 'https://example.com/media/video.mp4',
        'Hello');
      logInfo(`new MemoInfo("Hello World", "Hello", "", ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "Hello", "", ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("Hello World", "Hello", "", ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("Hello World", "Hello", "", ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("Hello World", "Hello", "", ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0005
     * @tc.name      ExpandTitle_MemoInfoCtor_0005
     * @tc.desc      new MemoInfo(" ", "Hello", "", "https://example.com/media/video.mp4", "Hello") initialises 5 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0005 begin`);
      const subject: MemoInfo = new MemoInfo(' ', 'Hello', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo(" ", "Hello", "", "https://e...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "Hello", "", "https://e...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo(" ", "Hello", "", "https://e...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo(" ", "Hello", "", "https://e...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo(" ", "Hello", "", "https://e...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0006
     * @tc.name      ExpandTitle_MemoInfoCtor_0006
     * @tc.desc      new MemoInfo("123", "Hello", "", "https://example.com/media/video.mp4", "Hello") initialises 5 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0006 begin`);
      const subject: MemoInfo = new MemoInfo('123', 'Hello', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("123", "Hello", "", "https:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", "Hello", "", "https:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("123", "Hello", "", "https:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("123", "Hello", "", "https:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("123", "Hello", "", "https:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0007
     * @tc.name      ExpandTitle_MemoInfoCtor_0007
     * @tc.desc      new MemoInfo(" a ", "Hello", "", "https://example.com/media/video.mp4", "Hello") initialises 5 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0007 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', 'Hello', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo(" a ", "Hello", "", "https:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "Hello", "", "https:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo(" a ", "Hello", "", "https:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo(" a ", "Hello", "", "https:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo(" a ", "Hello", "", "https:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0008
     * @tc.name      ExpandTitle_MemoInfoCtor_0008
     * @tc.desc      new MemoInfo("", "hello world", "", "https://example.com/media/video.mp4", "Hello") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0008 begin`);
      const subject: MemoInfo = new MemoInfo('', 'hello world', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "hello world", "", "http...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "hello world", "", "http...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("", "hello world", "", "http...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "hello world", "", "http...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "hello world", "", "http...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0009
     * @tc.name      ExpandTitle_MemoInfoCtor_0009
     * @tc.desc      new MemoInfo("", "", "", "https://example.com/media/video.mp4", "Hello") initialises 5 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0009 begin`);
      const subject: MemoInfo = new MemoInfo('', '', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "", "", "https://example...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "", "", "https://example...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('');
      logInfo(`new MemoInfo("", "", "", "https://example...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "", "", "https://example...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "", "", "https://example...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0010
     * @tc.name      ExpandTitle_MemoInfoCtor_0010
     * @tc.desc      new MemoInfo("", " ", "", "https://example.com/media/video.mp4", "Hello") initialises 5 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0010 begin`);
      const subject: MemoInfo = new MemoInfo('', ' ', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", " ", "", "https://exampl...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", " ", "", "https://exampl...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("", " ", "", "https://exampl...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", " ", "", "https://exampl...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", " ", "", "https://exampl...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0011
     * @tc.name      ExpandTitle_MemoInfoCtor_0011
     * @tc.desc      new MemoInfo("", "A", "", "https://example.com/media/video.mp4", "Hello") initialises 5 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0011 begin`);
      const subject: MemoInfo = new MemoInfo('', 'A', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "A", "", "https://exampl...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "A", "", "https://exampl...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo("", "A", "", "https://exampl...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "A", "", "https://exampl...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "A", "", "https://exampl...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0012
     * @tc.name      ExpandTitle_MemoInfoCtor_0012
     * @tc.desc      new MemoInfo("", "Sample Title 123", "", "https://example.com/media/video.mp4", "Hello") initial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0012 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Sample Title 123', '', 'https://example.com/media/video.mp4',
        'Hello');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0013
     * @tc.name      ExpandTitle_MemoInfoCtor_0013
     * @tc.desc      new MemoInfo("", "??", "", "https://example.com/media/video.mp4", "Hello") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0013 begin`);
      const subject: MemoInfo = new MemoInfo('', '\u4e2d\u6587', '', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "??", "", "https://examp...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "??", "", "https://examp...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo("", "??", "", "https://examp...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "??", "", "https://examp...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "??", "", "https://examp...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0014
     * @tc.name      ExpandTitle_MemoInfoCtor_0014
     * @tc.desc      new MemoInfo("", "Hello", "a", "https://example.com/media/video.mp4", "Hello") initialises 5 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0014 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', 'a', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "a", "https://e...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "a", "https://e...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "a", "https://e...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo("", "Hello", "a", "https://e...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "a", "https://e...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0015
     * @tc.name      ExpandTitle_MemoInfoCtor_0015
     * @tc.desc      new MemoInfo("", "Hello", "abc", "https://example.com/media/video.mp4", "Hello") initialises 5 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0015 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', 'abc', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "abc", "https:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "abc", "https:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "abc", "https:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("", "Hello", "abc", "https:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "abc", "https:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0016
     * @tc.name      ExpandTitle_MemoInfoCtor_0016
     * @tc.desc      new MemoInfo("", "Hello", "Hello World", "https://example.com/media/video.mp4", "Hello") initial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0016 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', 'Hello World', 'https://example.com/media/video.mp4',
        'Hello');
      logInfo(`new MemoInfo("", "Hello", "Hello World", ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "Hello World", ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "Hello World", ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("", "Hello", "Hello World", ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "Hello World", ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0017
     * @tc.name      ExpandTitle_MemoInfoCtor_0017
     * @tc.desc      new MemoInfo("", "Hello", " ", "https://example.com/media/video.mp4", "Hello") initialises 5 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0017 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', ' ', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "Hello", " ", "https://e...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", " ", "https://e...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", " ", "https://e...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' ');
      logInfo(`new MemoInfo("", "Hello", " ", "https://e...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", " ", "https://e...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0018
     * @tc.name      ExpandTitle_MemoInfoCtor_0018
     * @tc.desc      new MemoInfo("", "Hello", "123", "https://example.com/media/video.mp4", "Hello") initialises 5 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0018 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '123', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "123", "https:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "123", "https:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "123", "https:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("", "Hello", "123", "https:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "123", "https:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0019
     * @tc.name      ExpandTitle_MemoInfoCtor_0019
     * @tc.desc      new MemoInfo("", "Hello", " a ", "https://example.com/media/video.mp4", "Hello") initialises 5 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0019 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', ' a ', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo("", "Hello", " a ", "https:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", " a ", "https:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", " a ", "https:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' a ');
      logInfo(`new MemoInfo("", "Hello", " a ", "https:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", " a ", "https:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0020
     * @tc.name      ExpandTitle_MemoInfoCtor_0020
     * @tc.desc      new MemoInfo("", "Hello", "", "http://example.com/a.mp3", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0020 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'http://example.com/a.mp3', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "", "http://exa...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "http://exa...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "http://exa...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "http://exa...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("", "Hello", "", "http://exa...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0021
     * @tc.name      ExpandTitle_MemoInfoCtor_0021
     * @tc.desc      new MemoInfo("", "Hello", "", "file://media/Photo/1/IMG_1.jpg", "Hello") initialises 5 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0021 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'file://media/Photo/1/IMG_1.jpg', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "", "file://med...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "file://med...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "file://med...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "file://med...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo("", "Hello", "", "file://med...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0022
     * @tc.name      ExpandTitle_MemoInfoCtor_0022
     * @tc.desc      new MemoInfo("", "Hello", "", "datashare:///media/image/1", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0022 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'datashare:///media/image/1', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "", "datashare:...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "datashare:...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "datashare:...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "datashare:...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo("", "Hello", "", "datashare:...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0023
     * @tc.name      ExpandTitle_MemoInfoCtor_0023
     * @tc.desc      new MemoInfo("", "Hello", "", "", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0023 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', '', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "", "", "Hello"): subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "", "Hello"): subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "", "Hello"): subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "", "Hello"): subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "", "Hello"): subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0024
     * @tc.name      ExpandTitle_MemoInfoCtor_0024
     * @tc.desc      new MemoInfo("", "Hello", "", "not a url", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0024 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'not a url', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "", "not a url"...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "not a url"...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "not a url"...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "not a url"...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo("", "Hello", "", "not a url"...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0025
     * @tc.name      ExpandTitle_MemoInfoCtor_0025
     * @tc.desc      new MemoInfo("", "Hello", "", "a", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0025 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'a', 'Hello');
      logInfo(`new MemoInfo("", "Hello", "", "a", "Hello"): subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "a", "Hello"): subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "a", "Hello"): subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "a", "Hello"): subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo("", "Hello", "", "a", "Hello"): subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0026
     * @tc.name      ExpandTitle_MemoInfoCtor_0026
     * @tc.desc      new MemoInfo("", "Hello", "", "https://example.com/media/video.mp4", "hello world") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0026 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'https://example.com/media/video.mp4', 'hello world');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0027
     * @tc.name      ExpandTitle_MemoInfoCtor_0027
     * @tc.desc      new MemoInfo("", "Hello", "", "https://example.com/media/video.mp4", "") initialises 5 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0027 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'https://example.com/media/video.mp4', '');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('');
      logInfo(`${BUNDLE}MemoInfoCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0028
     * @tc.name      ExpandTitle_MemoInfoCtor_0028
     * @tc.desc      new MemoInfo("", "Hello", "", "https://example.com/media/video.mp4", " ") initialises 5 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0028 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'https://example.com/media/video.mp4', ' ');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual(' ');
      logInfo(`${BUNDLE}MemoInfoCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0029
     * @tc.name      ExpandTitle_MemoInfoCtor_0029
     * @tc.desc      new MemoInfo("", "Hello", "", "https://example.com/media/video.mp4", "A") initialises 5 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0029 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'https://example.com/media/video.mp4', 'A');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0030
     * @tc.name      ExpandTitle_MemoInfoCtor_0030
     * @tc.desc      new MemoInfo("", "Hello", "", "https://example.com/media/video.mp4", "Sample Title 123") initial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0030 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'https://example.com/media/video.mp4',
        'Sample Title 123');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0031
     * @tc.name      ExpandTitle_MemoInfoCtor_0031
     * @tc.desc      new MemoInfo("", "Hello", "", "https://example.com/media/video.mp4", "??") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0031 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', '', 'https://example.com/media/video.mp4', '\u4e2d\u6587');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", "Hello", "", "https://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}MemoInfoCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0032
     * @tc.name      ExpandTitle_MemoInfoCtor_0032
     * @tc.desc      new MemoInfo(" ", "", "abc", "a", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0032 begin`);
      const subject: MemoInfo = new MemoInfo(' ', '', 'abc', 'a', 'A');
      logInfo(`new MemoInfo(" ", "", "abc", "a", "A"): subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "", "abc", "a", "A"): subject.title=${subject.title}`);
      expect(subject.title).assertEqual('');
      logInfo(`new MemoInfo(" ", "", "abc", "a", "A"): subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo(" ", "", "abc", "a", "A"): subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo(" ", "", "abc", "a", "A"): subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0033
     * @tc.name      ExpandTitle_MemoInfoCtor_0033
     * @tc.desc      new MemoInfo("a", "??", "a", "", "hello world") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0033 begin`);
      const subject: MemoInfo = new MemoInfo('a', '\u4e2d\u6587', 'a', '', 'hello world');
      logInfo(`new MemoInfo("a", "??", "a", "", "hello w...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", "??", "a", "", "hello w...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo("a", "??", "a", "", "hello w...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo("a", "??", "a", "", "hello w...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("a", "??", "a", "", "hello w...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0034
     * @tc.name      ExpandTitle_MemoInfoCtor_0034
     * @tc.desc      new MemoInfo(" a ", "Hello", "a", "http://example.com/a.mp3", " ") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0034 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', 'Hello', 'a', 'http://example.com/a.mp3', ' ');
      logInfo(`new MemoInfo(" a ", "Hello", "a", "http:/...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "Hello", "a", "http:/...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo(" a ", "Hello", "a", "http:/...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo(" a ", "Hello", "a", "http:/...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo(" a ", "Hello", "a", "http:/...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual(' ');
      logInfo(`${BUNDLE}MemoInfoCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0035
     * @tc.name      ExpandTitle_MemoInfoCtor_0035
     * @tc.desc      new MemoInfo(" ", "", " ", "https://example.com/media/video.mp4", "Hello") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0035 begin`);
      const subject: MemoInfo = new MemoInfo(' ', '', ' ', 'https://example.com/media/video.mp4', 'Hello');
      logInfo(`new MemoInfo(" ", "", " ", "https://examp...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "", " ", "https://examp...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('');
      logInfo(`new MemoInfo(" ", "", " ", "https://examp...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "", " ", "https://examp...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo(" ", "", " ", "https://examp...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0036
     * @tc.name      ExpandTitle_MemoInfoCtor_0036
     * @tc.desc      new MemoInfo("Hello World", "hello world", " a ", "not a url", " ") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0036 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', 'hello world', ' a ', 'not a url', ' ');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' a ');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual(' ');
      logInfo(`${BUNDLE}MemoInfoCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0037
     * @tc.name      ExpandTitle_MemoInfoCtor_0037
     * @tc.desc      new MemoInfo(" a ", " ", "a", "https://example.com/media/video.mp4", "Sample Title 123") initial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0037 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', ' ', 'a', 'https://example.com/media/video.mp4',
        'Sample Title 123');
      logInfo(`new MemoInfo(" a ", " ", "a", "https://ex...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", " ", "a", "https://ex...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo(" a ", " ", "a", "https://ex...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo(" a ", " ", "a", "https://ex...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo(" a ", " ", "a", "https://ex...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0038
     * @tc.name      ExpandTitle_MemoInfoCtor_0038
     * @tc.desc      new MemoInfo(" a ", "hello world", "abc", "http://example.com/a.mp3", "A") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0038 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', 'hello world', 'abc', 'http://example.com/a.mp3', 'A');
      logInfo(`new MemoInfo(" a ", "hello world", "abc",...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "hello world", "abc",...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo(" a ", "hello world", "abc",...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo(" a ", "hello world", "abc",...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo(" a ", "hello world", "abc",...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0039
     * @tc.name      ExpandTitle_MemoInfoCtor_0039
     * @tc.desc      new MemoInfo("a", "A", "Hello World", "", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0039 begin`);
      const subject: MemoInfo = new MemoInfo('a', 'A', 'Hello World', '', 'A');
      logInfo(`new MemoInfo("a", "A", "Hello World", "",...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", "A", "Hello World", "",...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo("a", "A", "Hello World", "",...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("a", "A", "Hello World", "",...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("a", "A", "Hello World", "",...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0040
     * @tc.name      ExpandTitle_MemoInfoCtor_0040
     * @tc.desc      new MemoInfo(" a ", "A", "123", "http://example.com/a.mp3", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0040 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', 'A', '123', 'http://example.com/a.mp3', 'A');
      logInfo(`new MemoInfo(" a ", "A", "123", "http://e...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "A", "123", "http://e...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo(" a ", "A", "123", "http://e...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo(" a ", "A", "123", "http://e...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo(" a ", "A", "123", "http://e...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0041
     * @tc.name      ExpandTitle_MemoInfoCtor_0041
     * @tc.desc      new MemoInfo("", "", "abc", "", "Sample Title 123") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0041 begin`);
      const subject: MemoInfo = new MemoInfo('', '', 'abc', '', 'Sample Title 123');
      logInfo(`new MemoInfo("", "", "abc", "", "Sample T...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "", "abc", "", "Sample T...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('');
      logInfo(`new MemoInfo("", "", "abc", "", "Sample T...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("", "", "abc", "", "Sample T...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("", "", "abc", "", "Sample T...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0042
     * @tc.name      ExpandTitle_MemoInfoCtor_0042
     * @tc.desc      new MemoInfo("", "Sample Title 123", "abc", "a", "") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0042 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Sample Title 123', 'abc', 'a', '');
      logInfo(`new MemoInfo("", "Sample Title 123", "abc...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", "abc...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo("", "Sample Title 123", "abc...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("", "Sample Title 123", "abc...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo("", "Sample Title 123", "abc...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('');
      logInfo(`${BUNDLE}MemoInfoCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0043
     * @tc.name      ExpandTitle_MemoInfoCtor_0043
     * @tc.desc      new MemoInfo(" ", "Sample Title 123", "", "datashare:///media/image/1", "Sample Title 123") init...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0043 begin`);
      const subject: MemoInfo = new MemoInfo(' ', 'Sample Title 123', '', 'datashare:///media/image/1',
        'Sample Title 123');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "",...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "",...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "",...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "",...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo(" ", "Sample Title 123", "",...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0044
     * @tc.name      ExpandTitle_MemoInfoCtor_0044
     * @tc.desc      new MemoInfo("abc", "hello world", "Hello World", "not a url", "hello world") initialises 5 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0044 begin`);
      const subject: MemoInfo = new MemoInfo('abc', 'hello world', 'Hello World', 'not a url', 'hello world');
      logInfo(`new MemoInfo("abc", "hello world", "Hello...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('abc');
      logInfo(`new MemoInfo("abc", "hello world", "Hello...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("abc", "hello world", "Hello...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("abc", "hello world", "Hello...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo("abc", "hello world", "Hello...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0045
     * @tc.name      ExpandTitle_MemoInfoCtor_0045
     * @tc.desc      new MemoInfo("", " ", "123", "https://example.com/media/video.mp4", "hello world") initialises 5...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0045 begin`);
      const subject: MemoInfo = new MemoInfo('', ' ', '123', 'https://example.com/media/video.mp4', 'hello world');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("", " ", "123", "https://exa...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0046
     * @tc.name      ExpandTitle_MemoInfoCtor_0046
     * @tc.desc      new MemoInfo(" a ", "??", " ", "not a url", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0046 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', '\u4e2d\u6587', ' ', 'not a url', 'Hello');
      logInfo(`new MemoInfo(" a ", "??", " ", "not a url...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "??", " ", "not a url...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo(" a ", "??", " ", "not a url...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' ');
      logInfo(`new MemoInfo(" a ", "??", " ", "not a url...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo(" a ", "??", " ", "not a url...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0047
     * @tc.name      ExpandTitle_MemoInfoCtor_0047
     * @tc.desc      new MemoInfo(" a ", "??", "123", "", "") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0047 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', '\u4e2d\u6587', '123', '', '');
      logInfo(`new MemoInfo(" a ", "??", "123", "", ""): subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "??", "123", "", ""): subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo(" a ", "??", "123", "", ""): subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo(" a ", "??", "123", "", ""): subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo(" a ", "??", "123", "", ""): subject.content=${subject.content}`);
      expect(subject.content).assertEqual('');
      logInfo(`${BUNDLE}MemoInfoCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0048
     * @tc.name      ExpandTitle_MemoInfoCtor_0048
     * @tc.desc      new MemoInfo("abc", "", "123", "file://media/Photo/1/IMG_1.jpg", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0048 begin`);
      const subject: MemoInfo = new MemoInfo('abc', '', '123', 'file://media/Photo/1/IMG_1.jpg', 'A');
      logInfo(`new MemoInfo("abc", "", "123", "file://me...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('abc');
      logInfo(`new MemoInfo("abc", "", "123", "file://me...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('');
      logInfo(`new MemoInfo("abc", "", "123", "file://me...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("abc", "", "123", "file://me...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo("abc", "", "123", "file://me...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0049
     * @tc.name      ExpandTitle_MemoInfoCtor_0049
     * @tc.desc      new MemoInfo("Hello World", "Hello", " a ", "file://media/Photo/1/IMG_1.jpg", "Sample Title 123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0049 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', 'Hello', ' a ', 'file://media/Photo/1/IMG_1.jpg',
        'Sample Title 123');
      logInfo(`new MemoInfo("Hello World", "Hello", " a ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "Hello", " a ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("Hello World", "Hello", " a ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' a ');
      logInfo(`new MemoInfo("Hello World", "Hello", " a ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo("Hello World", "Hello", " a ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0050
     * @tc.name      ExpandTitle_MemoInfoCtor_0050
     * @tc.desc      new MemoInfo("", "Sample Title 123", "", "datashare:///media/image/1", "hello world") initialise...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0050 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Sample Title 123', '', 'datashare:///media/image/1', 'hello world');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('datashare:///media/image/1');
      logInfo(`new MemoInfo("", "Sample Title 123", "", ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0051
     * @tc.name      ExpandTitle_MemoInfoCtor_0051
     * @tc.desc      new MemoInfo("123", "Hello", " a ", "http://example.com/a.mp3", "Sample Title 123") initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0051 begin`);
      const subject: MemoInfo = new MemoInfo('123', 'Hello', ' a ', 'http://example.com/a.mp3', 'Sample Title 123');
      logInfo(`new MemoInfo("123", "Hello", " a ", "http...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", "Hello", " a ", "http...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("123", "Hello", " a ", "http...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' a ');
      logInfo(`new MemoInfo("123", "Hello", " a ", "http...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("123", "Hello", " a ", "http...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0052
     * @tc.name      ExpandTitle_MemoInfoCtor_0052
     * @tc.desc      new MemoInfo("Hello World", "hello world", "123", "a", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0052 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', 'hello world', '123', 'a', 'A');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('123');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0053
     * @tc.name      ExpandTitle_MemoInfoCtor_0053
     * @tc.desc      new MemoInfo("", "Sample Title 123", " ", "a", "A") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0053 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Sample Title 123', ' ', 'a', 'A');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Sample Title 123');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' ');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo("", "Sample Title 123", " ",...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0054
     * @tc.name      ExpandTitle_MemoInfoCtor_0054
     * @tc.desc      new MemoInfo("", "Hello", " a ", "", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0054 begin`);
      const subject: MemoInfo = new MemoInfo('', 'Hello', ' a ', '', 'Hello');
      logInfo(`new MemoInfo("", "Hello", " a ", "", "Hel...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", " a ", "", "Hel...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('Hello');
      logInfo(`new MemoInfo("", "Hello", " a ", "", "Hel...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' a ');
      logInfo(`new MemoInfo("", "Hello", " a ", "", "Hel...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("", "Hello", " a ", "", "Hel...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0055
     * @tc.name      ExpandTitle_MemoInfoCtor_0055
     * @tc.desc      new MemoInfo("a", " ", "Hello World", "", " ") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0055 begin`);
      const subject: MemoInfo = new MemoInfo('a', ' ', 'Hello World', '', ' ');
      logInfo(`new MemoInfo("a", " ", "Hello World", "",...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", " ", "Hello World", "",...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("a", " ", "Hello World", "",...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("a", " ", "Hello World", "",...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('');
      logInfo(`new MemoInfo("a", " ", "Hello World", "",...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual(' ');
      logInfo(`${BUNDLE}MemoInfoCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0056
     * @tc.name      ExpandTitle_MemoInfoCtor_0056
     * @tc.desc      new MemoInfo("123", "??", "abc", "http://example.com/a.mp3", "??") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0056 begin`);
      const subject: MemoInfo = new MemoInfo('123', '\u4e2d\u6587', 'abc', 'http://example.com/a.mp3', '\u4e2d\u6587');
      logInfo(`new MemoInfo("123", "??", "abc", "http://...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('123');
      logInfo(`new MemoInfo("123", "??", "abc", "http://...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo("123", "??", "abc", "http://...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo("123", "??", "abc", "http://...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("123", "??", "abc", "http://...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}MemoInfoCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0057
     * @tc.name      ExpandTitle_MemoInfoCtor_0057
     * @tc.desc      new MemoInfo("Hello World", "??", " a ", "a", "Hello") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0057 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', '\u4e2d\u6587', ' a ', 'a', 'Hello');
      logInfo(`new MemoInfo("Hello World", "??", " a ", ...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "??", " a ", ...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo("Hello World", "??", " a ", ...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' a ');
      logInfo(`new MemoInfo("Hello World", "??", " a ", ...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo("Hello World", "??", " a ", ...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Hello');
      logInfo(`${BUNDLE}MemoInfoCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0058
     * @tc.name      ExpandTitle_MemoInfoCtor_0058
     * @tc.desc      new MemoInfo("a", "A", " a ", "http://example.com/a.mp3", "hello world") initialises 5 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0058 begin`);
      const subject: MemoInfo = new MemoInfo('a', 'A', ' a ', 'http://example.com/a.mp3', 'hello world');
      logInfo(`new MemoInfo("a", "A", " a ", "http://exa...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", "A", " a ", "http://exa...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('A');
      logInfo(`new MemoInfo("a", "A", " a ", "http://exa...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' a ');
      logInfo(`new MemoInfo("a", "A", " a ", "http://exa...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('http://example.com/a.mp3');
      logInfo(`new MemoInfo("a", "A", " a ", "http://exa...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('hello world');
      logInfo(`${BUNDLE}MemoInfoCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0059
     * @tc.name      ExpandTitle_MemoInfoCtor_0059
     * @tc.desc      new MemoInfo(" ", "??", "abc", "a", "Sample Title 123") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0059 begin`);
      const subject: MemoInfo = new MemoInfo(' ', '\u4e2d\u6587', 'abc', 'a', 'Sample Title 123');
      logInfo(`new MemoInfo(" ", "??", "abc", "a", "Samp...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' ');
      logInfo(`new MemoInfo(" ", "??", "abc", "a", "Samp...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo(" ", "??", "abc", "a", "Samp...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('abc');
      logInfo(`new MemoInfo(" ", "??", "abc", "a", "Samp...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('a');
      logInfo(`new MemoInfo(" ", "??", "abc", "a", "Samp...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}MemoInfoCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0060
     * @tc.name      ExpandTitle_MemoInfoCtor_0060
     * @tc.desc      new MemoInfo("Hello World", " ", "a", "not a url", " ") initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0060 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', ' ', 'a', 'not a url', ' ');
      logInfo(`new MemoInfo("Hello World", " ", "a", "no...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", " ", "a", "no...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("Hello World", " ", "a", "no...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('a');
      logInfo(`new MemoInfo("Hello World", " ", "a", "no...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('not a url');
      logInfo(`new MemoInfo("Hello World", " ", "a", "no...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual(' ');
      logInfo(`${BUNDLE}MemoInfoCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0061
     * @tc.name      ExpandTitle_MemoInfoCtor_0061
     * @tc.desc      new MemoInfo("Hello World", "hello world", "Hello World", "https://example.com/media/video.mp4",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0061 begin`);
      const subject: MemoInfo = new MemoInfo('Hello World', 'hello world', 'Hello World',
        'https://example.com/media/video.mp4', '\u4e2d\u6587');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('hello world');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo("Hello World", "hello world"...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}MemoInfoCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0062
     * @tc.name      ExpandTitle_MemoInfoCtor_0062
     * @tc.desc      new MemoInfo(" a ", "??", " ", "https://example.com/media/video.mp4", "A") initialises 5 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0062 begin`);
      const subject: MemoInfo = new MemoInfo(' a ', '\u4e2d\u6587', ' ', 'https://example.com/media/video.mp4', 'A');
      logInfo(`new MemoInfo(" a ", "??", " ", "https://e...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual(' a ');
      logInfo(`new MemoInfo(" a ", "??", " ", "https://e...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual('\u4e2d\u6587');
      logInfo(`new MemoInfo(" a ", "??", " ", "https://e...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual(' ');
      logInfo(`new MemoInfo(" a ", "??", " ", "https://e...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new MemoInfo(" a ", "??", " ", "https://e...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('A');
      logInfo(`${BUNDLE}MemoInfoCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_INFO_CTOR_0063
     * @tc.name      ExpandTitle_MemoInfoCtor_0063
     * @tc.desc      new MemoInfo("a", " ", "Hello World", "file://media/Photo/1/IMG_1.jpg", "") initialises 5 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoInfoCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoInfoCtor_0063 begin`);
      const subject: MemoInfo = new MemoInfo('a', ' ', 'Hello World', 'file://media/Photo/1/IMG_1.jpg', '');
      logInfo(`new MemoInfo("a", " ", "Hello World", "fi...: subject.memoId=${subject.memoId}`);
      expect(subject.memoId).assertEqual('a');
      logInfo(`new MemoInfo("a", " ", "Hello World", "fi...: subject.title=${subject.title}`);
      expect(subject.title).assertEqual(' ');
      logInfo(`new MemoInfo("a", " ", "Hello World", "fi...: subject.time=${subject.time}`);
      expect(subject.time).assertEqual('Hello World');
      logInfo(`new MemoInfo("a", " ", "Hello World", "fi...: subject.imageSrc=${subject.imageSrc}`);
      expect(subject.imageSrc).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new MemoInfo("a", " ", "Hello World", "fi...: subject.content=${subject.content}`);
      expect(subject.content).assertEqual('');
      logInfo(`${BUNDLE}MemoInfoCtor_0063 end`);
    });
  });
}
