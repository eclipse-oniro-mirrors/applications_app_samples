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
import { newsPullUpText } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for newsPullUpText (50 cases). */
export default function newsPullUpTextTest(): void {
  describe('NewsPullUpTextTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0001
     * @tc.name      PullToRefresh_NewsPullUpText_0001
     * @tc.desc      newsPullUpText(value=0) returns "??????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsPullUpText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0001 begin`);
      const actual: string = newsPullUpText(0);
      logInfo(`newsPullUpText(value=0): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u4e0a\u62c9\u5237\u65b0...');
      logInfo(`${BUNDLE}NewsPullUpText_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0002
     * @tc.name      PullToRefresh_NewsPullUpText_0002
     * @tc.desc      newsPullUpText(value=1) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsPullUpText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0002 begin`);
      const actual: string = newsPullUpText(1);
      logInfo(`newsPullUpText(value=1): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0003
     * @tc.name      PullToRefresh_NewsPullUpText_0003
     * @tc.desc      newsPullUpText(value=-1) returns "??????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NewsPullUpText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0003 begin`);
      const actual: string = newsPullUpText(-1);
      logInfo(`newsPullUpText(value=-1): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u4e0a\u62c9\u5237\u65b0...');
      logInfo(`${BUNDLE}NewsPullUpText_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0004
     * @tc.name      PullToRefresh_NewsPullUpText_0004
     * @tc.desc      newsPullUpText(value=2) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0004 begin`);
      const actual: string = newsPullUpText(2);
      logInfo(`newsPullUpText(value=2): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0005
     * @tc.name      PullToRefresh_NewsPullUpText_0005
     * @tc.desc      newsPullUpText(value=3) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0005 begin`);
      const actual: string = newsPullUpText(3);
      logInfo(`newsPullUpText(value=3): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0006
     * @tc.name      PullToRefresh_NewsPullUpText_0006
     * @tc.desc      newsPullUpText(value=10) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0006 begin`);
      const actual: string = newsPullUpText(10);
      logInfo(`newsPullUpText(value=10): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0007
     * @tc.name      PullToRefresh_NewsPullUpText_0007
     * @tc.desc      newsPullUpText(value=100) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0007 begin`);
      const actual: string = newsPullUpText(100);
      logInfo(`newsPullUpText(value=100): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0008
     * @tc.name      PullToRefresh_NewsPullUpText_0008
     * @tc.desc      newsPullUpText(value=5) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0008 begin`);
      const actual: string = newsPullUpText(5);
      logInfo(`newsPullUpText(value=5): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0009
     * @tc.name      PullToRefresh_NewsPullUpText_0009
     * @tc.desc      newsPullUpText(value=15) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0009 begin`);
      const actual: string = newsPullUpText(15);
      logInfo(`newsPullUpText(value=15): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0010
     * @tc.name      PullToRefresh_NewsPullUpText_0010
     * @tc.desc      newsPullUpText(value=20) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0010 begin`);
      const actual: string = newsPullUpText(20);
      logInfo(`newsPullUpText(value=20): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0011
     * @tc.name      PullToRefresh_NewsPullUpText_0011
     * @tc.desc      newsPullUpText(value=25) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0011 begin`);
      const actual: string = newsPullUpText(25);
      logInfo(`newsPullUpText(value=25): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0012
     * @tc.name      PullToRefresh_NewsPullUpText_0012
     * @tc.desc      newsPullUpText(value=30) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0012 begin`);
      const actual: string = newsPullUpText(30);
      logInfo(`newsPullUpText(value=30): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0013
     * @tc.name      PullToRefresh_NewsPullUpText_0013
     * @tc.desc      newsPullUpText(value=35) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0013 begin`);
      const actual: string = newsPullUpText(35);
      logInfo(`newsPullUpText(value=35): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0014
     * @tc.name      PullToRefresh_NewsPullUpText_0014
     * @tc.desc      newsPullUpText(value=40) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0014 begin`);
      const actual: string = newsPullUpText(40);
      logInfo(`newsPullUpText(value=40): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0015
     * @tc.name      PullToRefresh_NewsPullUpText_0015
     * @tc.desc      newsPullUpText(value=45) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0015 begin`);
      const actual: string = newsPullUpText(45);
      logInfo(`newsPullUpText(value=45): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0016
     * @tc.name      PullToRefresh_NewsPullUpText_0016
     * @tc.desc      newsPullUpText(value=50) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0016 begin`);
      const actual: string = newsPullUpText(50);
      logInfo(`newsPullUpText(value=50): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0017
     * @tc.name      PullToRefresh_NewsPullUpText_0017
     * @tc.desc      newsPullUpText(value=55) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0017 begin`);
      const actual: string = newsPullUpText(55);
      logInfo(`newsPullUpText(value=55): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0018
     * @tc.name      PullToRefresh_NewsPullUpText_0018
     * @tc.desc      newsPullUpText(value=60) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0018 begin`);
      const actual: string = newsPullUpText(60);
      logInfo(`newsPullUpText(value=60): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0019
     * @tc.name      PullToRefresh_NewsPullUpText_0019
     * @tc.desc      newsPullUpText(value=65) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0019 begin`);
      const actual: string = newsPullUpText(65);
      logInfo(`newsPullUpText(value=65): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0020
     * @tc.name      PullToRefresh_NewsPullUpText_0020
     * @tc.desc      newsPullUpText(value=70) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0020 begin`);
      const actual: string = newsPullUpText(70);
      logInfo(`newsPullUpText(value=70): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0021
     * @tc.name      PullToRefresh_NewsPullUpText_0021
     * @tc.desc      newsPullUpText(value=75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0021 begin`);
      const actual: string = newsPullUpText(75);
      logInfo(`newsPullUpText(value=75): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0022
     * @tc.name      PullToRefresh_NewsPullUpText_0022
     * @tc.desc      newsPullUpText(value=80) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0022 begin`);
      const actual: string = newsPullUpText(80);
      logInfo(`newsPullUpText(value=80): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0023
     * @tc.name      PullToRefresh_NewsPullUpText_0023
     * @tc.desc      newsPullUpText(value=85) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0023 begin`);
      const actual: string = newsPullUpText(85);
      logInfo(`newsPullUpText(value=85): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0024
     * @tc.name      PullToRefresh_NewsPullUpText_0024
     * @tc.desc      newsPullUpText(value=90) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0024 begin`);
      const actual: string = newsPullUpText(90);
      logInfo(`newsPullUpText(value=90): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0025
     * @tc.name      PullToRefresh_NewsPullUpText_0025
     * @tc.desc      newsPullUpText(value=95) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0025 begin`);
      const actual: string = newsPullUpText(95);
      logInfo(`newsPullUpText(value=95): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0026
     * @tc.name      PullToRefresh_NewsPullUpText_0026
     * @tc.desc      newsPullUpText(value=105) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0026 begin`);
      const actual: string = newsPullUpText(105);
      logInfo(`newsPullUpText(value=105): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0027
     * @tc.name      PullToRefresh_NewsPullUpText_0027
     * @tc.desc      newsPullUpText(value=110) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0027 begin`);
      const actual: string = newsPullUpText(110);
      logInfo(`newsPullUpText(value=110): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0028
     * @tc.name      PullToRefresh_NewsPullUpText_0028
     * @tc.desc      newsPullUpText(value=115) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0028 begin`);
      const actual: string = newsPullUpText(115);
      logInfo(`newsPullUpText(value=115): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0029
     * @tc.name      PullToRefresh_NewsPullUpText_0029
     * @tc.desc      newsPullUpText(value=120) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0029 begin`);
      const actual: string = newsPullUpText(120);
      logInfo(`newsPullUpText(value=120): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0030
     * @tc.name      PullToRefresh_NewsPullUpText_0030
     * @tc.desc      newsPullUpText(value=125) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0030 begin`);
      const actual: string = newsPullUpText(125);
      logInfo(`newsPullUpText(value=125): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0031
     * @tc.name      PullToRefresh_NewsPullUpText_0031
     * @tc.desc      newsPullUpText(value=130) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0031 begin`);
      const actual: string = newsPullUpText(130);
      logInfo(`newsPullUpText(value=130): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0032
     * @tc.name      PullToRefresh_NewsPullUpText_0032
     * @tc.desc      newsPullUpText(value=135) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0032 begin`);
      const actual: string = newsPullUpText(135);
      logInfo(`newsPullUpText(value=135): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0033
     * @tc.name      PullToRefresh_NewsPullUpText_0033
     * @tc.desc      newsPullUpText(value=140) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0033 begin`);
      const actual: string = newsPullUpText(140);
      logInfo(`newsPullUpText(value=140): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0034
     * @tc.name      PullToRefresh_NewsPullUpText_0034
     * @tc.desc      newsPullUpText(value=145) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0034 begin`);
      const actual: string = newsPullUpText(145);
      logInfo(`newsPullUpText(value=145): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0035
     * @tc.name      PullToRefresh_NewsPullUpText_0035
     * @tc.desc      newsPullUpText(value=150) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0035 begin`);
      const actual: string = newsPullUpText(150);
      logInfo(`newsPullUpText(value=150): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0036
     * @tc.name      PullToRefresh_NewsPullUpText_0036
     * @tc.desc      newsPullUpText(value=155) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0036 begin`);
      const actual: string = newsPullUpText(155);
      logInfo(`newsPullUpText(value=155): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0037
     * @tc.name      PullToRefresh_NewsPullUpText_0037
     * @tc.desc      newsPullUpText(value=160) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0037 begin`);
      const actual: string = newsPullUpText(160);
      logInfo(`newsPullUpText(value=160): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0038
     * @tc.name      PullToRefresh_NewsPullUpText_0038
     * @tc.desc      newsPullUpText(value=165) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0038 begin`);
      const actual: string = newsPullUpText(165);
      logInfo(`newsPullUpText(value=165): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0039
     * @tc.name      PullToRefresh_NewsPullUpText_0039
     * @tc.desc      newsPullUpText(value=170) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0039 begin`);
      const actual: string = newsPullUpText(170);
      logInfo(`newsPullUpText(value=170): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0040
     * @tc.name      PullToRefresh_NewsPullUpText_0040
     * @tc.desc      newsPullUpText(value=175) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0040 begin`);
      const actual: string = newsPullUpText(175);
      logInfo(`newsPullUpText(value=175): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0041
     * @tc.name      PullToRefresh_NewsPullUpText_0041
     * @tc.desc      newsPullUpText(value=180) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0041 begin`);
      const actual: string = newsPullUpText(180);
      logInfo(`newsPullUpText(value=180): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0042
     * @tc.name      PullToRefresh_NewsPullUpText_0042
     * @tc.desc      newsPullUpText(value=185) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0042 begin`);
      const actual: string = newsPullUpText(185);
      logInfo(`newsPullUpText(value=185): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0043
     * @tc.name      PullToRefresh_NewsPullUpText_0043
     * @tc.desc      newsPullUpText(value=190) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0043 begin`);
      const actual: string = newsPullUpText(190);
      logInfo(`newsPullUpText(value=190): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0044
     * @tc.name      PullToRefresh_NewsPullUpText_0044
     * @tc.desc      newsPullUpText(value=195) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0044 begin`);
      const actual: string = newsPullUpText(195);
      logInfo(`newsPullUpText(value=195): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0045
     * @tc.name      PullToRefresh_NewsPullUpText_0045
     * @tc.desc      newsPullUpText(value=200) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0045 begin`);
      const actual: string = newsPullUpText(200);
      logInfo(`newsPullUpText(value=200): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0046
     * @tc.name      PullToRefresh_NewsPullUpText_0046
     * @tc.desc      newsPullUpText(value=157) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0046 begin`);
      const actual: string = newsPullUpText(157);
      logInfo(`newsPullUpText(value=157): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0047
     * @tc.name      PullToRefresh_NewsPullUpText_0047
     * @tc.desc      newsPullUpText(value=96.92) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0047 begin`);
      const actual: string = newsPullUpText(96.92);
      logInfo(`newsPullUpText(value=96.92): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0048
     * @tc.name      PullToRefresh_NewsPullUpText_0048
     * @tc.desc      newsPullUpText(value=123) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0048 begin`);
      const actual: string = newsPullUpText(123);
      logInfo(`newsPullUpText(value=123): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0049
     * @tc.name      PullToRefresh_NewsPullUpText_0049
     * @tc.desc      newsPullUpText(value=6) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpText_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0049 begin`);
      const actual: string = newsPullUpText(6);
      logInfo(`newsPullUpText(value=6): actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}NewsPullUpText_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_TEXT_0050
     * @tc.name      PullToRefresh_NewsPullUpText_0050
     * @tc.desc      newsPullUpText(value=-26) returns "??????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NewsPullUpText_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NewsPullUpText_0050 begin`);
      const actual: string = newsPullUpText(-26);
      logInfo(`newsPullUpText(value=-26): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u4e0a\u62c9\u5237\u65b0...');
      logInfo(`${BUNDLE}NewsPullUpText_0050 end`);
    });
  });
}
