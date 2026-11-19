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

/** Logic checks for SubWindowDragModel flow (52 cases). */
export default function subWindowDragModelFlow2Test(): void {
  describe('SubWindowDragModelFlow2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0051
     * @tc.name      WindowManage_SubWindowDragModelFlow_0051
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0051 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-166);
      const step2: boolean = subject.touch(196, -100, 15);
      logInfo(`step2 touch(196, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(-109);
      logInfo(`setTopHeight>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`setTopHeight>touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-109);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0052
     * @tc.name      WindowManage_SubWindowDragModelFlow_0052
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0052 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(50, 100, 0);
      logInfo(`step1 touch(50, 100, 0): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(1080);
      const step3: number = subject.updateDisplay(-1, 0);
      logInfo(`step3 updateDisplay(-1, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0053
     * @tc.name      WindowManage_SubWindowDragModelFlow_0053
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0053 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(100, 3, -1);
      logInfo(`step1 touch(100, 3, -1): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(2208);
      const step3: number = subject.updateDisplay(3, 1440);
      logInfo(`step3 updateDisplay(3, 1440): step3=${step3}`);
      expect(step3).assertEqual(720);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`touch>setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2208);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0054
     * @tc.name      WindowManage_SubWindowDragModelFlow_0054
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > updateDisplay > updateDisplay keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0054 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(768);
      const step2: number = subject.updateDisplay(768, 1);
      logInfo(`step2 updateDisplay(768, 1): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.updateDisplay(1344, 360);
      logInfo(`step3 updateDisplay(1344, 360): step3=${step3}`);
      expect(step3).assertEqual(180);
      const step4: number = subject.updateDisplay(360, 1056);
      logInfo(`step4 updateDisplay(360, 1056): step4=${step4}`);
      expect(step4).assertEqual(528);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0055
     * @tc.name      WindowManage_SubWindowDragModelFlow_0055
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0055 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1464.21);
      subject.setTopHeight(2054);
      subject.setTopHeight(1821);
      logInfo(`setTopHeight>setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1821);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0056
     * @tc.name      WindowManage_SubWindowDragModelFlow_0056
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0056 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1, 864);
      logInfo(`step1 updateDisplay(1, 864): step1=${step1}`);
      expect(step1).assertEqual(432);
      const step2: boolean = subject.touch(-100, -100, -1);
      logInfo(`step2 touch(-100, -100, -1): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(-1, 10);
      logInfo(`step3 updateDisplay(-1, 10): step3=${step3}`);
      expect(step3).assertEqual(5);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0057
     * @tc.name      WindowManage_SubWindowDragModelFlow_0057
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0057 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(2, 3);
      logInfo(`step1 updateDisplay(2, 3): step1=${step1}`);
      expect(step1).assertClose(1.5, PRECISION);
      const step2: boolean = subject.touch(196, -100, 15);
      logInfo(`step2 touch(196, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0058
     * @tc.name      WindowManage_SubWindowDragModelFlow_0058
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > touch > setTopHeight > updateDisplay...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0058 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(1, 864);
      logInfo(`step1 updateDisplay(1, 864): step1=${step1}`);
      expect(step1).assertEqual(432);
      subject.setTopHeight(-667);
      const step3: boolean = subject.touch(1, 5, 100);
      logInfo(`step3 touch(1, 5, 100): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(1536);
      const step5: number = subject.updateDisplay(96, 1824);
      logInfo(`step5 updateDisplay(96, 1824): step5=${step5}`);
      expect(step5).assertEqual(912);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0059
     * @tc.name      WindowManage_SubWindowDragModelFlow_0059
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0059 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(3360);
      const step2: number = subject.updateDisplay(1, 864);
      logInfo(`step2 updateDisplay(1, 864): step2=${step2}`);
      expect(step2).assertEqual(432);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3360);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0060
     * @tc.name      WindowManage_SubWindowDragModelFlow_0060
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0060 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(576, 1);
      logInfo(`step1 updateDisplay(576, 1): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.touch(5, -1, -8);
      logInfo(`step2 touch(5, -1, -8): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(1728, 0);
      logInfo(`step3 updateDisplay(1728, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.touch(50, 97, -8);
      logInfo(`step4 touch(50, 97, -8): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`updateDisplay>touch>updateDisplay>touch f...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`updateDisplay>touch>updateDisplay>touch f...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`updateDisplay>touch>updateDisplay>touch f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay>touch>updateDisplay>touch f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0061
     * @tc.name      WindowManage_SubWindowDragModelFlow_0061
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0061 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(1, 100, 100);
      logInfo(`step1 touch(1, 100, 100): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(480, 1920);
      logInfo(`step2 updateDisplay(480, 1920): step2=${step2}`);
      expect(step2).assertEqual(960);
      const step3: boolean = subject.touch(-100, 15, 0);
      logInfo(`step3 touch(-100, 15, 0): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(1, 50, 25);
      logInfo(`step4 touch(1, 50, 25): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`touch>updateDisplay>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>updateDisplay>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`touch>updateDisplay>touch>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`touch>updateDisplay>touch>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(480);
      logInfo(`touch>updateDisplay>touch>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`touch>updateDisplay>touch>touch final: subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0062
     * @tc.name      WindowManage_SubWindowDragModelFlow_0062
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0062 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2400);
      const step2: number = subject.updateDisplay(1056, 384);
      logInfo(`step2 updateDisplay(1056, 384): step2=${step2}`);
      expect(step2).assertEqual(192);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1056);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2400);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0063
     * @tc.name      WindowManage_SubWindowDragModelFlow_0063
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > touch > updateDisplay > touch keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0063 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1824);
      const step2: boolean = subject.touch(-100, -100, 100);
      logInfo(`step2 touch(-100, -100, 100): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(50, 97, -8);
      logInfo(`step3 touch(50, 97, -8): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(0, 672);
      logInfo(`step4 updateDisplay(0, 672): step4=${step4}`);
      expect(step4).assertEqual(336);
      const step5: boolean = subject.touch(-100, -100, 25);
      logInfo(`step5 touch(-100, -100, 25): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0064
     * @tc.name      WindowManage_SubWindowDragModelFlow_0064
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0064 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1);
      const step2: boolean = subject.touch(-100, -100, 2);
      logInfo(`step2 touch(-100, -100, 2): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(-1, 3, 5);
      logInfo(`step3 touch(-1, 3, 5): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`setTopHeight>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`setTopHeight>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`setTopHeight>touch>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0065
     * @tc.name      WindowManage_SubWindowDragModelFlow_0065
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0065 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1675.2);
      const step2: boolean = subject.touch(1, 2, 10);
      logInfo(`step2 touch(1, 2, 10): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1675.2, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0066
     * @tc.name      WindowManage_SubWindowDragModelFlow_0066
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0066 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(0, 97, 15);
      logInfo(`step1 touch(0, 97, 15): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(-1033);
      const step3: boolean = subject.touch(1, 5, 100);
      logInfo(`step3 touch(1, 5, 100): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`touch>setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`touch>setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1033);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0067
     * @tc.name      WindowManage_SubWindowDragModelFlow_0067
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > touch > setTopHeight keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0067 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(389.07);
      const step2: number = subject.updateDisplay(1632, 1536);
      logInfo(`step2 updateDisplay(1632, 1536): step2=${step2}`);
      expect(step2).assertEqual(768);
      const step3: boolean = subject.touch(1, 97, 15);
      logInfo(`step3 touch(1, 97, 15): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(1728);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1632);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0068
     * @tc.name      WindowManage_SubWindowDragModelFlow_0068
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > updateDisplay > updateDisplay keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0068 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-1107);
      const step2: boolean = subject.touch(-100, 97, 0);
      logInfo(`step2 touch(-100, 97, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(1056, 96);
      logInfo(`step3 updateDisplay(1056, 96): step3=${step3}`);
      expect(step3).assertEqual(48);
      const step4: number = subject.updateDisplay(1056, 1632);
      logInfo(`step4 updateDisplay(1056, 1632): step4=${step4}`);
      expect(step4).assertEqual(816);
      logInfo(`setTopHeight>touch>updateDisplay>updateDi...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>touch>updateDisplay>updateDi...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`setTopHeight>touch>updateDisplay>updateDi...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`setTopHeight>touch>updateDisplay>updateDi...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1056);
      logInfo(`setTopHeight>touch>updateDisplay>updateDi...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`setTopHeight>touch>updateDisplay>updateDi...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1107);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0069
     * @tc.name      WindowManage_SubWindowDragModelFlow_0069
     * @tc.desc      SubWindowDragModel call flow touch > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0069 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(5, -100, 0);
      logInfo(`step1 touch(5, -100, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(0, 97, 25);
      logInfo(`step2 touch(0, 97, 25): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(100, 3, -1);
      logInfo(`step3 touch(100, 3, -1): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`touch>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0070
     * @tc.name      WindowManage_SubWindowDragModelFlow_0070
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > touch > setTopHeight > touch keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0070 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(1248, 10);
      logInfo(`step1 updateDisplay(1248, 10): step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: boolean = subject.touch(-100, 15, 0);
      logInfo(`step2 touch(-100, 15, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(196, -100, -1);
      logInfo(`step3 touch(196, -100, -1): step3=${step3}`);
      expect(step3).assertTrue();
      subject.setTopHeight(596.16);
      const step5: boolean = subject.touch(15, 2, 15);
      logInfo(`step5 touch(15, 2, 15): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`updateDisplay>touch>touch>setTopHeight>to...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`updateDisplay>touch>touch>setTopHeight>to...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`updateDisplay>touch>touch>setTopHeight>to...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay>touch>touch>setTopHeight>to...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1248);
      logInfo(`updateDisplay>touch>touch>setTopHeight>to...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`updateDisplay>touch>touch>setTopHeight>to...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(596.16, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0071
     * @tc.name      WindowManage_SubWindowDragModelFlow_0071
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0071 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-1132);
      const step2: boolean = subject.touch(-1, -100, 15);
      logInfo(`step2 touch(-1, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1132);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0072
     * @tc.name      WindowManage_SubWindowDragModelFlow_0072
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0072 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(1632, 1536);
      logInfo(`step1 updateDisplay(1632, 1536): step1=${step1}`);
      expect(step1).assertEqual(768);
      const step2: boolean = subject.touch(5, 15, 20);
      logInfo(`step2 touch(5, 15, 20): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1632);
      logInfo(`updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0073
     * @tc.name      WindowManage_SubWindowDragModelFlow_0073
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0073 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2016);
      const step2: number = subject.updateDisplay(360, 10);
      logInfo(`step2 updateDisplay(360, 10): step2=${step2}`);
      expect(step2).assertEqual(5);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2016);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0074
     * @tc.name      WindowManage_SubWindowDragModelFlow_0074
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > updateDisplay > updateDisplay keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0074 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1728, 1824);
      logInfo(`step1 updateDisplay(1728, 1824): step1=${step1}`);
      expect(step1).assertEqual(912);
      const step2: boolean = subject.touch(15, -100, 0);
      logInfo(`step2 touch(15, -100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(288, 100);
      logInfo(`step3 updateDisplay(288, 100): step3=${step3}`);
      expect(step3).assertEqual(50);
      const step4: number = subject.updateDisplay(1248, 100);
      logInfo(`step4 updateDisplay(1248, 100): step4=${step4}`);
      expect(step4).assertEqual(50);
      logInfo(`updateDisplay>touch>updateDisplay>updateD...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`updateDisplay>touch>updateDisplay>updateD...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`updateDisplay>touch>updateDisplay>updateD...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay>touch>updateDisplay>updateD...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1248);
      logInfo(`updateDisplay>touch>updateDisplay>updateD...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0075
     * @tc.name      WindowManage_SubWindowDragModelFlow_0075
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0075 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(1248, 10);
      logInfo(`step1 updateDisplay(1248, 10): step1=${step1}`);
      expect(step1).assertEqual(5);
      subject.setTopHeight(-1033);
      subject.setTopHeight(1824);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1248);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0076
     * @tc.name      WindowManage_SubWindowDragModelFlow_0076
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0076 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1675.2);
      const step2: boolean = subject.touch(1, -100, 0);
      logInfo(`step2 touch(1, -100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(15, 97, 100);
      logInfo(`step3 touch(15, 97, 100): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(576, 1);
      logInfo(`step4 updateDisplay(576, 1): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      logInfo(`setTopHeight>touch>touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`setTopHeight>touch>touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`setTopHeight>touch>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`setTopHeight>touch>touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(576);
      logInfo(`setTopHeight>touch>touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`setTopHeight>touch>touch>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1675.2, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0077
     * @tc.name      WindowManage_SubWindowDragModelFlow_0077
     * @tc.desc      SubWindowDragModel call flow touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0077 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(196, -1, 3);
      logInfo(`step1 touch(196, -1, 3): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(5, 15, 15);
      logInfo(`step2 touch(5, 15, 15): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0078
     * @tc.name      WindowManage_SubWindowDragModelFlow_0078
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0078 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1981);
      const step2: number = subject.updateDisplay(3, 1440);
      logInfo(`step2 updateDisplay(3, 1440): step2=${step2}`);
      expect(step2).assertEqual(720);
      const step3: number = subject.updateDisplay(960, 1536);
      logInfo(`step3 updateDisplay(960, 1536): step3=${step3}`);
      expect(step3).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay>updateDisplay ...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay>updateDisplay ...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(960);
      logInfo(`setTopHeight>updateDisplay>updateDisplay ...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`setTopHeight>updateDisplay>updateDisplay ...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1981);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0079
     * @tc.name      WindowManage_SubWindowDragModelFlow_0079
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > touch > touch > setTopHeight keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0079 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(196, 2, 15);
      logInfo(`step1 touch(196, 2, 15): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(0, 1152);
      logInfo(`step2 updateDisplay(0, 1152): step2=${step2}`);
      expect(step2).assertEqual(576);
      const step3: boolean = subject.touch(100, -100, 0);
      logInfo(`step3 touch(100, -100, 0): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(-1, 100, 5);
      logInfo(`step4 touch(-1, 100, 5): step4=${step4}`);
      expect(step4).assertFalse();
      subject.setTopHeight(1821);
      logInfo(`touch>updateDisplay>touch>touch>setTopHei...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch>updateDisplay>touch>touch>setTopHei...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>updateDisplay>touch>touch>setTopHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`touch>updateDisplay>touch>touch>setTopHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`touch>updateDisplay>touch>touch>setTopHei...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1821);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0080
     * @tc.name      WindowManage_SubWindowDragModelFlow_0080
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0080 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2724);
      subject.setTopHeight(180.61);
      logInfo(`setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(180.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0081
     * @tc.name      WindowManage_SubWindowDragModelFlow_0081
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > touch > setTopHeight > updateDisplay keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0081 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(5, 15, 20);
      logInfo(`step1 touch(5, 15, 20): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(480, 2);
      logInfo(`step2 updateDisplay(480, 2): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: boolean = subject.touch(2, -100, 20);
      logInfo(`step3 touch(2, -100, 20): step3=${step3}`);
      expect(step3).assertTrue();
      subject.setTopHeight(480);
      const step5: number = subject.updateDisplay(192, 864);
      logInfo(`step5 updateDisplay(192, 864): step5=${step5}`);
      expect(step5).assertEqual(432);
      logInfo(`touch>updateDisplay>touch>setTopHeight>up...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch>updateDisplay>touch>setTopHeight>up...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>updateDisplay>touch>setTopHeight>up...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`touch>updateDisplay>touch>setTopHeight>up...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(192);
      logInfo(`touch>updateDisplay>touch>setTopHeight>up...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`touch>updateDisplay>touch>setTopHeight>up...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0082
     * @tc.name      WindowManage_SubWindowDragModelFlow_0082
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0082 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(-1, 2, -1);
      logInfo(`step1 touch(-1, 2, -1): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(1678);
      logInfo(`touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1678);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0083
     * @tc.name      WindowManage_SubWindowDragModelFlow_0083
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0083 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(50, 2, 10);
      logInfo(`step1 touch(50, 2, 10): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(2278);
      logInfo(`touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2278);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0084
     * @tc.name      WindowManage_SubWindowDragModelFlow_0084
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight > touch > updateDisplay keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0084 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(5, 50, 0);
      logInfo(`step1 touch(5, 50, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(-1, 15, 25);
      logInfo(`step2 touch(-1, 15, 25): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(719);
      const step4: boolean = subject.touch(196, -100, 15);
      logInfo(`step4 touch(196, -100, 15): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.updateDisplay(0, 1632);
      logInfo(`step5 updateDisplay(0, 1632): step5=${step5}`);
      expect(step5).assertEqual(816);
      logInfo(`touch>touch>setTopHeight>touch>updateDisp...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch>touch>setTopHeight>touch>updateDisp...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>touch>setTopHeight>touch>updateDisp...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`touch>touch>setTopHeight>touch>updateDisp...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`touch>touch>setTopHeight>touch>updateDisp...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`touch>touch>setTopHeight>touch>updateDisp...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(719);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0085
     * @tc.name      WindowManage_SubWindowDragModelFlow_0085
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0085 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1248);
      const step2: number = subject.updateDisplay(3, 1);
      logInfo(`step2 updateDisplay(3, 1): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0086
     * @tc.name      WindowManage_SubWindowDragModelFlow_0086
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0086 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1054.19);
      const step2: boolean = subject.touch(-100, 10, 2);
      logInfo(`step2 touch(-100, 10, 2): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(50, 97, -8);
      logInfo(`step3 touch(50, 97, -8): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`setTopHeight>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`setTopHeight>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`setTopHeight>touch>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1054.19, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0087
     * @tc.name      WindowManage_SubWindowDragModelFlow_0087
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > touch > touch > setTopHeight keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0087 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(360, 1728);
      logInfo(`step1 updateDisplay(360, 1728): step1=${step1}`);
      expect(step1).assertEqual(864);
      const step2: boolean = subject.touch(-1, 15, 1);
      logInfo(`step2 touch(-1, 15, 1): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(-100, -100, 1);
      logInfo(`step3 touch(-100, -100, 1): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.touch(5, 2, 3);
      logInfo(`step4 touch(5, 2, 3): step4=${step4}`);
      expect(step4).assertTrue();
      subject.setTopHeight(3456);
      logInfo(`updateDisplay>touch>touch>touch>setTopHei...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`updateDisplay>touch>touch>touch>setTopHei...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`updateDisplay>touch>touch>touch>setTopHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay>touch>touch>touch>setTopHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay>touch>touch>touch>setTopHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`updateDisplay>touch>touch>touch>setTopHei...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3456);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0088
     * @tc.name      WindowManage_SubWindowDragModelFlow_0088
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0088 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1179);
      subject.setTopHeight(-1778);
      subject.setTopHeight(-1107);
      logInfo(`setTopHeight>setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1107);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0089
     * @tc.name      WindowManage_SubWindowDragModelFlow_0089
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0089 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(10, 0);
      logInfo(`step1 updateDisplay(10, 0): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.touch(2, 0, -1);
      logInfo(`step2 touch(2, 0, -1): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0090
     * @tc.name      WindowManage_SubWindowDragModelFlow_0090
     * @tc.desc      SubWindowDragModel call flow touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0090 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(-100, 5, 0);
      logInfo(`step1 touch(-100, 5, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(10, 100, 10);
      logInfo(`step2 touch(10, 100, 10): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0091
     * @tc.name      WindowManage_SubWindowDragModelFlow_0091
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > setTopHeight > setTopHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0091 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(360, 1056);
      logInfo(`step1 updateDisplay(360, 1056): step1=${step1}`);
      expect(step1).assertEqual(528);
      const step2: number = subject.updateDisplay(-1, 10);
      logInfo(`step2 updateDisplay(-1, 10): step2=${step2}`);
      expect(step2).assertEqual(5);
      subject.setTopHeight(2400);
      subject.setTopHeight(53);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(53);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0092
     * @tc.name      WindowManage_SubWindowDragModelFlow_0092
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0092 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(2, 0);
      logInfo(`step1 updateDisplay(2, 0): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.updateDisplay(100, 1728);
      logInfo(`step2 updateDisplay(100, 1728): step2=${step2}`);
      expect(step2).assertEqual(864);
      const step3: boolean = subject.touch(-100, 100, 0);
      logInfo(`step3 touch(-100, 100, 0): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`updateDisplay>updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0093
     * @tc.name      WindowManage_SubWindowDragModelFlow_0093
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > touch > updateDisplay > setTopHeigh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0093 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(768, -1);
      logInfo(`step1 updateDisplay(768, -1): step1=${step1}`);
      expect(step1).assertClose(-0.5, PRECISION);
      const step2: number = subject.updateDisplay(672, 960);
      logInfo(`step2 updateDisplay(672, 960): step2=${step2}`);
      expect(step2).assertEqual(480);
      const step3: boolean = subject.touch(-100, -100, 20);
      logInfo(`step3 touch(-100, -100, 20): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(1344, 0);
      logInfo(`step4 updateDisplay(1344, 0): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.setTopHeight(1155.84);
      logInfo(`updateDisplay>updateDisplay>touch>updateD...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`updateDisplay>updateDisplay>touch>updateD...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`updateDisplay>updateDisplay>touch>updateD...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay>updateDisplay>touch>updateD...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1344);
      logInfo(`updateDisplay>updateDisplay>touch>updateD...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1155.84, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0094
     * @tc.name      WindowManage_SubWindowDragModelFlow_0094
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > updateDisplay > setTopHeight > setTopHeight...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0094 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(-100, 0, 0);
      logInfo(`step1 touch(-100, 0, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(3, 1);
      logInfo(`step2 updateDisplay(3, 1): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      const step3: number = subject.updateDisplay(-1, 288);
      logInfo(`step3 updateDisplay(-1, 288): step3=${step3}`);
      expect(step3).assertEqual(144);
      subject.setTopHeight(1728);
      subject.setTopHeight(180.61);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(180.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0095
     * @tc.name      WindowManage_SubWindowDragModelFlow_0095
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0095 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1056, 96);
      logInfo(`step1 updateDisplay(1056, 96): step1=${step1}`);
      expect(step1).assertEqual(48);
      subject.setTopHeight(960);
      logInfo(`updateDisplay>setTopHeight final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay>setTopHeight final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1056);
      logInfo(`updateDisplay>setTopHeight final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`updateDisplay>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0096
     * @tc.name      WindowManage_SubWindowDragModelFlow_0096
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > updateDisplay > setTopHeight keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0096 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(2976);
      subject.setTopHeight(1821);
      const step3: number = subject.updateDisplay(-1, 288);
      logInfo(`step3 updateDisplay(-1, 288): step3=${step3}`);
      expect(step3).assertEqual(144);
      subject.setTopHeight(848);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(848);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0097
     * @tc.name      WindowManage_SubWindowDragModelFlow_0097
     * @tc.desc      SubWindowDragModel call flow touch > touch > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0097 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(5, 50, 5);
      logInfo(`step1 touch(5, 50, 5): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(1, 50, 25);
      logInfo(`step2 touch(1, 50, 25): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(15, 2, 15);
      logInfo(`step3 touch(15, 2, 15): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(2, 0);
      logInfo(`step4 updateDisplay(2, 0): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`touch>touch>touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch>touch>touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`touch>touch>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>touch>touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0098
     * @tc.name      WindowManage_SubWindowDragModelFlow_0098
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > setTopHeight > touch keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0098 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1179.9);
      subject.setTopHeight(480);
      subject.setTopHeight(-166);
      const step4: boolean = subject.touch(10, 100, 10);
      logInfo(`step4 touch(10, 100, 10): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`setTopHeight>setTopHeight>setTopHeight>to...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`setTopHeight>setTopHeight>setTopHeight>to...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`setTopHeight>setTopHeight>setTopHeight>to...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-166);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0099
     * @tc.name      WindowManage_SubWindowDragModelFlow_0099
     * @tc.desc      SubWindowDragModel call flow touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0099 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(3, 100, 5);
      logInfo(`step1 touch(3, 100, 5): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(196, 10, -8);
      logInfo(`step2 touch(196, 10, -8): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0100
     * @tc.name      WindowManage_SubWindowDragModelFlow_0100
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0100 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2688);
      subject.setTopHeight(1536);
      logInfo(`setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0101
     * @tc.name      WindowManage_SubWindowDragModelFlow_0101
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0101 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(100, 3, 5);
      logInfo(`step1 touch(100, 3, 5): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(180.61);
      logInfo(`touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(180.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0102
     * @tc.name      WindowManage_SubWindowDragModelFlow_0102
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0102 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(-100, 97, 0);
      logInfo(`step1 touch(-100, 97, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(576, 10);
      logInfo(`step2 updateDisplay(576, 10): step2=${step2}`);
      expect(step2).assertEqual(5);
      logInfo(`touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(576);
      logInfo(`touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0102 end`);
    });
  });
}
