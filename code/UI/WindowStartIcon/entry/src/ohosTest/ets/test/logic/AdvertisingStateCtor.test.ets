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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AdvertisingState } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new AdvertisingState (1 cases). */
export default function advertisingStateCtorTest(): void {
  describe('AdvertisingStateCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_CTOR_0001
     * @tc.name      WindowStartIcon_AdvertisingStateCtor_0001
     * @tc.desc      new AdvertisingState() initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_AdvertisingStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AdvertisingStateCtor_0001 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      logInfo(`new AdvertisingState(): subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(6);
      logInfo(`new AdvertisingState(): subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertFalse();
      logInfo(`new AdvertisingState(): subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertFalse();
      logInfo(`new AdvertisingState(): subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('');
      logInfo(`new AdvertisingState(): subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(0);
      logInfo(`${BUNDLE}AdvertisingStateCtor_0001 end`);
    });
  });
}
