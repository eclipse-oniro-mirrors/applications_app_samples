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
import { Configure } from '../../../../main/ets/pages/Configure';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for Configure (5 cases). */
export default function configureValuesTest(): void {
  describe('ConfigureValuesTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_VALUES_0001
     * @tc.name      ExpandTitle_ConfigureValues_0001
     * @tc.desc      Configure.NORMAL_TITLE_HEIGHT keeps value 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ConfigureValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigureValues_0001 begin`);
      const actual: number = Configure.NORMAL_TITLE_HEIGHT;
      logInfo(`Configure.NORMAL_TITLE_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}ConfigureValues_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_VALUES_0002
     * @tc.name      ExpandTitle_ConfigureValues_0002
     * @tc.desc      Configure.EXPAND_TITLE_HEIGHT keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ConfigureValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigureValues_0002 begin`);
      const actual: number = Configure.EXPAND_TITLE_HEIGHT;
      logInfo(`Configure.EXPAND_TITLE_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ConfigureValues_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_VALUES_0003
     * @tc.name      ExpandTitle_ConfigureValues_0003
     * @tc.desc      Configure.CONTINUE_PULL_THRESHOLD keeps value 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConfigureValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigureValues_0003 begin`);
      const actual: number = Configure.CONTINUE_PULL_THRESHOLD;
      logInfo(`Configure.CONTINUE_PULL_THRESHOLD: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}ConfigureValues_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_VALUES_0004
     * @tc.name      ExpandTitle_ConfigureValues_0004
     * @tc.desc      Configure.ANIMATION_DURATION keeps value 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConfigureValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigureValues_0004 begin`);
      const actual: number = Configure.ANIMATION_DURATION;
      logInfo(`Configure.ANIMATION_DURATION: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}ConfigureValues_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_CONFIGURE_VALUES_0005
     * @tc.name      ExpandTitle_ConfigureValues_0005
     * @tc.desc      Configure.TITLE_SCALE_MAX_VALUE keeps value 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ConfigureValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigureValues_0005 begin`);
      const actual: number = Configure.TITLE_SCALE_MAX_VALUE;
      logInfo(`Configure.TITLE_SCALE_MAX_VALUE: actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}ConfigureValues_0005 end`);
    });
  });
}
