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

/** Logic checks for AdvertisingState.leave (1 cases). */
export default function advertisingStateLeaveTest(): void {
  describe('AdvertisingStateLeaveTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_LEAVE_0001
     * @tc.name      WindowStartIcon_AdvertisingStateLeave_0001
     * @tc.desc      AdvertisingState.leave() yields "pages/Index"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_AdvertisingStateLeave_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AdvertisingStateLeave_0001 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      logInfo(`leave() state: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateLeave_0001 end`);
    });
  });
}
