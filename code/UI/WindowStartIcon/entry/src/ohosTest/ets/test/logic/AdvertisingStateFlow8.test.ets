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

/** Logic checks for AdvertisingState flow (50 cases). */
export default function advertisingStateFlow8Test(): void {
  describe('AdvertisingStateFlow8Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0361
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0361
     * @tc.desc      AdvertisingState call flow leave > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0361 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(5);
      logInfo(`leave>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`leave>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>show>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`leave>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0361 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0362
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0362
     * @tc.desc      AdvertisingState call flow leave > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0362 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      logInfo(`leave>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0362 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0363
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0363
     * @tc.desc      AdvertisingState call flow skip > show > text > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0363 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('0');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`skip>show>text>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(-1);
      logInfo(`skip>show>text>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>show>text>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>show>text>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`skip>show>text>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0363 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0364
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0364
     * @tc.desc      AdvertisingState call flow tick > leave > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0364 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      subject.leave();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('0');
      logInfo(`tick>leave>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>leave>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0364 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0365
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0365
     * @tc.desc      AdvertisingState call flow show > leave > tick > leave > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0365 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.leave();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      subject.leave();
      subject.leave();
      logInfo(`show>leave>tick>leave>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0365 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0366
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0366
     * @tc.desc      AdvertisingState call flow leave > text > leave > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0366 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      subject.leave();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('6');
      logInfo(`leave>text>leave>tick>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0366 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0367
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0367
     * @tc.desc      AdvertisingState call flow tick > tick > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0367 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      subject.leave();
      logInfo(`tick>tick>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0367 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0368
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0368
     * @tc.desc      AdvertisingState call flow text > show > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0368 begin`);
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
      logInfo(`text>show>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>show>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0368 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0369
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0369
     * @tc.desc      AdvertisingState call flow skip > skip > tick > skip > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0369 begin`);
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
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`skip>skip>tick>skip>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>skip>tick>skip>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0369 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0370
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0370
     * @tc.desc      AdvertisingState call flow text > text > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0370 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0370 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0371
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0371
     * @tc.desc      AdvertisingState call flow leave > skip > text > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0371 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
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
      logInfo(`leave>skip>text>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(-1);
      logInfo(`leave>skip>text>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>skip>text>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>skip>text>show>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`leave>skip>text>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0371 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0372
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0372
     * @tc.desc      AdvertisingState call flow text > leave > skip > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0372 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      subject.leave();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      subject.leave();
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`text>leave>skip>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>leave>skip>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0372 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0373
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0373
     * @tc.desc      AdvertisingState call flow text > show > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0373 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('5');
      logInfo(`text>show>tick>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`text>show>tick>text final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>show>tick>text final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`text>show>tick>text final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0373 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0374
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0374
     * @tc.desc      AdvertisingState call flow skip > leave > text > show > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0374 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      subject.leave();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('0');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`skip>leave>text>show>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>leave>text>show>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0374 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0375
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0375
     * @tc.desc      AdvertisingState call flow tick > show > skip > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0375 begin`);
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
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`tick>show>skip>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>show>skip>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0375 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0376
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0376
     * @tc.desc      AdvertisingState call flow leave > show > leave > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0376 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.leave();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('6');
      logInfo(`leave>show>leave>tick>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0376 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0377
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0377
     * @tc.desc      AdvertisingState call flow skip > text > skip > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0377 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('0');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`skip>text>skip>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>skip>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0377 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0378
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0378
     * @tc.desc      AdvertisingState call flow tick > skip > tick > show > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0378 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.leave();
      logInfo(`tick>skip>tick>show>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>skip>tick>show>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0378 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0379
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0379
     * @tc.desc      AdvertisingState call flow skip > text > show > show > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0379 begin`);
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
      subject.leave();
      logInfo(`skip>text>show>show>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>show>show>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0379 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0380
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0380
     * @tc.desc      AdvertisingState call flow tick > skip > skip > show > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0380 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.leave();
      logInfo(`tick>skip>skip>show>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>skip>skip>show>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0380 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0381
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0381
     * @tc.desc      AdvertisingState call flow text > leave > tick > show > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0381 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      subject.leave();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.leave();
      logInfo(`text>leave>tick>show>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0381 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0382
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0382
     * @tc.desc      AdvertisingState call flow tick > leave > tick > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0382 begin`);
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
      logInfo(`tick>leave>tick>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0382 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0383
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0383
     * @tc.desc      AdvertisingState call flow text > skip > tick > tick > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0383 begin`);
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
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('0');
      logInfo(`text>skip>tick>tick>text final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>skip>tick>tick>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0383 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0384
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0384
     * @tc.desc      AdvertisingState call flow tick > leave > show > text > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0384 begin`);
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
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`tick>leave>show>text>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`tick>leave>show>text>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`tick>leave>show>text>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0384 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0385
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0385
     * @tc.desc      AdvertisingState call flow leave > show > leave > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0385 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: boolean = subject.show();
      logInfo(`step2 show(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.leave();
      subject.leave();
      logInfo(`leave>show>leave>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0385 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0386
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0386
     * @tc.desc      AdvertisingState call flow text > text > text > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0386 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`text>text>text>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>text>text>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0386 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0387
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0387
     * @tc.desc      AdvertisingState call flow text > text > leave > tick > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0387 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      subject.leave();
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      subject.leave();
      logInfo(`text>text>leave>tick>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0387 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0388
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0388
     * @tc.desc      AdvertisingState call flow leave > text > text > tick > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0388 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('6');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`leave>text>text>tick>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0388 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0389
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0389
     * @tc.desc      AdvertisingState call flow show > tick > tick > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0389 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`show>tick>tick>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(4);
      logInfo(`show>tick>tick>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>tick>tick>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>tick>tick>show final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(2);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0389 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0390
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0390
     * @tc.desc      AdvertisingState call flow skip > text > skip > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0390 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.skip();
      logInfo(`step1 skip(): step1=${step1}`);
      expect(step1).assertEqual('pages/Index');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('0');
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`skip>text>skip>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>text>skip>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>text>skip>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>text>skip>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0390 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0391
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0391
     * @tc.desc      AdvertisingState call flow tick > leave > show > show > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0391 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`tick>leave>show>show>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>leave>show>show>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0391 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0392
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0392
     * @tc.desc      AdvertisingState call flow text > text > show > text > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0392 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`text>text>show>text>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>text>show>text>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0392 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0393
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0393
     * @tc.desc      AdvertisingState call flow show > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0393 begin`);
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
      logInfo(`show>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0393 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0394
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0394
     * @tc.desc      AdvertisingState call flow tick > skip > tick > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0394 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: number = subject.tick();
      logInfo(`step1 tick(): step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: string = subject.skip();
      logInfo(`step2 skip(): step2=${step2}`);
      expect(step2).assertEqual('pages/Index');
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`tick>skip>tick>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>skip>tick>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0394 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0395
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0395
     * @tc.desc      AdvertisingState call flow show > leave > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0395 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: boolean = subject.show();
      logInfo(`step1 show(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.leave();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      logInfo(`show>leave>text final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0395 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0396
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0396
     * @tc.desc      AdvertisingState call flow tick > skip > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0396 begin`);
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
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`tick>skip>show>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>skip>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`tick>skip>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`tick>skip>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0396 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0397
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0397
     * @tc.desc      AdvertisingState call flow show > show > skip > show > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0397 begin`);
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
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`show>show>skip>show>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>show>skip>show>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0397 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0398
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0398
     * @tc.desc      AdvertisingState call flow leave > leave > tick > text > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0398 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: number = subject.tick();
      logInfo(`step3 tick(): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`leave>leave>tick>text>tick final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0398 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0399
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0399
     * @tc.desc      AdvertisingState call flow leave > leave > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0399 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: string = subject.skip();
      logInfo(`step3 skip(): step3=${step3}`);
      expect(step3).assertEqual('pages/Index');
      logInfo(`leave>leave>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>leave>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0399 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0400
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0400
     * @tc.desc      AdvertisingState call flow text > tick > text > text > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0400 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('6');
      const step5: string = subject.skip();
      logInfo(`step5 skip(): step5=${step5}`);
      expect(step5).assertEqual('pages/Index');
      logInfo(`text>tick>text>text>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`text>tick>text>text>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0400 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0401
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0401
     * @tc.desc      AdvertisingState call flow leave > leave > text > tick > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0401 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      subject.leave();
      logInfo(`leave>leave>text>tick>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0401 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0402
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0402
     * @tc.desc      AdvertisingState call flow show > skip > skip > show > leave keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0402 begin`);
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
      subject.leave();
      logInfo(`show>skip>skip>show>leave final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>skip>skip>show>leave final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0402 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0403
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0403
     * @tc.desc      AdvertisingState call flow leave > tick > text > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0403 begin`);
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
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`leave>tick>text>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`leave>tick>text>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>tick>text>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>tick>text>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0403 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0404
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0404
     * @tc.desc      AdvertisingState call flow text > tick > text > tick > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0404 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('6');
      const step2: number = subject.tick();
      logInfo(`step2 tick(): step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('6');
      const step4: number = subject.tick();
      logInfo(`step4 tick(): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`text>tick>text>tick>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>tick>text>tick>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`${BUNDLE}AdvertisingStateFlow_0404 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0405
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0405
     * @tc.desc      AdvertisingState call flow skip > show > show > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0405 begin`);
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
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`skip>show>show>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>show>show>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>show>show>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>show>show>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0405 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0406
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0406
     * @tc.desc      AdvertisingState call flow leave > leave > show > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0406 begin`);
      const subject: AdvertisingState = new AdvertisingState();
      subject.leave();
      subject.leave();
      const step3: boolean = subject.show();
      logInfo(`step3 show(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.show();
      logInfo(`step4 show(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`leave>leave>show>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`leave>leave>show>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`leave>leave>show>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0406 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0407
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0407
     * @tc.desc      AdvertisingState call flow show > tick > tick > skip > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0407 begin`);
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
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      const step5: boolean = subject.show();
      logInfo(`step5 show(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`show>tick>tick>skip>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`show>tick>tick>skip>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`show>tick>tick>skip>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`show>tick>tick>skip>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`show>tick>tick>skip>show final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(2);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0407 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0408
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0408
     * @tc.desc      AdvertisingState call flow text > text > tick > show > tick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0408 begin`);
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
      const step5: number = subject.tick();
      logInfo(`step5 tick(): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`text>text>tick>show>tick final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(5);
      logInfo(`text>text>tick>show>tick final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`text>text>tick>show>tick final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`text>text>tick>show>tick final: subject.ticks=${subject.ticks}`);
      expect(subject.ticks).assertEqual(1);
      logInfo(`${BUNDLE}AdvertisingStateFlow_0408 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0409
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0409
     * @tc.desc      AdvertisingState call flow tick > skip > skip > skip keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0409 begin`);
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
      const step4: string = subject.skip();
      logInfo(`step4 skip(): step4=${step4}`);
      expect(step4).assertEqual('pages/Index');
      logInfo(`tick>skip>skip>skip final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`tick>skip>skip>skip final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0409 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_STATE_FLOW_0410
     * @tc.name      WindowStartIcon_AdvertisingStateFlow_0410
     * @tc.desc      AdvertisingState call flow skip > skip > leave > show keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingStateFlow_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingStateFlow_0410 begin`);
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
      logInfo(`skip>skip>leave>show final: subject.pageCountDown=${subject.pageCountDown}`);
      expect(subject.pageCountDown).assertEqual(0);
      logInfo(`skip>skip>leave>show final: subject.timerRunning=${subject.timerRunning}`);
      expect(subject.timerRunning).assertTrue();
      logInfo(`skip>skip>leave>show final: subject.isFullScreen=${subject.isFullScreen}`);
      expect(subject.isFullScreen).assertTrue();
      logInfo(`skip>skip>leave>show final: subject.navigatedTo=${subject.navigatedTo}`);
      expect(subject.navigatedTo).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingStateFlow_0410 end`);
    });
  });
}
