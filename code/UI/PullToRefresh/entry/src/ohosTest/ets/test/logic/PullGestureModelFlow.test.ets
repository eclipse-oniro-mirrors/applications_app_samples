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
import { PullGestureModel } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for PullGestureModel flow (58 cases). */
export default function pullGestureModelFlowTest(): void {
  describe('PullGestureModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0001
     * @tc.name      PullToRefresh_PullGestureModelFlow_0001
     * @tc.desc      PullGestureModel call flow arrowAngle > currentState > finishRefresh > top keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullGestureModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0001 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.arrowAngle();
      logInfo(`step1 arrowAngle(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.currentState();
      logInfo(`step2 currentState(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.finishRefresh('oRg');
      logInfo(`step3 finishRefresh("oRg"): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.top();
      logInfo(`step4 top(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0002
     * @tc.name      PullToRefresh_PullGestureModelFlow_0002
     * @tc.desc      PullGestureModel call flow closeRefresh > top > touchDown keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullGestureModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0002 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      subject.closeRefresh();
      const step2: number = subject.top();
      logInfo(`step2 top(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.touchDown(-18);
      logInfo(`${BUNDLE}PullGestureModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0003
     * @tc.name      PullToRefresh_PullGestureModelFlow_0003
     * @tc.desc      PullGestureModel call flow move > footerText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0003 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.move(-1, 0, true);
      logInfo(`step1 move(-1, 0, true): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.footerText();
      logInfo(`step2 footerText(): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}PullGestureModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0004
     * @tc.name      PullToRefresh_PullGestureModelFlow_0004
     * @tc.desc      PullGestureModel call flow finishRefresh > finishRefresh > currentState > footerText > release k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0004 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.finishRefresh('da');
      logInfo(`step1 finishRefresh("da"): step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.finishRefresh('dx2crC2XWwN');
      logInfo(`step2 finishRefresh("dx2crC2XWwN"): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.currentState();
      logInfo(`step3 currentState(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.footerText();
      logInfo(`step4 footerText(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.release();
      logInfo(`step5 release(): step5=${step5}`);
      expect(step5).assertEqual('free');
      logInfo(`${BUNDLE}PullGestureModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0005
     * @tc.name      PullToRefresh_PullGestureModelFlow_0005
     * @tc.desc      PullGestureModel call flow closeRefresh > footerText > finishRefresh > currentState > bottom kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0005 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      subject.closeRefresh();
      const step2: string = subject.footerText();
      logInfo(`step2 footerText(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.finishRefresh(' \u4e2d\u6587 ');
      logInfo(`step3 finishRefresh(" ?? "): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.currentState();
      logInfo(`step4 currentState(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.bottom();
      logInfo(`step5 bottom(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0006
     * @tc.name      PullToRefresh_PullGestureModelFlow_0006
     * @tc.desc      PullGestureModel call flow release > finishRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0006 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('free');
      const step2: number = subject.finishRefresh(' a ');
      logInfo(`step2 finishRefresh(" a "): step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0007
     * @tc.name      PullToRefresh_PullGestureModelFlow_0007
     * @tc.desc      PullGestureModel call flow touchDown > finishRefresh > top > currentState keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0007 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      subject.touchDown(178);
      const step2: number = subject.finishRefresh(' _1');
      logInfo(`step2 finishRefresh(" _1"): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.top();
      logInfo(`step3 top(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.currentState();
      logInfo(`step4 currentState(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0008
     * @tc.name      PullToRefresh_PullGestureModelFlow_0008
     * @tc.desc      PullGestureModel call flow bottom > closeLoad > bottom > arrowAngle keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0008 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: number = subject.bottom();
      logInfo(`step1 bottom(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.closeLoad();
      const step3: number = subject.bottom();
      logInfo(`step3 bottom(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.arrowAngle();
      logInfo(`step4 arrowAngle(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0009
     * @tc.name      PullToRefresh_PullGestureModelFlow_0009
     * @tc.desc      PullGestureModel call flow closeRefresh > closeLoad > top > release > closeLoad keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0009 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      subject.closeRefresh();
      subject.closeLoad();
      const step3: number = subject.top();
      logInfo(`step3 top(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('free');
      subject.closeLoad();
      logInfo(`${BUNDLE}PullGestureModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0010
     * @tc.name      PullToRefresh_PullGestureModelFlow_0010
     * @tc.desc      PullGestureModel call flow finishRefresh > currentState > closeLoad > closeRefresh > closeLoad k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0010 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.finishRefresh('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step1 finishRefresh("????"): step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.currentState();
      logInfo(`step2 currentState(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.closeLoad();
      subject.closeRefresh();
      subject.closeLoad();
      logInfo(`${BUNDLE}PullGestureModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0011
     * @tc.name      PullToRefresh_PullGestureModelFlow_0011
     * @tc.desc      PullGestureModel call flow footerText > currentState > closeLoad > arrowAngle keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0011 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: string = subject.footerText();
      logInfo(`step1 footerText(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.currentState();
      logInfo(`step2 currentState(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.closeLoad();
      const step4: number = subject.arrowAngle();
      logInfo(`step4 arrowAngle(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0012
     * @tc.name      PullToRefresh_PullGestureModelFlow_0012
     * @tc.desc      PullGestureModel call flow touchDown > bottom > currentState keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0012 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      subject.touchDown(100);
      const step2: number = subject.bottom();
      logInfo(`step2 bottom(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.currentState();
      logInfo(`step3 currentState(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0013
     * @tc.name      PullToRefresh_PullGestureModelFlow_0013
     * @tc.desc      PullGestureModel call flow currentState > top > footerText > touchDown > bottom keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0013 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.currentState();
      logInfo(`step1 currentState(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.top();
      logInfo(`step2 top(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.footerText();
      logInfo(`step3 footerText(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.touchDown(123);
      const step5: number = subject.bottom();
      logInfo(`step5 bottom(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0014
     * @tc.name      PullToRefresh_PullGestureModelFlow_0014
     * @tc.desc      PullGestureModel call flow finishRefresh > release > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0014 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: number = subject.finishRefresh('hello world');
      logInfo(`step1 finishRefresh("hello world"): step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('free');
      const step3: number = subject.move(2, 3, true);
      logInfo(`step3 move(2, 3, true): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0015
     * @tc.name      PullToRefresh_PullGestureModelFlow_0015
     * @tc.desc      PullGestureModel call flow closeRefresh > finishRefresh > closeRefresh > closeLoad keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0015 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      subject.closeRefresh();
      const step2: number = subject.finishRefresh('Hello World');
      logInfo(`step2 finishRefresh("Hello World"): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.closeRefresh();
      subject.closeLoad();
      logInfo(`${BUNDLE}PullGestureModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0016
     * @tc.name      PullToRefresh_PullGestureModelFlow_0016
     * @tc.desc      PullGestureModel call flow currentState > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0016 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: number = subject.currentState();
      logInfo(`step1 currentState(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.move(15, 15, false);
      logInfo(`step2 move(15, 15, false): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0017
     * @tc.name      PullToRefresh_PullGestureModelFlow_0017
     * @tc.desc      PullGestureModel call flow top > closeRefresh > touchDown > closeRefresh > finishRefresh keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0017 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.top();
      logInfo(`step1 top(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.closeRefresh();
      subject.touchDown(30);
      subject.closeRefresh();
      const step5: number = subject.finishRefresh('oRg');
      logInfo(`step5 finishRefresh("oRg"): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0018
     * @tc.name      PullToRefresh_PullGestureModelFlow_0018
     * @tc.desc      PullGestureModel call flow currentState > touchDown keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0018 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: number = subject.currentState();
      logInfo(`step1 currentState(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.touchDown(10);
      logInfo(`${BUNDLE}PullGestureModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0019
     * @tc.name      PullToRefresh_PullGestureModelFlow_0019
     * @tc.desc      PullGestureModel call flow bottom > finishRefresh > closeLoad > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0019 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.bottom();
      logInfo(`step1 bottom(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.finishRefresh(' A ');
      logInfo(`step2 finishRefresh(" A "): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.closeLoad();
      const step4: number = subject.move(3, -100, false);
      logInfo(`step4 move(3, -100, false): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0020
     * @tc.name      PullToRefresh_PullGestureModelFlow_0020
     * @tc.desc      PullGestureModel call flow release > footerText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0020 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('free');
      const step2: string = subject.footerText();
      logInfo(`step2 footerText(): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}PullGestureModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0021
     * @tc.name      PullToRefresh_PullGestureModelFlow_0021
     * @tc.desc      PullGestureModel call flow closeLoad > finishRefresh > bottom > bottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0021 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      subject.closeLoad();
      const step2: number = subject.finishRefresh(' ');
      logInfo(`step2 finishRefresh(" "): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.bottom();
      logInfo(`step3 bottom(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.bottom();
      logInfo(`step4 bottom(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0022
     * @tc.name      PullToRefresh_PullGestureModelFlow_0022
     * @tc.desc      PullGestureModel call flow top > footerText > top > top keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0022 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.top();
      logInfo(`step1 top(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.footerText();
      logInfo(`step2 footerText(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.top();
      logInfo(`step3 top(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.top();
      logInfo(`step4 top(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0023
     * @tc.name      PullToRefresh_PullGestureModelFlow_0023
     * @tc.desc      PullGestureModel call flow release > arrowAngle > footerText > touchDown > finishRefresh keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0023 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('free');
      const step2: number = subject.arrowAngle();
      logInfo(`step2 arrowAngle(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.footerText();
      logInfo(`step3 footerText(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.touchDown(30.5);
      const step5: number = subject.finishRefresh('Hello WorldHello World');
      logInfo(`step5 finishRefresh("Hello WorldHello Wor...: step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0024
     * @tc.name      PullToRefresh_PullGestureModelFlow_0024
     * @tc.desc      PullGestureModel call flow release > finishRefresh > release > closeLoad keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0024 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('free');
      const step2: number = subject.finishRefresh('\u4e2d\u6587');
      logInfo(`step2 finishRefresh("??"): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('free');
      subject.closeLoad();
      logInfo(`${BUNDLE}PullGestureModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0025
     * @tc.name      PullToRefresh_PullGestureModelFlow_0025
     * @tc.desc      PullGestureModel call flow closeLoad > closeLoad > release > finishRefresh > move keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0025 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      subject.closeLoad();
      subject.closeLoad();
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('free');
      const step4: number = subject.finishRefresh('123');
      logInfo(`step4 finishRefresh("123"): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.move(-100, -100, true);
      logInfo(`step5 move(-100, -100, true): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0026
     * @tc.name      PullToRefresh_PullGestureModelFlow_0026
     * @tc.desc      PullGestureModel call flow bottom > footerText > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0026 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: number = subject.bottom();
      logInfo(`step1 bottom(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.footerText();
      logInfo(`step2 footerText(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.move(5, 21, false);
      logInfo(`step3 move(5, 21, false): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0027
     * @tc.name      PullToRefresh_PullGestureModelFlow_0027
     * @tc.desc      PullGestureModel call flow release > closeRefresh > top keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0027 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('free');
      subject.closeRefresh();
      const step3: number = subject.top();
      logInfo(`step3 top(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0028
     * @tc.name      PullToRefresh_PullGestureModelFlow_0028
     * @tc.desc      PullGestureModel call flow move > footerText > finishRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0028 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.move(10, 10, false);
      logInfo(`step1 move(10, 10, false): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.footerText();
      logInfo(`step2 footerText(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.finishRefresh('cKC');
      logInfo(`step3 finishRefresh("cKC"): step3=${step3}`);
      expect(step3).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0029
     * @tc.name      PullToRefresh_PullGestureModelFlow_0029
     * @tc.desc      PullGestureModel call flow release > bottom > currentState > closeRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0029 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('free');
      const step2: number = subject.bottom();
      logInfo(`step2 bottom(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.currentState();
      logInfo(`step3 currentState(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.closeRefresh();
      logInfo(`${BUNDLE}PullGestureModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0030
     * @tc.name      PullToRefresh_PullGestureModelFlow_0030
     * @tc.desc      PullGestureModel call flow finishRefresh > closeLoad > top > bottom > top keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0030 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.finishRefresh('73jSLWMS7');
      logInfo(`step1 finishRefresh("73jSLWMS7"): step1=${step1}`);
      expect(step1).assertEqual(3);
      subject.closeLoad();
      const step3: number = subject.top();
      logInfo(`step3 top(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.bottom();
      logInfo(`step4 bottom(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.top();
      logInfo(`step5 top(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0031
     * @tc.name      PullToRefresh_PullGestureModelFlow_0031
     * @tc.desc      PullGestureModel call flow finishRefresh > bottom > touchDown > closeLoad > footerText keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0031 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.finishRefresh(' _1');
      logInfo(`step1 finishRefresh(" _1"): step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.bottom();
      logInfo(`step2 bottom(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.touchDown(58.58);
      subject.closeLoad();
      const step5: string = subject.footerText();
      logInfo(`step5 footerText(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}PullGestureModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0032
     * @tc.name      PullToRefresh_PullGestureModelFlow_0032
     * @tc.desc      PullGestureModel call flow move > top > bottom > closeLoad > closeLoad keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0032 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.move(-1, -100, true);
      logInfo(`step1 move(-1, -100, true): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.top();
      logInfo(`step2 top(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.bottom();
      logInfo(`step3 bottom(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.closeLoad();
      subject.closeLoad();
      logInfo(`${BUNDLE}PullGestureModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0033
     * @tc.name      PullToRefresh_PullGestureModelFlow_0033
     * @tc.desc      PullGestureModel call flow closeRefresh > release > currentState > move > touchDown keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0033 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      subject.closeRefresh();
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('free');
      const step3: number = subject.currentState();
      logInfo(`step3 currentState(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.move(15, 0, false);
      logInfo(`step4 move(15, 0, false): step4=${step4}`);
      expect(step4).assertEqual(11);
      subject.touchDown(59);
      logInfo(`${BUNDLE}PullGestureModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0034
     * @tc.name      PullToRefresh_PullGestureModelFlow_0034
     * @tc.desc      PullGestureModel call flow bottom > footerText > bottom > bottom > bottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0034 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.bottom();
      logInfo(`step1 bottom(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.footerText();
      logInfo(`step2 footerText(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.bottom();
      logInfo(`step3 bottom(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.bottom();
      logInfo(`step4 bottom(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.bottom();
      logInfo(`step5 bottom(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0035
     * @tc.name      PullToRefresh_PullGestureModelFlow_0035
     * @tc.desc      PullGestureModel call flow touchDown > move > footerText > closeRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0035 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      subject.touchDown(178);
      const step2: number = subject.move(2, 3, true);
      logInfo(`step2 move(2, 3, true): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.footerText();
      logInfo(`step3 footerText(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.closeRefresh();
      logInfo(`${BUNDLE}PullGestureModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0036
     * @tc.name      PullToRefresh_PullGestureModelFlow_0036
     * @tc.desc      PullGestureModel call flow footerText > currentState keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0036 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: string = subject.footerText();
      logInfo(`step1 footerText(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.currentState();
      logInfo(`step2 currentState(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0037
     * @tc.name      PullToRefresh_PullGestureModelFlow_0037
     * @tc.desc      PullGestureModel call flow bottom > touchDown > bottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0037 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.bottom();
      logInfo(`step1 bottom(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.touchDown(150);
      const step3: number = subject.bottom();
      logInfo(`step3 bottom(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0038
     * @tc.name      PullToRefresh_PullGestureModelFlow_0038
     * @tc.desc      PullGestureModel call flow finishRefresh > closeRefresh > closeRefresh > footerText keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0038 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.finishRefresh('Ux5');
      logInfo(`step1 finishRefresh("Ux5"): step1=${step1}`);
      expect(step1).assertEqual(3);
      subject.closeRefresh();
      subject.closeRefresh();
      const step4: string = subject.footerText();
      logInfo(`step4 footerText(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}PullGestureModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0039
     * @tc.name      PullToRefresh_PullGestureModelFlow_0039
     * @tc.desc      PullGestureModel call flow release > closeRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0039 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('free');
      subject.closeRefresh();
      logInfo(`${BUNDLE}PullGestureModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0040
     * @tc.name      PullToRefresh_PullGestureModelFlow_0040
     * @tc.desc      PullGestureModel call flow closeLoad > touchDown > finishRefresh > closeLoad > release keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0040 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      subject.closeLoad();
      subject.touchDown(66);
      const step3: number = subject.finishRefresh('duKBx0w9sHr4');
      logInfo(`step3 finishRefresh("duKBx0w9sHr4"): step3=${step3}`);
      expect(step3).assertEqual(3);
      subject.closeLoad();
      const step5: string = subject.release();
      logInfo(`step5 release(): step5=${step5}`);
      expect(step5).assertEqual('free');
      logInfo(`${BUNDLE}PullGestureModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0041
     * @tc.name      PullToRefresh_PullGestureModelFlow_0041
     * @tc.desc      PullGestureModel call flow bottom > closeRefresh > closeLoad > bottom keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0041 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.bottom();
      logInfo(`step1 bottom(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.closeRefresh();
      subject.closeLoad();
      const step4: number = subject.bottom();
      logInfo(`step4 bottom(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0042
     * @tc.name      PullToRefresh_PullGestureModelFlow_0042
     * @tc.desc      PullGestureModel call flow touchDown > closeLoad > arrowAngle > closeRefresh keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0042 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      subject.touchDown(91.64);
      subject.closeLoad();
      const step3: number = subject.arrowAngle();
      logInfo(`step3 arrowAngle(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.closeRefresh();
      logInfo(`${BUNDLE}PullGestureModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0043
     * @tc.name      PullToRefresh_PullGestureModelFlow_0043
     * @tc.desc      PullGestureModel call flow top > currentState > footerText > closeLoad > footerText keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0043 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.top();
      logInfo(`step1 top(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.currentState();
      logInfo(`step2 currentState(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.footerText();
      logInfo(`step3 footerText(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.closeLoad();
      const step5: string = subject.footerText();
      logInfo(`step5 footerText(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}PullGestureModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0044
     * @tc.name      PullToRefresh_PullGestureModelFlow_0044
     * @tc.desc      PullGestureModel call flow currentState > touchDown > release > currentState > move keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0044 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: number = subject.currentState();
      logInfo(`step1 currentState(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.touchDown(-81);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('free');
      const step4: number = subject.currentState();
      logInfo(`step4 currentState(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.move(10, 10, false);
      logInfo(`step5 move(10, 10, false): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0045
     * @tc.name      PullToRefresh_PullGestureModelFlow_0045
     * @tc.desc      PullGestureModel call flow touchDown > closeLoad > finishRefresh > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0045 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      subject.touchDown(131);
      subject.closeLoad();
      const step3: number = subject.finishRefresh('6o3ym61');
      logInfo(`step3 finishRefresh("6o3ym61"): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.move(9.94, 21, false);
      logInfo(`step4 move(9.94, 21, false): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0046
     * @tc.name      PullToRefresh_PullGestureModelFlow_0046
     * @tc.desc      PullGestureModel call flow currentState > finishRefresh > move > footerText > footerText keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0046 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: number = subject.currentState();
      logInfo(`step1 currentState(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.finishRefresh('Hello');
      logInfo(`step2 finishRefresh("Hello"): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.move(10, -100, true);
      logInfo(`step3 move(10, -100, true): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.footerText();
      logInfo(`step4 footerText(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.footerText();
      logInfo(`step5 footerText(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}PullGestureModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0047
     * @tc.name      PullToRefresh_PullGestureModelFlow_0047
     * @tc.desc      PullGestureModel call flow arrowAngle > footerText > release > touchDown > move keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0047 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.arrowAngle();
      logInfo(`step1 arrowAngle(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.footerText();
      logInfo(`step2 footerText(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('free');
      subject.touchDown(3);
      const step5: number = subject.move(-100, 0, false);
      logInfo(`step5 move(-100, 0, false): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0048
     * @tc.name      PullToRefresh_PullGestureModelFlow_0048
     * @tc.desc      PullGestureModel call flow move > bottom > closeRefresh > top keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0048 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.move(2, -100, true);
      logInfo(`step1 move(2, -100, true): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.bottom();
      logInfo(`step2 bottom(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.closeRefresh();
      const step4: number = subject.top();
      logInfo(`step4 top(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0049
     * @tc.name      PullToRefresh_PullGestureModelFlow_0049
     * @tc.desc      PullGestureModel call flow top > closeLoad > finishRefresh > currentState keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0049 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.top();
      logInfo(`step1 top(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.closeLoad();
      const step3: number = subject.finishRefresh(' Hello ');
      logInfo(`step3 finishRefresh(" Hello "): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.currentState();
      logInfo(`step4 currentState(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0050
     * @tc.name      PullToRefresh_PullGestureModelFlow_0050
     * @tc.desc      PullGestureModel call flow arrowAngle > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0050 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: number = subject.arrowAngle();
      logInfo(`step1 arrowAngle(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('free');
      logInfo(`${BUNDLE}PullGestureModelFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0051
     * @tc.name      PullToRefresh_PullGestureModelFlow_0051
     * @tc.desc      PullGestureModel call flow closeLoad > touchDown > touchDown > currentState keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0051 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      subject.closeLoad();
      subject.touchDown(-18);
      subject.touchDown(150);
      const step4: number = subject.currentState();
      logInfo(`step4 currentState(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0052
     * @tc.name      PullToRefresh_PullGestureModelFlow_0052
     * @tc.desc      PullGestureModel call flow arrowAngle > finishRefresh > arrowAngle keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0052 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.arrowAngle();
      logInfo(`step1 arrowAngle(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.finishRefresh('8hGQ');
      logInfo(`step2 finishRefresh("8hGQ"): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.arrowAngle();
      logInfo(`step3 arrowAngle(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0053
     * @tc.name      PullToRefresh_PullGestureModelFlow_0053
     * @tc.desc      PullGestureModel call flow release > footerText > finishRefresh > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0053 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('free');
      const step2: string = subject.footerText();
      logInfo(`step2 footerText(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.finishRefresh('SAwwv9gwdf');
      logInfo(`step3 finishRefresh("SAwwv9gwdf"): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.move(-1, 15, true);
      logInfo(`step4 move(-1, 15, true): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0054
     * @tc.name      PullToRefresh_PullGestureModelFlow_0054
     * @tc.desc      PullGestureModel call flow finishRefresh > closeRefresh > top > release > bottom keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0054 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.finishRefresh('');
      logInfo(`step1 finishRefresh(""): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.closeRefresh();
      const step3: number = subject.top();
      logInfo(`step3 top(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('free');
      const step5: number = subject.bottom();
      logInfo(`step5 bottom(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0055
     * @tc.name      PullToRefresh_PullGestureModelFlow_0055
     * @tc.desc      PullGestureModel call flow bottom > finishRefresh > closeRefresh > finishRefresh > finishRefresh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0055 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.bottom();
      logInfo(`step1 bottom(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.finishRefresh('A');
      logInfo(`step2 finishRefresh("A"): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.closeRefresh();
      const step4: number = subject.finishRefresh('  ');
      logInfo(`step4 finishRefresh("  "): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.finishRefresh('da');
      logInfo(`step5 finishRefresh("da"): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0056
     * @tc.name      PullToRefresh_PullGestureModelFlow_0056
     * @tc.desc      PullGestureModel call flow finishRefresh > release > closeLoad keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0056 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const step1: number = subject.finishRefresh(' Sample Title 123 ');
      logInfo(`step1 finishRefresh(" Sample Title 123 "): step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('free');
      subject.closeLoad();
      logInfo(`${BUNDLE}PullGestureModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0057
     * @tc.name      PullToRefresh_PullGestureModelFlow_0057
     * @tc.desc      PullGestureModel call flow currentState > bottom > footerText keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0057 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const step1: number = subject.currentState();
      logInfo(`step1 currentState(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.bottom();
      logInfo(`step2 bottom(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.footerText();
      logInfo(`step3 footerText(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}PullGestureModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FLOW_0058
     * @tc.name      PullToRefresh_PullGestureModelFlow_0058
     * @tc.desc      PullGestureModel call flow touchDown > release > arrowAngle keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFlow_0058 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      subject.touchDown(155);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('free');
      const step3: number = subject.arrowAngle();
      logInfo(`step3 arrowAngle(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFlow_0058 end`);
    });
  });
}
