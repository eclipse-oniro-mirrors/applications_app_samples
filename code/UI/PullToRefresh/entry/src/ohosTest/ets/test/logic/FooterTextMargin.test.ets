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
import { footerTextMargin } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for footerTextMargin (30 cases). */
export default function footerTextMarginTest(): void {
  describe('FooterTextMarginTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0001
     * @tc.name      PullToRefresh_FooterTextMargin_0001
     * @tc.desc      footerTextMargin(newsDataListIndex=0, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_FooterTextMargin_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0001 begin`);
      const actual: number = footerTextMargin(0, true);
      logInfo(`footerTextMargin(newsDataListIndex=0, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0002
     * @tc.name      PullToRefresh_FooterTextMargin_0002
     * @tc.desc      footerTextMargin(newsDataListIndex=0, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_FooterTextMargin_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0002 begin`);
      const actual: number = footerTextMargin(0, false);
      logInfo(`footerTextMargin(newsDataListIndex=0, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0003
     * @tc.name      PullToRefresh_FooterTextMargin_0003
     * @tc.desc      footerTextMargin(newsDataListIndex=1, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0003 begin`);
      const actual: number = footerTextMargin(1, true);
      logInfo(`footerTextMargin(newsDataListIndex=1, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0004
     * @tc.name      PullToRefresh_FooterTextMargin_0004
     * @tc.desc      footerTextMargin(newsDataListIndex=1, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0004 begin`);
      const actual: number = footerTextMargin(1, false);
      logInfo(`footerTextMargin(newsDataListIndex=1, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0005
     * @tc.name      PullToRefresh_FooterTextMargin_0005
     * @tc.desc      footerTextMargin(newsDataListIndex=-1, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterTextMargin_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0005 begin`);
      const actual: number = footerTextMargin(-1, true);
      logInfo(`footerTextMargin(newsDataListIndex=-1, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0006
     * @tc.name      PullToRefresh_FooterTextMargin_0006
     * @tc.desc      footerTextMargin(newsDataListIndex=-1, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterTextMargin_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0006 begin`);
      const actual: number = footerTextMargin(-1, false);
      logInfo(`footerTextMargin(newsDataListIndex=-1, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0007
     * @tc.name      PullToRefresh_FooterTextMargin_0007
     * @tc.desc      footerTextMargin(newsDataListIndex=8, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterTextMargin_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0007 begin`);
      const actual: number = footerTextMargin(8, true);
      logInfo(`footerTextMargin(newsDataListIndex=8, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0008
     * @tc.name      PullToRefresh_FooterTextMargin_0008
     * @tc.desc      footerTextMargin(newsDataListIndex=8, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterTextMargin_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0008 begin`);
      const actual: number = footerTextMargin(8, false);
      logInfo(`footerTextMargin(newsDataListIndex=8, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0009
     * @tc.name      PullToRefresh_FooterTextMargin_0009
     * @tc.desc      footerTextMargin(newsDataListIndex=7, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterTextMargin_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0009 begin`);
      const actual: number = footerTextMargin(7, true);
      logInfo(`footerTextMargin(newsDataListIndex=7, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0010
     * @tc.name      PullToRefresh_FooterTextMargin_0010
     * @tc.desc      footerTextMargin(newsDataListIndex=7, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterTextMargin_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0010 begin`);
      const actual: number = footerTextMargin(7, false);
      logInfo(`footerTextMargin(newsDataListIndex=7, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0011
     * @tc.name      PullToRefresh_FooterTextMargin_0011
     * @tc.desc      footerTextMargin(newsDataListIndex=9, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterTextMargin_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0011 begin`);
      const actual: number = footerTextMargin(9, true);
      logInfo(`footerTextMargin(newsDataListIndex=9, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0012
     * @tc.name      PullToRefresh_FooterTextMargin_0012
     * @tc.desc      footerTextMargin(newsDataListIndex=9, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterTextMargin_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0012 begin`);
      const actual: number = footerTextMargin(9, false);
      logInfo(`footerTextMargin(newsDataListIndex=9, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0013
     * @tc.name      PullToRefresh_FooterTextMargin_0013
     * @tc.desc      footerTextMargin(newsDataListIndex=2, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0013 begin`);
      const actual: number = footerTextMargin(2, true);
      logInfo(`footerTextMargin(newsDataListIndex=2, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0014
     * @tc.name      PullToRefresh_FooterTextMargin_0014
     * @tc.desc      footerTextMargin(newsDataListIndex=2, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0014 begin`);
      const actual: number = footerTextMargin(2, false);
      logInfo(`footerTextMargin(newsDataListIndex=2, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0015
     * @tc.name      PullToRefresh_FooterTextMargin_0015
     * @tc.desc      footerTextMargin(newsDataListIndex=5, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0015 begin`);
      const actual: number = footerTextMargin(5, true);
      logInfo(`footerTextMargin(newsDataListIndex=5, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0016
     * @tc.name      PullToRefresh_FooterTextMargin_0016
     * @tc.desc      footerTextMargin(newsDataListIndex=5, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0016 begin`);
      const actual: number = footerTextMargin(5, false);
      logInfo(`footerTextMargin(newsDataListIndex=5, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0017
     * @tc.name      PullToRefresh_FooterTextMargin_0017
     * @tc.desc      footerTextMargin(newsDataListIndex=10, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0017 begin`);
      const actual: number = footerTextMargin(10, true);
      logInfo(`footerTextMargin(newsDataListIndex=10, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0018
     * @tc.name      PullToRefresh_FooterTextMargin_0018
     * @tc.desc      footerTextMargin(newsDataListIndex=10, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0018 begin`);
      const actual: number = footerTextMargin(10, false);
      logInfo(`footerTextMargin(newsDataListIndex=10, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0019
     * @tc.name      PullToRefresh_FooterTextMargin_0019
     * @tc.desc      footerTextMargin(newsDataListIndex=3, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0019 begin`);
      const actual: number = footerTextMargin(3, true);
      logInfo(`footerTextMargin(newsDataListIndex=3, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0020
     * @tc.name      PullToRefresh_FooterTextMargin_0020
     * @tc.desc      footerTextMargin(newsDataListIndex=3, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0020 begin`);
      const actual: number = footerTextMargin(3, false);
      logInfo(`footerTextMargin(newsDataListIndex=3, isL...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0021
     * @tc.name      PullToRefresh_FooterTextMargin_0021
     * @tc.desc      footerTextMargin(newsDataListIndex=100, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0021 begin`);
      const actual: number = footerTextMargin(100, true);
      logInfo(`footerTextMargin(newsDataListIndex=100, i...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0022
     * @tc.name      PullToRefresh_FooterTextMargin_0022
     * @tc.desc      footerTextMargin(newsDataListIndex=100, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0022 begin`);
      const actual: number = footerTextMargin(100, false);
      logInfo(`footerTextMargin(newsDataListIndex=100, i...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0023
     * @tc.name      PullToRefresh_FooterTextMargin_0023
     * @tc.desc      footerTextMargin(newsDataListIndex=15, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0023 begin`);
      const actual: number = footerTextMargin(15, true);
      logInfo(`footerTextMargin(newsDataListIndex=15, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0024
     * @tc.name      PullToRefresh_FooterTextMargin_0024
     * @tc.desc      footerTextMargin(newsDataListIndex=15, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0024 begin`);
      const actual: number = footerTextMargin(15, false);
      logInfo(`footerTextMargin(newsDataListIndex=15, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0025
     * @tc.name      PullToRefresh_FooterTextMargin_0025
     * @tc.desc      footerTextMargin(newsDataListIndex=20, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0025 begin`);
      const actual: number = footerTextMargin(20, true);
      logInfo(`footerTextMargin(newsDataListIndex=20, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0026
     * @tc.name      PullToRefresh_FooterTextMargin_0026
     * @tc.desc      footerTextMargin(newsDataListIndex=20, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0026 begin`);
      const actual: number = footerTextMargin(20, false);
      logInfo(`footerTextMargin(newsDataListIndex=20, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0027
     * @tc.name      PullToRefresh_FooterTextMargin_0027
     * @tc.desc      footerTextMargin(newsDataListIndex=25, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0027 begin`);
      const actual: number = footerTextMargin(25, true);
      logInfo(`footerTextMargin(newsDataListIndex=25, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0028
     * @tc.name      PullToRefresh_FooterTextMargin_0028
     * @tc.desc      footerTextMargin(newsDataListIndex=25, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0028 begin`);
      const actual: number = footerTextMargin(25, false);
      logInfo(`footerTextMargin(newsDataListIndex=25, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0029
     * @tc.name      PullToRefresh_FooterTextMargin_0029
     * @tc.desc      footerTextMargin(newsDataListIndex=30, isLoading=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0029 begin`);
      const actual: number = footerTextMargin(30, true);
      logInfo(`footerTextMargin(newsDataListIndex=30, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_TEXT_MARGIN_0030
     * @tc.name      PullToRefresh_FooterTextMargin_0030
     * @tc.desc      footerTextMargin(newsDataListIndex=30, isLoading=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterTextMargin_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterTextMargin_0030 begin`);
      const actual: number = footerTextMargin(30, false);
      logInfo(`footerTextMargin(newsDataListIndex=30, is...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}FooterTextMargin_0030 end`);
    });
  });
}
