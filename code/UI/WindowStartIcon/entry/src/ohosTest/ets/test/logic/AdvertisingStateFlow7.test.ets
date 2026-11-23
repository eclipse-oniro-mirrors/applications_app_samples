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

/** Logic checks for AdvertisingState flow (49 cases). */
export default function advertisingStateFlow7Test(): void {
  describe('AdvertisingStateFlow7Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0312
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0312
     * @tc.desc      AdvertisingState call flow text > tick > skip > tick > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0312 begin`);
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
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`text>tick>skip>tick>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>tick>skip>tick>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0312 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0313
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0313
     * @tc.desc      AdvertisingState call flow tick > skip > text > show > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0313 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('0');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`tick>skip>text>show>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>skip>text>show>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`tick>skip>text>show>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`tick>skip>text>show>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0314
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0314
     * @tc.desc      AdvertisingState call flow tick > leave > show > text > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0314 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      subject.leave();
      logInfo(`tick>leave>show>text>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0314 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0315
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0315
     * @tc.desc      AdvertisingState call flow leave > leave > show > text > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0315 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`leave>leave>show>text>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>leave>show>text>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>leave>show>text>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0315 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0316
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0316
     * @tc.desc      AdvertisingState call flow show > text > text > skip > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0316 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      subject.leave();
      logInfo(`show>text>text>skip>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>text>text>skip>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0316 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0317
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0317
     * @tc.desc      AdvertisingState call flow show > show > text > show > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0317 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('6');
      logInfo(`show>show>text>show>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>show>text>show>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0317 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0318
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0318
     * @tc.desc      AdvertisingState call flow skip > show > show > show > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0318 begin`);
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
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`skip>show>show>show>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>show>show>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>show>show>show>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>show>show>show>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0318 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0319
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0319
     * @tc.desc      AdvertisingState call flow skip > show > skip > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0319 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`skip>show>skip>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>skip>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0319 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0320
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0320
     * @tc.desc      AdvertisingState call flow show > show > show > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0320 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`show>show>show>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`show>show>show>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>show>show>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>show>show>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0320 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0321
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0321
     * @tc.desc      AdvertisingState call flow tick > text > tick > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0321 begin`);
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
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`tick>text>tick>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>text>tick>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0321 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0322
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0322
     * @tc.desc      AdvertisingState call flow skip > show > skip > skip > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0322 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`skip>show>skip>skip>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>skip>skip>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0322 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0323
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0323
     * @tc.desc      AdvertisingState call flow show > show > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0323 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.leave();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`show>show>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>show>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0323 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0324
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0324
     * @tc.desc      AdvertisingState call flow leave > show > leave > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0324 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.leave();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      logInfo(`leave>show>leave>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0324 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0325
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0325
     * @tc.desc      AdvertisingState call flow skip > text > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0325 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('0');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`skip>text>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>text>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>text>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0325 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0326
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0326
     * @tc.desc      AdvertisingState call flow leave > show > text > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0326 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      subject.leave();
      logInfo(`leave>show>text>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0326 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0327
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0327
     * @tc.desc      AdvertisingState call flow skip > text > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0327 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      logInfo(`skip>text>tick>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>tick>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0327 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0328
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0328
     * @tc.desc      AdvertisingState call flow tick > show > leave > tick > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0328 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.leave();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`tick>show>leave>tick>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0328 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0329
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0329
     * @tc.desc      AdvertisingState call flow leave > text > show > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0329 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.leave();
      logInfo(`leave>text>show>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0329 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0330
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0330
     * @tc.desc      AdvertisingState call flow tick > tick > tick > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0330 begin`);
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
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`tick>tick>tick>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>tick>tick>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0330 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0331
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0331
     * @tc.desc      AdvertisingState call flow show > skip > skip > text > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0331 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`show>skip>skip>text>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>skip>skip>text>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>skip>skip>text>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>skip>skip>text>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0331 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0332
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0332
     * @tc.desc      AdvertisingState call flow leave > show > text > text > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0332 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`leave>show>text>text>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`leave>show>text>text>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>show>text>text>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>show>text>text>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`leave>show>text>text>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0332 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0333
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0333
     * @tc.desc      AdvertisingState call flow leave > show > leave > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0333 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.leave();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('6');
      logInfo(`leave>show>leave>text>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0333 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0334
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0334
     * @tc.desc      AdvertisingState call flow leave > show > leave > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0334 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.leave();
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`leave>show>leave>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>show>leave>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>show>leave>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>show>leave>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0334 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0335
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0335
     * @tc.desc      AdvertisingState call flow skip > tick > skip > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0335 begin`);
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
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`skip>tick>skip>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>tick>skip>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0335 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0336
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0336
     * @tc.desc      AdvertisingState call flow leave > tick > text > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0336 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
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
      logInfo(`leave>tick>text>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>tick>text>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0336 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0337
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0337
     * @tc.desc      AdvertisingState call flow text > show > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0337 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`text>show>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>show>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>show>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`text>show>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0337 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0338
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0338
     * @tc.desc      AdvertisingState call flow leave > show > skip > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0338 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`leave>show>skip>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>show>skip>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0338 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0339
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0339
     * @tc.desc      AdvertisingState call flow skip > text > leave > leave > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0339 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('0');
      subject.leave();
      subject.leave();
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`skip>text>leave>leave>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>leave>leave>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0339 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0340
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0340
     * @tc.desc      AdvertisingState call flow show > skip > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0340 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`show>skip>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>skip>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>skip>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>skip>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0340 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0341
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0341
     * @tc.desc      AdvertisingState call flow tick > show > show > leave > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0341 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.leave();
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('6');
      logInfo(`tick>show>show>leave>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0341 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0342
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0342
     * @tc.desc      AdvertisingState call flow leave > leave > skip > text > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0342 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`leave>leave>skip>text>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>leave>skip>text>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0342 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0343
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0343
     * @tc.desc      AdvertisingState call flow leave > leave > tick > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0343 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`leave>leave>tick>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>leave>tick>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>leave>tick>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0343 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0344
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0344
     * @tc.desc      AdvertisingState call flow tick > show > text > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0344 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`tick>show>text>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`tick>show>text>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`tick>show>text>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`tick>show>text>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0344 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0345
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0345
     * @tc.desc      AdvertisingState call flow text > tick > skip > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0345 begin`);
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
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`text>tick>skip>tick>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>tick>skip>tick>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0345 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0346
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0346
     * @tc.desc      AdvertisingState call flow tick > tick > tick > text > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0346 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0346 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0347
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0347
     * @tc.desc      AdvertisingState call flow skip > show > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0347 begin`);
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
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`skip>show>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(-1);
      logInfo(`skip>show>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>show>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>show>show>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`skip>show>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0347 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0348
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0348
     * @tc.desc      AdvertisingState call flow leave > text > show > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0348 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.leave();
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`leave>text>show>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>text>show>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0348 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0349
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0349
     * @tc.desc      AdvertisingState call flow show > leave > show > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0349 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      logInfo(`show>leave>show>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>leave>show>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>leave>show>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0349 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0350
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0350
     * @tc.desc      AdvertisingState call flow show > tick > skip > show > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0350 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.leave();
      logInfo(`show>tick>skip>show>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>tick>skip>show>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`show>tick>skip>show>leave final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0350 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0351
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0351
     * @tc.desc      AdvertisingState call flow skip > show > skip > tick > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0351 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`skip>show>skip>tick>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>skip>tick>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0351 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0352
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0352
     * @tc.desc      AdvertisingState call flow text > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0352 begin`);
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
      logInfo(`text>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`text>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`text>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0352 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0353
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0353
     * @tc.desc      AdvertisingState call flow skip > text > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0353 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('0');
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`skip>text>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(-1);
      logInfo(`skip>text>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>text>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>text>show>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`skip>text>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0353 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0354
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0354
     * @tc.desc      AdvertisingState call flow leave > leave > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0354 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      logInfo(`leave>leave>text>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0354 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0355
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0355
     * @tc.desc      AdvertisingState call flow show > text > skip > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0355 begin`);
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
      subject.leave();
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`show>text>skip>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>text>skip>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0355 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0356
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0356
     * @tc.desc      AdvertisingState call flow tick > text > leave > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0356 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      subject.leave();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tick>text>leave>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`tick>text>leave>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`tick>text>leave>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0356 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0357
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0357
     * @tc.desc      AdvertisingState call flow skip > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0357 begin`);
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
      logInfo(`skip>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0357 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0358
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0358
     * @tc.desc      AdvertisingState call flow skip > skip > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0358 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('0');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      logInfo(`skip>skip>text>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>skip>text>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0358 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0359
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0359
     * @tc.desc      AdvertisingState call flow skip > skip > text > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0359 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('0');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`skip>skip>text>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>skip>text>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0359 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0360
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0360
     * @tc.desc      AdvertisingState call flow tick > tick > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0360 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`tick>tick>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`tick>tick>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0360 end`);
    });
  });
}
