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
import { newsLoadingText } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for newsLoadingText (30 cases). */
export default function newsLoadingTextTest(): void {
  describe('NewsLoadingTextTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0001
     * @tc.name      PullToRefresh_NewsLoadingText_0001
     * @tc.desc      newsLoadingText(newsDataListIndex=0) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsLoadingText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0001 begin`);
      const actual: string = newsLoadingText(0);
      logInfo(`newsLoadingText(newsDataListIndex=0): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0002
     * @tc.name      PullToRefresh_NewsLoadingText_0002
     * @tc.desc      newsLoadingText(newsDataListIndex=1) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsLoadingText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0002 begin`);
      const actual: string = newsLoadingText(1);
      logInfo(`newsLoadingText(newsDataListIndex=1): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0003
     * @tc.name      PullToRefresh_NewsLoadingText_0003
     * @tc.desc      newsLoadingText(newsDataListIndex=2) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0003 begin`);
      const actual: string = newsLoadingText(2);
      logInfo(`newsLoadingText(newsDataListIndex=2): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0004
     * @tc.name      PullToRefresh_NewsLoadingText_0004
     * @tc.desc      newsLoadingText(newsDataListIndex=-1) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NewsLoadingText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0004 begin`);
      const actual: string = newsLoadingText(-1);
      logInfo(`newsLoadingText(newsDataListIndex=-1): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0005
     * @tc.name      PullToRefresh_NewsLoadingText_0005
     * @tc.desc      newsLoadingText(newsDataListIndex=5) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0005 begin`);
      const actual: string = newsLoadingText(5);
      logInfo(`newsLoadingText(newsDataListIndex=5): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0006
     * @tc.name      PullToRefresh_NewsLoadingText_0006
     * @tc.desc      newsLoadingText(newsDataListIndex=10) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0006 begin`);
      const actual: string = newsLoadingText(10);
      logInfo(`newsLoadingText(newsDataListIndex=10): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0007
     * @tc.name      PullToRefresh_NewsLoadingText_0007
     * @tc.desc      newsLoadingText(newsDataListIndex=3) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0007 begin`);
      const actual: string = newsLoadingText(3);
      logInfo(`newsLoadingText(newsDataListIndex=3): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0008
     * @tc.name      PullToRefresh_NewsLoadingText_0008
     * @tc.desc      newsLoadingText(newsDataListIndex=100) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0008 begin`);
      const actual: string = newsLoadingText(100);
      logInfo(`newsLoadingText(newsDataListIndex=100): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0009
     * @tc.name      PullToRefresh_NewsLoadingText_0009
     * @tc.desc      newsLoadingText(newsDataListIndex=15) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0009 begin`);
      const actual: string = newsLoadingText(15);
      logInfo(`newsLoadingText(newsDataListIndex=15): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0010
     * @tc.name      PullToRefresh_NewsLoadingText_0010
     * @tc.desc      newsLoadingText(newsDataListIndex=20) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0010 begin`);
      const actual: string = newsLoadingText(20);
      logInfo(`newsLoadingText(newsDataListIndex=20): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0011
     * @tc.name      PullToRefresh_NewsLoadingText_0011
     * @tc.desc      newsLoadingText(newsDataListIndex=25) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0011 begin`);
      const actual: string = newsLoadingText(25);
      logInfo(`newsLoadingText(newsDataListIndex=25): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0012
     * @tc.name      PullToRefresh_NewsLoadingText_0012
     * @tc.desc      newsLoadingText(newsDataListIndex=30) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0012 begin`);
      const actual: string = newsLoadingText(30);
      logInfo(`newsLoadingText(newsDataListIndex=30): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0013
     * @tc.name      PullToRefresh_NewsLoadingText_0013
     * @tc.desc      newsLoadingText(newsDataListIndex=35) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0013 begin`);
      const actual: string = newsLoadingText(35);
      logInfo(`newsLoadingText(newsDataListIndex=35): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0014
     * @tc.name      PullToRefresh_NewsLoadingText_0014
     * @tc.desc      newsLoadingText(newsDataListIndex=40) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0014 begin`);
      const actual: string = newsLoadingText(40);
      logInfo(`newsLoadingText(newsDataListIndex=40): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0015
     * @tc.name      PullToRefresh_NewsLoadingText_0015
     * @tc.desc      newsLoadingText(newsDataListIndex=45) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0015 begin`);
      const actual: string = newsLoadingText(45);
      logInfo(`newsLoadingText(newsDataListIndex=45): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0016
     * @tc.name      PullToRefresh_NewsLoadingText_0016
     * @tc.desc      newsLoadingText(newsDataListIndex=50) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0016 begin`);
      const actual: string = newsLoadingText(50);
      logInfo(`newsLoadingText(newsDataListIndex=50): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0017
     * @tc.name      PullToRefresh_NewsLoadingText_0017
     * @tc.desc      newsLoadingText(newsDataListIndex=55) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0017 begin`);
      const actual: string = newsLoadingText(55);
      logInfo(`newsLoadingText(newsDataListIndex=55): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0018
     * @tc.name      PullToRefresh_NewsLoadingText_0018
     * @tc.desc      newsLoadingText(newsDataListIndex=60) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0018 begin`);
      const actual: string = newsLoadingText(60);
      logInfo(`newsLoadingText(newsDataListIndex=60): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0019
     * @tc.name      PullToRefresh_NewsLoadingText_0019
     * @tc.desc      newsLoadingText(newsDataListIndex=65) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0019 begin`);
      const actual: string = newsLoadingText(65);
      logInfo(`newsLoadingText(newsDataListIndex=65): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0020
     * @tc.name      PullToRefresh_NewsLoadingText_0020
     * @tc.desc      newsLoadingText(newsDataListIndex=70) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0020 begin`);
      const actual: string = newsLoadingText(70);
      logInfo(`newsLoadingText(newsDataListIndex=70): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0021
     * @tc.name      PullToRefresh_NewsLoadingText_0021
     * @tc.desc      newsLoadingText(newsDataListIndex=75) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0021 begin`);
      const actual: string = newsLoadingText(75);
      logInfo(`newsLoadingText(newsDataListIndex=75): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0022
     * @tc.name      PullToRefresh_NewsLoadingText_0022
     * @tc.desc      newsLoadingText(newsDataListIndex=80) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0022 begin`);
      const actual: string = newsLoadingText(80);
      logInfo(`newsLoadingText(newsDataListIndex=80): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0023
     * @tc.name      PullToRefresh_NewsLoadingText_0023
     * @tc.desc      newsLoadingText(newsDataListIndex=85) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0023 begin`);
      const actual: string = newsLoadingText(85);
      logInfo(`newsLoadingText(newsDataListIndex=85): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0024
     * @tc.name      PullToRefresh_NewsLoadingText_0024
     * @tc.desc      newsLoadingText(newsDataListIndex=90) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0024 begin`);
      const actual: string = newsLoadingText(90);
      logInfo(`newsLoadingText(newsDataListIndex=90): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0025
     * @tc.name      PullToRefresh_NewsLoadingText_0025
     * @tc.desc      newsLoadingText(newsDataListIndex=95) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0025 begin`);
      const actual: string = newsLoadingText(95);
      logInfo(`newsLoadingText(newsDataListIndex=95): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0026
     * @tc.name      PullToRefresh_NewsLoadingText_0026
     * @tc.desc      newsLoadingText(newsDataListIndex=105) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0026 begin`);
      const actual: string = newsLoadingText(105);
      logInfo(`newsLoadingText(newsDataListIndex=105): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0027
     * @tc.name      PullToRefresh_NewsLoadingText_0027
     * @tc.desc      newsLoadingText(newsDataListIndex=110) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0027 begin`);
      const actual: string = newsLoadingText(110);
      logInfo(`newsLoadingText(newsDataListIndex=110): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0028
     * @tc.name      PullToRefresh_NewsLoadingText_0028
     * @tc.desc      newsLoadingText(newsDataListIndex=115) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0028 begin`);
      const actual: string = newsLoadingText(115);
      logInfo(`newsLoadingText(newsDataListIndex=115): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0029
     * @tc.name      PullToRefresh_NewsLoadingText_0029
     * @tc.desc      newsLoadingText(newsDataListIndex=120) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0029 begin`);
      const actual: string = newsLoadingText(120);
      logInfo(`newsLoadingText(newsDataListIndex=120): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_LOADING_TEXT_0030
     * @tc.name      PullToRefresh_NewsLoadingText_0030
     * @tc.desc      newsLoadingText(newsDataListIndex=125) returns "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsLoadingText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsLoadingText_0030 begin`);
      const actual: string = newsLoadingText(125);
      logInfo(`newsLoadingText(newsDataListIndex=125): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}NewsLoadingText_0030 end`);
    });
  });
}
