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

/** Logic checks for AdvertisingState flow (6 cases). */
export default function advertisingStateFlow16Test(): void {
  describe('AdvertisingStateFlow16Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0754
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0754
     * @tc.desc      AdvertisingState call flow show > skip > tick > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0754', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0754 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.leave();
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`show>skip>tick>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>skip>tick>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0754 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0755
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0755
     * @tc.desc      AdvertisingState call flow skip > show > leave > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0755', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0755 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.leave();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      logInfo(`skip>show>leave>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>leave>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0755 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0756
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0756
     * @tc.desc      AdvertisingState call flow tick > tick > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0756', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0756 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`tick>tick>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>tick>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0756 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0757
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0757
     * @tc.desc      AdvertisingState call flow leave > skip > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0757', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0757 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`leave>skip>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>skip>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>skip>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>skip>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0757 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0758
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0758
     * @tc.desc      AdvertisingState call flow show > leave > show > skip > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0758', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0758 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`show>leave>show>skip>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>leave>show>skip>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0758 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0759
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0759
     * @tc.desc      AdvertisingState call flow tick > show > skip > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0759', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0759 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`tick>show>skip>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>show>skip>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`tick>show>skip>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`tick>show>skip>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0759 end`);
    });
  });
}
