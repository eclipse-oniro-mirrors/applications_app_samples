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
import { NewsItem } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new NewsItem (59 cases). */
export default function newsItemCtorTest(): void {
  describe('NewsItemCtorTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0001
     * @tc.name      PullToRefresh_NewsItemCtor_0001
     * @tc.desc      new NewsItem("", "Hello", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsItemCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0001 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'Hello', '');
      logInfo(`new NewsItem("", "Hello", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0002
     * @tc.name      PullToRefresh_NewsItemCtor_0002
     * @tc.desc      new NewsItem("a", "Hello", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsItemCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0002 begin`);
      const subject: NewsItem = new NewsItem('a', 'Hello', 'Hello', '');
      logInfo(`new NewsItem("a", "Hello", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('a');
      logInfo(`new NewsItem("a", "Hello", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("a", "Hello", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("a", "Hello", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0003
     * @tc.name      PullToRefresh_NewsItemCtor_0003
     * @tc.desc      new NewsItem("abc", "Hello", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0003 begin`);
      const subject: NewsItem = new NewsItem('abc', 'Hello', 'Hello', '');
      logInfo(`new NewsItem("abc", "Hello", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('abc');
      logInfo(`new NewsItem("abc", "Hello", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("abc", "Hello", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("abc", "Hello", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0004
     * @tc.name      PullToRefresh_NewsItemCtor_0004
     * @tc.desc      new NewsItem("Hello World", "Hello", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0004 begin`);
      const subject: NewsItem = new NewsItem('Hello World', 'Hello', 'Hello', '');
      logInfo(`new NewsItem("Hello World", "Hello", "Hel...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('Hello World');
      logInfo(`new NewsItem("Hello World", "Hello", "Hel...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("Hello World", "Hello", "Hel...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("Hello World", "Hello", "Hel...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0005
     * @tc.name      PullToRefresh_NewsItemCtor_0005
     * @tc.desc      new NewsItem(" ", "Hello", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0005 begin`);
      const subject: NewsItem = new NewsItem(' ', 'Hello', 'Hello', '');
      logInfo(`new NewsItem(" ", "Hello", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' ');
      logInfo(`new NewsItem(" ", "Hello", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem(" ", "Hello", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem(" ", "Hello", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0006
     * @tc.name      PullToRefresh_NewsItemCtor_0006
     * @tc.desc      new NewsItem("123", "Hello", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0006 begin`);
      const subject: NewsItem = new NewsItem('123', 'Hello', 'Hello', '');
      logInfo(`new NewsItem("123", "Hello", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('123');
      logInfo(`new NewsItem("123", "Hello", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("123", "Hello", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("123", "Hello", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0007
     * @tc.name      PullToRefresh_NewsItemCtor_0007
     * @tc.desc      new NewsItem(" a ", "Hello", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0007 begin`);
      const subject: NewsItem = new NewsItem(' a ', 'Hello', 'Hello', '');
      logInfo(`new NewsItem(" a ", "Hello", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' a ');
      logInfo(`new NewsItem(" a ", "Hello", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem(" a ", "Hello", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem(" a ", "Hello", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0008
     * @tc.name      PullToRefresh_NewsItemCtor_0008
     * @tc.desc      new NewsItem("", "hello world", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0008 begin`);
      const subject: NewsItem = new NewsItem('', 'hello world', 'Hello', '');
      logInfo(`new NewsItem("", "hello world", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "hello world", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('hello world');
      logInfo(`new NewsItem("", "hello world", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "hello world", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0009
     * @tc.name      PullToRefresh_NewsItemCtor_0009
     * @tc.desc      new NewsItem("", "", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0009 begin`);
      const subject: NewsItem = new NewsItem('', '', 'Hello', '');
      logInfo(`new NewsItem("", "", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('');
      logInfo(`new NewsItem("", "", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0010
     * @tc.name      PullToRefresh_NewsItemCtor_0010
     * @tc.desc      new NewsItem("", " ", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0010 begin`);
      const subject: NewsItem = new NewsItem('', ' ', 'Hello', '');
      logInfo(`new NewsItem("", " ", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", " ", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual(' ');
      logInfo(`new NewsItem("", " ", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", " ", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0011
     * @tc.name      PullToRefresh_NewsItemCtor_0011
     * @tc.desc      new NewsItem("", "A", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0011 begin`);
      const subject: NewsItem = new NewsItem('', 'A', 'Hello', '');
      logInfo(`new NewsItem("", "A", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "A", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('A');
      logInfo(`new NewsItem("", "A", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "A", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0012
     * @tc.name      PullToRefresh_NewsItemCtor_0012
     * @tc.desc      new NewsItem("", "Sample Title 123", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0012 begin`);
      const subject: NewsItem = new NewsItem('', 'Sample Title 123', 'Hello', '');
      logInfo(`new NewsItem("", "Sample Title 123", "Hel...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Sample Title 123", "Hel...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Sample Title 123');
      logInfo(`new NewsItem("", "Sample Title 123", "Hel...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "Sample Title 123", "Hel...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0013
     * @tc.name      PullToRefresh_NewsItemCtor_0013
     * @tc.desc      new NewsItem("", "??", "Hello", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0013 begin`);
      const subject: NewsItem = new NewsItem('', '\u4e2d\u6587', 'Hello', '');
      logInfo(`new NewsItem("", "??", "Hello", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "??", "Hello", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem("", "??", "Hello", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "??", "Hello", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0014
     * @tc.name      PullToRefresh_NewsItemCtor_0014
     * @tc.desc      new NewsItem("", "Hello", "hello world", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0014 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'hello world', '');
      logInfo(`new NewsItem("", "Hello", "hello world", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "hello world", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "hello world", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('hello world');
      logInfo(`new NewsItem("", "Hello", "hello world", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0015
     * @tc.name      PullToRefresh_NewsItemCtor_0015
     * @tc.desc      new NewsItem("", "Hello", "", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0015 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', '', '');
      logInfo(`new NewsItem("", "Hello", "", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0016
     * @tc.name      PullToRefresh_NewsItemCtor_0016
     * @tc.desc      new NewsItem("", "Hello", " ", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0016 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', ' ', '');
      logInfo(`new NewsItem("", "Hello", " ", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", " ", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", " ", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual(' ');
      logInfo(`new NewsItem("", "Hello", " ", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0017
     * @tc.name      PullToRefresh_NewsItemCtor_0017
     * @tc.desc      new NewsItem("", "Hello", "A", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0017 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'A', '');
      logInfo(`new NewsItem("", "Hello", "A", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "A", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "A", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('A');
      logInfo(`new NewsItem("", "Hello", "A", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0018
     * @tc.name      PullToRefresh_NewsItemCtor_0018
     * @tc.desc      new NewsItem("", "Hello", "Sample Title 123", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0018 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'Sample Title 123', '');
      logInfo(`new NewsItem("", "Hello", "Sample Title 1...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "Sample Title 1...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Sample Title 1...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Sample Title 123');
      logInfo(`new NewsItem("", "Hello", "Sample Title 1...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0019
     * @tc.name      PullToRefresh_NewsItemCtor_0019
     * @tc.desc      new NewsItem("", "Hello", "??", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0019 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', '\u4e2d\u6587', '');
      logInfo(`new NewsItem("", "Hello", "??", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "??", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "??", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem("", "Hello", "??", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0020
     * @tc.name      PullToRefresh_NewsItemCtor_0020
     * @tc.desc      new NewsItem("", "Hello", "Hello", "a") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0020 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'Hello', 'a');
      logInfo(`new NewsItem("", "Hello", "Hello", "a"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "Hello", "a"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", "a"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", "a"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('a');
      logInfo(`${BUNDLE}NewsItemCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0021
     * @tc.name      PullToRefresh_NewsItemCtor_0021
     * @tc.desc      new NewsItem("", "Hello", "Hello", "abc") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0021 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'Hello', 'abc');
      logInfo(`new NewsItem("", "Hello", "Hello", "abc"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "Hello", "abc"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", "abc"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", "abc"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('abc');
      logInfo(`${BUNDLE}NewsItemCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0022
     * @tc.name      PullToRefresh_NewsItemCtor_0022
     * @tc.desc      new NewsItem("", "Hello", "Hello", "Hello World") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0022 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'Hello', 'Hello World');
      logInfo(`new NewsItem("", "Hello", "Hello", "Hello...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "Hello", "Hello...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", "Hello...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", "Hello...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('Hello World');
      logInfo(`${BUNDLE}NewsItemCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0023
     * @tc.name      PullToRefresh_NewsItemCtor_0023
     * @tc.desc      new NewsItem("", "Hello", "Hello", " ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0023 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'Hello', ' ');
      logInfo(`new NewsItem("", "Hello", "Hello", " "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "Hello", " "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", " "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", " "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' ');
      logInfo(`${BUNDLE}NewsItemCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0024
     * @tc.name      PullToRefresh_NewsItemCtor_0024
     * @tc.desc      new NewsItem("", "Hello", "Hello", "123") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0024 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'Hello', '123');
      logInfo(`new NewsItem("", "Hello", "Hello", "123"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "Hello", "123"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", "123"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", "123"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('123');
      logInfo(`${BUNDLE}NewsItemCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0025
     * @tc.name      PullToRefresh_NewsItemCtor_0025
     * @tc.desc      new NewsItem("", "Hello", "Hello", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0025 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'Hello', ' a ');
      logInfo(`new NewsItem("", "Hello", "Hello", " a "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Hello", "Hello", " a "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", " a "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("", "Hello", "Hello", " a "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0026
     * @tc.name      PullToRefresh_NewsItemCtor_0026
     * @tc.desc      new NewsItem("", "??", " ", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0026 begin`);
      const subject: NewsItem = new NewsItem('', '\u4e2d\u6587', ' ', '');
      logInfo(`new NewsItem("", "??", " ", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "??", " ", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem("", "??", " ", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual(' ');
      logInfo(`new NewsItem("", "??", " ", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0027
     * @tc.name      PullToRefresh_NewsItemCtor_0027
     * @tc.desc      new NewsItem("abc", "A", "Sample Title 123", "a") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0027 begin`);
      const subject: NewsItem = new NewsItem('abc', 'A', 'Sample Title 123', 'a');
      logInfo(`new NewsItem("abc", "A", "Sample Title 12...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('abc');
      logInfo(`new NewsItem("abc", "A", "Sample Title 12...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('A');
      logInfo(`new NewsItem("abc", "A", "Sample Title 12...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Sample Title 123');
      logInfo(`new NewsItem("abc", "A", "Sample Title 12...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('a');
      logInfo(`${BUNDLE}NewsItemCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0028
     * @tc.name      PullToRefresh_NewsItemCtor_0028
     * @tc.desc      new NewsItem(" ", "Hello", "??", "123") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0028 begin`);
      const subject: NewsItem = new NewsItem(' ', 'Hello', '\u4e2d\u6587', '123');
      logInfo(`new NewsItem(" ", "Hello", "??", "123"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' ');
      logInfo(`new NewsItem(" ", "Hello", "??", "123"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem(" ", "Hello", "??", "123"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem(" ", "Hello", "??", "123"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('123');
      logInfo(`${BUNDLE}NewsItemCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0029
     * @tc.name      PullToRefresh_NewsItemCtor_0029
     * @tc.desc      new NewsItem("", "hello world", "A", "Hello World") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0029 begin`);
      const subject: NewsItem = new NewsItem('', 'hello world', 'A', 'Hello World');
      logInfo(`new NewsItem("", "hello world", "A", "Hel...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "hello world", "A", "Hel...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('hello world');
      logInfo(`new NewsItem("", "hello world", "A", "Hel...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('A');
      logInfo(`new NewsItem("", "hello world", "A", "Hel...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('Hello World');
      logInfo(`${BUNDLE}NewsItemCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0030
     * @tc.name      PullToRefresh_NewsItemCtor_0030
     * @tc.desc      new NewsItem("abc", "", "A", "a") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0030 begin`);
      const subject: NewsItem = new NewsItem('abc', '', 'A', 'a');
      logInfo(`new NewsItem("abc", "", "A", "a"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('abc');
      logInfo(`new NewsItem("abc", "", "A", "a"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('');
      logInfo(`new NewsItem("abc", "", "A", "a"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('A');
      logInfo(`new NewsItem("abc", "", "A", "a"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('a');
      logInfo(`${BUNDLE}NewsItemCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0031
     * @tc.name      PullToRefresh_NewsItemCtor_0031
     * @tc.desc      new NewsItem("", " ", "", " ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0031 begin`);
      const subject: NewsItem = new NewsItem('', ' ', '', ' ');
      logInfo(`new NewsItem("", " ", "", " "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", " ", "", " "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual(' ');
      logInfo(`new NewsItem("", " ", "", " "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('');
      logInfo(`new NewsItem("", " ", "", " "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' ');
      logInfo(`${BUNDLE}NewsItemCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0032
     * @tc.name      PullToRefresh_NewsItemCtor_0032
     * @tc.desc      new NewsItem(" ", " ", "Hello", "123") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0032 begin`);
      const subject: NewsItem = new NewsItem(' ', ' ', 'Hello', '123');
      logInfo(`new NewsItem(" ", " ", "Hello", "123"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' ');
      logInfo(`new NewsItem(" ", " ", "Hello", "123"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual(' ');
      logInfo(`new NewsItem(" ", " ", "Hello", "123"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem(" ", " ", "Hello", "123"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('123');
      logInfo(`${BUNDLE}NewsItemCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0033
     * @tc.name      PullToRefresh_NewsItemCtor_0033
     * @tc.desc      new NewsItem("abc", " ", "??", "Hello World") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0033 begin`);
      const subject: NewsItem = new NewsItem('abc', ' ', '\u4e2d\u6587', 'Hello World');
      logInfo(`new NewsItem("abc", " ", "??", "Hello Wor...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('abc');
      logInfo(`new NewsItem("abc", " ", "??", "Hello Wor...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual(' ');
      logInfo(`new NewsItem("abc", " ", "??", "Hello Wor...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem("abc", " ", "??", "Hello Wor...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('Hello World');
      logInfo(`${BUNDLE}NewsItemCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0034
     * @tc.name      PullToRefresh_NewsItemCtor_0034
     * @tc.desc      new NewsItem("Hello World", "Sample Title 123", " ", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0034 begin`);
      const subject: NewsItem = new NewsItem('Hello World', 'Sample Title 123', ' ', ' a ');
      logInfo(`new NewsItem("Hello World", "Sample Title...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('Hello World');
      logInfo(`new NewsItem("Hello World", "Sample Title...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Sample Title 123');
      logInfo(`new NewsItem("Hello World", "Sample Title...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual(' ');
      logInfo(`new NewsItem("Hello World", "Sample Title...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0035
     * @tc.name      PullToRefresh_NewsItemCtor_0035
     * @tc.desc      new NewsItem("a", "Hello", "hello world", " ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0035 begin`);
      const subject: NewsItem = new NewsItem('a', 'Hello', 'hello world', ' ');
      logInfo(`new NewsItem("a", "Hello", "hello world",...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('a');
      logInfo(`new NewsItem("a", "Hello", "hello world",...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("a", "Hello", "hello world",...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('hello world');
      logInfo(`new NewsItem("a", "Hello", "hello world",...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' ');
      logInfo(`${BUNDLE}NewsItemCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0036
     * @tc.name      PullToRefresh_NewsItemCtor_0036
     * @tc.desc      new NewsItem("a", "Sample Title 123", "Hello", "a") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0036 begin`);
      const subject: NewsItem = new NewsItem('a', 'Sample Title 123', 'Hello', 'a');
      logInfo(`new NewsItem("a", "Sample Title 123", "He...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('a');
      logInfo(`new NewsItem("a", "Sample Title 123", "He...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Sample Title 123');
      logInfo(`new NewsItem("a", "Sample Title 123", "He...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("a", "Sample Title 123", "He...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('a');
      logInfo(`${BUNDLE}NewsItemCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0037
     * @tc.name      PullToRefresh_NewsItemCtor_0037
     * @tc.desc      new NewsItem("a", "A", "", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0037 begin`);
      const subject: NewsItem = new NewsItem('a', 'A', '', ' a ');
      logInfo(`new NewsItem("a", "A", "", " a "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('a');
      logInfo(`new NewsItem("a", "A", "", " a "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('A');
      logInfo(`new NewsItem("a", "A", "", " a "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('');
      logInfo(`new NewsItem("a", "A", "", " a "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0038
     * @tc.name      PullToRefresh_NewsItemCtor_0038
     * @tc.desc      new NewsItem("123", "??", "??", "Hello World") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0038 begin`);
      const subject: NewsItem = new NewsItem('123', '\u4e2d\u6587', '\u4e2d\u6587', 'Hello World');
      logInfo(`new NewsItem("123", "??", "??", "Hello Wo...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('123');
      logInfo(`new NewsItem("123", "??", "??", "Hello Wo...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem("123", "??", "??", "Hello Wo...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem("123", "??", "??", "Hello Wo...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('Hello World');
      logInfo(`${BUNDLE}NewsItemCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0039
     * @tc.name      PullToRefresh_NewsItemCtor_0039
     * @tc.desc      new NewsItem(" a ", "hello world", "Hello", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0039 begin`);
      const subject: NewsItem = new NewsItem(' a ', 'hello world', 'Hello', ' a ');
      logInfo(`new NewsItem(" a ", "hello world", "Hello...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' a ');
      logInfo(`new NewsItem(" a ", "hello world", "Hello...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('hello world');
      logInfo(`new NewsItem(" a ", "hello world", "Hello...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem(" a ", "hello world", "Hello...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0040
     * @tc.name      PullToRefresh_NewsItemCtor_0040
     * @tc.desc      new NewsItem(" a ", "hello world", "hello world", "a") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0040 begin`);
      const subject: NewsItem = new NewsItem(' a ', 'hello world', 'hello world', 'a');
      logInfo(`new NewsItem(" a ", "hello world", "hello...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' a ');
      logInfo(`new NewsItem(" a ", "hello world", "hello...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('hello world');
      logInfo(`new NewsItem(" a ", "hello world", "hello...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('hello world');
      logInfo(`new NewsItem(" a ", "hello world", "hello...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('a');
      logInfo(`${BUNDLE}NewsItemCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0041
     * @tc.name      PullToRefresh_NewsItemCtor_0041
     * @tc.desc      new NewsItem("abc", "Sample Title 123", "hello world", "abc") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0041 begin`);
      const subject: NewsItem = new NewsItem('abc', 'Sample Title 123', 'hello world', 'abc');
      logInfo(`new NewsItem("abc", "Sample Title 123", "...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('abc');
      logInfo(`new NewsItem("abc", "Sample Title 123", "...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Sample Title 123');
      logInfo(`new NewsItem("abc", "Sample Title 123", "...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('hello world');
      logInfo(`new NewsItem("abc", "Sample Title 123", "...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('abc');
      logInfo(`${BUNDLE}NewsItemCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0042
     * @tc.name      PullToRefresh_NewsItemCtor_0042
     * @tc.desc      new NewsItem("", "", " ", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0042 begin`);
      const subject: NewsItem = new NewsItem('', '', ' ', ' a ');
      logInfo(`new NewsItem("", "", " ", " a "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "", " ", " a "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('');
      logInfo(`new NewsItem("", "", " ", " a "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual(' ');
      logInfo(`new NewsItem("", "", " ", " a "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0043
     * @tc.name      PullToRefresh_NewsItemCtor_0043
     * @tc.desc      new NewsItem("123", "Hello", "Hello", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0043 begin`);
      const subject: NewsItem = new NewsItem('123', 'Hello', 'Hello', ' a ');
      logInfo(`new NewsItem("123", "Hello", "Hello", " a "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('123');
      logInfo(`new NewsItem("123", "Hello", "Hello", " a "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("123", "Hello", "Hello", " a "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem("123", "Hello", "Hello", " a "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0044
     * @tc.name      PullToRefresh_NewsItemCtor_0044
     * @tc.desc      new NewsItem(" a ", "??", "A", "123") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0044 begin`);
      const subject: NewsItem = new NewsItem(' a ', '\u4e2d\u6587', 'A', '123');
      logInfo(`new NewsItem(" a ", "??", "A", "123"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' a ');
      logInfo(`new NewsItem(" a ", "??", "A", "123"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem(" a ", "??", "A", "123"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('A');
      logInfo(`new NewsItem(" a ", "??", "A", "123"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('123');
      logInfo(`${BUNDLE}NewsItemCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0045
     * @tc.name      PullToRefresh_NewsItemCtor_0045
     * @tc.desc      new NewsItem(" ", "A", "hello world", "Hello World") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0045 begin`);
      const subject: NewsItem = new NewsItem(' ', 'A', 'hello world', 'Hello World');
      logInfo(`new NewsItem(" ", "A", "hello world", "He...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' ');
      logInfo(`new NewsItem(" ", "A", "hello world", "He...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('A');
      logInfo(`new NewsItem(" ", "A", "hello world", "He...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('hello world');
      logInfo(`new NewsItem(" ", "A", "hello world", "He...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('Hello World');
      logInfo(`${BUNDLE}NewsItemCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0046
     * @tc.name      PullToRefresh_NewsItemCtor_0046
     * @tc.desc      new NewsItem("abc", "A", "", "123") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0046 begin`);
      const subject: NewsItem = new NewsItem('abc', 'A', '', '123');
      logInfo(`new NewsItem("abc", "A", "", "123"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('abc');
      logInfo(`new NewsItem("abc", "A", "", "123"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('A');
      logInfo(`new NewsItem("abc", "A", "", "123"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('');
      logInfo(`new NewsItem("abc", "A", "", "123"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('123');
      logInfo(`${BUNDLE}NewsItemCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0047
     * @tc.name      PullToRefresh_NewsItemCtor_0047
     * @tc.desc      new NewsItem("", "Sample Title 123", "Sample Title 123", " ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0047 begin`);
      const subject: NewsItem = new NewsItem('', 'Sample Title 123', 'Sample Title 123', ' ');
      logInfo(`new NewsItem("", "Sample Title 123", "Sam...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", "Sample Title 123", "Sam...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Sample Title 123');
      logInfo(`new NewsItem("", "Sample Title 123", "Sam...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Sample Title 123');
      logInfo(`new NewsItem("", "Sample Title 123", "Sam...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' ');
      logInfo(`${BUNDLE}NewsItemCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0048
     * @tc.name      PullToRefresh_NewsItemCtor_0048
     * @tc.desc      new NewsItem("Hello World", "Hello", "??", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0048 begin`);
      const subject: NewsItem = new NewsItem('Hello World', 'Hello', '\u4e2d\u6587', ' a ');
      logInfo(`new NewsItem("Hello World", "Hello", "??"...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('Hello World');
      logInfo(`new NewsItem("Hello World", "Hello", "??"...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("Hello World", "Hello", "??"...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem("Hello World", "Hello", "??"...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0049
     * @tc.name      PullToRefresh_NewsItemCtor_0049
     * @tc.desc      new NewsItem(" ", "hello world", "A", "a") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0049 begin`);
      const subject: NewsItem = new NewsItem(' ', 'hello world', 'A', 'a');
      logInfo(`new NewsItem(" ", "hello world", "A", "a"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' ');
      logInfo(`new NewsItem(" ", "hello world", "A", "a"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('hello world');
      logInfo(`new NewsItem(" ", "hello world", "A", "a"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('A');
      logInfo(`new NewsItem(" ", "hello world", "A", "a"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('a');
      logInfo(`${BUNDLE}NewsItemCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0050
     * @tc.name      PullToRefresh_NewsItemCtor_0050
     * @tc.desc      new NewsItem(" a ", "Hello", "Hello", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0050 begin`);
      const subject: NewsItem = new NewsItem(' a ', 'Hello', 'Hello', ' a ');
      logInfo(`new NewsItem(" a ", "Hello", "Hello", " a "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' a ');
      logInfo(`new NewsItem(" a ", "Hello", "Hello", " a "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem(" a ", "Hello", "Hello", " a "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem(" a ", "Hello", "Hello", " a "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0051
     * @tc.name      PullToRefresh_NewsItemCtor_0051
     * @tc.desc      new NewsItem(" a ", "A", " ", "a") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0051 begin`);
      const subject: NewsItem = new NewsItem(' a ', 'A', ' ', 'a');
      logInfo(`new NewsItem(" a ", "A", " ", "a"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' a ');
      logInfo(`new NewsItem(" a ", "A", " ", "a"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('A');
      logInfo(`new NewsItem(" a ", "A", " ", "a"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual(' ');
      logInfo(`new NewsItem(" a ", "A", " ", "a"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('a');
      logInfo(`${BUNDLE}NewsItemCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0052
     * @tc.name      PullToRefresh_NewsItemCtor_0052
     * @tc.desc      new NewsItem(" a ", " ", "Hello", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0052 begin`);
      const subject: NewsItem = new NewsItem(' a ', ' ', 'Hello', ' a ');
      logInfo(`new NewsItem(" a ", " ", "Hello", " a "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' a ');
      logInfo(`new NewsItem(" a ", " ", "Hello", " a "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual(' ');
      logInfo(`new NewsItem(" a ", " ", "Hello", " a "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Hello');
      logInfo(`new NewsItem(" a ", " ", "Hello", " a "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0053
     * @tc.name      PullToRefresh_NewsItemCtor_0053
     * @tc.desc      new NewsItem("123", "hello world", "A", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0053 begin`);
      const subject: NewsItem = new NewsItem('123', 'hello world', 'A', '');
      logInfo(`new NewsItem("123", "hello world", "A", ""): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('123');
      logInfo(`new NewsItem("123", "hello world", "A", ""): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('hello world');
      logInfo(`new NewsItem("123", "hello world", "A", ""): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('A');
      logInfo(`new NewsItem("123", "hello world", "A", ""): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0054
     * @tc.name      PullToRefresh_NewsItemCtor_0054
     * @tc.desc      new NewsItem("a", "A", "hello world", "123") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0054 begin`);
      const subject: NewsItem = new NewsItem('a', 'A', 'hello world', '123');
      logInfo(`new NewsItem("a", "A", "hello world", "123"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('a');
      logInfo(`new NewsItem("a", "A", "hello world", "123"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('A');
      logInfo(`new NewsItem("a", "A", "hello world", "123"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('hello world');
      logInfo(`new NewsItem("a", "A", "hello world", "123"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('123');
      logInfo(`${BUNDLE}NewsItemCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0055
     * @tc.name      PullToRefresh_NewsItemCtor_0055
     * @tc.desc      new NewsItem("123", "Hello", "??", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0055 begin`);
      const subject: NewsItem = new NewsItem('123', 'Hello', '\u4e2d\u6587', ' a ');
      logInfo(`new NewsItem("123", "Hello", "??", " a "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('123');
      logInfo(`new NewsItem("123", "Hello", "??", " a "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('Hello');
      logInfo(`new NewsItem("123", "Hello", "??", " a "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem("123", "Hello", "??", " a "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0056
     * @tc.name      PullToRefresh_NewsItemCtor_0056
     * @tc.desc      new NewsItem(" ", " ", "A", "Hello World") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0056 begin`);
      const subject: NewsItem = new NewsItem(' ', ' ', 'A', 'Hello World');
      logInfo(`new NewsItem(" ", " ", "A", "Hello World"): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual(' ');
      logInfo(`new NewsItem(" ", " ", "A", "Hello World"): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual(' ');
      logInfo(`new NewsItem(" ", " ", "A", "Hello World"): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('A');
      logInfo(`new NewsItem(" ", " ", "A", "Hello World"): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('Hello World');
      logInfo(`${BUNDLE}NewsItemCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0057
     * @tc.name      PullToRefresh_NewsItemCtor_0057
     * @tc.desc      new NewsItem("123", "hello world", "hello world", "") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0057 begin`);
      const subject: NewsItem = new NewsItem('123', 'hello world', 'hello world', '');
      logInfo(`new NewsItem("123", "hello world", "hello...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('123');
      logInfo(`new NewsItem("123", "hello world", "hello...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('hello world');
      logInfo(`new NewsItem("123", "hello world", "hello...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('hello world');
      logInfo(`new NewsItem("123", "hello world", "hello...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual('');
      logInfo(`${BUNDLE}NewsItemCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0058
     * @tc.name      PullToRefresh_NewsItemCtor_0058
     * @tc.desc      new NewsItem("Hello World", "??", "Sample Title 123", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0058 begin`);
      const subject: NewsItem = new NewsItem('Hello World', '\u4e2d\u6587', 'Sample Title 123', ' a ');
      logInfo(`new NewsItem("Hello World", "??", "Sample...: subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('Hello World');
      logInfo(`new NewsItem("Hello World", "??", "Sample...: subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual('\u4e2d\u6587');
      logInfo(`new NewsItem("Hello World", "??", "Sample...: subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('Sample Title 123');
      logInfo(`new NewsItem("Hello World", "??", "Sample...: subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_CTOR_0059
     * @tc.name      PullToRefresh_NewsItemCtor_0059
     * @tc.desc      new NewsItem("", " ", "", " a ") initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsItemCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsItemCtor_0059 begin`);
      const subject: NewsItem = new NewsItem('', ' ', '', ' a ');
      logInfo(`new NewsItem("", " ", "", " a "): subject.newsId=${subject.newsId}`);
      expect(subject.newsId).assertEqual('');
      logInfo(`new NewsItem("", " ", "", " a "): subject.newsTitle=${subject.newsTitle}`);
      expect(subject.newsTitle).assertEqual(' ');
      logInfo(`new NewsItem("", " ", "", " a "): subject.newsContent=${subject.newsContent}`);
      expect(subject.newsContent).assertEqual('');
      logInfo(`new NewsItem("", " ", "", " a "): subject.newsTime=${subject.newsTime}`);
      expect(subject.newsTime).assertEqual(' a ');
      logInfo(`${BUNDLE}NewsItemCtor_0059 end`);
    });
  });
}
