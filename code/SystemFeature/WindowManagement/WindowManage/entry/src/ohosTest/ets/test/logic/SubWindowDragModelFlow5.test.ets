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

/** Logic checks for SubWindowDragModel flow (39 cases). */
export default function subWindowDragModelFlow5Test(): void {
  describe('SubWindowDragModelFlow5Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0205
     * @tc.name      WindowManage_SubWindowDragModelFlow_0205
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > touch > updateDisplay keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0205 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-309);
      const step2: number = subject.updateDisplay(1, 0);
      logInfo(`step2 updateDisplay(1, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.touch(0, 15, 0);
      logInfo(`step3 touch(0, 15, 0): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(1080, 0);
      logInfo(`step4 updateDisplay(1080, 0): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-309);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0206
     * @tc.name      WindowManage_SubWindowDragModelFlow_0206
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > updateDisplay > setTopHeight keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0206 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(384, 0);
      logInfo(`step1 updateDisplay(384, 0): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.touch(1, 100, 100);
      logInfo(`step2 touch(1, 100, 100): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(3, 1440);
      logInfo(`step3 updateDisplay(3, 1440): step3=${step3}`);
      expect(step3).assertEqual(720);
      subject.setTopHeight(1056);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`updateDisplay>touch>updateDisplay>setTopH...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0207
     * @tc.name      WindowManage_SubWindowDragModelFlow_0207
     * @tc.desc      SubWindowDragModel call flow touch > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0207 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(5, -1, 100);
      logInfo(`step1 touch(5, -1, 100): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(-100, -100, 0);
      logInfo(`step2 touch(-100, -100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(360, 1728);
      logInfo(`step3 updateDisplay(360, 1728): step3=${step3}`);
      expect(step3).assertEqual(864);
      logInfo(`touch>touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`touch>touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`touch>touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0208
     * @tc.name      WindowManage_SubWindowDragModelFlow_0208
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0208 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(3760);
      const step2: boolean = subject.touch(1, 15, 20);
      logInfo(`step2 touch(1, 15, 20): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(-1893);
      logInfo(`setTopHeight>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`setTopHeight>touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`setTopHeight>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-1893);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0209
     * @tc.name      WindowManage_SubWindowDragModelFlow_0209
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > touch > updateDisplay > updateDisplay...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0209 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1056);
      subject.setTopHeight(118);
      const step3: boolean = subject.touch(-1, 0, -1);
      logInfo(`step3 touch(-1, 0, -1): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(720, 3);
      logInfo(`step4 updateDisplay(720, 3): step4=${step4}`);
      expect(step4).assertClose(1.5, PRECISION);
      const step5: number = subject.updateDisplay(0, 1056);
      logInfo(`step5 updateDisplay(0, 1056): step5=${step5}`);
      expect(step5).assertEqual(528);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`setTopHeight>setTopHeight>touch>updateDis...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(118);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0210
     * @tc.name      WindowManage_SubWindowDragModelFlow_0210
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0210 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(720, 1920);
      logInfo(`step1 updateDisplay(720, 1920): step1=${step1}`);
      expect(step1).assertEqual(960);
      subject.setTopHeight(388.56);
      logInfo(`updateDisplay>setTopHeight final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`updateDisplay>setTopHeight final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay>setTopHeight final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`updateDisplay>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(388.56, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0211
     * @tc.name      WindowManage_SubWindowDragModelFlow_0211
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0211 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(2, 10, 3);
      logInfo(`step1 touch(2, 10, 3): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(15, 2, 15);
      logInfo(`step2 touch(15, 2, 15): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(2278);
      logInfo(`touch>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch>touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`touch>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2278);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0212
     * @tc.name      WindowManage_SubWindowDragModelFlow_0212
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0212 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(1, -100, -1);
      logInfo(`step1 touch(1, -100, -1): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(1536, 576);
      logInfo(`step2 updateDisplay(1536, 576): step2=${step2}`);
      expect(step2).assertEqual(288);
      logInfo(`touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`touch>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1536);
      logInfo(`touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0213
     * @tc.name      WindowManage_SubWindowDragModelFlow_0213
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > touch > setTopHeight keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0213 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(100);
      const step2: number = subject.updateDisplay(1824, 384);
      logInfo(`step2 updateDisplay(1824, 384): step2=${step2}`);
      expect(step2).assertEqual(192);
      const step3: boolean = subject.touch(1, -100, 0);
      logInfo(`step3 touch(1, -100, 0): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(1536);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1824);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`setTopHeight>updateDisplay>touch>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0214
     * @tc.name      WindowManage_SubWindowDragModelFlow_0214
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > updateDisplay > updateDisplay > updat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0214 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-24);
      subject.setTopHeight(2688);
      const step3: number = subject.updateDisplay(10, 1);
      logInfo(`step3 updateDisplay(10, 1): step3=${step3}`);
      expect(step3).assertClose(0.5, PRECISION);
      const step4: number = subject.updateDisplay(864, 0);
      logInfo(`step4 updateDisplay(864, 0): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.updateDisplay(1824, 1);
      logInfo(`step5 updateDisplay(1824, 1): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>u...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>u...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1824);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>u...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`setTopHeight>setTopHeight>updateDisplay>u...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2688);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0215
     * @tc.name      WindowManage_SubWindowDragModelFlow_0215
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0215 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(-203);
      const step2: boolean = subject.touch(15, 10, 10);
      logInfo(`step2 touch(15, 10, 10): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-203);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0216
     * @tc.name      WindowManage_SubWindowDragModelFlow_0216
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0216 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(-119);
      const step2: number = subject.updateDisplay(1080, 768);
      logInfo(`step2 updateDisplay(1080, 768): step2=${step2}`);
      expect(step2).assertEqual(384);
      logInfo(`setTopHeight>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`setTopHeight>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`setTopHeight>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-119);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0217
     * @tc.name      WindowManage_SubWindowDragModelFlow_0217
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > touch > setTopHeight > setTopHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0217 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: number = subject.updateDisplay(0, 1248);
      logInfo(`step1 updateDisplay(0, 1248): step1=${step1}`);
      expect(step1).assertEqual(624);
      const step2: boolean = subject.touch(1, 0, 0);
      logInfo(`step2 touch(1, 0, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(0, 97, 25);
      logInfo(`step3 touch(0, 97, 25): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(-266);
      subject.setTopHeight(845.05);
      logInfo(`updateDisplay>touch>touch>setTopHeight>se...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`updateDisplay>touch>touch>setTopHeight>se...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`updateDisplay>touch>touch>setTopHeight>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay>touch>touch>setTopHeight>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`updateDisplay>touch>touch>setTopHeight>se...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(845.05, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0218
     * @tc.name      WindowManage_SubWindowDragModelFlow_0218
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0218 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(10, 100, 20);
      logInfo(`step1 touch(10, 100, 20): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(118);
      const step3: boolean = subject.touch(1, -100, -1);
      logInfo(`step3 touch(1, -100, -1): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`touch>setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>setTopHeight>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(118);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0219
     * @tc.name      WindowManage_SubWindowDragModelFlow_0219
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0219 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(100, 3, -1);
      logInfo(`step1 touch(100, 3, -1): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(-1, 0);
      logInfo(`step2 updateDisplay(-1, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.updateDisplay(1344, 0);
      logInfo(`step3 updateDisplay(1344, 0): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.touch(-1, -100, 0);
      logInfo(`step4 touch(-1, -100, 0): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>updateDisplay>updateDisplay>touch f...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch>updateDisplay>updateDisplay>touch f...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>updateDisplay>updateDisplay>touch f...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>updateDisplay>updateDisplay>touch f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0220
     * @tc.name      WindowManage_SubWindowDragModelFlow_0220
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0220 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(0, 0, -1);
      logInfo(`step1 touch(0, 0, -1): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(1920);
      const step3: number = subject.updateDisplay(0, 384);
      logInfo(`step3 updateDisplay(0, 384): step3=${step3}`);
      expect(step3).assertEqual(192);
      const step4: boolean = subject.touch(196, -100, -1);
      logInfo(`step4 touch(196, -100, -1): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>setTopHeight>updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch>setTopHeight>updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>setTopHeight>updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`touch>setTopHeight>updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`touch>setTopHeight>updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`touch>setTopHeight>updateDisplay>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0221
     * @tc.name      WindowManage_SubWindowDragModelFlow_0221
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > setTopHeight > setTopHeight > updateDisplay...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0221 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(2, 384);
      logInfo(`step1 updateDisplay(2, 384): step1=${step1}`);
      expect(step1).assertEqual(192);
      const step2: boolean = subject.touch(-1, 100, 20);
      logInfo(`step2 touch(-1, 100, 20): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(-642);
      subject.setTopHeight(412.7);
      const step5: number = subject.updateDisplay(3, 1440);
      logInfo(`step5 updateDisplay(3, 1440): step5=${step5}`);
      expect(step5).assertEqual(720);
      logInfo(`updateDisplay>touch>setTopHeight>setTopHe...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`updateDisplay>touch>setTopHeight>setTopHe...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`updateDisplay>touch>setTopHeight>setTopHe...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay>touch>setTopHeight>setTopHe...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`updateDisplay>touch>setTopHeight>setTopHe...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`updateDisplay>touch>setTopHeight>setTopHe...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(412.7, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0222
     * @tc.name      WindowManage_SubWindowDragModelFlow_0222
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0222 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(0, 10);
      logInfo(`step1 updateDisplay(0, 10): step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: number = subject.updateDisplay(1344, 360);
      logInfo(`step2 updateDisplay(1344, 360): step2=${step2}`);
      expect(step2).assertEqual(180);
      logInfo(`updateDisplay>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay>updateDisplay final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1344);
      logInfo(`updateDisplay>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0223
     * @tc.name      WindowManage_SubWindowDragModelFlow_0223
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0223 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(2, 97, 2);
      logInfo(`step1 touch(2, 97, 2): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(192);
      logInfo(`touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch>setTopHeight final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0224
     * @tc.name      WindowManage_SubWindowDragModelFlow_0224
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > updateDisplay > updateDisplay > touch keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0224 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(50, 2, 10);
      logInfo(`step1 touch(50, 2, 10): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(576);
      const step3: number = subject.updateDisplay(360, 1056);
      logInfo(`step3 updateDisplay(360, 1056): step3=${step3}`);
      expect(step3).assertEqual(528);
      const step4: number = subject.updateDisplay(10, 100);
      logInfo(`step4 updateDisplay(10, 100): step4=${step4}`);
      expect(step4).assertEqual(50);
      const step5: boolean = subject.touch(15, 2, 15);
      logInfo(`step5 touch(15, 2, 15): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0225
     * @tc.name      WindowManage_SubWindowDragModelFlow_0225
     * @tc.desc      SubWindowDragModel call flow updateDisplay > touch > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0225 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(720, 384);
      logInfo(`step1 updateDisplay(720, 384): step1=${step1}`);
      expect(step1).assertEqual(192);
      const step2: boolean = subject.touch(10, -1, 2);
      logInfo(`step2 touch(10, -1, 2): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.updateDisplay(0, 100);
      logInfo(`step3 updateDisplay(0, 100): step3=${step3}`);
      expect(step3).assertEqual(50);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay>touch>updateDisplay final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0226
     * @tc.name      WindowManage_SubWindowDragModelFlow_0226
     * @tc.desc      SubWindowDragModel call flow setTopHeight > updateDisplay > touch > updateDisplay keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0226 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(3265);
      const step2: number = subject.updateDisplay(96, 1824);
      logInfo(`step2 updateDisplay(96, 1824): step2=${step2}`);
      expect(step2).assertEqual(912);
      const step3: boolean = subject.touch(1, 2, 10);
      logInfo(`step3 touch(1, 2, 10): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(1632, 1536);
      logInfo(`step4 updateDisplay(1632, 1536): step4=${step4}`);
      expect(step4).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1632);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`setTopHeight>updateDisplay>touch>updateDi...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3265);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0227
     * @tc.name      WindowManage_SubWindowDragModelFlow_0227
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0227 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(196, 0, -1);
      logInfo(`step1 touch(196, 0, -1): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(-200);
      const step3: boolean = subject.touch(5, 0, 0);
      logInfo(`step3 touch(5, 0, 0): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(10, -100, 0);
      logInfo(`step4 touch(10, -100, 0): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>setTopHeight>touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch>setTopHeight>touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`touch>setTopHeight>touch>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-200);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0228
     * @tc.name      WindowManage_SubWindowDragModelFlow_0228
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > updateDisplay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0228 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(1, 2);
      logInfo(`step1 updateDisplay(1, 2): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.updateDisplay(384, 1632);
      logInfo(`step2 updateDisplay(384, 1632): step2=${step2}`);
      expect(step2).assertEqual(816);
      const step3: number = subject.updateDisplay(96, 1824);
      logInfo(`step3 updateDisplay(96, 1824): step3=${step3}`);
      expect(step3).assertEqual(912);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`updateDisplay>updateDisplay>updateDisplay...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0229
     * @tc.name      WindowManage_SubWindowDragModelFlow_0229
     * @tc.desc      SubWindowDragModel call flow touch > touch > touch > setTopHeight > updateDisplay keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0229 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(3, 0, 25);
      logInfo(`step1 touch(3, 0, 25): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(-100, 5, 0);
      logInfo(`step2 touch(-100, 5, 0): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(50, 2, 10);
      logInfo(`step3 touch(50, 2, 10): step3=${step3}`);
      expect(step3).assertFalse();
      subject.setTopHeight(384);
      const step5: number = subject.updateDisplay(10, 1);
      logInfo(`step5 updateDisplay(10, 1): step5=${step5}`);
      expect(step5).assertClose(0.5, PRECISION);
      logInfo(`touch>touch>touch>setTopHeight>updateDisp...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch>touch>touch>setTopHeight>updateDisp...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`touch>touch>touch>setTopHeight>updateDisp...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`touch>touch>touch>setTopHeight>updateDisp...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`touch>touch>touch>setTopHeight>updateDisp...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`touch>touch>touch>setTopHeight>updateDisp...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0230
     * @tc.name      WindowManage_SubWindowDragModelFlow_0230
     * @tc.desc      SubWindowDragModel call flow updateDisplay > updateDisplay > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0230 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: number = subject.updateDisplay(10, 0);
      logInfo(`step1 updateDisplay(10, 0): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.updateDisplay(1080, 10);
      logInfo(`step2 updateDisplay(1080, 10): step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: boolean = subject.touch(50, 1, 0);
      logInfo(`step3 touch(50, 1, 0): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`updateDisplay>updateDisplay>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay>updateDisplay>touch final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0231
     * @tc.name      WindowManage_SubWindowDragModelFlow_0231
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > updateDisplay > updateDisplay > touch keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0231 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(0, 15, -1);
      logInfo(`step1 touch(0, 15, -1): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(2208);
      const step3: number = subject.updateDisplay(1824, 360);
      logInfo(`step3 updateDisplay(1824, 360): step3=${step3}`);
      expect(step3).assertEqual(180);
      const step4: number = subject.updateDisplay(720, 3);
      logInfo(`step4 updateDisplay(720, 3): step4=${step4}`);
      expect(step4).assertClose(1.5, PRECISION);
      const step5: boolean = subject.touch(0, -1, 5);
      logInfo(`step5 touch(0, -1, 5): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`touch>setTopHeight>updateDisplay>updateDi...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2208);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0232
     * @tc.name      WindowManage_SubWindowDragModelFlow_0232
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0232 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(2, 0, 15);
      logInfo(`step1 touch(2, 0, 15): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(10, 0, 10);
      logInfo(`step2 touch(10, 0, 10): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(1426.35);
      logInfo(`touch>touch>setTopHeight final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch>touch>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(1426.35, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0233
     * @tc.name      WindowManage_SubWindowDragModelFlow_0233
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > touch > touch > updateDisplay keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0233 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      subject.setTopHeight(1419.16);
      subject.setTopHeight(360);
      const step3: boolean = subject.touch(15, 2, 15);
      logInfo(`step3 touch(15, 2, 15): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(-100, 15, 0);
      logInfo(`step4 touch(-100, 15, 0): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.updateDisplay(0, 1344);
      logInfo(`step5 updateDisplay(0, 1344): step5=${step5}`);
      expect(step5).assertEqual(672);
      logInfo(`setTopHeight>setTopHeight>touch>touch>upd...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>setTopHeight>touch>touch>upd...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`setTopHeight>setTopHeight>touch>touch>upd...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`setTopHeight>setTopHeight>touch>touch>upd...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`setTopHeight>setTopHeight>touch>touch>upd...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`setTopHeight>setTopHeight>touch>touch>upd...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0234
     * @tc.name      WindowManage_SubWindowDragModelFlow_0234
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight > setTopHeight > setTopHeight > touch k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0234 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      subject.setTopHeight(1155.84);
      subject.setTopHeight(2756);
      subject.setTopHeight(-99);
      subject.setTopHeight(3264);
      const step5: boolean = subject.touch(0, 15, -1);
      logInfo(`step5 touch(0, 15, -1): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`setTopHeight>setTopHeight>setTopHeight>se...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`setTopHeight>setTopHeight>setTopHeight>se...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3264);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0235
     * @tc.name      WindowManage_SubWindowDragModelFlow_0235
     * @tc.desc      SubWindowDragModel call flow setTopHeight > touch > touch > touch > setTopHeight keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0235 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-166);
      const step2: boolean = subject.touch(3, 0, 25);
      logInfo(`step2 touch(3, 0, 25): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.touch(1, 97, 15);
      logInfo(`step3 touch(1, 97, 15): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.touch(-100, 15, -8);
      logInfo(`step4 touch(-100, 15, -8): step4=${step4}`);
      expect(step4).assertFalse();
      subject.setTopHeight(-266);
      logInfo(`setTopHeight>touch>touch>touch>setTopHeig...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`setTopHeight>touch>touch>touch>setTopHeig...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`setTopHeight>touch>touch>touch>setTopHeig...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-266);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0236
     * @tc.name      WindowManage_SubWindowDragModelFlow_0236
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > touch > updateDisplay > setTopHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0236 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(5, 0, 0);
      logInfo(`step1 touch(5, 0, 0): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(-1893);
      const step3: boolean = subject.touch(1, 5, 100);
      logInfo(`step3 touch(1, 5, 100): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.updateDisplay(10, 1);
      logInfo(`step4 updateDisplay(10, 1): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      subject.setTopHeight(3760);
      logInfo(`touch>setTopHeight>touch>updateDisplay>se...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>setTopHeight>touch>updateDisplay>se...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`touch>setTopHeight>touch>updateDisplay>se...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`touch>setTopHeight>touch>updateDisplay>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`touch>setTopHeight>touch>updateDisplay>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`touch>setTopHeight>touch>updateDisplay>se...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(3760);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0237
     * @tc.name      WindowManage_SubWindowDragModelFlow_0237
     * @tc.desc      SubWindowDragModel call flow updateDisplay > setTopHeight > setTopHeight > touch > setTopHeight ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0237 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: number = subject.updateDisplay(10, 192);
      logInfo(`step1 updateDisplay(10, 192): step1=${step1}`);
      expect(step1).assertEqual(96);
      subject.setTopHeight(1);
      subject.setTopHeight(848);
      const step4: boolean = subject.touch(15, 10, 10);
      logInfo(`step4 touch(15, 10, 10): step4=${step4}`);
      expect(step4).assertFalse();
      subject.setTopHeight(8);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>t...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>t...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>t...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>t...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>t...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`updateDisplay>setTopHeight>setTopHeight>t...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(8);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0238
     * @tc.name      WindowManage_SubWindowDragModelFlow_0238
     * @tc.desc      SubWindowDragModel call flow setTopHeight > setTopHeight keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0238 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      subject.setTopHeight(-642);
      subject.setTopHeight(388.56);
      logInfo(`setTopHeight>setTopHeight final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertClose(388.56, PRECISION);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0239
     * @tc.name      WindowManage_SubWindowDragModelFlow_0239
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight > updateDisplay > setTopHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0239 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(196, 10, -8);
      logInfo(`step1 touch(196, 10, -8): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(100, -1, -1);
      logInfo(`step2 touch(100, -1, -1): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(1678);
      const step4: number = subject.updateDisplay(576, 1);
      logInfo(`step4 updateDisplay(576, 1): step4=${step4}`);
      expect(step4).assertClose(0.5, PRECISION);
      subject.setTopHeight(-444);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(576);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(-444);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0240
     * @tc.name      WindowManage_SubWindowDragModelFlow_0240
     * @tc.desc      SubWindowDragModel call flow touch > setTopHeight > updateDisplay > touch > setTopHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0240 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(-1, -100, 25);
      logInfo(`step1 touch(-1, -100, 25): step1=${step1}`);
      expect(step1).assertFalse();
      subject.setTopHeight(-642);
      const step3: number = subject.updateDisplay(384, 1920);
      logInfo(`step3 updateDisplay(384, 1920): step3=${step3}`);
      expect(step3).assertEqual(960);
      const step4: boolean = subject.touch(100, 3, -1);
      logInfo(`step4 touch(100, 3, -1): step4=${step4}`);
      expect(step4).assertTrue();
      subject.setTopHeight(384);
      logInfo(`touch>setTopHeight>updateDisplay>touch>se...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch>setTopHeight>updateDisplay>touch>se...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`touch>setTopHeight>updateDisplay>touch>se...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`touch>setTopHeight>updateDisplay>touch>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(384);
      logInfo(`touch>setTopHeight>updateDisplay>touch>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`touch>setTopHeight>updateDisplay>touch>se...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0241
     * @tc.name      WindowManage_SubWindowDragModelFlow_0241
     * @tc.desc      SubWindowDragModel call flow touch > touch > setTopHeight > updateDisplay > setTopHeight keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0241 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const step1: boolean = subject.touch(-100, 15, -8);
      logInfo(`step1 touch(-100, 15, -8): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(-100, 100, 0);
      logInfo(`step2 touch(-100, 100, 0): step2=${step2}`);
      expect(step2).assertFalse();
      subject.setTopHeight(-309);
      const step4: number = subject.updateDisplay(10, 360);
      logInfo(`step4 updateDisplay(10, 360): step4=${step4}`);
      expect(step4).assertEqual(180);
      subject.setTopHeight(2688);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`touch>touch>setTopHeight>updateDisplay>se...: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2688);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0242
     * @tc.name      WindowManage_SubWindowDragModelFlow_0242
     * @tc.desc      SubWindowDragModel call flow touch > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0242 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const step1: boolean = subject.touch(196, 10, -8);
      logInfo(`step1 touch(196, 10, -8): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.touch(1, 100, 100);
      logInfo(`step2 touch(1, 100, 100): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`touch>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>touch final: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_FLOW_0243
     * @tc.name      WindowManage_SubWindowDragModelFlow_0243
     * @tc.desc      SubWindowDragModel call flow touch > updateDisplay > setTopHeight > touch keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0243 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const step1: boolean = subject.touch(100, -100, 0);
      logInfo(`step1 touch(100, -100, 0): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.updateDisplay(1920, 0);
      logInfo(`step2 updateDisplay(1920, 0): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.setTopHeight(2688);
      const step4: boolean = subject.touch(1, 0, 0);
      logInfo(`step4 touch(1, 0, 0): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`touch>updateDisplay>setTopHeight>touch final: subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(2688);
      logInfo(`${BUNDLE}SubWindowDragModelFlow_0243 end`);
    });
  });
}
