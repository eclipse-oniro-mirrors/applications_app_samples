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
export default function advertisingStateFlow11Test(): void {
  describe('AdvertisingStateFlow11Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0510
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0510
     * @tc.desc      AdvertisingState call flow tick > show > tick > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0510 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`tick>show>tick>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>show>tick>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`tick>show>tick>skip>skip final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0510 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0511
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0511
     * @tc.desc      AdvertisingState call flow leave > skip > show > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0511 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`leave>skip>show>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>skip>show>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0511 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0512
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0512
     * @tc.desc      AdvertisingState call flow text > tick > leave > show > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0512 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      subject.leave();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`text>tick>leave>show>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>tick>leave>show>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0512 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0513
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0513
     * @tc.desc      AdvertisingState call flow skip > text > tick > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0513 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`skip>text>tick>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>tick>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>text>tick>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>text>tick>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0513 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0514
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0514
     * @tc.desc      AdvertisingState call flow leave > tick > text > show > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0514 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.leave();
      logInfo(`leave>tick>text>show>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0514 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0515
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0515
     * @tc.desc      AdvertisingState call flow show > tick > leave > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0515 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(5);
      subject.leave();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`show>tick>leave>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`show>tick>leave>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`show>tick>leave>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0515 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0516
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0516
     * @tc.desc      AdvertisingState call flow tick > leave > tick > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0516 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      subject.leave();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`tick>leave>tick>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>leave>tick>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0516 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0517
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0517
     * @tc.desc      AdvertisingState call flow tick > tick > skip > leave > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0517 begin`);
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
      subject.leave();
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`tick>tick>skip>leave>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>tick>skip>leave>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0517 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0518
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0518
     * @tc.desc      AdvertisingState call flow skip > leave > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0518 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      subject.leave();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('0');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      logInfo(`skip>leave>text>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>leave>text>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0518 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0519
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0519
     * @tc.desc      AdvertisingState call flow tick > text > tick > skip > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0519 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      subject.leave();
      logInfo(`tick>text>tick>skip>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>text>tick>skip>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0519 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0520
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0520
     * @tc.desc      AdvertisingState call flow show > tick > text > leave > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0520 begin`);
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
      subject.leave();
      subject.leave();
      logInfo(`show>tick>text>leave>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`show>tick>text>leave>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`show>tick>text>leave>leave final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0520 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0521
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0521
     * @tc.desc      AdvertisingState call flow leave > leave > text > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0521 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`leave>leave>text>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>leave>text>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>leave>text>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0521 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0522
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0522
     * @tc.desc      AdvertisingState call flow text > tick > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0522 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      logInfo(`text>tick>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>tick>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0522 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0523
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0523
     * @tc.desc      AdvertisingState call flow skip > tick > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0523 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`skip>tick>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>tick>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>tick>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>tick>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0523 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0524
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0524
     * @tc.desc      AdvertisingState call flow leave > text > tick > leave > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0524 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      subject.leave();
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('6');
      logInfo(`leave>text>tick>leave>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0524 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0525
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0525
     * @tc.desc      AdvertisingState call flow text > show > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0525 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      logInfo(`text>show>text>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>show>text>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0525 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0526
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0526
     * @tc.desc      AdvertisingState call flow show > skip > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0526 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`show>skip>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>skip>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>skip>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>skip>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0526 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0527
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0527
     * @tc.desc      AdvertisingState call flow text > skip > tick > tick > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0527 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`text>skip>tick>tick>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>skip>tick>tick>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0527 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0528
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0528
     * @tc.desc      AdvertisingState call flow text > skip > text > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0528 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`text>skip>text>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(-1);
      logInfo(`text>skip>text>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>skip>text>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`text>skip>text>show>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`text>skip>text>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0528 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0529
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0529
     * @tc.desc      AdvertisingState call flow show > show > text > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0529 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`show>show>text>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`show>show>text>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>show>text>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>show>text>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0529 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0530
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0530
     * @tc.desc      AdvertisingState call flow skip > tick > tick > show > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0530 begin`);
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
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`skip>tick>tick>show>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>tick>tick>show>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>tick>tick>show>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>tick>tick>show>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0530 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0531
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0531
     * @tc.desc      AdvertisingState call flow text > text > show > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0531 begin`);
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
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`text>text>show>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>text>show>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0531 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0532
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0532
     * @tc.desc      AdvertisingState call flow tick > text > show > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0532 begin`);
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
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`tick>text>show>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>text>show>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0532 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0533
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0533
     * @tc.desc      AdvertisingState call flow skip > tick > skip > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0533 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      subject.leave();
      logInfo(`skip>tick>skip>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>tick>skip>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0533 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0534
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0534
     * @tc.desc      AdvertisingState call flow leave > text > show > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0534 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`leave>text>show>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>text>show>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`leave>text>show>tick>skip final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0534 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0535
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0535
     * @tc.desc      AdvertisingState call flow show > show > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0535 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`show>show>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>show>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>show>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>show>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0535 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0536
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0536
     * @tc.desc      AdvertisingState call flow tick > skip > show > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0536 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`tick>skip>show>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>skip>show>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0536 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0537
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0537
     * @tc.desc      AdvertisingState call flow text > skip > leave > text > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0537 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      subject.leave();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`text>skip>leave>text>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>skip>leave>text>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>skip>leave>text>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`text>skip>leave>text>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0537 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0538
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0538
     * @tc.desc      AdvertisingState call flow tick > text > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0538 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      logInfo(`tick>text>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>text>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0538 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0539
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0539
     * @tc.desc      AdvertisingState call flow text > skip > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0539 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      subject.leave();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`text>skip>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>skip>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0539 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0540
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0540
     * @tc.desc      AdvertisingState call flow text > show > show > tick > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0540 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`text>show>show>tick>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`text>show>show>tick>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>show>show>tick>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`text>show>show>tick>show final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0540 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0541
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0541
     * @tc.desc      AdvertisingState call flow leave > tick > show > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0541 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('5');
      logInfo(`leave>tick>show>tick>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`leave>tick>show>tick>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>tick>show>tick>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>tick>show>tick>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`leave>tick>show>tick>text final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0541 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0542
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0542
     * @tc.desc      AdvertisingState call flow leave > text > skip > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0542 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`leave>text>skip>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>text>skip>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0542 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0543
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0543
     * @tc.desc      AdvertisingState call flow skip > leave > show > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0543 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`skip>leave>show>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>leave>show>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`skip>leave>show>tick>skip final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0543 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0544
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0544
     * @tc.desc      AdvertisingState call flow leave > tick > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0544 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`leave>tick>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>tick>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0544 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0545
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0545
     * @tc.desc      AdvertisingState call flow show > skip > skip > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0545 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`show>skip>skip>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>skip>skip>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0545 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0546
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0546
     * @tc.desc      AdvertisingState call flow show > leave > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0546 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.leave();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`show>leave>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>leave>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>leave>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>leave>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0546 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0547
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0547
     * @tc.desc      AdvertisingState call flow text > leave > show > leave > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0547 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.leave();
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`text>leave>show>leave>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>leave>show>leave>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`text>leave>show>leave>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0547 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0548
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0548
     * @tc.desc      AdvertisingState call flow show > text > show > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0548 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      logInfo(`show>text>show>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>text>show>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0548 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0549
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0549
     * @tc.desc      AdvertisingState call flow skip > show > show > leave > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0549 begin`);
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
      subject.leave();
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`skip>show>show>leave>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>show>leave>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0549 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0550
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0550
     * @tc.desc      AdvertisingState call flow leave > skip > skip > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0550 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`leave>skip>skip>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>skip>skip>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0550 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0551
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0551
     * @tc.desc      AdvertisingState call flow show > tick > show > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0551 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`show>tick>show>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(4);
      logInfo(`show>tick>show>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>tick>show>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>tick>show>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(2);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0551 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0552
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0552
     * @tc.desc      AdvertisingState call flow show > leave > tick > leave > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0552 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.leave();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      subject.leave();
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('6');
      logInfo(`show>leave>tick>leave>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0552 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0553
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0553
     * @tc.desc      AdvertisingState call flow show > skip > skip > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0553 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      subject.leave();
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`show>skip>skip>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>skip>skip>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0553 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0554
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0554
     * @tc.desc      AdvertisingState call flow text > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0554 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      logInfo(`text>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0554 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0555
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0555
     * @tc.desc      AdvertisingState call flow tick > leave > skip > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0555 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      subject.leave();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`tick>leave>skip>tick>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>leave>skip>tick>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0555 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0556
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0556
     * @tc.desc      AdvertisingState call flow skip > tick > show > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0556 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`skip>tick>show>text>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>tick>show>text>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>tick>show>text>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>tick>show>text>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0556 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0557
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0557
     * @tc.desc      AdvertisingState call flow show > tick > tick > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0557 begin`);
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
      subject.leave();
      logInfo(`show>tick>tick>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(4);
      logInfo(`show>tick>tick>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`show>tick>tick>leave final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(2);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0557 end`);
    });
  });
}
