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

/** Logic checks for SubWindowDragModel flow (49 cases). */
export default function subWindowDragModelFlow4Test(): void {
  describe('SubWindowDragModelFlow4Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0156
     * @tc.name      WindowManage_SubWindowDragModelFlow_0156
     * @tc.desc      SubWindowDragModel call flow touch > touch > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0156 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(-1, 97, 2);
      logInfo(`step1 touch(-1, 97, 2): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(3, -100, 15);
      logInfo(`step2 touch(3, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(-100, -100, -1);
      logInfo(`step3 touch(-100, -100, -1): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(2, -100, 20);
      logInfo(`step4 touch(2, -100, 20): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>touch>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch>touch>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0157
     * @tc.name      WindowManage_SubWindowDragModelFlow_0157
     * @tc.desc      SubWindowDragModel call flow touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0157 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(196, 97, 100);
      logInfo(`step1 touch(196, 97, 100): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(-100, 100, 20);
      logInfo(`step2 touch(-100, 100, 20): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0158
     * @tc.name      WindowManage_SubWindowDragModelFlow_0158
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > setTopHeight > setTopHeight keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0158 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(196, 10, -8);
      logInfo(`step1 touch(196, 10, -8): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(100, 480);
      logInfo(`step2 updateDisplay(100, 480): step2=${step2}`);
      expect(step2).assertEqual(240);
      subject.setTopHeight(2054);
      subject.setTopHeight(1179.9);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1179.9, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0159
     * @tc.name      WindowManage_SubWindowDragModelFlow_0159
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > updateDisplay > updateDisplay keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0159 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(1, 2, 10);
      logInfo(`step1 touch(1, 2, 10): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(1248, 1920);
      logInfo(`step2 updateDisplay(1248, 1920): step2=${step2}`);
      expect(step2).assertEqual(960);
      const step3: number = subject.updateDisplay(576, 0);
      logInfo(`step3 updateDisplay(576, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.updateDisplay(192, 864);
      logInfo(`step4 updateDisplay(192, 864): step4=${step4}`);
      expect(step4).assertEqual(432);
      logInfo(`touch>updateDisplay>updateDisplay>updateD...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>updateDisplay>updateDisplay>updateD...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`touch>updateDisplay>updateDisplay>updateD...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`touch>updateDisplay>updateDisplay>updateD...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(192);
      logInfo(`touch>updateDisplay>updateDisplay>updateD...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0160
     * @tc.name      WindowManage_SubWindowDragModelFlow_0160
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0160 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(861.1);
      subject.setTopHeight(2756);
      const step3: number = subject.updateDisplay(480, 2);
      logInfo(`step3 updateDisplay(480, 2): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`setTopHeight>setTopHeight>updateDisplay f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`setTopHeight>setTopHeight>updateDisplay f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(480);
      logInfo(`setTopHeight>setTopHeight>updateDisplay f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`setTopHeight>setTopHeight>updateDisplay f...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2756);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0161
     * @tc.name      WindowManage_SubWindowDragModelFlow_0161
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0161 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(10, 1);
      logInfo(`step1 updateDisplay(10, 1): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.updateDisplay(576, 1);
      logInfo(`step2 updateDisplay(576, 1): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(576);
      logInfo(`updateDisplay>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0162
     * @tc.name      WindowManage_SubWindowDragModelFlow_0162
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > touch > touch > updateDisplay keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0162 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1981);
      const step2: number = subject.updateDisplay(1920, 100);
      logInfo(`step2 updateDisplay(1920, 100): step2=${step2}`);
      expect(step2).assertEqual(50);
      const step3: boolean = subject.touch(-100, 15, 0);
      logInfo(`step3 touch(-100, 15, 0): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(0, 15, 0);
      logInfo(`step4 touch(0, 15, 0): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.updateDisplay(0, 1536);
      logInfo(`step5 updateDisplay(0, 1536): step5=${step5}`);
      expect(step5).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay>touch>touch>up...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`setTopHeight>updateDisplay>touch>touch>up...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay>touch>touch>up...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`setTopHeight>updateDisplay>touch>touch>up...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`setTopHeight>updateDisplay>touch>touch>up...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1981);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0163
     * @tc.name      WindowManage_SubWindowDragModelFlow_0163
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > touch > setTopHeight > updateDisplay keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0163 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(5, 0, 0);
      logInfo(`step1 touch(5, 0, 0): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(2304);
      const step3: boolean = subject.touch(-1, 1, 15);
      logInfo(`step3 touch(-1, 1, 15): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(-642);
      const step5: number = subject.updateDisplay(3, 1);
      logInfo(`step5 updateDisplay(3, 1): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`touch>setTopHeight>touch>setTopHeight>upd...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch>setTopHeight>touch>setTopHeight>upd...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`touch>setTopHeight>touch>setTopHeight>upd...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`touch>setTopHeight>touch>setTopHeight>upd...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`touch>setTopHeight>touch>setTopHeight>upd...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`touch>setTopHeight>touch>setTopHeight>upd...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-642);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0164
     * @tc.name      WindowManage_SubWindowDragModelFlow_0164
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > updateDisplay > setTopHeight > touch keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0164 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(-100, 97, 0);
      logInfo(`step1 touch(-100, 97, 0): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(-1893);
      const step3: number = subject.updateDisplay(1632, 1728);
      logInfo(`step3 updateDisplay(1632, 1728): step3=${step3}`);
      expect(step3).assertEqual(864);
      subject.setTopHeight(2208);
      const step5: boolean = subject.touch(0, 1, 2);
      logInfo(`step5 touch(0, 1, 2): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1632);
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2208);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0165
     * @tc.name      WindowManage_SubWindowDragModelFlow_0165
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > setTopHeight > setTopHeight keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0165 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(-1, 1, 15);
      logInfo(`step1 touch(-1, 1, 15): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(0, 1056);
      logInfo(`step2 updateDisplay(0, 1056): step2=${step2}`);
      expect(step2).assertEqual(528);
      subject.setTopHeight(892.43);
      subject.setTopHeight(1821);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`touch>updateDisplay>setTopHeight>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1821);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0166
     * @tc.name      WindowManage_SubWindowDragModelFlow_0166
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight > setTopHeight > touch keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0166 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(2, -100, 25);
      logInfo(`step1 touch(2, -100, 25): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(1, 3, 1);
      logInfo(`step2 touch(1, 3, 1): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(1080);
      subject.setTopHeight(3437);
      const step5: boolean = subject.touch(-100, 0, 0);
      logInfo(`step5 touch(-100, 0, 0): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>touch>setTopHeight>setTopHeight>tou...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>touch>setTopHeight>setTopHeight>tou...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3437);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0167
     * @tc.name      WindowManage_SubWindowDragModelFlow_0167
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0167 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(15, -100, 0);
      logInfo(`step1 touch(15, -100, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(0, 480);
      logInfo(`step2 updateDisplay(0, 480): step2=${step2}`);
      expect(step2).assertEqual(240);
      subject.setTopHeight(118);
      const step4: boolean = subject.touch(3, 0, 25);
      logInfo(`step4 touch(3, 0, 25): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(118);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0168
     * @tc.name      WindowManage_SubWindowDragModelFlow_0168
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0168 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(5, 10, 2);
      logInfo(`step1 touch(5, 10, 2): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(0, 720);
      logInfo(`step2 updateDisplay(0, 720): step2=${step2}`);
      expect(step2).assertEqual(360);
      logInfo(`touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0169
     * @tc.name      WindowManage_SubWindowDragModelFlow_0169
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > setTopHeight > updateDisplay > setTopHeight...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0169 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(1, 864);
      logInfo(`step1 updateDisplay(1, 864): step1=${step1}`);
      expect(step1).assertEqual(432);
      const step2: boolean = subject.touch(5, 15, 15);
      logInfo(`step2 touch(5, 15, 15): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(8);
      const step4: number = subject.updateDisplay(480, 288);
      logInfo(`step4 updateDisplay(480, 288): step4=${step4}`);
      expect(step4).assertEqual(144);
      subject.setTopHeight(-166);
      logInfo(`updateDisplay>touch>setTopHeight>updateDi...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`updateDisplay>touch>setTopHeight>updateDi...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`updateDisplay>touch>setTopHeight>updateDi...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay>touch>setTopHeight>updateDi...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(480);
      logInfo(`updateDisplay>touch>setTopHeight>updateDi...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`updateDisplay>touch>setTopHeight>updateDi...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-166);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0170
     * @tc.name      WindowManage_SubWindowDragModelFlow_0170
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > updateDisplay > setTopHeight > updateDispla...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0170 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(5, 15, 20);
      logInfo(`step1 touch(5, 15, 20): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(-1, 3);
      logInfo(`step2 updateDisplay(-1, 3): step2=${step2}`);
      expect(step2).assertClose(1.5, PRECISION);
      const step3: number = subject.updateDisplay(720, 384);
      logInfo(`step3 updateDisplay(720, 384): step3=${step3}`);
      expect(step3).assertEqual(192);
      subject.setTopHeight(1155.84);
      const step5: number = subject.updateDisplay(360, 1920);
      logInfo(`step5 updateDisplay(360, 1920): step5=${step5}`);
      expect(step5).assertEqual(960);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`touch>updateDisplay>updateDisplay>setTopH...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1155.84, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0171
     * @tc.name      WindowManage_SubWindowDragModelFlow_0171
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0171 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(196, 100, 20);
      logInfo(`step1 touch(196, 100, 20): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(601);
      logInfo(`touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(601);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0172
     * @tc.name      WindowManage_SubWindowDragModelFlow_0172
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > updateDisplay > touch keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0172 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(192, 2);
      logInfo(`step1 updateDisplay(192, 2): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.updateDisplay(0, 1728);
      logInfo(`step2 updateDisplay(0, 1728): step2=${step2}`);
      expect(step2).assertEqual(864);
      const step3: number = subject.updateDisplay(96, 2);
      logInfo(`step3 updateDisplay(96, 2): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: boolean = subject.touch(3, 100, -1);
      logInfo(`step4 touch(3, 100, -1): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0173
     * @tc.name      WindowManage_SubWindowDragModelFlow_0173
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0173 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1056, 96);
      logInfo(`step1 updateDisplay(1056, 96): step1=${step1}`);
      expect(step1).assertEqual(48);
      subject.setTopHeight(960);
      subject.setTopHeight(-642);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1056);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-642);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0174
     * @tc.name      WindowManage_SubWindowDragModelFlow_0174
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > updateDisplay > updateDisplay keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0174 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(1536, 576);
      logInfo(`step1 updateDisplay(1536, 576): step1=${step1}`);
      expect(step1).assertEqual(288);
      subject.setTopHeight(1821);
      const step3: number = subject.updateDisplay(576, 1056);
      logInfo(`step3 updateDisplay(576, 1056): step3=${step3}`);
      expect(step3).assertEqual(528);
      const step4: number = subject.updateDisplay(0, 288);
      logInfo(`step4 updateDisplay(0, 288): step4=${step4}`);
      expect(step4).assertEqual(144);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1821);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0175
     * @tc.name      WindowManage_SubWindowDragModelFlow_0175
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > setTopHeight > setTopHeight > touch...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0175 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(2, 384);
      logInfo(`step1 updateDisplay(2, 384): step1=${step1}`);
      expect(step1).assertEqual(192);
      const step2: number = subject.updateDisplay(2, 384);
      logInfo(`step2 updateDisplay(2, 384): step2=${step2}`);
      expect(step2).assertEqual(192);
      subject.setTopHeight(3);
      subject.setTopHeight(-215);
      const step5: boolean = subject.touch(-100, 50, 0);
      logInfo(`step5 touch(-100, 50, 0): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-215);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0176
     * @tc.name      WindowManage_SubWindowDragModelFlow_0176
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0176 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(192, 1);
      logInfo(`step1 updateDisplay(192, 1): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: boolean = subject.touch(100, 3, 5);
      logInfo(`step2 touch(100, 3, 5): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(192);
      logInfo(`updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0177
     * @tc.name      WindowManage_SubWindowDragModelFlow_0177
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0177 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(1824, 0);
      logInfo(`step1 updateDisplay(1824, 0): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.setTopHeight(2724);
      subject.setTopHeight(1817.61);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1824);
      logInfo(`updateDisplay>setTopHeight>setTopHeight f...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1817.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0178
     * @tc.name      WindowManage_SubWindowDragModelFlow_0178
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > touch > updateDisplay > touch keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0178 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(0, 576);
      logInfo(`step1 updateDisplay(0, 576): step1=${step1}`);
      expect(step1).assertEqual(288);
      const step2: boolean = subject.touch(-1, 15, 1);
      logInfo(`step2 touch(-1, 15, 1): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(-1, 100, 20);
      logInfo(`step3 touch(-1, 100, 20): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(1536, 10);
      logInfo(`step4 updateDisplay(1536, 10): step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: boolean = subject.touch(0, 1, 2);
      logInfo(`step5 touch(0, 1, 2): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`updateDisplay>touch>touch>updateDisplay>t...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`updateDisplay>touch>touch>updateDisplay>t...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay>touch>touch>updateDisplay>t...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1536);
      logInfo(`updateDisplay>touch>touch>updateDisplay>t...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`updateDisplay>touch>touch>updateDisplay>t...: subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0179
     * @tc.name      WindowManage_SubWindowDragModelFlow_0179
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0179 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1080, 0);
      logInfo(`step1 updateDisplay(1080, 0): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.updateDisplay(2, -1);
      logInfo(`step2 updateDisplay(2, -1): step2=${step2}`);
      expect(step2).assertClose(-0.5, PRECISION);
      subject.setTopHeight(-309);
      logInfo(`updateDisplay>updateDisplay>setTopHeight ...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay>updateDisplay>setTopHeight ...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`updateDisplay>updateDisplay>setTopHeight ...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`updateDisplay>updateDisplay>setTopHeight ...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-309);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0180
     * @tc.name      WindowManage_SubWindowDragModelFlow_0180
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0180 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(50, 97, 20);
      logInfo(`step1 touch(50, 97, 20): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(576, 0);
      logInfo(`step2 updateDisplay(576, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.touch(-100, 1, 0);
      logInfo(`step3 touch(-100, 1, 0): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(1248, 1536);
      logInfo(`step4 updateDisplay(1248, 1536): step4=${step4}`);
      expect(step4).assertEqual(768);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1248);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0181
     * @tc.name      WindowManage_SubWindowDragModelFlow_0181
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0181 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(-100, 97, 5);
      logInfo(`step1 touch(-100, 97, 5): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(96);
      logInfo(`touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0182
     * @tc.name      WindowManage_SubWindowDragModelFlow_0182
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0182 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(1152);
      const step2: boolean = subject.touch(-100, -1, 0);
      logInfo(`step2 touch(-100, -1, 0): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0183
     * @tc.name      WindowManage_SubWindowDragModelFlow_0183
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > touch > updateDisplay > touch keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0183 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(3, 97, 3);
      logInfo(`step1 touch(3, 97, 3): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(100, 1728);
      logInfo(`step2 updateDisplay(100, 1728): step2=${step2}`);
      expect(step2).assertEqual(864);
      const step3: boolean = subject.touch(2, 0, -1);
      logInfo(`step3 touch(2, 0, -1): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.updateDisplay(192, 0);
      logInfo(`step4 updateDisplay(192, 0): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: boolean = subject.touch(5, 50, 0);
      logInfo(`step5 touch(5, 50, 0): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>updateDisplay>touch>updateDisplay>t...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>updateDisplay>touch>updateDisplay>t...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`touch>updateDisplay>touch>updateDisplay>t...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>updateDisplay>touch>updateDisplay>t...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(192);
      logInfo(`touch>updateDisplay>touch>updateDisplay>t...: subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0184
     * @tc.name      WindowManage_SubWindowDragModelFlow_0184
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0184 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1902.81);
      const step2: boolean = subject.touch(5, 15, -1);
      logInfo(`step2 touch(5, 15, -1): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(2112);
      logInfo(`setTopHeight>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`setTopHeight>touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`setTopHeight>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2112);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0185
     * @tc.name      WindowManage_SubWindowDragModelFlow_0185
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > updateDisplay > setTopHeight keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0185 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(5, 50, 1);
      logInfo(`step1 touch(5, 50, 1): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(719);
      const step3: number = subject.updateDisplay(1824, 0);
      logInfo(`step3 updateDisplay(1824, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.setTopHeight(1743);
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1824);
      logInfo(`touch>setTopHeight>updateDisplay>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1743);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0186
     * @tc.name      WindowManage_SubWindowDragModelFlow_0186
     * @tc.desc      SubWindowDragModel call flow touch > touch > touch > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0186 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(2, -100, 20);
      logInfo(`step1 touch(2, -100, 20): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(-1, 1, 15);
      logInfo(`step2 touch(-1, 1, 15): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(-100, -100, 100);
      logInfo(`step3 touch(-100, -100, 100): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(5, 0, 0);
      logInfo(`step4 touch(5, 0, 0): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.updateDisplay(-1, 288);
      logInfo(`step5 updateDisplay(-1, 288): step5=${step5}`);
      expect(step5).assertEqual(144);
      logInfo(`touch>touch>touch>touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>touch>touch>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`touch>touch>touch>touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`touch>touch>touch>touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0187
     * @tc.name      WindowManage_SubWindowDragModelFlow_0187
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > updateDisplay > setTopHeight > updat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0187 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(96, 1728);
      logInfo(`step1 updateDisplay(96, 1728): step1=${step1}`);
      expect(step1).assertEqual(864);
      subject.setTopHeight(-1778);
      const step3: number = subject.updateDisplay(1056, 384);
      logInfo(`step3 updateDisplay(1056, 384): step3=${step3}`);
      expect(step3).assertEqual(192);
      subject.setTopHeight(719);
      const step5: number = subject.updateDisplay(0, 360);
      logInfo(`step5 updateDisplay(0, 360): step5=${step5}`);
      expect(step5).assertEqual(180);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(719);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0188
     * @tc.name      WindowManage_SubWindowDragModelFlow_0188
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0188 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(196, 0, -1);
      logInfo(`step1 touch(196, 0, -1): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(1536, 576);
      logInfo(`step2 updateDisplay(1536, 576): step2=${step2}`);
      expect(step2).assertEqual(288);
      subject.setTopHeight(1920);
      logInfo(`touch>updateDisplay>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch>updateDisplay>setTopHeight final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`touch>updateDisplay>setTopHeight final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1536);
      logInfo(`touch>updateDisplay>setTopHeight final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`touch>updateDisplay>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0189
     * @tc.name      WindowManage_SubWindowDragModelFlow_0189
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > updateDisplay > setTopHeight keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0189 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(3265);
      subject.setTopHeight(3840);
      const step3: number = subject.updateDisplay(-1, 360);
      logInfo(`step3 updateDisplay(-1, 360): step3=${step3}`);
      expect(step3).assertEqual(180);
      subject.setTopHeight(1817.61);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1817.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0190
     * @tc.name      WindowManage_SubWindowDragModelFlow_0190
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > setTopHeight > touch > touch keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0190 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-667);
      subject.setTopHeight(1632);
      subject.setTopHeight(1536);
      const step4: boolean = subject.touch(50, 97, -8);
      logInfo(`step4 touch(50, 97, -8): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.touch(3, 0, 25);
      logInfo(`step5 touch(3, 0, 25): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`setTopHeight>setTopHeight>setTopHeight>to...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`setTopHeight>setTopHeight>setTopHeight>to...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0191
     * @tc.name      WindowManage_SubWindowDragModelFlow_0191
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0191 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(1, 2, 2);
      logInfo(`step1 touch(1, 2, 2): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(3, 0);
      logInfo(`step2 updateDisplay(3, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.touch(5, 15, 20);
      logInfo(`step3 touch(5, 15, 20): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`touch>updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch>updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`touch>updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0192
     * @tc.name      WindowManage_SubWindowDragModelFlow_0192
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > touch > updateDisplay > touch keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0192 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(196, -100, 0);
      logInfo(`step1 touch(196, -100, 0): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(2688);
      const step3: boolean = subject.touch(0, 3, 3);
      logInfo(`step3 touch(0, 3, 3): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(0, 1248);
      logInfo(`step4 updateDisplay(0, 1248): step4=${step4}`);
      expect(step4).assertEqual(624);
      const step5: boolean = subject.touch(10, -1, 2);
      logInfo(`step5 touch(10, -1, 2): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>setTopHeight>touch>updateDisplay>to...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch>setTopHeight>touch>updateDisplay>to...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`touch>setTopHeight>touch>updateDisplay>to...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`touch>setTopHeight>touch>updateDisplay>to...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`touch>setTopHeight>touch>updateDisplay>to...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`touch>setTopHeight>touch>updateDisplay>to...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2688);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0193
     * @tc.name      WindowManage_SubWindowDragModelFlow_0193
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > updateDisplay > touch > updateDisplay keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0193 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(10, 0, 10);
      logInfo(`step1 touch(10, 0, 10): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(180.61);
      const step3: number = subject.updateDisplay(0, 1);
      logInfo(`step3 updateDisplay(0, 1): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.touch(3, -100, 20);
      logInfo(`step4 touch(3, -100, 20): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.updateDisplay(576, 10);
      logInfo(`step5 updateDisplay(576, 10): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`touch>setTopHeight>updateDisplay>touch>up...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch>setTopHeight>updateDisplay>touch>up...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>setTopHeight>updateDisplay>touch>up...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`touch>setTopHeight>updateDisplay>touch>up...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(576);
      logInfo(`touch>setTopHeight>updateDisplay>touch>up...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`touch>setTopHeight>updateDisplay>touch>up...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(180.61, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0194
     * @tc.name      WindowManage_SubWindowDragModelFlow_0194
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0194 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-203);
      const step2: boolean = subject.touch(-100, -100, 15);
      logInfo(`step2 touch(-100, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-203);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0195
     * @tc.name      WindowManage_SubWindowDragModelFlow_0195
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0195 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(1, 864);
      logInfo(`step1 updateDisplay(1, 864): step1=${step1}`);
      expect(step1).assertEqual(432);
      const step2: boolean = subject.touch(-100, 10, 2);
      logInfo(`step2 touch(-100, 10, 2): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0196
     * @tc.name      WindowManage_SubWindowDragModelFlow_0196
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0196 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(1824, 1);
      logInfo(`step1 updateDisplay(1824, 1): step1=${step1}`);
      expect(step1).assertClose(0.5, PRECISION);
      const step2: number = subject.updateDisplay(2, 1824);
      logInfo(`step2 updateDisplay(2, 1824): step2=${step2}`);
      expect(step2).assertEqual(912);
      logInfo(`updateDisplay>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`updateDisplay>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0197
     * @tc.name      WindowManage_SubWindowDragModelFlow_0197
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > setTopHeight > setTopHeight > touch keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0197 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(2, 0, -1);
      logInfo(`step1 touch(2, 0, -1): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(2496);
      subject.setTopHeight(-1582);
      subject.setTopHeight(-890);
      const step5: boolean = subject.touch(-1, 0, -1);
      logInfo(`step5 touch(-1, 0, -1): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>setTopHeight>setTopHeight>setTopHei...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch>setTopHeight>setTopHeight>setTopHei...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-890);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0198
     * @tc.name      WindowManage_SubWindowDragModelFlow_0198
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0198 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(3, 0, 25);
      logInfo(`step1 touch(3, 0, 25): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(192, 1);
      logInfo(`step2 updateDisplay(192, 1): step2=${step2}`);
      expect(step2).assertClose(0.5, PRECISION);
      logInfo(`touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(192);
      logInfo(`touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0199
     * @tc.name      WindowManage_SubWindowDragModelFlow_0199
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0199 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(-100, 1, 0);
      logInfo(`step1 touch(-100, 1, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(1152, 0);
      logInfo(`step2 updateDisplay(1152, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.touch(10, 10, 10);
      logInfo(`step3 touch(10, 10, 10): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(1080, 768);
      logInfo(`step4 updateDisplay(1080, 768): step4=${step4}`);
      expect(step4).assertEqual(384);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`touch>updateDisplay>touch>updateDisplay f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0200
     * @tc.name      WindowManage_SubWindowDragModelFlow_0200
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0200 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(-100, 97, -1);
      logInfo(`step1 touch(-100, 97, -1): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(1, 50, 25);
      logInfo(`step2 touch(1, 50, 25): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(848);
      logInfo(`touch>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`touch>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(848);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0201
     * @tc.name      WindowManage_SubWindowDragModelFlow_0201
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > touch > updateDisplay > touch keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0201 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1419.16);
      subject.setTopHeight(2304);
      const step3: boolean = subject.touch(-100, -100, 1);
      logInfo(`step3 touch(-100, -100, 1): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(0, 1440);
      logInfo(`step4 updateDisplay(0, 1440): step4=${step4}`);
      expect(step4).assertEqual(720);
      const step5: boolean = subject.touch(1, 97, 15);
      logInfo(`step5 touch(1, 97, 15): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2304);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0202
     * @tc.name      WindowManage_SubWindowDragModelFlow_0202
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0202 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2016);
      const step2: boolean = subject.touch(-100, -100, 2);
      logInfo(`step2 touch(-100, -100, 2): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2016);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0203
     * @tc.name      WindowManage_SubWindowDragModelFlow_0203
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0203 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(-100, -100, 100);
      logInfo(`step1 touch(-100, -100, 100): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(0, 768);
      logInfo(`step2 updateDisplay(0, 768): step2=${step2}`);
      expect(step2).assertEqual(384);
      logInfo(`touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0204
     * @tc.name      WindowManage_SubWindowDragModelFlow_0204
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > setTopHeight > updateDisplay keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0204 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(-100, -100, 25);
      logInfo(`step1 touch(-100, -100, 25): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(576);
      subject.setTopHeight(-166);
      const step4: number = subject.updateDisplay(192, 0);
      logInfo(`step4 updateDisplay(192, 0): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`touch>setTopHeight>setTopHeight>updateDis...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>setTopHeight>setTopHeight>updateDis...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>setTopHeight>setTopHeight>updateDis...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>setTopHeight>setTopHeight>updateDis...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(192);
      logInfo(`touch>setTopHeight>setTopHeight>updateDis...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-166);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0204 end`);
    });
  });
}
