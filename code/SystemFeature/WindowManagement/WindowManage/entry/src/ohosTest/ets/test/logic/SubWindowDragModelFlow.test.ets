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
import { SubWindowDragModel } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SubWindowDragModel flow (50 cases). */
export default function subWindowDragModelFlowTest(): void {
  describe('SubWindowDragModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0001
     * @tc.name      WindowManage_SubWindowDragModelFlow_0001
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0001 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1823);
      subject.setTopHeight(2);
      subject.setTopHeight(861.1);
      logInfo(`setTopHeight>setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(861.1, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0002
     * @tc.name      WindowManage_SubWindowDragModelFlow_0002
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > setTopHeight > touch > updateDisplay keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0002 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(2, 360);
      logInfo(`step1 updateDisplay(2, 360): step1=${step1}`);
      expect(step1).assertEqual(180);
      const step2: boolean = subject.touch(196, 10, 3);
      logInfo(`step2 touch(196, 10, 3): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(1248);
      const step4: boolean = subject.touch(-100, 97, -1);
      logInfo(`step4 touch(-100, 97, -1): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.updateDisplay(1920, 100);
      logInfo(`step5 updateDisplay(1920, 100): step5=${step5}`);
      expect(step5).assertEqual(50);
      logInfo(`updateDisplay>touch>setTopHeight>touch>up...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`updateDisplay>touch>setTopHeight>touch>up...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`updateDisplay>touch>setTopHeight>touch>up...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay>touch>setTopHeight>touch>up...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay>touch>setTopHeight>touch>up...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`updateDisplay>touch>setTopHeight>touch>up...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0003
     * @tc.name      WindowManage_SubWindowDragModelFlow_0003
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > updateDisplay > touch > setTopHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0003 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-99);
      const step2: boolean = subject.touch(50, 97, -8);
      logInfo(`step2 touch(50, 97, -8): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(0, 480);
      logInfo(`step3 updateDisplay(0, 480): step3=${step3}`);
      expect(step3).assertEqual(240);
      const step4: boolean = subject.touch(100, 100, -8);
      logInfo(`step4 touch(100, 100, -8): step4=${step4}`);
      expect(step4).assertFalse();
      subject.setTopHeight(-119);
      logInfo(`setTopHeight>touch>updateDisplay>touch>se...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`setTopHeight>touch>updateDisplay>touch>se...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`setTopHeight>touch>updateDisplay>touch>se...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`setTopHeight>touch>updateDisplay>touch>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`setTopHeight>touch>updateDisplay>touch>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`setTopHeight>touch>updateDisplay>touch>se...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-119);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0004
     * @tc.name      WindowManage_SubWindowDragModelFlow_0004
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > setTopHeight > updateDisplay > touch keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0004 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(-100, 3, 0);
      logInfo(`step1 touch(-100, 3, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(0, 360);
      logInfo(`step2 updateDisplay(0, 360): step2=${step2}`);
      expect(step2).assertEqual(180);
      subject.setTopHeight(848);
      const step4: number = subject.updateDisplay(192, 2);
      logInfo(`step4 updateDisplay(192, 2): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: boolean = subject.touch(5, 50, 20);
      logInfo(`step5 touch(5, 50, 20): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(192);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(848);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0005
     * @tc.name      WindowManage_SubWindowDragModelFlow_0005
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > setTopHeight > updateDisplay keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0005 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(-100, -100, 10);
      logInfo(`step1 touch(-100, -100, 10): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(1, 1632);
      logInfo(`step2 updateDisplay(1, 1632): step2=${step2}`);
      expect(step2).assertEqual(816);
      subject.setTopHeight(2054);
      const step4: number = subject.updateDisplay(1344, 360);
      logInfo(`step4 updateDisplay(1344, 360): step4=${step4}`);
      expect(step4).assertEqual(180);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1344);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2054);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0006
     * @tc.name      WindowManage_SubWindowDragModelFlow_0006
     * @tc.desc      SubWindowDragModel call flow touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0006 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(5, 15, 20);
      logInfo(`step1 touch(5, 15, 20): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(100, -100, 0);
      logInfo(`step2 touch(100, -100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0007
     * @tc.name      WindowManage_SubWindowDragModelFlow_0007
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0007 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(196, 100, 20);
      logInfo(`step1 touch(196, 100, 20): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(-24);
      logInfo(`touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-24);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0008
     * @tc.name      WindowManage_SubWindowDragModelFlow_0008
     * @tc.desc      SubWindowDragModel call flow touch > touch > updateDisplay > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0008 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(15, 10, 10);
      logInfo(`step1 touch(15, 10, 10): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(196, -100, 15);
      logInfo(`step2 touch(196, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(-1, 288);
      logInfo(`step3 updateDisplay(-1, 288): step3=${step3}`);
      expect(step3).assertEqual(144);
      subject.setTopHeight(480);
      logInfo(`touch>touch>updateDisplay>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch>touch>updateDisplay>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>touch>updateDisplay>setTopHeight final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`touch>touch>updateDisplay>setTopHeight final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`touch>touch>updateDisplay>setTopHeight final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`touch>touch>updateDisplay>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0009
     * @tc.name      WindowManage_SubWindowDragModelFlow_0009
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > setTopHeight > setTopHeight > updateDisplay ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0009 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1678);
      const step2: boolean = subject.touch(3, -100, 15);
      logInfo(`step2 touch(3, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(-266);
      subject.setTopHeight(412.7);
      const step5: number = subject.updateDisplay(0, 2);
      logInfo(`step5 updateDisplay(0, 2): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`setTopHeight>touch>setTopHeight>setTopHei...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`setTopHeight>touch>setTopHeight>setTopHei...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch>setTopHeight>setTopHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`setTopHeight>touch>setTopHeight>setTopHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`setTopHeight>touch>setTopHeight>setTopHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`setTopHeight>touch>setTopHeight>setTopHei...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(412.7, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0010
     * @tc.name      WindowManage_SubWindowDragModelFlow_0010
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0010 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1214);
      const step2: boolean = subject.touch(5, -1, -8);
      logInfo(`step2 touch(5, -1, -8): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1214);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0011
     * @tc.name      WindowManage_SubWindowDragModelFlow_0011
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > updateDisplay > setTopHeight keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0011 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(3437);
      const step2: boolean = subject.touch(-1, 97, 2);
      logInfo(`step2 touch(-1, 97, 2): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(0, 10);
      logInfo(`step3 updateDisplay(0, 10): step3=${step3}`);
      expect(step3).assertEqual(5);
      subject.setTopHeight(847.11);
      logInfo(`setTopHeight>touch>updateDisplay>setTopHe...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`setTopHeight>touch>updateDisplay>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`setTopHeight>touch>updateDisplay>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`setTopHeight>touch>updateDisplay>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`setTopHeight>touch>updateDisplay>setTopHe...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`setTopHeight>touch>updateDisplay>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(847.11, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0012
     * @tc.name      WindowManage_SubWindowDragModelFlow_0012
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0012 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(-1, 288);
      logInfo(`step1 updateDisplay(-1, 288): step1=${step1}`);
      expect(step1).assertEqual(144);
      const step2: boolean = subject.touch(100, 3, -1);
      logInfo(`step2 touch(100, 3, -1): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0013
     * @tc.name      WindowManage_SubWindowDragModelFlow_0013
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0013 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(288, 672);
      logInfo(`step1 updateDisplay(288, 672): step1=${step1}`);
      expect(step1).assertEqual(336);
      subject.setTopHeight(100);
      const step3: boolean = subject.touch(1, 3, 1);
      logInfo(`step3 touch(1, 3, 1): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`updateDisplay>setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`updateDisplay>setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`updateDisplay>setTopHeight>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay>setTopHeight>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(288);
      logInfo(`updateDisplay>setTopHeight>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`updateDisplay>setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0014
     * @tc.name      WindowManage_SubWindowDragModelFlow_0014
     * @tc.desc      SubWindowDragModel call flow touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0014 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(5, 10, 5);
      logInfo(`step1 touch(5, 10, 5): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(0, -1, 5);
      logInfo(`step2 touch(0, -1, 5): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0015
     * @tc.name      WindowManage_SubWindowDragModelFlow_0015
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > updateDisplay > updateDisplay > tou...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0015 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(-1, 288);
      logInfo(`step1 updateDisplay(-1, 288): step1=${step1}`);
      expect(step1).assertEqual(144);
      const step2: number = subject.updateDisplay(2, 672);
      logInfo(`step2 updateDisplay(2, 672): step2=${step2}`);
      expect(step2).assertEqual(336);
      const step3: number = subject.updateDisplay(576, 1056);
      logInfo(`step3 updateDisplay(576, 1056): step3=${step3}`);
      expect(step3).assertEqual(528);
      const step4: number = subject.updateDisplay(0, 1);
      logInfo(`step4 updateDisplay(0, 1): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: boolean = subject.touch(-100, 100, 0);
      logInfo(`step5 touch(-100, 100, 0): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0016
     * @tc.name      WindowManage_SubWindowDragModelFlow_0016
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0016 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(2, 10, 3);
      logInfo(`step1 touch(2, 10, 3): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(118);
      logInfo(`touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(118);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0017
     * @tc.name      WindowManage_SubWindowDragModelFlow_0017
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > updateDisplay > setTopHeight keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0017 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(0, 1440);
      logInfo(`step1 updateDisplay(0, 1440): step1=${step1}`);
      expect(step1).assertEqual(720);
      const step2: boolean = subject.touch(1, -100, 0);
      logInfo(`step2 touch(1, -100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(768, 0);
      logInfo(`step3 updateDisplay(768, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.setTopHeight(1);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(768);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0018
     * @tc.name      WindowManage_SubWindowDragModelFlow_0018
     * @tc.desc      SubWindowDragModel call flow touch > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0018 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(1, 15, 20);
      logInfo(`step1 touch(1, 15, 20): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(10, 5, 2);
      logInfo(`step2 touch(10, 5, 2): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(-1, 2, -1);
      logInfo(`step3 touch(-1, 2, -1): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`touch>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0019
     * @tc.name      WindowManage_SubWindowDragModelFlow_0019
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0019 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(1, 100, 100);
      logInfo(`step1 touch(1, 100, 100): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(-444);
      const step3: boolean = subject.touch(15, -1, 15);
      logInfo(`step3 touch(15, -1, 15): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(10, 10, 10);
      logInfo(`step4 touch(10, 10, 10): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>setTopHeight>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch>setTopHeight>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`touch>setTopHeight>touch>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-444);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0020
     * @tc.name      WindowManage_SubWindowDragModelFlow_0020
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0020 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1817.61);
      const step2: boolean = subject.touch(100, -100, 0);
      logInfo(`step2 touch(100, -100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1817.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0021
     * @tc.name      WindowManage_SubWindowDragModelFlow_0021
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0021 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(196, -100, 15);
      logInfo(`step1 touch(196, -100, 15): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(3, 100, 0);
      logInfo(`step2 touch(3, 100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(845.05);
      subject.setTopHeight(596.16);
      logInfo(`touch>touch>setTopHeight>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch>touch>setTopHeight>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>touch>setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(596.16, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0022
     * @tc.name      WindowManage_SubWindowDragModelFlow_0022
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0022 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(100, 0);
      logInfo(`step1 updateDisplay(100, 0): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.updateDisplay(1920, 100);
      logInfo(`step2 updateDisplay(1920, 100): step2=${step2}`);
      expect(step2).assertEqual(50);
      subject.setTopHeight(1678);
      logInfo(`updateDisplay>updateDisplay>setTopHeight ...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay>updateDisplay>setTopHeight ...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay>updateDisplay>setTopHeight ...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`updateDisplay>updateDisplay>setTopHeight ...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1678);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0023
     * @tc.name      WindowManage_SubWindowDragModelFlow_0023
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0023 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(100, 3, -1);
      logInfo(`step1 touch(100, 3, -1): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(1823);
      logInfo(`touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1823);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0024
     * @tc.name      WindowManage_SubWindowDragModelFlow_0024
     * @tc.desc      SubWindowDragModel call flow touch > touch > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0024 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(-1, -100, 25);
      logInfo(`step1 touch(-1, -100, 25): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(-1, -100, 15);
      logInfo(`step2 touch(-1, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(-100, -100, -1);
      logInfo(`step3 touch(-100, -100, -1): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(5, 50, 20);
      logInfo(`step4 touch(5, 50, 20): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>touch>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>touch>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0025
     * @tc.name      WindowManage_SubWindowDragModelFlow_0025
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > updateDisplay > setTopHeight > setT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0025 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(1248, 1344);
      logInfo(`step1 updateDisplay(1248, 1344): step1=${step1}`);
      expect(step1).assertEqual(672);
      const step2: number = subject.updateDisplay(1, 1728);
      logInfo(`step2 updateDisplay(1, 1728): step2=${step2}`);
      expect(step2).assertEqual(864);
      const step3: number = subject.updateDisplay(1152, 864);
      logInfo(`step3 updateDisplay(1152, 864): step3=${step3}`);
      expect(step3).assertEqual(432);
      subject.setTopHeight(2304);
      subject.setTopHeight(480);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1152);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0026
     * @tc.name      WindowManage_SubWindowDragModelFlow_0026
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > updateDisplay > setTopHeight > setT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0026 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(576, 1728);
      logInfo(`step1 updateDisplay(576, 1728): step1=${step1}`);
      expect(step1).assertEqual(864);
      const step2: number = subject.updateDisplay(960, 864);
      logInfo(`step2 updateDisplay(960, 864): step2=${step2}`);
      expect(step2).assertEqual(432);
      const step3: number = subject.updateDisplay(96, 720);
      logInfo(`step3 updateDisplay(96, 720): step3=${step3}`);
      expect(step3).assertEqual(360);
      subject.setTopHeight(768);
      subject.setTopHeight(180.61);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(180.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0027
     * @tc.name      WindowManage_SubWindowDragModelFlow_0027
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > updateDisplay > updateDisplay > setTo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0027 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-24);
      subject.setTopHeight(-109);
      const step3: number = subject.updateDisplay(1056, 0);
      logInfo(`step3 updateDisplay(1056, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.updateDisplay(1056, 0);
      logInfo(`step4 updateDisplay(1056, 0): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.setTopHeight(-901);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>u...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>u...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1056);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>u...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-901);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0028
     * @tc.name      WindowManage_SubWindowDragModelFlow_0028
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > setTopHeight > updateDisplay > setTopHeight ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0028 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3760);
      const step2: boolean = subject.touch(-100, 97, 0);
      logInfo(`step2 touch(-100, 97, 0): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(2496);
      const step4: number = subject.updateDisplay(0, 384);
      logInfo(`step4 updateDisplay(0, 384): step4=${step4}`);
      expect(step4).assertEqual(192);
      subject.setTopHeight(1248);
      logInfo(`setTopHeight>touch>setTopHeight>updateDis...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>touch>setTopHeight>updateDis...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`setTopHeight>touch>setTopHeight>updateDis...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`setTopHeight>touch>setTopHeight>updateDis...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`setTopHeight>touch>setTopHeight>updateDis...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0029
     * @tc.name      WindowManage_SubWindowDragModelFlow_0029
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0029 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(596.16);
      const step2: number = subject.updateDisplay(10, 1);
      logInfo(`step2 updateDisplay(10, 1): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(596.16, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0030
     * @tc.name      WindowManage_SubWindowDragModelFlow_0030
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0030 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(1, 50, 25);
      logInfo(`step1 touch(1, 50, 25): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(96, 1824);
      logInfo(`step2 updateDisplay(96, 1824): step2=${step2}`);
      expect(step2).assertEqual(912);
      subject.setTopHeight(2880);
      const step4: boolean = subject.touch(-100, -100, 3);
      logInfo(`step4 touch(-100, -100, 3): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2880);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0031
     * @tc.name      WindowManage_SubWindowDragModelFlow_0031
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0031 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1179);
      const step2: number = subject.updateDisplay(1056, 1632);
      logInfo(`step2 updateDisplay(1056, 1632): step2=${step2}`);
      expect(step2).assertEqual(816);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1056);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1179);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0032
     * @tc.name      WindowManage_SubWindowDragModelFlow_0032
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > setTopHeight > updateDisplay > touch...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0032 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2592);
      const step2: number = subject.updateDisplay(1080, 768);
      logInfo(`step2 updateDisplay(1080, 768): step2=${step2}`);
      expect(step2).assertEqual(384);
      subject.setTopHeight(388.56);
      const step4: number = subject.updateDisplay(768, 1);
      logInfo(`step4 updateDisplay(768, 1): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      const step5: boolean = subject.touch(50, 15, 3);
      logInfo(`step5 touch(50, 15, 3): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`setTopHeight>updateDisplay>setTopHeight>u...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`setTopHeight>updateDisplay>setTopHeight>u...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`setTopHeight>updateDisplay>setTopHeight>u...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`setTopHeight>updateDisplay>setTopHeight>u...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay>setTopHeight>u...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`setTopHeight>updateDisplay>setTopHeight>u...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(388.56, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0033
     * @tc.name      WindowManage_SubWindowDragModelFlow_0033
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0033 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(768, 1152);
      logInfo(`step1 updateDisplay(768, 1152): step1=${step1}`);
      expect(step1).assertEqual(576);
      const step2: boolean = subject.touch(10, 0, 10);
      logInfo(`step2 touch(10, 0, 10): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(2339);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(768);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2339);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0034
     * @tc.name      WindowManage_SubWindowDragModelFlow_0034
     * @tc.desc      SubWindowDragModel call flow touch > touch > updateDisplay > updateDisplay > setTopHeight keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0034 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(-100, -100, -1);
      logInfo(`step1 touch(-100, -100, -1): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(100, 97, 100);
      logInfo(`step2 touch(100, 97, 100): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(720, 0);
      logInfo(`step3 updateDisplay(720, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.updateDisplay(1728, 1824);
      logInfo(`step4 updateDisplay(1728, 1824): step4=${step4}`);
      expect(step4).assertEqual(912);
      subject.setTopHeight(-99);
      logInfo(`touch>touch>updateDisplay>updateDisplay>s...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>touch>updateDisplay>updateDisplay>s...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`touch>touch>updateDisplay>updateDisplay>s...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`touch>touch>updateDisplay>updateDisplay>s...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1728);
      logInfo(`touch>touch>updateDisplay>updateDisplay>s...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`touch>touch>updateDisplay>updateDisplay>s...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-99);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0035
     * @tc.name      WindowManage_SubWindowDragModelFlow_0035
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0035 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1152, 864);
      logInfo(`step1 updateDisplay(1152, 864): step1=${step1}`);
      expect(step1).assertEqual(432);
      const step2: number = subject.updateDisplay(0, 672);
      logInfo(`step2 updateDisplay(0, 672): step2=${step2}`);
      expect(step2).assertEqual(336);
      logInfo(`updateDisplay>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0036
     * @tc.name      WindowManage_SubWindowDragModelFlow_0036
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > updateDisplay > setTopHeight > setTo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0036 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(601);
      const step2: number = subject.updateDisplay(0, -1);
      logInfo(`step2 updateDisplay(0, -1): step2=${step2}`);
      expect(step2).assertClose(-0.5, PRECISION);
      const step3: number = subject.updateDisplay(96, 100);
      logInfo(`step3 updateDisplay(96, 100): step3=${step3}`);
      expect(step3).assertEqual(50);
      subject.setTopHeight(389.07);
      subject.setTopHeight(1);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0037
     * @tc.name      WindowManage_SubWindowDragModelFlow_0037
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > updateDisplay > setTopHeight > setTopHeight...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0037 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(100, 100, -8);
      logInfo(`step1 touch(100, 100, -8): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(576, 10);
      logInfo(`step2 updateDisplay(576, 10): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.updateDisplay(720, 0);
      logInfo(`step3 updateDisplay(720, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.setTopHeight(2496);
      subject.setTopHeight(360);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0038
     * @tc.name      WindowManage_SubWindowDragModelFlow_0038
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0038 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1, 1632);
      logInfo(`step1 updateDisplay(1, 1632): step1=${step1}`);
      expect(step1).assertEqual(816);
      const step2: boolean = subject.touch(196, 0, -1);
      logInfo(`step2 touch(196, 0, -1): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(180.61);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(180.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0039
     * @tc.name      WindowManage_SubWindowDragModelFlow_0039
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0039 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(3360);
      subject.setTopHeight(96);
      logInfo(`setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0040
     * @tc.name      WindowManage_SubWindowDragModelFlow_0040
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0040 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(1536, 768);
      logInfo(`step1 updateDisplay(1536, 768): step1=${step1}`);
      expect(step1).assertEqual(384);
      subject.setTopHeight(1675.2);
      subject.setTopHeight(-200);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1536);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-200);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0041
     * @tc.name      WindowManage_SubWindowDragModelFlow_0041
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0041 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(960);
      subject.setTopHeight(861.1);
      const step3: number = subject.updateDisplay(100, 480);
      logInfo(`step3 updateDisplay(100, 480): step3=${step3}`);
      expect(step3).assertEqual(240);
      logInfo(`setTopHeight>setTopHeight>updateDisplay f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`setTopHeight>setTopHeight>updateDisplay f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`setTopHeight>setTopHeight>updateDisplay f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`setTopHeight>setTopHeight>updateDisplay f...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(861.1, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0042
     * @tc.name      WindowManage_SubWindowDragModelFlow_0042
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > touch > updateDisplay > updateDisplay keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0042 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(5, 2, 3);
      logInfo(`step1 touch(5, 2, 3): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(96, 1824);
      logInfo(`step2 updateDisplay(96, 1824): step2=${step2}`);
      expect(step2).assertEqual(912);
      const step3: boolean = subject.touch(-100, -100, 20);
      logInfo(`step3 touch(-100, -100, 20): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.updateDisplay(1728, 672);
      logInfo(`step4 updateDisplay(1728, 672): step4=${step4}`);
      expect(step4).assertEqual(336);
      const step5: number = subject.updateDisplay(-1, 3);
      logInfo(`step5 updateDisplay(-1, 3): step5=${step5}`);
      expect(step5).assertClose(1.5, PRECISION);
      logInfo(`touch>updateDisplay>touch>updateDisplay>u...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>updateDisplay>touch>updateDisplay>u...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>updateDisplay>touch>updateDisplay>u...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`touch>updateDisplay>touch>updateDisplay>u...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`touch>updateDisplay>touch>updateDisplay>u...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`touch>updateDisplay>touch>updateDisplay>u...: subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0043
     * @tc.name      WindowManage_SubWindowDragModelFlow_0043
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0043 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(1920, 100);
      logInfo(`step1 updateDisplay(1920, 100): step1=${step1}`);
      expect(step1).assertEqual(50);
      const step2: boolean = subject.touch(100, -100, 0);
      logInfo(`step2 touch(100, -100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(-166);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-166);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0044
     * @tc.name      WindowManage_SubWindowDragModelFlow_0044
     * @tc.desc      SubWindowDragModel call flow touch > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0044 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(5, 50, 5);
      logInfo(`step1 touch(5, 50, 5): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(5, 50, 0);
      logInfo(`step2 touch(5, 50, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(1056, 0);
      logInfo(`step3 updateDisplay(1056, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`touch>touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`touch>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0045
     * @tc.name      WindowManage_SubWindowDragModelFlow_0045
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0045 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(2, 1824);
      logInfo(`step1 updateDisplay(2, 1824): step1=${step1}`);
      expect(step1).assertEqual(912);
      const step2: boolean = subject.touch(-100, 10, 2);
      logInfo(`step2 touch(-100, 10, 2): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(1, 100, 100);
      logInfo(`step3 touch(1, 100, 100): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(50, 97, -8);
      logInfo(`step4 touch(50, 97, -8): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`updateDisplay>touch>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`updateDisplay>touch>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`updateDisplay>touch>touch>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay>touch>touch>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`updateDisplay>touch>touch>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0046
     * @tc.name      WindowManage_SubWindowDragModelFlow_0046
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0046 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(384, 0);
      logInfo(`step1 updateDisplay(384, 0): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.updateDisplay(1920, 768);
      logInfo(`step2 updateDisplay(1920, 768): step2=${step2}`);
      expect(step2).assertEqual(384);
      logInfo(`updateDisplay>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0047
     * @tc.name      WindowManage_SubWindowDragModelFlow_0047
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0047 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1824, 1);
      logInfo(`step1 updateDisplay(1824, 1): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.touch(10, 0, 10);
      logInfo(`step2 touch(10, 0, 10): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1824);
      logInfo(`updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0048
     * @tc.name      WindowManage_SubWindowDragModelFlow_0048
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0048 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(-100, -1, 0);
      logInfo(`step1 touch(-100, -1, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(-100, -100, 1);
      logInfo(`step2 touch(-100, -100, 1): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(-99);
      logInfo(`touch>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-99);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0049
     * @tc.name      WindowManage_SubWindowDragModelFlow_0049
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0049 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(720);
      const step2: number = subject.updateDisplay(1056, 96);
      logInfo(`step2 updateDisplay(1056, 96): step2=${step2}`);
      expect(step2).assertEqual(48);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1056);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0050
     * @tc.name      WindowManage_SubWindowDragModelFlow_0050
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > updateDisplay > setTopHeight keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0050 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1824, 1);
      logInfo(`step1 updateDisplay(1824, 1): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.touch(100, -100, 0);
      logInfo(`step2 touch(100, -100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(1632, 1344);
      logInfo(`step3 updateDisplay(1632, 1344): step3=${step3}`);
      expect(step3).assertEqual(672);
      subject.setTopHeight(3840);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1632);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3840);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0050 end`);
    });
  });
}
