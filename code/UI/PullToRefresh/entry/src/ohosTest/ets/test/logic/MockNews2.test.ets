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

/** Logic checks for mockNews (7 cases). */
export default function mockNews2Test(): void {
  describe('MockNews2Test', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0052
     * @tc.name      PullToRefresh_MockNews_0052
     * @tc.desc      mockNews(page=172) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0052 begin`);
      const actual: NewsItem[] = mockNews(172);
      logInfo(`mockNews(page=172): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=172): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=172): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=172): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=172): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0173-01');
      logInfo(`mockNews(page=172): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=172): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=172): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0053
     * @tc.name      PullToRefresh_MockNews_0053
     * @tc.desc      mockNews(page=105.54) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0053 begin`);
      const actual: NewsItem[] = mockNews(105.54);
      logInfo(`mockNews(page=105.54): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=105.54): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=105.54): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=105.54): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=105.54): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0106.54-01');
      logInfo(`mockNews(page=105.54): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=105.54): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=105.54): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0054
     * @tc.name      PullToRefresh_MockNews_0054
     * @tc.desc      mockNews(page=131.02) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0054 begin`);
      const actual: NewsItem[] = mockNews(131.02);
      logInfo(`mockNews(page=131.02): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=131.02): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=131.02): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=131.02): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=131.02): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0132.02-01');
      logInfo(`mockNews(page=131.02): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=131.02): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=131.02): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0055
     * @tc.name      PullToRefresh_MockNews_0055
     * @tc.desc      mockNews(page=84.45) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0055 begin`);
      const actual: NewsItem[] = mockNews(84.45);
      logInfo(`mockNews(page=84.45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=84.45): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=84.45): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=84.45): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=84.45): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-085.45-01');
      logInfo(`mockNews(page=84.45): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=84.45): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=84.45): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0056
     * @tc.name      PullToRefresh_MockNews_0056
     * @tc.desc      mockNews(page=372) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0056 begin`);
      const actual: NewsItem[] = mockNews(372);
      logInfo(`mockNews(page=372): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=372): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=372): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=372): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=372): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0373-01');
      logInfo(`mockNews(page=372): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=372): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=372): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0057
     * @tc.name      PullToRefresh_MockNews_0057
     * @tc.desc      mockNews(page=172.76) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0057 begin`);
      const actual: NewsItem[] = mockNews(172.76);
      logInfo(`mockNews(page=172.76): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=172.76): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=172.76): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=172.76): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=172.76): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0173.76-01');
      logInfo(`mockNews(page=172.76): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=172.76): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=172.76): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_NEWS_0058
     * @tc.name      PullToRefresh_MockNews_0058
     * @tc.desc      mockNews(page=395) returns "content4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockNews_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockNews_0058 begin`);
      const actual: NewsItem[] = mockNews(395);
      logInfo(`mockNews(page=395): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`mockNews(page=395): actual[0].newsId=${actual[0].newsId}`);
      expect(actual[0].newsId).assertEqual('1');
      logInfo(`mockNews(page=395): actual[0].newsTitle=${actual[0].newsTitle}`);
      expect(actual[0].newsTitle).assertEqual('title1');
      logInfo(`mockNews(page=395): actual[0].newsContent=${actual[0].newsContent}`);
      expect(actual[0].newsContent).assertEqual('content1');
      logInfo(`mockNews(page=395): actual[0].newsTime=${actual[0].newsTime}`);
      expect(actual[0].newsTime).assertEqual('2024-0396-01');
      logInfo(`mockNews(page=395): actual[3].newsId=${actual[3].newsId}`);
      expect(actual[3].newsId).assertEqual('4');
      logInfo(`mockNews(page=395): actual[3].newsTitle=${actual[3].newsTitle}`);
      expect(actual[3].newsTitle).assertEqual('title4');
      logInfo(`mockNews(page=395): actual[3].newsContent=${actual[3].newsContent}`);
      expect(actual[3].newsContent).assertEqual('content4');
      logInfo(`${BUNDLE}MockNews_0058 end`);
    });
  });
}
