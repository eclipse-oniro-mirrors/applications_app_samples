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

/** Logic checks for SubWindowDragModel flow (53 cases). */
export default function subWindowDragModelFlow3Test(): void {
  describe('SubWindowDragModelFlow3Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0103
     * @tc.name      WindowManage_SubWindowDragModelFlow_0103
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0103 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(0, 15, 0);
      logInfo(`step1 touch(0, 15, 0): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(861.1);
      subject.setTopHeight(2496);
      logInfo(`touch>setTopHeight>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`touch>setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2496);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0104
     * @tc.name      WindowManage_SubWindowDragModelFlow_0104
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0104 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(96, 100);
      logInfo(`step1 updateDisplay(96, 100): step1=${step1}`);
      expect(step1).assertEqual(50);
      const step2: number = subject.updateDisplay(360, 1728);
      logInfo(`step2 updateDisplay(360, 1728): step2=${step2}`);
      expect(step2).assertEqual(864);
      logInfo(`updateDisplay>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0105
     * @tc.name      WindowManage_SubWindowDragModelFlow_0105
     * @tc.desc      SubWindowDragModel call flow touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0105 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(-100, -100, 10);
      logInfo(`step1 touch(-100, -100, 10): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(-100, 15, -8);
      logInfo(`step2 touch(-100, 15, -8): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0106
     * @tc.name      WindowManage_SubWindowDragModelFlow_0106
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > setTopHeight > setTopHeight keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0106 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3);
      const step2: number = subject.updateDisplay(2, 1152);
      logInfo(`step2 updateDisplay(2, 1152): step2=${step2}`);
      expect(step2).assertEqual(576);
      subject.setTopHeight(389.07);
      subject.setTopHeight(-24);
      logInfo(`setTopHeight>updateDisplay>setTopHeight>s...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`setTopHeight>updateDisplay>setTopHeight>s...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`setTopHeight>updateDisplay>setTopHeight>s...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`setTopHeight>updateDisplay>setTopHeight>s...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-24);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0107
     * @tc.name      WindowManage_SubWindowDragModelFlow_0107
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > updateDisplay > touch keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0107 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(864, 100);
      logInfo(`step1 updateDisplay(864, 100): step1=${step1}`);
      expect(step1).assertEqual(50);
      const step2: number = subject.updateDisplay(576, 0);
      logInfo(`step2 updateDisplay(576, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.updateDisplay(10, 360);
      logInfo(`step3 updateDisplay(10, 360): step3=${step3}`);
      expect(step3).assertEqual(180);
      const step4: boolean = subject.touch(15, 3, 3);
      logInfo(`step4 touch(15, 3, 3): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0108
     * @tc.name      WindowManage_SubWindowDragModelFlow_0108
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0108 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(0, 768);
      logInfo(`step1 updateDisplay(0, 768): step1=${step1}`);
      expect(step1).assertEqual(384);
      const step2: boolean = subject.touch(-1, 2, 15);
      logInfo(`step2 touch(-1, 2, 15): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0109
     * @tc.name      WindowManage_SubWindowDragModelFlow_0109
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0109 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(0, 960);
      logInfo(`step1 updateDisplay(0, 960): step1=${step1}`);
      expect(step1).assertEqual(480);
      const step2: number = subject.updateDisplay(480, 0);
      logInfo(`step2 updateDisplay(480, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.touch(1, 100, 100);
      logInfo(`step3 touch(1, 100, 100): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`updateDisplay>updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0110
     * @tc.name      WindowManage_SubWindowDragModelFlow_0110
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > updateDisplay > updateDisplay keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0110 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-667);
      const step2: number = subject.updateDisplay(480, 1824);
      logInfo(`step2 updateDisplay(480, 1824): step2=${step2}`);
      expect(step2).assertEqual(912);
      const step3: number = subject.updateDisplay(0, 96);
      logInfo(`step3 updateDisplay(0, 96): step3=${step3}`);
      expect(step3).assertEqual(48);
      const step4: number = subject.updateDisplay(288, 1056);
      logInfo(`step4 updateDisplay(288, 1056): step4=${step4}`);
      expect(step4).assertEqual(528);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(288);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-667);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0111
     * @tc.name      WindowManage_SubWindowDragModelFlow_0111
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0111 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(360, 10);
      logInfo(`step1 updateDisplay(360, 10): step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: number = subject.updateDisplay(360, 1728);
      logInfo(`step2 updateDisplay(360, 1728): step2=${step2}`);
      expect(step2).assertEqual(864);
      logInfo(`updateDisplay>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0112
     * @tc.name      WindowManage_SubWindowDragModelFlow_0112
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0112 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3072);
      const step2: number = subject.updateDisplay(96, 1824);
      logInfo(`step2 updateDisplay(96, 1824): step2=${step2}`);
      expect(step2).assertEqual(912);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3072);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0113
     * @tc.name      WindowManage_SubWindowDragModelFlow_0113
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > updateDisplay > touch > touch keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0113 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1248, 1536);
      logInfo(`step1 updateDisplay(1248, 1536): step1=${step1}`);
      expect(step1).assertEqual(768);
      subject.setTopHeight(-116);
      const step3: number = subject.updateDisplay(1056, 1632);
      logInfo(`step3 updateDisplay(1056, 1632): step3=${step3}`);
      expect(step3).assertEqual(816);
      const step4: boolean = subject.touch(0, -1, 5);
      logInfo(`step4 touch(0, -1, 5): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.touch(196, -1, 3);
      logInfo(`step5 touch(196, -1, 3): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1056);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`updateDisplay>setTopHeight>updateDisplay>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-116);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0114
     * @tc.name      WindowManage_SubWindowDragModelFlow_0114
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0114 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(576);
      subject.setTopHeight(1823);
      logInfo(`setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1823);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0115
     * @tc.name      WindowManage_SubWindowDragModelFlow_0115
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0115 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(1, 3, 1);
      logInfo(`step1 touch(1, 3, 1): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(1155.84);
      const step3: boolean = subject.touch(10, 5, 2);
      logInfo(`step3 touch(10, 5, 2): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(2208);
      logInfo(`touch>setTopHeight>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch>setTopHeight>touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`touch>setTopHeight>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2208);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0116
     * @tc.name      WindowManage_SubWindowDragModelFlow_0116
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight > setTopHeight > setTopHeight keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0116 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(-100, -100, 15);
      logInfo(`step1 touch(-100, -100, 15): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(50, -100, 0);
      logInfo(`step2 touch(50, -100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(1);
      subject.setTopHeight(388.56);
      subject.setTopHeight(-1145);
      logInfo(`touch>touch>setTopHeight>setTopHeight>set...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch>touch>setTopHeight>setTopHeight>set...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>touch>setTopHeight>setTopHeight>set...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1145);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0117
     * @tc.name      WindowManage_SubWindowDragModelFlow_0117
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0117 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1743);
      const step2: number = subject.updateDisplay(1920, 768);
      logInfo(`step2 updateDisplay(1920, 768): step2=${step2}`);
      expect(step2).assertEqual(384);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1743);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0118
     * @tc.name      WindowManage_SubWindowDragModelFlow_0118
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0118 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(2, 100, 5);
      logInfo(`step1 touch(2, 100, 5): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(96, 720);
      logInfo(`step2 updateDisplay(96, 720): step2=${step2}`);
      expect(step2).assertEqual(360);
      logInfo(`touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0119
     * @tc.name      WindowManage_SubWindowDragModelFlow_0119
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > setTopHeight > setTopHeight > touch...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0119 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(2, -1);
      logInfo(`step1 updateDisplay(2, -1): step1=${step1}`);
      expect(step1).assertClose(-0.5, PRECISION);
      const step2: number = subject.updateDisplay(10, 192);
      logInfo(`step2 updateDisplay(10, 192): step2=${step2}`);
      expect(step2).assertEqual(96);
      subject.setTopHeight(-200);
      subject.setTopHeight(2880);
      const step5: boolean = subject.touch(1, 2, 2);
      logInfo(`step5 touch(1, 2, 2): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`updateDisplay>updateDisplay>setTopHeight>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2880);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0120
     * @tc.name      WindowManage_SubWindowDragModelFlow_0120
     * @tc.desc      SubWindowDragModel call flow touch > touch > touch > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0120 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(-100, -100, 2);
      logInfo(`step1 touch(-100, -100, 2): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(1, 5, 10);
      logInfo(`step2 touch(1, 5, 10): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(-100, -100, 0);
      logInfo(`step3 touch(-100, -100, 0): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(-100, 15, 0);
      logInfo(`step4 touch(-100, 15, 0): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.touch(1, 5, 10);
      logInfo(`step5 touch(1, 5, 10): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>touch>touch>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>touch>touch>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0121
     * @tc.name      WindowManage_SubWindowDragModelFlow_0121
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > touch > setTopHeight > updateDisplay keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0121 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1817.61);
      const step2: boolean = subject.touch(100, 10, -8);
      logInfo(`step2 touch(100, 10, -8): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(1, -100, -1);
      logInfo(`step3 touch(1, -100, -1): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(861.1);
      const step5: number = subject.updateDisplay(1248, 100);
      logInfo(`step5 updateDisplay(1248, 100): step5=${step5}`);
      expect(step5).assertEqual(50);
      logInfo(`setTopHeight>touch>touch>setTopHeight>upd...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`setTopHeight>touch>touch>setTopHeight>upd...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch>touch>setTopHeight>upd...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`setTopHeight>touch>touch>setTopHeight>upd...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1248);
      logInfo(`setTopHeight>touch>touch>setTopHeight>upd...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`setTopHeight>touch>touch>setTopHeight>upd...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(861.1, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0122
     * @tc.name      WindowManage_SubWindowDragModelFlow_0122
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > updateDisplay > setTopHeight > setTo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0122 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(8);
      const step2: number = subject.updateDisplay(10, 192);
      logInfo(`step2 updateDisplay(10, 192): step2=${step2}`);
      expect(step2).assertEqual(96);
      const step3: number = subject.updateDisplay(0, 720);
      logInfo(`step3 updateDisplay(0, 720): step3=${step3}`);
      expect(step3).assertEqual(360);
      subject.setTopHeight(1);
      subject.setTopHeight(672);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0123
     * @tc.name      WindowManage_SubWindowDragModelFlow_0123
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0123 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(0);
      subject.setTopHeight(-1033);
      subject.setTopHeight(3360);
      logInfo(`setTopHeight>setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3360);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0124
     * @tc.name      WindowManage_SubWindowDragModelFlow_0124
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0124 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3265);
      const step2: boolean = subject.touch(5, 0, 0);
      logInfo(`step2 touch(5, 0, 0): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3265);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0125
     * @tc.name      WindowManage_SubWindowDragModelFlow_0125
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > setTopHeight > setTopHeight > touch keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0125 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(100, 100, -8);
      logInfo(`step1 touch(100, 100, -8): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(2112);
      subject.setTopHeight(3552);
      subject.setTopHeight(1152);
      const step5: boolean = subject.touch(100, 100, -8);
      logInfo(`step5 touch(100, 100, -8): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>setTopHeight>setTopHeight>setTopHei...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>setTopHeight>setTopHeight>setTopHei...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>setTopHeight>setTopHeight>setTopHei...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0126
     * @tc.name      WindowManage_SubWindowDragModelFlow_0126
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > updateDisplay > setTopHeight > update...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0126 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-309);
      subject.setTopHeight(3360);
      const step3: number = subject.updateDisplay(2, 480);
      logInfo(`step3 updateDisplay(2, 480): step3=${step3}`);
      expect(step3).assertEqual(240);
      subject.setTopHeight(3552);
      const step5: number = subject.updateDisplay(1632, 0);
      logInfo(`step5 updateDisplay(1632, 0): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1632);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>s...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3552);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0127
     * @tc.name      WindowManage_SubWindowDragModelFlow_0127
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > updateDisplay > setTopHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0127 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(845.05);
      const step2: number = subject.updateDisplay(1056, 1632);
      logInfo(`step2 updateDisplay(1056, 1632): step2=${step2}`);
      expect(step2).assertEqual(816);
      const step3: number = subject.updateDisplay(1344, 360);
      logInfo(`step3 updateDisplay(1344, 360): step3=${step3}`);
      expect(step3).assertEqual(180);
      subject.setTopHeight(-1033);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1344);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1033);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0128
     * @tc.name      WindowManage_SubWindowDragModelFlow_0128
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > touch > updateDisplay > touch keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0128 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(480);
      const step2: boolean = subject.touch(15, 2, 15);
      logInfo(`step2 touch(15, 2, 15): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(-100, 1, 0);
      logInfo(`step3 touch(-100, 1, 0): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(1, 2);
      logInfo(`step4 updateDisplay(1, 2): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: boolean = subject.touch(-100, -100, 1);
      logInfo(`step5 touch(-100, -100, 1): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`setTopHeight>touch>touch>updateDisplay>to...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0129
     * @tc.name      WindowManage_SubWindowDragModelFlow_0129
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0129 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(2016);
      const step2: boolean = subject.touch(2, 97, 2);
      logInfo(`step2 touch(2, 97, 2): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2016);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0130
     * @tc.name      WindowManage_SubWindowDragModelFlow_0130
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0130 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(50, -100, 0);
      logInfo(`step1 touch(50, -100, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(196, 10, 2);
      logInfo(`step2 touch(196, 10, 2): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(1419.16);
      const step4: boolean = subject.touch(-100, -100, -1);
      logInfo(`step4 touch(-100, -100, -1): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>touch>setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>touch>setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>touch>setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1419.16, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0131
     * @tc.name      WindowManage_SubWindowDragModelFlow_0131
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0131 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(1920, 1632);
      logInfo(`step1 updateDisplay(1920, 1632): step1=${step1}`);
      expect(step1).assertEqual(816);
      const step2: boolean = subject.touch(-1, 1, -8);
      logInfo(`step2 touch(-1, 1, -8): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(2756);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`updateDisplay>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2756);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0132
     * @tc.name      WindowManage_SubWindowDragModelFlow_0132
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > touch > setTopHeight keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0132 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(1824, 720);
      logInfo(`step1 updateDisplay(1824, 720): step1=${step1}`);
      expect(step1).assertEqual(360);
      subject.setTopHeight(2278);
      const step3: boolean = subject.touch(0, 15, 0);
      logInfo(`step3 touch(0, 15, 0): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(-215);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1824);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`updateDisplay>setTopHeight>touch>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-215);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0133
     * @tc.name      WindowManage_SubWindowDragModelFlow_0133
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > setTopHeight > setTopHeight keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0133 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(1, 864);
      logInfo(`step1 updateDisplay(1, 864): step1=${step1}`);
      expect(step1).assertEqual(432);
      subject.setTopHeight(861.1);
      subject.setTopHeight(3437);
      subject.setTopHeight(-1132);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>s...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>s...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>s...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>s...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1132);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0134
     * @tc.name      WindowManage_SubWindowDragModelFlow_0134
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0134 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(2112);
      subject.setTopHeight(1824);
      logInfo(`setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0135
     * @tc.name      WindowManage_SubWindowDragModelFlow_0135
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0135 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-1778);
      const step2: number = subject.updateDisplay(1824, 0);
      logInfo(`step2 updateDisplay(1824, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1824);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1778);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0136
     * @tc.name      WindowManage_SubWindowDragModelFlow_0136
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > touch > setTopHeight keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0136 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(0, 1728);
      logInfo(`step1 updateDisplay(0, 1728): step1=${step1}`);
      expect(step1).assertEqual(864);
      const step2: number = subject.updateDisplay(1632, 1344);
      logInfo(`step2 updateDisplay(1632, 1344): step2=${step2}`);
      expect(step2).assertEqual(672);
      const step3: boolean = subject.touch(-100, -100, 5);
      logInfo(`step3 touch(-100, -100, 5): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(3760);
      logInfo(`updateDisplay>updateDisplay>touch>setTopH...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`updateDisplay>updateDisplay>touch>setTopH...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`updateDisplay>updateDisplay>touch>setTopH...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay>updateDisplay>touch>setTopH...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1632);
      logInfo(`updateDisplay>updateDisplay>touch>setTopH...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`updateDisplay>updateDisplay>touch>setTopH...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3760);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0137
     * @tc.name      WindowManage_SubWindowDragModelFlow_0137
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0137 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(672);
      const step2: boolean = subject.touch(5, 0, 0);
      logInfo(`step2 touch(5, 0, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(1920, 1632);
      logInfo(`step3 updateDisplay(1920, 1632): step3=${step3}`);
      expect(step3).assertEqual(816);
      logInfo(`setTopHeight>touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`setTopHeight>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`setTopHeight>touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`setTopHeight>touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`setTopHeight>touch>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0138
     * @tc.name      WindowManage_SubWindowDragModelFlow_0138
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0138 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(2, 360);
      logInfo(`step1 updateDisplay(2, 360): step1=${step1}`);
      expect(step1).assertEqual(180);
      const step2: boolean = subject.touch(0, 0, -1);
      logInfo(`step2 touch(0, 0, -1): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(576, 1);
      logInfo(`step3 updateDisplay(576, 1): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(576);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0139
     * @tc.name      WindowManage_SubWindowDragModelFlow_0139
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0139 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(384);
      subject.setTopHeight(3264);
      logInfo(`setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3264);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0140
     * @tc.name      WindowManage_SubWindowDragModelFlow_0140
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0140 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(118);
      const step2: boolean = subject.touch(2, 100, 1);
      logInfo(`step2 touch(2, 100, 1): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(118);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0141
     * @tc.name      WindowManage_SubWindowDragModelFlow_0141
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0141 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(192, 2);
      logInfo(`step1 updateDisplay(192, 2): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.setTopHeight(1678);
      logInfo(`updateDisplay>setTopHeight final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay>setTopHeight final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(192);
      logInfo(`updateDisplay>setTopHeight final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`updateDisplay>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1678);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0142
     * @tc.name      WindowManage_SubWindowDragModelFlow_0142
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > updateDisplay > touch > touch keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0142 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(864, 768);
      logInfo(`step1 updateDisplay(864, 768): step1=${step1}`);
      expect(step1).assertEqual(384);
      const step2: number = subject.updateDisplay(360, 1056);
      logInfo(`step2 updateDisplay(360, 1056): step2=${step2}`);
      expect(step2).assertEqual(528);
      const step3: number = subject.updateDisplay(2, 360);
      logInfo(`step3 updateDisplay(2, 360): step3=${step3}`);
      expect(step3).assertEqual(180);
      const step4: boolean = subject.touch(50, -100, 0);
      logInfo(`step4 touch(50, -100, 0): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.touch(-100, 97, 5);
      logInfo(`step5 touch(-100, 97, 5): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0143
     * @tc.name      WindowManage_SubWindowDragModelFlow_0143
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0143 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(-100, -100, 15);
      logInfo(`step1 touch(-100, -100, 15): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(3840);
      subject.setTopHeight(1214);
      logInfo(`touch>setTopHeight>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>setTopHeight>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1214);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0144
     * @tc.name      WindowManage_SubWindowDragModelFlow_0144
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > setTopHeight > setTopHeight keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0144 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(0);
      const step2: boolean = subject.touch(-100, -100, 20);
      logInfo(`step2 touch(-100, -100, 20): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(2278);
      subject.setTopHeight(892.43);
      logInfo(`setTopHeight>touch>setTopHeight>setTopHei...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>touch>setTopHeight>setTopHei...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>touch>setTopHeight>setTopHei...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(892.43, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0145
     * @tc.name      WindowManage_SubWindowDragModelFlow_0145
     * @tc.desc      SubWindowDragModel call flow touch > touch > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0145 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(-100, 50, -1);
      logInfo(`step1 touch(-100, 50, -1): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(196, -100, 15);
      logInfo(`step2 touch(196, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(50, 97, -8);
      logInfo(`step3 touch(50, 97, -8): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(576, 1);
      logInfo(`step4 updateDisplay(576, 1): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      logInfo(`touch>touch>touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch>touch>touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`touch>touch>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`touch>touch>touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(576);
      logInfo(`touch>touch>touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0146
     * @tc.name      WindowManage_SubWindowDragModelFlow_0146
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0146 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-215);
      subject.setTopHeight(1344);
      logInfo(`setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0147
     * @tc.name      WindowManage_SubWindowDragModelFlow_0147
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > updateDisplay > touch keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0147 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(388.56);
      const step2: number = subject.updateDisplay(1056, 0);
      logInfo(`step2 updateDisplay(1056, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.updateDisplay(1, 864);
      logInfo(`step3 updateDisplay(1, 864): step3=${step3}`);
      expect(step3).assertEqual(432);
      const step4: boolean = subject.touch(196, 10, 3);
      logInfo(`step4 touch(196, 10, 3): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`setTopHeight>updateDisplay>updateDisplay>...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(388.56, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0148
     * @tc.name      WindowManage_SubWindowDragModelFlow_0148
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0148 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(2496);
      const step2: boolean = subject.touch(-100, -100, 15);
      logInfo(`step2 touch(-100, -100, 15): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(0, 384);
      logInfo(`step3 updateDisplay(0, 384): step3=${step3}`);
      expect(step3).assertEqual(192);
      const step4: boolean = subject.touch(5, -1, -8);
      logInfo(`step4 touch(5, -1, -8): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`setTopHeight>touch>updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`setTopHeight>touch>updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`setTopHeight>touch>updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`setTopHeight>touch>updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`setTopHeight>touch>updateDisplay>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2496);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0149
     * @tc.name      WindowManage_SubWindowDragModelFlow_0149
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0149 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(-1, 15, 1);
      logInfo(`step1 touch(-1, 15, 1): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(1920, 1632);
      logInfo(`step2 updateDisplay(1920, 1632): step2=${step2}`);
      expect(step2).assertEqual(816);
      const step3: number = subject.updateDisplay(3, 1);
      logInfo(`step3 updateDisplay(3, 1): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: boolean = subject.touch(10, 100, 10);
      logInfo(`step4 touch(10, 100, 10): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>updateDisplay>updateDisplay>touch f...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch>updateDisplay>updateDisplay>touch f...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>updateDisplay>updateDisplay>touch f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`touch>updateDisplay>updateDisplay>touch f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`touch>updateDisplay>updateDisplay>touch f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0150
     * @tc.name      WindowManage_SubWindowDragModelFlow_0150
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > touch > touch > setTopHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0150 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(1632, 0);
      logInfo(`step1 updateDisplay(1632, 0): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.setTopHeight(360);
      const step3: boolean = subject.touch(15, 97, 15);
      logInfo(`step3 touch(15, 97, 15): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(-1, 2, 15);
      logInfo(`step4 touch(-1, 2, 15): step4=${step4}`);
      expect(step4).assertFalse();
      subject.setTopHeight(16);
      logInfo(`updateDisplay>setTopHeight>touch>touch>se...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`updateDisplay>setTopHeight>touch>touch>se...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`updateDisplay>setTopHeight>touch>touch>se...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay>setTopHeight>touch>touch>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1632);
      logInfo(`updateDisplay>setTopHeight>touch>touch>se...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(16);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0151
     * @tc.name      WindowManage_SubWindowDragModelFlow_0151
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > setTopHeight > updateDisplay keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0151 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(1, 100, 0);
      logInfo(`step1 touch(1, 100, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(0, 576);
      logInfo(`step2 updateDisplay(0, 576): step2=${step2}`);
      expect(step2).assertEqual(288);
      subject.setTopHeight(-1033);
      const step4: number = subject.updateDisplay(10, 360);
      logInfo(`step4 updateDisplay(10, 360): step4=${step4}`);
      expect(step4).assertEqual(180);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`touch>updateDisplay>setTopHeight>updateDi...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1033);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0152
     * @tc.name      WindowManage_SubWindowDragModelFlow_0152
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0152 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(196, -100, -1);
      logInfo(`step1 touch(196, -100, -1): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(384, 1920);
      logInfo(`step2 updateDisplay(384, 1920): step2=${step2}`);
      expect(step2).assertEqual(960);
      logInfo(`touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(384);
      logInfo(`touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0153
     * @tc.name      WindowManage_SubWindowDragModelFlow_0153
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0153 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(720);
      const step2: boolean = subject.touch(-100, -1, 0);
      logInfo(`step2 touch(-100, -1, 0): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(2016);
      const step4: boolean = subject.touch(196, 2, 15);
      logInfo(`step4 touch(196, 2, 15): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`setTopHeight>touch>setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`setTopHeight>touch>setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`setTopHeight>touch>setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2016);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0154
     * @tc.name      WindowManage_SubWindowDragModelFlow_0154
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > setTopHeight > updateDisplay > update...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0154 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(16);
      subject.setTopHeight(2880);
      subject.setTopHeight(601);
      const step4: number = subject.updateDisplay(0, 720);
      logInfo(`step4 updateDisplay(0, 720): step4=${step4}`);
      expect(step4).assertEqual(360);
      const step5: number = subject.updateDisplay(10, 0);
      logInfo(`step5 updateDisplay(10, 0): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`setTopHeight>setTopHeight>setTopHeight>up...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`setTopHeight>setTopHeight>setTopHeight>up...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`setTopHeight>setTopHeight>setTopHeight>up...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(601);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0155
     * @tc.name      WindowManage_SubWindowDragModelFlow_0155
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0155 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-1415);
      subject.setTopHeight(847.11);
      logInfo(`setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(847.11, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0155 end`);
    });
  });
}
