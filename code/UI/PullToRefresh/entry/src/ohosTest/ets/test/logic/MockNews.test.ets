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
import { NewsItem, mockNews } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for mockNews (51 cases). */
export default function mockNewsTest(): void {
  describe('MockNewsTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0001
     * @tc.name      PullToRefresh_MockNews_0001
     * @tc.desc      mockNews(page=1) returns "content104"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_MockNews_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MockNews_0001 begin`);
      const actual: NewsItem[] = mockNews(1);
      logInfo(`mockNews(page=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=1): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('101');
      logInfo(`mockNews(page=1): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title101');
      logInfo(`mockNews(page=1): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content101');
      logInfo(`mockNews(page=1): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-02-01');
      logInfo(`mockNews(page=1): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('104');
      logInfo(`mockNews(page=1): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title104');
      logInfo(`mockNews(page=1): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content104');
      logInfo(`${BUNDLE}MockNews_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0002
     * @tc.name      PullToRefresh_MockNews_0002
     * @tc.desc      mockNews(page=0) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_MockNews_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MockNews_0002 begin`);
      const actual: NewsItem[] = mockNews(0);
      logInfo(`mockNews(page=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=0): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=0): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=0): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=0): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-01-01');
      logInfo(`mockNews(page=0): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=0): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=0): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0003
     * @tc.name      PullToRefresh_MockNews_0003
     * @tc.desc      mockNews(page=2) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_MockNews_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MockNews_0003 begin`);
      const actual: NewsItem[] = mockNews(2);
      logInfo(`mockNews(page=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=2): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=2): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=2): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=2): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-03-01');
      logInfo(`mockNews(page=2): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=2): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=2): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0004
     * @tc.name      PullToRefresh_MockNews_0004
     * @tc.desc      mockNews(page=101) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_MockNews_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MockNews_0004 begin`);
      const actual: NewsItem[] = mockNews(101);
      logInfo(`mockNews(page=101): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=101): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=101): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=101): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=101): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0102-01');
      logInfo(`mockNews(page=101): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=101): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=101): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0005
     * @tc.name      PullToRefresh_MockNews_0005
     * @tc.desc      mockNews(page=100) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_MockNews_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MockNews_0005 begin`);
      const actual: NewsItem[] = mockNews(100);
      logInfo(`mockNews(page=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=100): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=100): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=100): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=100): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0101-01');
      logInfo(`mockNews(page=100): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=100): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=100): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0006
     * @tc.name      PullToRefresh_MockNews_0006
     * @tc.desc      mockNews(page=102) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_MockNews_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MockNews_0006 begin`);
      const actual: NewsItem[] = mockNews(102);
      logInfo(`mockNews(page=102): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=102): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=102): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=102): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=102): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0103-01');
      logInfo(`mockNews(page=102): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=102): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=102): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0007
     * @tc.name      PullToRefresh_MockNews_0007
     * @tc.desc      mockNews(page=202) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0007 begin`);
      const actual: NewsItem[] = mockNews(202);
      logInfo(`mockNews(page=202): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=202): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=202): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=202): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=202): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0203-01');
      logInfo(`mockNews(page=202): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=202): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=202): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0008
     * @tc.name      PullToRefresh_MockNews_0008
     * @tc.desc      mockNews(page=50) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0008 begin`);
      const actual: NewsItem[] = mockNews(50);
      logInfo(`mockNews(page=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=50): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=50): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=50): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=50): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-051-01');
      logInfo(`mockNews(page=50): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=50): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=50): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0009
     * @tc.name      PullToRefresh_MockNews_0009
     * @tc.desc      mockNews(page=-1) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_MockNews_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MockNews_0009 begin`);
      const actual: NewsItem[] = mockNews(-1);
      logInfo(`mockNews(page=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=-1): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=-1): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=-1): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=-1): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-00-01');
      logInfo(`mockNews(page=-1): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=-1): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=-1): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0010
     * @tc.name      PullToRefresh_MockNews_0010
     * @tc.desc      mockNews(page=3) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0010 begin`);
      const actual: NewsItem[] = mockNews(3);
      logInfo(`mockNews(page=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=3): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=3): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=3): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=3): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-04-01');
      logInfo(`mockNews(page=3): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=3): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=3): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0011
     * @tc.name      PullToRefresh_MockNews_0011
     * @tc.desc      mockNews(page=10) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0011 begin`);
      const actual: NewsItem[] = mockNews(10);
      logInfo(`mockNews(page=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=10): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=10): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=10): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=10): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-011-01');
      logInfo(`mockNews(page=10): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=10): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=10): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0012
     * @tc.name      PullToRefresh_MockNews_0012
     * @tc.desc      mockNews(page=20) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0012 begin`);
      const actual: NewsItem[] = mockNews(20);
      logInfo(`mockNews(page=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=20): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=20): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=20): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=20): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-021-01');
      logInfo(`mockNews(page=20): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=20): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=20): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0013
     * @tc.name      PullToRefresh_MockNews_0013
     * @tc.desc      mockNews(page=30) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0013 begin`);
      const actual: NewsItem[] = mockNews(30);
      logInfo(`mockNews(page=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=30): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=30): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=30): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=30): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-031-01');
      logInfo(`mockNews(page=30): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=30): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=30): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0014
     * @tc.name      PullToRefresh_MockNews_0014
     * @tc.desc      mockNews(page=40) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0014 begin`);
      const actual: NewsItem[] = mockNews(40);
      logInfo(`mockNews(page=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=40): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=40): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=40): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=40): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-041-01');
      logInfo(`mockNews(page=40): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=40): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=40): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0015
     * @tc.name      PullToRefresh_MockNews_0015
     * @tc.desc      mockNews(page=60) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0015 begin`);
      const actual: NewsItem[] = mockNews(60);
      logInfo(`mockNews(page=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=60): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=60): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=60): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=60): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-061-01');
      logInfo(`mockNews(page=60): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=60): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=60): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0016
     * @tc.name      PullToRefresh_MockNews_0016
     * @tc.desc      mockNews(page=70) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0016 begin`);
      const actual: NewsItem[] = mockNews(70);
      logInfo(`mockNews(page=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=70): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=70): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=70): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=70): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-071-01');
      logInfo(`mockNews(page=70): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=70): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=70): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0017
     * @tc.name      PullToRefresh_MockNews_0017
     * @tc.desc      mockNews(page=80) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0017 begin`);
      const actual: NewsItem[] = mockNews(80);
      logInfo(`mockNews(page=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=80): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=80): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=80): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=80): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-081-01');
      logInfo(`mockNews(page=80): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=80): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=80): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0018
     * @tc.name      PullToRefresh_MockNews_0018
     * @tc.desc      mockNews(page=90) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0018 begin`);
      const actual: NewsItem[] = mockNews(90);
      logInfo(`mockNews(page=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=90): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=90): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=90): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=90): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-091-01');
      logInfo(`mockNews(page=90): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=90): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=90): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0019
     * @tc.name      PullToRefresh_MockNews_0019
     * @tc.desc      mockNews(page=110) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0019 begin`);
      const actual: NewsItem[] = mockNews(110);
      logInfo(`mockNews(page=110): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=110): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=110): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=110): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=110): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0111-01');
      logInfo(`mockNews(page=110): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=110): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=110): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0020
     * @tc.name      PullToRefresh_MockNews_0020
     * @tc.desc      mockNews(page=120) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0020 begin`);
      const actual: NewsItem[] = mockNews(120);
      logInfo(`mockNews(page=120): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=120): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=120): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=120): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=120): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0121-01');
      logInfo(`mockNews(page=120): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=120): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=120): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0021
     * @tc.name      PullToRefresh_MockNews_0021
     * @tc.desc      mockNews(page=130) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0021 begin`);
      const actual: NewsItem[] = mockNews(130);
      logInfo(`mockNews(page=130): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=130): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=130): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=130): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=130): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0131-01');
      logInfo(`mockNews(page=130): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=130): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=130): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0022
     * @tc.name      PullToRefresh_MockNews_0022
     * @tc.desc      mockNews(page=140) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0022 begin`);
      const actual: NewsItem[] = mockNews(140);
      logInfo(`mockNews(page=140): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=140): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=140): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=140): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=140): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0141-01');
      logInfo(`mockNews(page=140): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=140): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=140): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0023
     * @tc.name      PullToRefresh_MockNews_0023
     * @tc.desc      mockNews(page=150) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0023 begin`);
      const actual: NewsItem[] = mockNews(150);
      logInfo(`mockNews(page=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=150): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=150): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=150): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=150): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0151-01');
      logInfo(`mockNews(page=150): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=150): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=150): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0024
     * @tc.name      PullToRefresh_MockNews_0024
     * @tc.desc      mockNews(page=160) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0024 begin`);
      const actual: NewsItem[] = mockNews(160);
      logInfo(`mockNews(page=160): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=160): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=160): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=160): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=160): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0161-01');
      logInfo(`mockNews(page=160): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=160): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=160): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0025
     * @tc.name      PullToRefresh_MockNews_0025
     * @tc.desc      mockNews(page=170) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0025 begin`);
      const actual: NewsItem[] = mockNews(170);
      logInfo(`mockNews(page=170): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=170): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=170): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=170): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=170): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0171-01');
      logInfo(`mockNews(page=170): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=170): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=170): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0026
     * @tc.name      PullToRefresh_MockNews_0026
     * @tc.desc      mockNews(page=180) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0026 begin`);
      const actual: NewsItem[] = mockNews(180);
      logInfo(`mockNews(page=180): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=180): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=180): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=180): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=180): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0181-01');
      logInfo(`mockNews(page=180): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=180): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=180): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0027
     * @tc.name      PullToRefresh_MockNews_0027
     * @tc.desc      mockNews(page=190) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0027 begin`);
      const actual: NewsItem[] = mockNews(190);
      logInfo(`mockNews(page=190): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=190): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=190): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=190): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=190): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0191-01');
      logInfo(`mockNews(page=190): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=190): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=190): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0028
     * @tc.name      PullToRefresh_MockNews_0028
     * @tc.desc      mockNews(page=200) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0028 begin`);
      const actual: NewsItem[] = mockNews(200);
      logInfo(`mockNews(page=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=200): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=200): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=200): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=200): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0201-01');
      logInfo(`mockNews(page=200): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=200): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=200): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0029
     * @tc.name      PullToRefresh_MockNews_0029
     * @tc.desc      mockNews(page=210) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0029 begin`);
      const actual: NewsItem[] = mockNews(210);
      logInfo(`mockNews(page=210): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=210): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=210): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=210): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=210): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0211-01');
      logInfo(`mockNews(page=210): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=210): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=210): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0030
     * @tc.name      PullToRefresh_MockNews_0030
     * @tc.desc      mockNews(page=220) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0030 begin`);
      const actual: NewsItem[] = mockNews(220);
      logInfo(`mockNews(page=220): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=220): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=220): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=220): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=220): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0221-01');
      logInfo(`mockNews(page=220): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=220): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=220): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0031
     * @tc.name      PullToRefresh_MockNews_0031
     * @tc.desc      mockNews(page=230) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0031 begin`);
      const actual: NewsItem[] = mockNews(230);
      logInfo(`mockNews(page=230): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=230): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=230): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=230): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=230): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0231-01');
      logInfo(`mockNews(page=230): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=230): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=230): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0032
     * @tc.name      PullToRefresh_MockNews_0032
     * @tc.desc      mockNews(page=240) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0032 begin`);
      const actual: NewsItem[] = mockNews(240);
      logInfo(`mockNews(page=240): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=240): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=240): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=240): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=240): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0241-01');
      logInfo(`mockNews(page=240): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=240): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=240): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0033
     * @tc.name      PullToRefresh_MockNews_0033
     * @tc.desc      mockNews(page=250) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0033 begin`);
      const actual: NewsItem[] = mockNews(250);
      logInfo(`mockNews(page=250): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=250): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=250): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=250): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=250): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0251-01');
      logInfo(`mockNews(page=250): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=250): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=250): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0034
     * @tc.name      PullToRefresh_MockNews_0034
     * @tc.desc      mockNews(page=260) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0034 begin`);
      const actual: NewsItem[] = mockNews(260);
      logInfo(`mockNews(page=260): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=260): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=260): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=260): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=260): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0261-01');
      logInfo(`mockNews(page=260): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=260): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=260): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0035
     * @tc.name      PullToRefresh_MockNews_0035
     * @tc.desc      mockNews(page=270) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0035 begin`);
      const actual: NewsItem[] = mockNews(270);
      logInfo(`mockNews(page=270): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=270): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=270): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=270): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=270): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0271-01');
      logInfo(`mockNews(page=270): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=270): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=270): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0036
     * @tc.name      PullToRefresh_MockNews_0036
     * @tc.desc      mockNews(page=280) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0036 begin`);
      const actual: NewsItem[] = mockNews(280);
      logInfo(`mockNews(page=280): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=280): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=280): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=280): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=280): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0281-01');
      logInfo(`mockNews(page=280): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=280): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=280): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0037
     * @tc.name      PullToRefresh_MockNews_0037
     * @tc.desc      mockNews(page=290) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0037 begin`);
      const actual: NewsItem[] = mockNews(290);
      logInfo(`mockNews(page=290): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=290): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=290): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=290): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=290): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0291-01');
      logInfo(`mockNews(page=290): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=290): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=290): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0038
     * @tc.name      PullToRefresh_MockNews_0038
     * @tc.desc      mockNews(page=300) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0038 begin`);
      const actual: NewsItem[] = mockNews(300);
      logInfo(`mockNews(page=300): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=300): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=300): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=300): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=300): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0301-01');
      logInfo(`mockNews(page=300): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=300): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=300): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0039
     * @tc.name      PullToRefresh_MockNews_0039
     * @tc.desc      mockNews(page=310) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0039 begin`);
      const actual: NewsItem[] = mockNews(310);
      logInfo(`mockNews(page=310): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=310): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=310): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=310): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=310): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0311-01');
      logInfo(`mockNews(page=310): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=310): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=310): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0040
     * @tc.name      PullToRefresh_MockNews_0040
     * @tc.desc      mockNews(page=320) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0040 begin`);
      const actual: NewsItem[] = mockNews(320);
      logInfo(`mockNews(page=320): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=320): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=320): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=320): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=320): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0321-01');
      logInfo(`mockNews(page=320): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=320): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=320): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0041
     * @tc.name      PullToRefresh_MockNews_0041
     * @tc.desc      mockNews(page=330) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0041 begin`);
      const actual: NewsItem[] = mockNews(330);
      logInfo(`mockNews(page=330): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=330): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=330): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=330): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=330): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0331-01');
      logInfo(`mockNews(page=330): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=330): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=330): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0042
     * @tc.name      PullToRefresh_MockNews_0042
     * @tc.desc      mockNews(page=340) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0042 begin`);
      const actual: NewsItem[] = mockNews(340);
      logInfo(`mockNews(page=340): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=340): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=340): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=340): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=340): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0341-01');
      logInfo(`mockNews(page=340): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=340): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=340): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0043
     * @tc.name      PullToRefresh_MockNews_0043
     * @tc.desc      mockNews(page=350) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0043 begin`);
      const actual: NewsItem[] = mockNews(350);
      logInfo(`mockNews(page=350): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=350): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=350): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=350): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=350): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0351-01');
      logInfo(`mockNews(page=350): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=350): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=350): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0044
     * @tc.name      PullToRefresh_MockNews_0044
     * @tc.desc      mockNews(page=360) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0044 begin`);
      const actual: NewsItem[] = mockNews(360);
      logInfo(`mockNews(page=360): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=360): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=360): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=360): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=360): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0361-01');
      logInfo(`mockNews(page=360): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=360): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=360): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0045
     * @tc.name      PullToRefresh_MockNews_0045
     * @tc.desc      mockNews(page=370) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0045 begin`);
      const actual: NewsItem[] = mockNews(370);
      logInfo(`mockNews(page=370): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=370): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=370): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=370): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=370): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0371-01');
      logInfo(`mockNews(page=370): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=370): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=370): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0046
     * @tc.name      PullToRefresh_MockNews_0046
     * @tc.desc      mockNews(page=380) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0046 begin`);
      const actual: NewsItem[] = mockNews(380);
      logInfo(`mockNews(page=380): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=380): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=380): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=380): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=380): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0381-01');
      logInfo(`mockNews(page=380): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=380): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=380): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0047
     * @tc.name      PullToRefresh_MockNews_0047
     * @tc.desc      mockNews(page=390) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0047 begin`);
      const actual: NewsItem[] = mockNews(390);
      logInfo(`mockNews(page=390): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=390): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=390): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=390): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=390): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0391-01');
      logInfo(`mockNews(page=390): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=390): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=390): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0048
     * @tc.name      PullToRefresh_MockNews_0048
     * @tc.desc      mockNews(page=400) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0048 begin`);
      const actual: NewsItem[] = mockNews(400);
      logInfo(`mockNews(page=400): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=400): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=400): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=400): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=400): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0401-01');
      logInfo(`mockNews(page=400): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=400): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=400): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0049
     * @tc.name      PullToRefresh_MockNews_0049
     * @tc.desc      mockNews(page=296) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0049 begin`);
      const actual: NewsItem[] = mockNews(296);
      logInfo(`mockNews(page=296): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=296): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=296): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=296): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=296): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0297-01');
      logInfo(`mockNews(page=296): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=296): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=296): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0050
     * @tc.name      PullToRefresh_MockNews_0050
     * @tc.desc      mockNews(page=125) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0050 begin`);
      const actual: NewsItem[] = mockNews(125);
      logInfo(`mockNews(page=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=125): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=125): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=125): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=125): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0126-01');
      logInfo(`mockNews(page=125): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=125): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=125): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0051
     * @tc.name      PullToRefresh_MockNews_0051
     * @tc.desc      mockNews(page=228) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0051 begin`);
      const actual: NewsItem[] = mockNews(228);
      logInfo(`mockNews(page=228): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=228): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=228): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=228): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=228): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0229-01');
      logInfo(`mockNews(page=228): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=228): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=228): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0051 end`);
    });
  });
}
