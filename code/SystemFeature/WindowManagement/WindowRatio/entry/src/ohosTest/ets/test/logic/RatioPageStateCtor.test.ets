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
import { RatioPageState } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new RatioPageState (1 cases). */
export default function ratioPageStateCtorTest(): void {
  describe('RatioPageStateCtorTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_CTOR_0001
     * @tc.name      WindowRatio_RatioPageStateCtor_0001
     * @tc.desc      new RatioPageState() initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioPageStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioPageStateCtor_0001 begin`);
      const subject: RatioPageState = new RatioPageState();
      logInfo(`new RatioPageState(): subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(0);
      logInfo(`new RatioPageState(): subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.3333333333333333, PRECISION);
      logInfo(`new RatioPageState(): subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('4:3');
      logInfo(`new RatioPageState(): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('unknown');
      logInfo(`new RatioPageState(): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('unknown');
      logInfo(`new RatioPageState(): subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(0);
      logInfo(`${BUNDLE}RatioPageStateCtor_0001 end`);
    });
  });
}
