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

/** Logic checks for AdvertisingState flow (48 cases). */
export default function advertisingStateFlow15Test(): void {
  describe('AdvertisingStateFlow15Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0706
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0706
     * @tc.desc      AdvertisingState call flow text > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0706', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0706 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      subject.leave();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      logInfo(`text>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0706 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0707
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0707
     * @tc.desc      AdvertisingState call flow show > show > tick > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0707', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0707 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('5');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('5');
      logInfo(`show>show>tick>text>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`show>show>tick>text>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>show>tick>text>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>show>tick>text>text final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0707 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0708
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0708
     * @tc.desc      AdvertisingState call flow show > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0708', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0708 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('5');
      logInfo(`show>tick>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`show>tick>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>tick>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>tick>text final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0708 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0709
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0709
     * @tc.desc      AdvertisingState call flow leave > show > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0709', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0709 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`leave>show>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>show>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>show>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>show>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0709 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0710
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0710
     * @tc.desc      AdvertisingState call flow show > tick > tick > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0710', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0710 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(4);
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`show>tick>tick>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(3);
      logInfo(`show>tick>tick>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>tick>tick>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>tick>tick>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(3);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0710 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0711
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0711
     * @tc.desc      AdvertisingState call flow skip > leave > tick > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0711', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0711 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      subject.leave();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`skip>leave>tick>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>leave>tick>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>leave>tick>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>leave>tick>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0711 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0712
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0712
     * @tc.desc      AdvertisingState call flow show > show > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0712', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0712 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`show>show>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>show>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`show>show>tick>skip final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0712 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0713
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0713
     * @tc.desc      AdvertisingState call flow tick > text > skip > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0713', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0713 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`tick>text>skip>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>text>skip>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0713 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0714
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0714
     * @tc.desc      AdvertisingState call flow show > leave > text > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0714', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0714 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.leave();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`show>leave>text>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>leave>text>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0714 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0715
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0715
     * @tc.desc      AdvertisingState call flow leave > tick > tick > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0715', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0715 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`leave>tick>tick>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>tick>tick>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>tick>tick>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0715 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0716
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0716
     * @tc.desc      AdvertisingState call flow tick > skip > skip > text > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0716', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0716 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      subject.leave();
      logInfo(`tick>skip>skip>text>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>skip>skip>text>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0716 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0717
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0717
     * @tc.desc      AdvertisingState call flow skip > show > show > show > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0717', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0717 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`skip>show>show>show>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>show>show>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0717 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0718
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0718
     * @tc.desc      AdvertisingState call flow tick > tick > text > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0718', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0718 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`tick>tick>text>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>tick>text>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0718 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0719
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0719
     * @tc.desc      AdvertisingState call flow text > skip > text > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0719', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0719 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('0');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`text>skip>text>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>skip>text>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0719 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0720
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0720
     * @tc.desc      AdvertisingState call flow leave > skip > skip > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0720', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0720 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`leave>skip>skip>tick>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>skip>skip>tick>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0720 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0721
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0721
     * @tc.desc      AdvertisingState call flow text > show > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0721', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0721 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`text>show>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>show>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`text>show>tick>skip final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0721 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0722
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0722
     * @tc.desc      AdvertisingState call flow skip > skip > leave > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0722', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0722 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      subject.leave();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`skip>skip>leave>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(-1);
      logInfo(`skip>skip>leave>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>skip>leave>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>skip>leave>show>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`skip>skip>leave>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0722 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0723
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0723
     * @tc.desc      AdvertisingState call flow skip > show > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0723', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0723 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`skip>show>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>show>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>show>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0723 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0724
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0724
     * @tc.desc      AdvertisingState call flow show > skip > show > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0724', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0724 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.leave();
      logInfo(`show>skip>show>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>skip>show>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0724 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0725
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0725
     * @tc.desc      AdvertisingState call flow skip > skip > tick > leave > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0725', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0725 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.leave();
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`skip>skip>tick>leave>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>skip>tick>leave>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0725 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0726
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0726
     * @tc.desc      AdvertisingState call flow show > leave > leave > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0726', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0726 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.leave();
      subject.leave();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`show>leave>leave>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>leave>leave>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0726 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0727
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0727
     * @tc.desc      AdvertisingState call flow show > tick > text > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0727', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0727 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('5');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`show>tick>text>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>tick>text>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`show>tick>text>skip>text final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0727 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0728
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0728
     * @tc.desc      AdvertisingState call flow skip > text > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0728', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0728 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('0');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`skip>text>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0728 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0729
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0729
     * @tc.desc      AdvertisingState call flow show > text > skip > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0729', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0729 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`show>text>skip>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>text>skip>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>text>skip>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>text>skip>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0729 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0730
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0730
     * @tc.desc      AdvertisingState call flow skip > leave > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0730', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0730 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      subject.leave();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`skip>leave>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>leave>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0730 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0731
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0731
     * @tc.desc      AdvertisingState call flow tick > text > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0731', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0731 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tick>text>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`tick>text>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0731 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0732
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0732
     * @tc.desc      AdvertisingState call flow tick > text > show > tick > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0732', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0732 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`tick>text>show>tick>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(4);
      logInfo(`tick>text>show>tick>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`tick>text>show>tick>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`tick>text>show>tick>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(2);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0732 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0733
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0733
     * @tc.desc      AdvertisingState call flow show > text > show > show > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0733', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0733 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('6');
      logInfo(`show>text>show>show>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>text>show>show>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0733 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0734
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0734
     * @tc.desc      AdvertisingState call flow tick > leave > show > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0734', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0734 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`tick>leave>show>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>leave>show>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0734 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0735
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0735
     * @tc.desc      AdvertisingState call flow leave > tick > show > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0735', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0735 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`leave>tick>show>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>tick>show>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0735 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0736
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0736
     * @tc.desc      AdvertisingState call flow show > show > skip > leave > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0736', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0736 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      subject.leave();
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`show>show>skip>leave>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>show>skip>leave>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0736 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0737
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0737
     * @tc.desc      AdvertisingState call flow leave > leave > text > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0737', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0737 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`leave>leave>text>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>leave>text>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0737 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0738
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0738
     * @tc.desc      AdvertisingState call flow skip > leave > show > text > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0738', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0738 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`skip>leave>show>text>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>leave>show>text>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0738 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0739
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0739
     * @tc.desc      AdvertisingState call flow show > leave > text > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0739', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0739 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.leave();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`show>leave>text>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>leave>text>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0739 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0740
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0740
     * @tc.desc      AdvertisingState call flow skip > text > text > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0740', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0740 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('0');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('0');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`skip>text>text>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>text>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0740 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0741
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0741
     * @tc.desc      AdvertisingState call flow leave > show > skip > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0741', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0741 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`leave>show>skip>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>show>skip>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0741 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0742
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0742
     * @tc.desc      AdvertisingState call flow show > show > leave > leave > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0742', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0742 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.leave();
      subject.leave();
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`show>show>leave>leave>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>show>leave>leave>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>show>leave>leave>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0742 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0743
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0743
     * @tc.desc      AdvertisingState call flow tick > tick > skip > tick > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0743', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0743 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.leave();
      logInfo(`tick>tick>skip>tick>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>tick>skip>tick>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0743 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0744
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0744
     * @tc.desc      AdvertisingState call flow text > text > tick > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0744', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0744 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`text>text>tick>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>text>tick>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0744 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0745
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0745
     * @tc.desc      AdvertisingState call flow show > tick > text > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0745', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0745 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('5');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`show>tick>text>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`show>tick>text>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>tick>text>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>tick>text>show final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0745 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0746
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0746
     * @tc.desc      AdvertisingState call flow text > tick > skip > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0746', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0746 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`text>tick>skip>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>tick>skip>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>tick>skip>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`text>tick>skip>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0746 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0747
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0747
     * @tc.desc      AdvertisingState call flow text > text > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0747', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0747 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`text>text>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>text>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0747 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0748
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0748
     * @tc.desc      AdvertisingState call flow show > tick > tick > tick > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0748', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0748 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(4);
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(3);
      subject.leave();
      logInfo(`show>tick>tick>tick>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(3);
      logInfo(`show>tick>tick>tick>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`show>tick>tick>tick>leave final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(3);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0748 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0749
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0749
     * @tc.desc      AdvertisingState call flow skip > tick > tick > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0749', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0749 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`skip>tick>tick>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>tick>tick>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>tick>tick>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>tick>tick>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0749 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0750
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0750
     * @tc.desc      AdvertisingState call flow text > text > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0750', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0750 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`text>text>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>text>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0750 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0751
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0751
     * @tc.desc      AdvertisingState call flow show > tick > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0751', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0751 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`show>tick>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>tick>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`show>tick>skip>skip final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0751 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0752
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0752
     * @tc.desc      AdvertisingState call flow skip > text > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0752', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0752 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('0');
      subject.leave();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`skip>text>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0752 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0753
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0753
     * @tc.desc      AdvertisingState call flow leave > tick > tick > tick > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0753', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0753 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`leave>tick>tick>tick>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0753 end`);
    });
  });
}
