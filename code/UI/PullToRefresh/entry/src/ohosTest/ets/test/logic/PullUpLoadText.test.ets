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
import { pullUpLoadText } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for pullUpLoadText (59 cases). */
export default function pullUpLoadTextTest(): void {
  describe('PullUpLoadTextTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0001
     * @tc.name      PullToRefresh_PullUpLoadText_0001
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullUpLoadText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0001 begin`);
      const actual: string = pullUpLoadText(-100, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0002
     * @tc.name      PullToRefresh_PullUpLoadText_0002
     * @tc.desc      pullUpLoadText(trYBottom=0.75, loadImgHeight=0, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullUpLoadText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0002 begin`);
      const actual: string = pullUpLoadText(0.75, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=0.75, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0003
     * @tc.name      PullToRefresh_PullUpLoadText_0003
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=0.375) returns "??????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0003 begin`);
      const actual: string = pullUpLoadText(-100, 0, 0.375);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u4e0a\u62c9\u5237\u65b0...');
      logInfo(`${BUNDLE}PullUpLoadText_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0004
     * @tc.name      PullToRefresh_PullUpLoadText_0004
     * @tc.desc      pullUpLoadText(trYBottom=-1, loadImgHeight=0, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0004 begin`);
      const actual: string = pullUpLoadText(-1, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-1, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0005
     * @tc.name      PullToRefresh_PullUpLoadText_0005
     * @tc.desc      pullUpLoadText(trYBottom=1.5, loadImgHeight=0, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0005 begin`);
      const actual: string = pullUpLoadText(1.5, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=1.5, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0006
     * @tc.name      PullToRefresh_PullUpLoadText_0006
     * @tc.desc      pullUpLoadText(trYBottom=0.375, loadImgHeight=0, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0006 begin`);
      const actual: string = pullUpLoadText(0.375, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=0.375, loadImgHe...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0007
     * @tc.name      PullToRefresh_PullUpLoadText_0007
     * @tc.desc      pullUpLoadText(trYBottom=0, loadImgHeight=0, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0007 begin`);
      const actual: string = pullUpLoadText(0, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=0, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0008
     * @tc.name      PullToRefresh_PullUpLoadText_0008
     * @tc.desc      pullUpLoadText(trYBottom=1, loadImgHeight=0, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0008 begin`);
      const actual: string = pullUpLoadText(1, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0009
     * @tc.name      PullToRefresh_PullUpLoadText_0009
     * @tc.desc      pullUpLoadText(trYBottom=50, loadImgHeight=0, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0009 begin`);
      const actual: string = pullUpLoadText(50, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=50, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0010
     * @tc.name      PullToRefresh_PullUpLoadText_0010
     * @tc.desc      pullUpLoadText(trYBottom=100, loadImgHeight=0, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0010 begin`);
      const actual: string = pullUpLoadText(100, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0011
     * @tc.name      PullToRefresh_PullUpLoadText_0011
     * @tc.desc      pullUpLoadText(trYBottom=2, loadImgHeight=0, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0011 begin`);
      const actual: string = pullUpLoadText(2, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=2, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0012
     * @tc.name      PullToRefresh_PullUpLoadText_0012
     * @tc.desc      pullUpLoadText(trYBottom=3, loadImgHeight=0, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0012 begin`);
      const actual: string = pullUpLoadText(3, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=3, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0013
     * @tc.name      PullToRefresh_PullUpLoadText_0013
     * @tc.desc      pullUpLoadText(trYBottom=10, loadImgHeight=0, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0013 begin`);
      const actual: string = pullUpLoadText(10, 0, 0.75);
      logInfo(`pullUpLoadText(trYBottom=10, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0014
     * @tc.name      PullToRefresh_PullUpLoadText_0014
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=1, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0014 begin`);
      const actual: string = pullUpLoadText(-100, 1, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0015
     * @tc.name      PullToRefresh_PullUpLoadText_0015
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0.75, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0015 begin`);
      const actual: string = pullUpLoadText(-100, 0.75, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0016
     * @tc.name      PullToRefresh_PullUpLoadText_0016
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=1.5, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0016 begin`);
      const actual: string = pullUpLoadText(-100, 1.5, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0017
     * @tc.name      PullToRefresh_PullUpLoadText_0017
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0.375, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0017 begin`);
      const actual: string = pullUpLoadText(-100, 0.375, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0018
     * @tc.name      PullToRefresh_PullUpLoadText_0018
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=100, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0018 begin`);
      const actual: string = pullUpLoadText(-100, 100, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0019
     * @tc.name      PullToRefresh_PullUpLoadText_0019
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=360, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0019 begin`);
      const actual: string = pullUpLoadText(-100, 360, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0020
     * @tc.name      PullToRefresh_PullUpLoadText_0020
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=720, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0020 begin`);
      const actual: string = pullUpLoadText(-100, 720, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0021
     * @tc.name      PullToRefresh_PullUpLoadText_0021
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=1080, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0021 begin`);
      const actual: string = pullUpLoadText(-100, 1080, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0022
     * @tc.name      PullToRefresh_PullUpLoadText_0022
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=1920, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0022 begin`);
      const actual: string = pullUpLoadText(-100, 1920, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0023
     * @tc.name      PullToRefresh_PullUpLoadText_0023
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=-1, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0023 begin`);
      const actual: string = pullUpLoadText(-100, -1, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0024
     * @tc.name      PullToRefresh_PullUpLoadText_0024
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=2, value=0.75) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0024 begin`);
      const actual: string = pullUpLoadText(-100, 2, 0.75);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0025
     * @tc.name      PullToRefresh_PullUpLoadText_0025
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=1.5) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0025 begin`);
      const actual: string = pullUpLoadText(-100, 0, 1.5);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0026
     * @tc.name      PullToRefresh_PullUpLoadText_0026
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=0) returns "??????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0026 begin`);
      const actual: string = pullUpLoadText(-100, 0, 0);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u4e0a\u62c9\u5237\u65b0...');
      logInfo(`${BUNDLE}PullUpLoadText_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0027
     * @tc.name      PullToRefresh_PullUpLoadText_0027
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=1) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0027 begin`);
      const actual: string = pullUpLoadText(-100, 0, 1);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0028
     * @tc.name      PullToRefresh_PullUpLoadText_0028
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=-1) returns "??????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0028 begin`);
      const actual: string = pullUpLoadText(-100, 0, -1);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u4e0a\u62c9\u5237\u65b0...');
      logInfo(`${BUNDLE}PullUpLoadText_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0029
     * @tc.name      PullToRefresh_PullUpLoadText_0029
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=2) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0029 begin`);
      const actual: string = pullUpLoadText(-100, 0, 2);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0030
     * @tc.name      PullToRefresh_PullUpLoadText_0030
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=3) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0030 begin`);
      const actual: string = pullUpLoadText(-100, 0, 3);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0031
     * @tc.name      PullToRefresh_PullUpLoadText_0031
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=10) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0031 begin`);
      const actual: string = pullUpLoadText(-100, 0, 10);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0032
     * @tc.name      PullToRefresh_PullUpLoadText_0032
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=100) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0032 begin`);
      const actual: string = pullUpLoadText(-100, 0, 100);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0033
     * @tc.name      PullToRefresh_PullUpLoadText_0033
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=5) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0033 begin`);
      const actual: string = pullUpLoadText(-100, 0, 5);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0034
     * @tc.name      PullToRefresh_PullUpLoadText_0034
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0, value=23) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0034 begin`);
      const actual: string = pullUpLoadText(-100, 0, 23);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0035
     * @tc.name      PullToRefresh_PullUpLoadText_0035
     * @tc.desc      pullUpLoadText(trYBottom=0, loadImgHeight=360, value=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpLoadText_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0035 begin`);
      const actual: string = pullUpLoadText(0, 360, 10);
      logInfo(`pullUpLoadText(trYBottom=0, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0036
     * @tc.name      PullToRefresh_PullUpLoadText_0036
     * @tc.desc      pullUpLoadText(trYBottom=100, loadImgHeight=0.75, value=1.5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0036 begin`);
      const actual: string = pullUpLoadText(100, 0.75, 1.5);
      logInfo(`pullUpLoadText(trYBottom=100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0037
     * @tc.name      PullToRefresh_PullUpLoadText_0037
     * @tc.desc      pullUpLoadText(trYBottom=0.75, loadImgHeight=1.5, value=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0037 begin`);
      const actual: string = pullUpLoadText(0.75, 1.5, 5);
      logInfo(`pullUpLoadText(trYBottom=0.75, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0038
     * @tc.name      PullToRefresh_PullUpLoadText_0038
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0.75, value=1.5) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0038 begin`);
      const actual: string = pullUpLoadText(-100, 0.75, 1.5);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0039
     * @tc.name      PullToRefresh_PullUpLoadText_0039
     * @tc.desc      pullUpLoadText(trYBottom=10, loadImgHeight=720, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0039 begin`);
      const actual: string = pullUpLoadText(10, 720, 0.75);
      logInfo(`pullUpLoadText(trYBottom=10, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0040
     * @tc.name      PullToRefresh_PullUpLoadText_0040
     * @tc.desc      pullUpLoadText(trYBottom=50, loadImgHeight=2, value=0.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0040 begin`);
      const actual: string = pullUpLoadText(50, 2, 0.75);
      logInfo(`pullUpLoadText(trYBottom=50, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0041
     * @tc.name      PullToRefresh_PullUpLoadText_0041
     * @tc.desc      pullUpLoadText(trYBottom=0, loadImgHeight=-1, value=10) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0041 begin`);
      const actual: string = pullUpLoadText(0, -1, 10);
      logInfo(`pullUpLoadText(trYBottom=0, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0042
     * @tc.name      PullToRefresh_PullUpLoadText_0042
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=0.75, value=23) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0042 begin`);
      const actual: string = pullUpLoadText(-100, 0.75, 23);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0043
     * @tc.name      PullToRefresh_PullUpLoadText_0043
     * @tc.desc      pullUpLoadText(trYBottom=1, loadImgHeight=1.5, value=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0043 begin`);
      const actual: string = pullUpLoadText(1, 1.5, -1);
      logInfo(`pullUpLoadText(trYBottom=1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0044
     * @tc.name      PullToRefresh_PullUpLoadText_0044
     * @tc.desc      pullUpLoadText(trYBottom=-1, loadImgHeight=1080, value=0.375) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0044 begin`);
      const actual: string = pullUpLoadText(-1, 1080, 0.375);
      logInfo(`pullUpLoadText(trYBottom=-1, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0045
     * @tc.name      PullToRefresh_PullUpLoadText_0045
     * @tc.desc      pullUpLoadText(trYBottom=10, loadImgHeight=1920, value=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpLoadText_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0045 begin`);
      const actual: string = pullUpLoadText(10, 1920, 1);
      logInfo(`pullUpLoadText(trYBottom=10, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0046
     * @tc.name      PullToRefresh_PullUpLoadText_0046
     * @tc.desc      pullUpLoadText(trYBottom=-1, loadImgHeight=1.5, value=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0046 begin`);
      const actual: string = pullUpLoadText(-1, 1.5, -1);
      logInfo(`pullUpLoadText(trYBottom=-1, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0047
     * @tc.name      PullToRefresh_PullUpLoadText_0047
     * @tc.desc      pullUpLoadText(trYBottom=-1, loadImgHeight=720, value=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0047 begin`);
      const actual: string = pullUpLoadText(-1, 720, 100);
      logInfo(`pullUpLoadText(trYBottom=-1, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0048
     * @tc.name      PullToRefresh_PullUpLoadText_0048
     * @tc.desc      pullUpLoadText(trYBottom=100, loadImgHeight=360, value=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpLoadText_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0048 begin`);
      const actual: string = pullUpLoadText(100, 360, 0);
      logInfo(`pullUpLoadText(trYBottom=100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0049
     * @tc.name      PullToRefresh_PullUpLoadText_0049
     * @tc.desc      pullUpLoadText(trYBottom=0.375, loadImgHeight=2, value=0.375) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpLoadText_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0049 begin`);
      const actual: string = pullUpLoadText(0.375, 2, 0.375);
      logInfo(`pullUpLoadText(trYBottom=0.375, loadImgHe...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0050
     * @tc.name      PullToRefresh_PullUpLoadText_0050
     * @tc.desc      pullUpLoadText(trYBottom=1.5, loadImgHeight=0.75, value=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpLoadText_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0050 begin`);
      const actual: string = pullUpLoadText(1.5, 0.75, 10);
      logInfo(`pullUpLoadText(trYBottom=1.5, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0051
     * @tc.name      PullToRefresh_PullUpLoadText_0051
     * @tc.desc      pullUpLoadText(trYBottom=100, loadImgHeight=100, value=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpLoadText_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0051 begin`);
      const actual: string = pullUpLoadText(100, 100, 100);
      logInfo(`pullUpLoadText(trYBottom=100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0052
     * @tc.name      PullToRefresh_PullUpLoadText_0052
     * @tc.desc      pullUpLoadText(trYBottom=-100, loadImgHeight=2, value=3) returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0052 begin`);
      const actual: string = pullUpLoadText(-100, 2, 3);
      logInfo(`pullUpLoadText(trYBottom=-100, loadImgHei...: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullUpLoadText_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0053
     * @tc.name      PullToRefresh_PullUpLoadText_0053
     * @tc.desc      pullUpLoadText(trYBottom=100, loadImgHeight=0.375, value=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpLoadText_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0053 begin`);
      const actual: string = pullUpLoadText(100, 0.375, 2);
      logInfo(`pullUpLoadText(trYBottom=100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0054
     * @tc.name      PullToRefresh_PullUpLoadText_0054
     * @tc.desc      pullUpLoadText(trYBottom=2, loadImgHeight=1, value=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpLoadText_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0054 begin`);
      const actual: string = pullUpLoadText(2, 1, 0);
      logInfo(`pullUpLoadText(trYBottom=2, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0055
     * @tc.name      PullToRefresh_PullUpLoadText_0055
     * @tc.desc      pullUpLoadText(trYBottom=-1, loadImgHeight=1, value=0.375) returns "??????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0055 begin`);
      const actual: string = pullUpLoadText(-1, 1, 0.375);
      logInfo(`pullUpLoadText(trYBottom=-1, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u4e0a\u62c9\u5237\u65b0...');
      logInfo(`${BUNDLE}PullUpLoadText_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0056
     * @tc.name      PullToRefresh_PullUpLoadText_0056
     * @tc.desc      pullUpLoadText(trYBottom=-1, loadImgHeight=360, value=1.5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0056 begin`);
      const actual: string = pullUpLoadText(-1, 360, 1.5);
      logInfo(`pullUpLoadText(trYBottom=-1, loadImgHeigh...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0057
     * @tc.name      PullToRefresh_PullUpLoadText_0057
     * @tc.desc      pullUpLoadText(trYBottom=100, loadImgHeight=0, value=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpLoadText_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0057 begin`);
      const actual: string = pullUpLoadText(100, 0, 5);
      logInfo(`pullUpLoadText(trYBottom=100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0058
     * @tc.name      PullToRefresh_PullUpLoadText_0058
     * @tc.desc      pullUpLoadText(trYBottom=1, loadImgHeight=0.75, value=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpLoadText_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0058 begin`);
      const actual: string = pullUpLoadText(1, 0.75, -1);
      logInfo(`pullUpLoadText(trYBottom=1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_LOAD_TEXT_0059
     * @tc.name      PullToRefresh_PullUpLoadText_0059
     * @tc.desc      pullUpLoadText(trYBottom=0.375, loadImgHeight=360, value=0.375) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpLoadText_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpLoadText_0059 begin`);
      const actual: string = pullUpLoadText(0.375, 360, 0.375);
      logInfo(`pullUpLoadText(trYBottom=0.375, loadImgHe...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}PullUpLoadText_0059 end`);
    });
  });
}
