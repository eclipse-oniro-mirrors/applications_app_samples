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
import { FoldLayoutState } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FoldLayoutState flow (46 cases). */
export default function foldLayoutStateFlow8Test(): void {
  describe('FoldLayoutStateFlow8Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0333
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0333
     * @tc.desc      FoldLayoutState call flow push > resize > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0333 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('6W9');
      logInfo(`step1 push("6W9"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(3264, 90);
      logInfo(`step2 resize(3264, 90): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('XD3RMuwT');
      logInfo(`step3 push("XD3RMuwT"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('zp');
      logInfo(`step4 push("zp"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>resize>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`push>resize>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('zp');
      logInfo(`push>resize>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('zp');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0333 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0334
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0334
     * @tc.desc      FoldLayoutState call flow push > push > pop > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0334 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('iRJm14qh130');
      logInfo(`step1 push("iRJm14qh130"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('5lJ');
      logInfo(`step2 push("5lJ"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.push('sb');
      logInfo(`step4 push("sb"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.resize(0, 90);
      logInfo(`step5 resize(0, 90): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>push>pop>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>push>pop>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push>pop>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sb');
      logInfo(`push>push>pop>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0334 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0335
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0335
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0335 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('CnnQXi9dQW');
      logInfo(`step2 push("CnnQXi9dQW"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CnnQXi9dQW');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CnnQXi9dQW');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0335 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0336
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0336
     * @tc.desc      FoldLayoutState call flow push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0336 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('5lJ');
      logInfo(`step1 push("5lJ"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('5lJ');
      logInfo(`push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('5lJ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0336 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0337
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0337
     * @tc.desc      FoldLayoutState call flow resize > pop > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0337 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 80);
      logInfo(`step1 resize(0, 80): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.resize(10, 135);
      logInfo(`step3 resize(10, 135): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('sb');
      logInfo(`step4 push("sb"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>pop>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>pop>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sb');
      logInfo(`resize>pop>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0337 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0338
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0338
     * @tc.desc      FoldLayoutState call flow resize > resize > resize > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0338 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 30);
      logInfo(`step1 resize(0, 30): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, 105);
      logInfo(`step2 resize(0, 105): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(2, 26.32);
      logInfo(`step3 resize(2, 26.32): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('QuD8OSFzUc');
      logInfo(`step5 push("QuD8OSFzUc"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>resize>resize>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>resize>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>resize>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QuD8OSFzUc');
      logInfo(`resize>resize>resize>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QuD8OSFzUc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0338 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0339
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0339
     * @tc.desc      FoldLayoutState call flow applyMode > resize > applyMode > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0339 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(3744, 5);
      logInfo(`step2 resize(3744, 5): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('pD4L2s');
      logInfo(`step4 push("pD4L2s"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>resize>applyMode>push>applyMode...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('md');
      logInfo(`applyMode>resize>applyMode>push>applyMode...: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>resize>applyMode>push>applyMode...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>resize>applyMode>push>applyMode...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('pD4L2s');
      logInfo(`applyMode>resize>applyMode>push>applyMode...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('pD4L2s');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0339 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0340
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0340
     * @tc.desc      FoldLayoutState call flow pop > push > pop > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0340 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('xabc');
      logInfo(`step2 push("xabc"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.push('Z');
      logInfo(`step4 push("Z"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.resize(0, 110);
      logInfo(`step5 resize(0, 110): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>push>pop>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>push>pop>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push>pop>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Z');
      logInfo(`pop>push>pop>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Z');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0340 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0341
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0341
     * @tc.desc      FoldLayoutState call flow push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0341 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('oH3I6lc6');
      logInfo(`step1 push("oH3I6lc6"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(0, -51);
      logInfo(`step2 resize(0, -51): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('oH3I6lc6');
      logInfo(`push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('oH3I6lc6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0341 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0342
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0342
     * @tc.desc      FoldLayoutState call flow pop > push > resize > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0342 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('ZQqNgSwkhzgH');
      logInfo(`step2 push("ZQqNgSwkhzgH"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(192, 0);
      logInfo(`step3 resize(192, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      const step5: string = subject.resize(1248, 171);
      logInfo(`step5 resize(1248, 171): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>push>resize>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>push>resize>pop>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ZQqNgSwkhzgH');
      logInfo(`pop>push>resize>pop>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ZQqNgSwkhzgH');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0342 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0343
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0343
     * @tc.desc      FoldLayoutState call flow resize > push > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0343 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(384, -51);
      logInfo(`step1 resize(384, -51): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('OwcYyBxztK');
      logInfo(`step2 push("OwcYyBxztK"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(-1, 70);
      logInfo(`step3 resize(-1, 70): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`resize>push>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('OwcYyBxztK');
      logInfo(`resize>push>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('OwcYyBxztK');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0343 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0344
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0344
     * @tc.desc      FoldLayoutState call flow resize > applyMode > resize > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0344 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(-1, 70);
      logInfo(`step1 resize(-1, 70): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(0, 145);
      logInfo(`step3 resize(0, 145): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.resize(150, -6);
      logInfo(`step5 resize(150, -6): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>applyMode>resize>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0344 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0345
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0345
     * @tc.desc      FoldLayoutState call flow pop > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0345 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(2976, 0);
      logInfo(`step2 resize(2976, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      logInfo(`pop>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>resize>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0345 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0346
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0346
     * @tc.desc      FoldLayoutState call flow applyMode > pop > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0346 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('RyK3kaGb5JT8');
      logInfo(`step3 push("RyK3kaGb5JT8"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`applyMode>pop>push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`applyMode>pop>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('RyK3kaGb5JT8');
      logInfo(`applyMode>pop>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('RyK3kaGb5JT8');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0346 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0347
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0347
     * @tc.desc      FoldLayoutState call flow push > push > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0347 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('Hello World_1');
      logInfo(`step1 push("Hello World_1"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('sGb');
      logInfo(`step2 push("sGb"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.push('WWLw0aL79puH');
      logInfo(`step4 push("WWLw0aL79puH"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`push>push>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('WWLw0aL79puH');
      logInfo(`push>push>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('WWLw0aL79puH');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0347 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0348
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0348
     * @tc.desc      FoldLayoutState call flow push > resize > pop > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0348 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('Y04PixjyIvmu');
      logInfo(`step1 push("Y04PixjyIvmu"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(1536, 105);
      logInfo(`step2 resize(1536, 105): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.push('Byso2NxFd');
      logInfo(`step4 push("Byso2NxFd"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>resize>pop>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>pop>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>pop>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Byso2NxFd');
      logInfo(`push>resize>pop>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Byso2NxFd');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0348 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0349
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0349
     * @tc.desc      FoldLayoutState call flow push > pop > push > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0349 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('xIX8');
      logInfo(`step1 push("xIX8"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.push('QuD8OSFzUc');
      logInfo(`step3 push("QuD8OSFzUc"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('Wekqg0YAP');
      logInfo(`step4 push("Wekqg0YAP"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`push>pop>push>push>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>pop>push>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>pop>push>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Wekqg0YAP');
      logInfo(`push>pop>push>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Wekqg0YAP');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0349 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0350
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0350
     * @tc.desc      FoldLayoutState call flow pop > push > push > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0350 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('hOgzRi6');
      logInfo(`step2 push("hOgzRi6"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('dCj4QjbZ');
      logInfo(`step3 push("dCj4QjbZ"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('6');
      logInfo(`step5 push("6"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`pop>push>push>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>push>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>push>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('6');
      logInfo(`pop>push>push>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0350 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0351
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0351
     * @tc.desc      FoldLayoutState call flow resize > push > pop > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0351 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(2592, 0);
      logInfo(`step1 resize(2592, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('  ');
      logInfo(`step2 push("  "): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.push('zp');
      logInfo(`step4 push("zp"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`resize>push>pop>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push>pop>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>push>pop>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push>pop>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('zp');
      logInfo(`resize>push>pop>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('zp');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0351 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0352
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0352
     * @tc.desc      FoldLayoutState call flow resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0352 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(3093, 0);
      logInfo(`step1 resize(3093, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('QBy');
      logInfo(`step2 push("QBy"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QBy');
      logInfo(`resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QBy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0352 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0353
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0353
     * @tc.desc      FoldLayoutState call flow pop > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0353 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(3264, 0);
      logInfo(`step2 resize(3264, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`pop>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>resize>applyMode final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0353 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0354
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0354
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0354 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('lcBs');
      logInfo(`step1 push("lcBs"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('DMGUNUr5X6');
      logInfo(`step2 push("DMGUNUr5X6"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('DMGUNUr5X6');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('DMGUNUr5X6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0354 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0355
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0355
     * @tc.desc      FoldLayoutState call flow pop > push > push > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0355 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('TfYsI');
      logInfo(`step2 push("TfYsI"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('');
      logInfo(`step3 push(""): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(2400, 3);
      logInfo(`step4 resize(2400, 3): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`pop>push>push>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('md');
      logInfo(`pop>push>push>resize>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>push>resize>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0355 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0356
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0356
     * @tc.desc      FoldLayoutState call flow push > applyMode > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0356 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('mFj');
      logInfo(`step1 push("mFj"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.push('TfYsI');
      logInfo(`step4 push("TfYsI"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`push>applyMode>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('TfYsI');
      logInfo(`push>applyMode>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('TfYsI');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0356 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0357
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0357
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0357 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('CI9bhwEXM');
      logInfo(`step2 push("CI9bhwEXM"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`applyMode>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CI9bhwEXM');
      logInfo(`applyMode>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CI9bhwEXM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0357 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0358
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0358
     * @tc.desc      FoldLayoutState call flow resize > resize > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0358 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(3648, 0);
      logInfo(`step1 resize(3648, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(3840, 0);
      logInfo(`step2 resize(3840, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('Y04PixjyIvmu');
      logInfo(`step3 push("Y04PixjyIvmu"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(1632, 35);
      logInfo(`step4 resize(1632, 35): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>resize>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Y04PixjyIvmu');
      logInfo(`resize>resize>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Y04PixjyIvmu');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0358 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0359
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0359
     * @tc.desc      FoldLayoutState call flow applyMode > push > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0359 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('tHzc');
      logInfo(`step2 push("tHzc"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 137);
      logInfo(`step3 resize(0, 137): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(2112, 0);
      logInfo(`step4 resize(2112, 0): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>push>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`applyMode>push>resize>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tHzc');
      logInfo(`applyMode>push>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tHzc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0359 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0360
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0360
     * @tc.desc      FoldLayoutState call flow push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0360 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push(' abc ');
      logInfo(`step1 push(" abc "): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' abc ');
      logInfo(`push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' abc ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0360 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0361
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0361
     * @tc.desc      FoldLayoutState call flow applyMode > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0361 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('   ');
      logInfo(`step2 push("   "): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('rD6V');
      logInfo(`step3 push("rD6V"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`applyMode>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('rD6V');
      logInfo(`applyMode>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('rD6V');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0361 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0362
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0362
     * @tc.desc      FoldLayoutState call flow push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0362 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('EURv');
      logInfo(`step1 push("EURv"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      logInfo(`push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('EURv');
      logInfo(`push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('EURv');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0362 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0363
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0363
     * @tc.desc      FoldLayoutState call flow pop > push > applyMode > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0363 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('4');
      logInfo(`step2 push("4"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('KNq');
      logInfo(`step4 push("KNq"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`pop>push>applyMode>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>applyMode>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>applyMode>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('KNq');
      logInfo(`pop>push>applyMode>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('KNq');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0363 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0364
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0364
     * @tc.desc      FoldLayoutState call flow resize > push > pop > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0364 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(96, 180);
      logInfo(`step1 resize(96, 180): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('SjtxzP');
      logInfo(`step2 push("SjtxzP"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.push('R');
      logInfo(`step4 push("R"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>push>pop>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>pop>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push>pop>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('R');
      logInfo(`resize>push>pop>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('R');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0364 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0365
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0365
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0365 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('Hello World_1');
      logInfo(`step1 push("Hello World_1"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(2976, 1);
      logInfo(`step3 resize(2976, 1): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>applyMode>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Hello World_1');
      logInfo(`push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0365 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0366
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0366
     * @tc.desc      FoldLayoutState call flow resize > resize > resize > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0366 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(720, 0);
      logInfo(`step1 resize(720, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(1080, 0);
      logInfo(`step2 resize(1080, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(1632, 50);
      logInfo(`step3 resize(1632, 50): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('ZuapEZV');
      logInfo(`step4 push("ZuapEZV"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`resize>resize>resize>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>resize>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ZuapEZV');
      logInfo(`resize>resize>resize>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ZuapEZV');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0366 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0367
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0367
     * @tc.desc      FoldLayoutState call flow resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0367 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(2562, 87);
      logInfo(`step1 resize(2562, 87): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('4Q7Zrm0J4JM');
      logInfo(`step2 push("4Q7Zrm0J4JM"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4Q7Zrm0J4JM');
      logInfo(`resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4Q7Zrm0J4JM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0367 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0368
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0368
     * @tc.desc      FoldLayoutState call flow push > push > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0368 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('8T7');
      logInfo(`step1 push("8T7"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('uyAR92H');
      logInfo(`step2 push("uyAR92H"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(3, 74);
      logInfo(`step3 resize(3, 74): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`push>push>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>push>resize>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>push>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('uyAR92H');
      logInfo(`push>push>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('uyAR92H');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0368 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0369
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0369
     * @tc.desc      FoldLayoutState call flow push > pop > resize > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0369 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('N9S');
      logInfo(`step1 push("N9S"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.resize(0, 25);
      logInfo(`step3 resize(0, 25): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('VEJ2W');
      logInfo(`step4 push("VEJ2W"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`push>pop>resize>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>pop>resize>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('VEJ2W');
      logInfo(`push>pop>resize>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('VEJ2W');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0369 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0370
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0370
     * @tc.desc      FoldLayoutState call flow push > pop > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0370 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push(' a ');
      logInfo(`step1 push(" a "): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(1344, 0);
      logInfo(`step4 resize(1344, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>pop>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>pop>applyMode>resize final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' a ');
      logInfo(`push>pop>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' a ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0370 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0371
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0371
     * @tc.desc      FoldLayoutState call flow pop > pop > applyMode > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0371 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('sGb');
      logInfo(`step5 push("sGb"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`pop>pop>applyMode>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>pop>applyMode>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>pop>applyMode>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sGb');
      logInfo(`pop>pop>applyMode>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sGb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0371 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0372
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0372
     * @tc.desc      FoldLayoutState call flow push > resize > resize > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0372 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('tWI');
      logInfo(`step1 push("tWI"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(0, -6);
      logInfo(`step2 resize(0, -6): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(3168, 0);
      logInfo(`step3 resize(3168, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>resize>resize>applyMode>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>resize>resize>applyMode>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>resize>resize>applyMode>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>resize>applyMode>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tWI');
      logInfo(`push>resize>resize>applyMode>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tWI');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0372 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0373
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0373
     * @tc.desc      FoldLayoutState call flow resize > pop > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0373 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(576, 0);
      logInfo(`step1 resize(576, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.resize(0, 140);
      logInfo(`step4 resize(0, 140): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>pop>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0373 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0374
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0374
     * @tc.desc      FoldLayoutState call flow pop > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0374 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('  ');
      logInfo(`step2 push("  "): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(2, 26.32);
      logInfo(`step3 resize(2, 26.32): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`pop>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('  ');
      logInfo(`pop>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('  ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0374 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0375
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0375
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0375 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('dsWQIIpU10A7');
      logInfo(`step2 push("dsWQIIpU10A7"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`applyMode>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dsWQIIpU10A7');
      logInfo(`applyMode>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dsWQIIpU10A7');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0375 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0376
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0376
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0376 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('Byso2NxFd');
      logInfo(`step1 push("Byso2NxFd"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(2880, 0);
      logInfo(`step3 resize(2880, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>applyMode>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Byso2NxFd');
      logInfo(`push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Byso2NxFd');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0376 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0377
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0377
     * @tc.desc      FoldLayoutState call flow pop > push > pop > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0377 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('Hello World_1');
      logInfo(`step2 push("Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.resize(768, 0);
      logInfo(`step4 resize(768, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`pop>push>pop>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>push>pop>resize>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`pop>push>pop>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Hello World_1');
      logInfo(`pop>push>pop>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0377 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0378
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0378
     * @tc.desc      FoldLayoutState call flow push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0378 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('VEJ2W');
      logInfo(`step1 push("VEJ2W"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(96, 180);
      logInfo(`step2 resize(96, 180): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('VEJ2W');
      logInfo(`push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('VEJ2W');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0378 end`);
    });
  });
}
