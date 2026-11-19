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

/** Logic checks for FoldLayoutState flow (48 cases). */
export default function foldLayoutStateFlow4Test(): void {
  describe('FoldLayoutStateFlow4Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0146
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0146
     * @tc.desc      FoldLayoutState call flow resize > applyMode > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0146 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(10, 0);
      logInfo(`step1 resize(10, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('4O');
      logInfo(`step3 push("4O"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`resize>applyMode>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>applyMode>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>applyMode>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>applyMode>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4O');
      logInfo(`resize>applyMode>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4O');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0147
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0147
     * @tc.desc      FoldLayoutState call flow push > resize > pop > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0147 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('qeEC2oAAaz');
      logInfo(`step1 push("qeEC2oAAaz"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(1536, 0);
      logInfo(`step2 resize(1536, 0): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('xHello World');
      logInfo(`step5 push("xHello World"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>resize>pop>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>resize>pop>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>resize>pop>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>pop>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xHello World');
      logInfo(`push>resize>pop>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xHello World');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0148
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0148
     * @tc.desc      FoldLayoutState call flow push > applyMode > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0148 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('HDWLlwbDkiF');
      logInfo(`step1 push("HDWLlwbDkiF"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('aqNMn');
      logInfo(`step3 push("aqNMn"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`push>applyMode>push>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('aqNMn');
      logInfo(`push>applyMode>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('aqNMn');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0149
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0149
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0149 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('ZuapEZV');
      logInfo(`step1 push("ZuapEZV"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('mQAHnIEj');
      logInfo(`step2 push("mQAHnIEj"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mQAHnIEj');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mQAHnIEj');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0150
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0150
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0150 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('sX8IIO6eY');
      logInfo(`step2 push("sX8IIO6eY"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sX8IIO6eY');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sX8IIO6eY');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0151
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0151
     * @tc.desc      FoldLayoutState call flow applyMode > applyMode > applyMode > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0151 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('sGb');
      logInfo(`step4 push("sGb"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.push('4');
      logInfo(`step5 push("4"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>applyMode>applyMode>push>push f...: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>applyMode>applyMode>push>push f...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>applyMode>applyMode>push>push f...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4');
      logInfo(`applyMode>applyMode>applyMode>push>push f...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0152
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0152
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0152 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('nKriyYENMO');
      logInfo(`step2 push("nKriyYENMO"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('nKriyYENMO');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('nKriyYENMO');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0153
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0153
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0153 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('dF');
      logInfo(`step1 push("dF"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('mFj');
      logInfo(`step2 push("mFj"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mFj');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mFj');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0154
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0154
     * @tc.desc      FoldLayoutState call flow pop > applyMode > push > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0154 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('l0NCr38Q');
      logInfo(`step3 push("l0NCr38Q"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      const step5: string = subject.push('J');
      logInfo(`step5 push("J"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`pop>applyMode>push>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>applyMode>push>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>applyMode>push>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('J');
      logInfo(`pop>applyMode>push>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('J');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0155
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0155
     * @tc.desc      FoldLayoutState call flow pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0155 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0156
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0156
     * @tc.desc      FoldLayoutState call flow push > resize > pop > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0156 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('dF');
      logInfo(`step1 push("dF"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(3, 74);
      logInfo(`step2 resize(3, 74): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.resize(0, 135);
      logInfo(`step4 resize(0, 135): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('Hello World');
      logInfo(`step5 push("Hello World"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>resize>pop>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>pop>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>pop>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Hello World');
      logInfo(`push>resize>pop>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Hello World');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0157
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0157
     * @tc.desc      FoldLayoutState call flow resize > push > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0157 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(10, 130);
      logInfo(`step1 resize(10, 130): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('sX8IIO6eY');
      logInfo(`step2 push("sX8IIO6eY"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('sb');
      logInfo(`step4 push("sb"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>push>applyMode>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>push>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sb');
      logInfo(`resize>push>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0158
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0158
     * @tc.desc      FoldLayoutState call flow push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0158 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('tpDXECg1oDVa');
      logInfo(`step1 push("tpDXECg1oDVa"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      logInfo(`push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tpDXECg1oDVa');
      logInfo(`push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tpDXECg1oDVa');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0159
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0159
     * @tc.desc      FoldLayoutState call flow resize > applyMode > push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0159 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(288, 185);
      logInfo(`step1 resize(288, 185): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('UC5DEF4j');
      logInfo(`step3 push("UC5DEF4j"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(0, 170);
      logInfo(`step5 resize(0, 170): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>applyMode>push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>applyMode>push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>applyMode>push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('UC5DEF4j');
      logInfo(`resize>applyMode>push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('UC5DEF4j');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0160
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0160
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0160 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('Yef3X');
      logInfo(`step1 push("Yef3X"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 65);
      logInfo(`step3 resize(0, 65): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(2304, 171);
      logInfo(`step5 resize(2304, 171): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>applyMode>resize>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>applyMode>resize>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yef3X');
      logInfo(`push>applyMode>resize>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yef3X');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0161
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0161
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0161 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('N');
      logInfo(`step1 push("N"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('J3B0bAN');
      logInfo(`step2 push("J3B0bAN"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('J3B0bAN');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('J3B0bAN');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0162
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0162
     * @tc.desc      FoldLayoutState call flow pop > resize > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0162 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(333.66, 0);
      logInfo(`step2 resize(333.66, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`pop>resize>pop>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>resize>pop>applyMode final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0163
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0163
     * @tc.desc      FoldLayoutState call flow resize > pop > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0163 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1056, 140);
      logInfo(`step1 resize(1056, 140): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('Y');
      logInfo(`step3 push("Y"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(1536, -42);
      logInfo(`step4 resize(1536, -42): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>pop>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>pop>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Y');
      logInfo(`resize>pop>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Y');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0164
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0164
     * @tc.desc      FoldLayoutState call flow pop > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0164 begin`);
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
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0165
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0165
     * @tc.desc      FoldLayoutState call flow applyMode > pop > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0165 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('XD3RMuwT');
      logInfo(`step4 push("XD3RMuwT"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>pop>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>pop>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>pop>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('XD3RMuwT');
      logInfo(`applyMode>pop>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('XD3RMuwT');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0166
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0166
     * @tc.desc      FoldLayoutState call flow resize > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0166 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 115);
      logInfo(`step1 resize(0, 115): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('ClKjbpd');
      logInfo(`step3 push("ClKjbpd"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>applyMode>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ClKjbpd');
      logInfo(`resize>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ClKjbpd');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0167
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0167
     * @tc.desc      FoldLayoutState call flow push > pop > pop > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0167 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('nKriyYENMO');
      logInfo(`step1 push("nKriyYENMO"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`push>pop>pop>pop>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop>pop>pop>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('nKriyYENMO');
      logInfo(`push>pop>pop>pop>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('nKriyYENMO');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0168
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0168
     * @tc.desc      FoldLayoutState call flow push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0168 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('KBshc');
      logInfo(`step1 push("KBshc"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(3552, 191);
      logInfo(`step2 resize(3552, 191): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('PoDMfGp');
      logInfo(`step3 push("PoDMfGp"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('PoDMfGp');
      logInfo(`push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('PoDMfGp');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0169
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0169
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0169 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('LSyiarJKOkGy');
      logInfo(`step2 push("LSyiarJKOkGy"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      const step5: string = subject.resize(0, 80);
      logInfo(`step5 resize(0, 80): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>push>applyMode>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>push>applyMode>pop>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('LSyiarJKOkGy');
      logInfo(`applyMode>push>applyMode>pop>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('LSyiarJKOkGy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0170
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0170
     * @tc.desc      FoldLayoutState call flow pop > applyMode > push > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0170 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('QuD8OSFzUc');
      logInfo(`step3 push("QuD8OSFzUc"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(0, 40);
      logInfo(`step4 resize(0, 40): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`pop>applyMode>push>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>applyMode>push>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QuD8OSFzUc');
      logInfo(`pop>applyMode>push>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QuD8OSFzUc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0171
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0171
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0171 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('mRh7rDC');
      logInfo(`step2 push("mRh7rDC"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mRh7rDC');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mRh7rDC');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0172
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0172
     * @tc.desc      FoldLayoutState call flow push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0172 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('sD2I');
      logInfo(`step1 push("sD2I"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(2400, 100);
      logInfo(`step2 resize(2400, 100): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sD2I');
      logInfo(`push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sD2I');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0173
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0173
     * @tc.desc      FoldLayoutState call flow applyMode > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0173 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0174
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0174
     * @tc.desc      FoldLayoutState call flow pop > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0174 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('mRh7rDC');
      logInfo(`step2 push("mRh7rDC"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(2976, 55);
      logInfo(`step3 resize(2976, 55): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`pop>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mRh7rDC');
      logInfo(`pop>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mRh7rDC');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0175
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0175
     * @tc.desc      FoldLayoutState call flow pop > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0175 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('YBG6earU');
      logInfo(`step2 push("YBG6earU"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`pop>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YBG6earU');
      logInfo(`pop>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YBG6earU');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0176
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0176
     * @tc.desc      FoldLayoutState call flow pop > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0176 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0177
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0177
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0177 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('XD3RMuwT');
      logInfo(`step1 push("XD3RMuwT"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('UC5DEF4j');
      logInfo(`step2 push("UC5DEF4j"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('UC5DEF4j');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('UC5DEF4j');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0178
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0178
     * @tc.desc      FoldLayoutState call flow applyMode > resize > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0178 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(2784, 95);
      logInfo(`step2 resize(2784, 95): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('hOgzRi6');
      logInfo(`step3 push("hOgzRi6"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push(' _1');
      logInfo(`step4 push(" _1"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`applyMode>resize>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>resize>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>resize>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' _1');
      logInfo(`applyMode>resize>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' _1');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0179
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0179
     * @tc.desc      FoldLayoutState call flow push > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0179 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push(' abc ');
      logInfo(`step1 push(" abc "): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      logInfo(`push>applyMode>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>applyMode>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' abc ');
      logInfo(`push>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' abc ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0180
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0180
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0180 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('TfYsI');
      logInfo(`step1 push("TfYsI"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(864, 0);
      logInfo(`step3 resize(864, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.resize(333.66, 0);
      logInfo(`step5 resize(333.66, 0): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>applyMode>resize>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>applyMode>resize>applyMode>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>resize>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('TfYsI');
      logInfo(`push>applyMode>resize>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('TfYsI');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0181
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0181
     * @tc.desc      FoldLayoutState call flow pop > applyMode > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0181 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0182
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0182
     * @tc.desc      FoldLayoutState call flow push > push > applyMode > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0182 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('123');
      logInfo(`step1 push("123"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('6');
      logInfo(`step2 push("6"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`push>push>applyMode>applyMode>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>applyMode>applyMode>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>push>applyMode>applyMode>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('6');
      logInfo(`push>push>applyMode>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0183
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0183
     * @tc.desc      FoldLayoutState call flow resize > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0183 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 50);
      logInfo(`step1 resize(0, 50): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('CI9bhwEXM');
      logInfo(`step3 push("CI9bhwEXM"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CI9bhwEXM');
      logInfo(`resize>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CI9bhwEXM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0184
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0184
     * @tc.desc      FoldLayoutState call flow push > applyMode > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0184 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('sX8IIO6eY');
      logInfo(`step1 push("sX8IIO6eY"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`push>applyMode>applyMode>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>applyMode>applyMode>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sX8IIO6eY');
      logInfo(`push>applyMode>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sX8IIO6eY');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0185
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0185
     * @tc.desc      FoldLayoutState call flow push > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0185 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('RtNmV8fr7eoq');
      logInfo(`step1 push("RtNmV8fr7eoq"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('EB3x5Oew');
      logInfo(`step2 push("EB3x5Oew"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('2MtjEnIZ1MzG');
      logInfo(`step3 push("2MtjEnIZ1MzG"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`push>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`push>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('2MtjEnIZ1MzG');
      logInfo(`push>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('2MtjEnIZ1MzG');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0186
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0186
     * @tc.desc      FoldLayoutState call flow push > resize > push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0186 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('luaI');
      logInfo(`step1 push("luaI"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(1277, 57.87);
      logInfo(`step2 resize(1277, 57.87): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('ClKjbpd');
      logInfo(`step3 push("ClKjbpd"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(1152, 57.87);
      logInfo(`step5 resize(1152, 57.87): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>resize>push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ClKjbpd');
      logInfo(`push>resize>push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ClKjbpd');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0187
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0187
     * @tc.desc      FoldLayoutState call flow pop > resize > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0187 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(2592, 74);
      logInfo(`step2 resize(2592, 74): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`pop>resize>applyMode>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0188
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0188
     * @tc.desc      FoldLayoutState call flow pop > applyMode > resize > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0188 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(2784, 95);
      logInfo(`step3 resize(2784, 95): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.resize(2304, 150);
      logInfo(`step5 resize(2304, 150): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>applyMode>resize>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0189
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0189
     * @tc.desc      FoldLayoutState call flow applyMode > pop > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0189 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('PzXCY7UNxdB8');
      logInfo(`step3 push("PzXCY7UNxdB8"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>pop>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>pop>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>pop>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('PzXCY7UNxdB8');
      logInfo(`applyMode>pop>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('PzXCY7UNxdB8');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0190
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0190
     * @tc.desc      FoldLayoutState call flow resize > pop > push > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0190 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(100, 0);
      logInfo(`step1 resize(100, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('CNNTXFFap');
      logInfo(`step3 push("CNNTXFFap"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(-1918, 0);
      logInfo(`step4 resize(-1918, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`resize>pop>push>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>push>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CNNTXFFap');
      logInfo(`resize>pop>push>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CNNTXFFap');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0191
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0191
     * @tc.desc      FoldLayoutState call flow resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0191 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 180);
      logInfo(`step1 resize(0, 180): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('J3B0bAN');
      logInfo(`step2 push("J3B0bAN"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('J3B0bAN');
      logInfo(`resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('J3B0bAN');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0192
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0192
     * @tc.desc      FoldLayoutState call flow push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0192 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('6W9');
      logInfo(`step1 push("6W9"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      logInfo(`push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('6W9');
      logInfo(`push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('6W9');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0193
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0193
     * @tc.desc      FoldLayoutState call flow resize > applyMode > resize > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0193 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(360, 1);
      logInfo(`step1 resize(360, 1): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(1344, 0);
      logInfo(`step3 resize(1344, 0): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('tWI');
      logInfo(`step4 push("tWI"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`resize>applyMode>resize>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>applyMode>resize>push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`resize>applyMode>resize>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tWI');
      logInfo(`resize>applyMode>resize>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tWI');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0193 end`);
    });
  });
}
