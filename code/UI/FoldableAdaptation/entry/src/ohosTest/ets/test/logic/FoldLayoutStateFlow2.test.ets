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

/** Logic checks for FoldLayoutState flow (47 cases). */
export default function foldLayoutStateFlow2Test(): void {
  describe('FoldLayoutStateFlow2Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0051
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0051
     * @tc.desc      FoldLayoutState call flow push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0051 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('xabc');
      logInfo(`step1 push("xabc"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      logInfo(`push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xabc');
      logInfo(`push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xabc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0052
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0052
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0052 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('Yt2U6');
      logInfo(`step1 push("Yt2U6"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(1652.93, 0);
      logInfo(`step3 resize(1652.93, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(2784, 0);
      logInfo(`step4 resize(2784, 0): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`push>applyMode>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>applyMode>resize>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yt2U6');
      logInfo(`push>applyMode>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yt2U6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0053
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0053
     * @tc.desc      FoldLayoutState call flow applyMode > applyMode > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0053 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.push('PoDMfGp');
      logInfo(`step4 push("PoDMfGp"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>applyMode>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>applyMode>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>applyMode>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('PoDMfGp');
      logInfo(`applyMode>applyMode>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('PoDMfGp');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0054
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0054
     * @tc.desc      FoldLayoutState call flow pop > pop > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0054 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0055
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0055
     * @tc.desc      FoldLayoutState call flow push > resize > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0055 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('xabc');
      logInfo(`step1 push("xabc"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(2304, 150);
      logInfo(`step2 resize(2304, 150): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('F');
      logInfo(`step3 push("F"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`push>resize>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('F');
      logInfo(`push>resize>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('F');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0056
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0056
     * @tc.desc      FoldLayoutState call flow push > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0056 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('KNq');
      logInfo(`step1 push("KNq"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      logInfo(`push>pop>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('KNq');
      logInfo(`push>pop>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('KNq');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0057
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0057
     * @tc.desc      FoldLayoutState call flow applyMode > push > pop > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0057 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('UqVZp');
      logInfo(`step2 push("UqVZp"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.resize(3456, 0);
      logInfo(`step4 resize(3456, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('HDWLlwbDkiF');
      logInfo(`step5 push("HDWLlwbDkiF"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>push>pop>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`applyMode>push>pop>resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>pop>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>pop>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('HDWLlwbDkiF');
      logInfo(`applyMode>push>pop>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('HDWLlwbDkiF');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0058
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0058
     * @tc.desc      FoldLayoutState call flow pop > push > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0058 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('a_1');
      logInfo(`step2 push("a_1"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('SjtxzP');
      logInfo(`step4 push("SjtxzP"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>push>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('SjtxzP');
      logInfo(`pop>push>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('SjtxzP');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0059
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0059
     * @tc.desc      FoldLayoutState call flow applyMode > resize > resize > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0059 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, 40);
      logInfo(`step2 resize(0, 40): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(-240, 57.87);
      logInfo(`step3 resize(-240, 57.87): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`applyMode>resize>resize>pop>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0060
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0060
     * @tc.desc      FoldLayoutState call flow push > pop > pop > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0060 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('UqVZp');
      logInfo(`step1 push("UqVZp"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.push('5ozgs6M');
      logInfo(`step4 push("5ozgs6M"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.push('qeEC2oAAaz');
      logInfo(`step5 push("qeEC2oAAaz"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>pop>pop>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>pop>pop>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>pop>pop>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qeEC2oAAaz');
      logInfo(`push>pop>pop>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qeEC2oAAaz');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0061
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0061
     * @tc.desc      FoldLayoutState call flow resize > resize > push > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0061 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1277, 155);
      logInfo(`step1 resize(1277, 155): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, 45);
      logInfo(`step2 resize(0, 45): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('wTtoDGQ');
      logInfo(`step3 push("wTtoDGQ"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`resize>resize>push>pop>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>push>pop>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('wTtoDGQ');
      logInfo(`resize>resize>push>pop>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('wTtoDGQ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0062
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0062
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0062 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('3eGu6S2yD');
      logInfo(`step2 push("3eGu6S2yD"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('3eGu6S2yD');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('3eGu6S2yD');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0063
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0063
     * @tc.desc      FoldLayoutState call flow pop > pop > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0063 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('kBXEt17y5');
      logInfo(`step3 push("kBXEt17y5"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(3360, 120);
      logInfo(`step4 resize(3360, 120): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`pop>pop>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>pop>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>pop>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('kBXEt17y5');
      logInfo(`pop>pop>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('kBXEt17y5');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0064
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0064
     * @tc.desc      FoldLayoutState call flow pop > applyMode > pop > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0064 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('lcBs');
      logInfo(`step5 push("lcBs"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`pop>applyMode>pop>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>applyMode>pop>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>applyMode>pop>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('lcBs');
      logInfo(`pop>applyMode>pop>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('lcBs');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0065
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0065
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0065 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('A6XSmSNXcSK');
      logInfo(`step2 push("A6XSmSNXcSK"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('A6XSmSNXcSK');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('A6XSmSNXcSK');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0066
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0066
     * @tc.desc      FoldLayoutState call flow push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0066 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('sTCHk');
      logInfo(`step1 push("sTCHk"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(3744, 2);
      logInfo(`step2 resize(3744, 2): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('wTtoDGQ');
      logInfo(`step3 push("wTtoDGQ"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('wTtoDGQ');
      logInfo(`push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('wTtoDGQ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0067
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0067
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0067 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('ZQqNgSwkhzgH');
      logInfo(`step1 push("ZQqNgSwkhzgH"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('10UttR');
      logInfo(`step2 push("10UttR"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('10UttR');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('10UttR');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0068
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0068
     * @tc.desc      FoldLayoutState call flow push > resize > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0068 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('HEwnWVlBQqim');
      logInfo(`step1 push("HEwnWVlBQqim"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(100, 15);
      logInfo(`step2 resize(100, 15): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(0, 110);
      logInfo(`step3 resize(0, 110): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(150, -51);
      logInfo(`step4 resize(150, -51): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>resize>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('HEwnWVlBQqim');
      logInfo(`push>resize>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('HEwnWVlBQqim');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0069
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0069
     * @tc.desc      FoldLayoutState call flow push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0069 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('i');
      logInfo(`step1 push("i"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      logInfo(`push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('i');
      logInfo(`push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('i');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0070
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0070
     * @tc.desc      FoldLayoutState call flow push > resize > resize > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0070 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('KNq');
      logInfo(`step1 push("KNq"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(10, 0);
      logInfo(`step2 resize(10, 0): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(2208, 140);
      logInfo(`step3 resize(2208, 140): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(3072, 0);
      logInfo(`step4 resize(3072, 0): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>resize>resize>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>resize>resize>resize>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>resize>resize>resize>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>resize>resize>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('KNq');
      logInfo(`push>resize>resize>resize>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('KNq');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0071
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0071
     * @tc.desc      FoldLayoutState call flow pop > applyMode > push > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0071 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('CylPH');
      logInfo(`step3 push("CylPH"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(1440, 170);
      logInfo(`step4 resize(1440, 170): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>applyMode>push>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>applyMode>push>resize>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>applyMode>push>resize>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CylPH');
      logInfo(`pop>applyMode>push>resize>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CylPH');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0072
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0072
     * @tc.desc      FoldLayoutState call flow pop > applyMode > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0072 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0073
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0073
     * @tc.desc      FoldLayoutState call flow applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0073 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0074
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0074
     * @tc.desc      FoldLayoutState call flow resize > pop > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0074 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 140);
      logInfo(`step1 resize(0, 140): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`resize>pop>applyMode>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0075
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0075
     * @tc.desc      FoldLayoutState call flow applyMode > applyMode > applyMode > applyMode > push keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0075 begin`);
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
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push(' Hello World ');
      logInfo(`step5 push(" Hello World "): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>applyMode>applyMode>applyMode>p...: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>applyMode>applyMode>applyMode>p...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>applyMode>applyMode>applyMode>p...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' Hello World ');
      logInfo(`applyMode>applyMode>applyMode>applyMode>p...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0076
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0076
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0076 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('N9YsM');
      logInfo(`step2 push("N9YsM"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('N9YsM');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('N9YsM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0077
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0077
     * @tc.desc      FoldLayoutState call flow applyMode > push > pop > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0077 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('Yef3X');
      logInfo(`step2 push("Yef3X"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(-240, 88);
      logInfo(`step5 resize(-240, 88): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>push>pop>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>push>pop>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yef3X');
      logInfo(`applyMode>push>pop>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yef3X');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0078
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0078
     * @tc.desc      FoldLayoutState call flow pop > pop > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0078 begin`);
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
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0079
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0079
     * @tc.desc      FoldLayoutState call flow resize > resize > applyMode > applyMode > applyMode keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0079 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(3360, 120);
      logInfo(`step1 resize(3360, 120): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(2784, 0);
      logInfo(`step2 resize(2784, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>resize>applyMode>applyMode>applyMo...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>resize>applyMode>applyMode>applyMo...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0080
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0080
     * @tc.desc      FoldLayoutState call flow applyMode > resize > pop > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0080 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, 80);
      logInfo(`step2 resize(0, 80): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.resize(3, 0);
      logInfo(`step4 resize(3, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`applyMode>resize>pop>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`applyMode>resize>pop>resize>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0081
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0081
     * @tc.desc      FoldLayoutState call flow push > push > pop > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0081 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('HGlC7');
      logInfo(`step1 push("HGlC7"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('5jHJZ');
      logInfo(`step2 push("5jHJZ"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.push('05');
      logInfo(`step4 push("05"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`push>push>pop>push>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>pop>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>push>pop>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('05');
      logInfo(`push>push>pop>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('05');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0082
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0082
     * @tc.desc      FoldLayoutState call flow applyMode > resize > applyMode > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0082 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, 70);
      logInfo(`step2 resize(0, 70): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('mFj');
      logInfo(`step4 push("mFj"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>resize>applyMode>push>applyMode...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>resize>applyMode>push>applyMode...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>resize>applyMode>push>applyMode...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mFj');
      logInfo(`applyMode>resize>applyMode>push>applyMode...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mFj');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0083
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0083
     * @tc.desc      FoldLayoutState call flow push > pop > applyMode > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0083 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('YBG6earU');
      logInfo(`step1 push("YBG6earU"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(150, 0);
      logInfo(`step4 resize(150, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`push>pop>applyMode>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>pop>applyMode>resize>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop>applyMode>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YBG6earU');
      logInfo(`push>pop>applyMode>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YBG6earU');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0084
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0084
     * @tc.desc      FoldLayoutState call flow applyMode > resize > push > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0084 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(960, 110);
      logInfo(`step2 resize(960, 110): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('sb');
      logInfo(`step3 push("sb"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>resize>push>applyMode>applyMode...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>resize>push>applyMode>applyMode...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>resize>push>applyMode>applyMode...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sb');
      logInfo(`applyMode>resize>push>applyMode>applyMode...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0085
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0085
     * @tc.desc      FoldLayoutState call flow resize > pop > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0085 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(333.66, 55);
      logInfo(`step1 resize(333.66, 55): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.resize(1440, 170);
      logInfo(`step3 resize(1440, 170): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(3360, 0);
      logInfo(`step4 resize(3360, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>pop>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>pop>resize>resize final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0086
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0086
     * @tc.desc      FoldLayoutState call flow applyMode > resize > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0086 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(100, 200);
      logInfo(`step2 resize(100, 200): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('EURv');
      logInfo(`step3 push("EURv"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`applyMode>resize>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>resize>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('EURv');
      logInfo(`applyMode>resize>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('EURv');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0087
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0087
     * @tc.desc      FoldLayoutState call flow resize > resize > applyMode > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0087 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 145);
      logInfo(`step1 resize(0, 145): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(1440, 0);
      logInfo(`step2 resize(1440, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('xHello World');
      logInfo(`step4 push("xHello World"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`resize>resize>applyMode>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>resize>applyMode>push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`resize>resize>applyMode>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xHello World');
      logInfo(`resize>resize>applyMode>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xHello World');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0088
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0088
     * @tc.desc      FoldLayoutState call flow resize > push > push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0088 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 90);
      logInfo(`step1 resize(0, 90): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push(' abc ');
      logInfo(`step2 push(" abc "): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('sTCHk');
      logInfo(`step3 push("sTCHk"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(150, 0);
      logInfo(`step5 resize(150, 0): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`resize>push>push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push>push>applyMode>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>push>push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>push>push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sTCHk');
      logInfo(`resize>push>push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sTCHk');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0089
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0089
     * @tc.desc      FoldLayoutState call flow pop > push > applyMode > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0089 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('qxHlmS');
      logInfo(`step2 push("qxHlmS"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      const step5: string = subject.push('pD4L2s');
      logInfo(`step5 push("pD4L2s"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`pop>push>applyMode>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>applyMode>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push>applyMode>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('pD4L2s');
      logInfo(`pop>push>applyMode>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('pD4L2s');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0090
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0090
     * @tc.desc      FoldLayoutState call flow pop > applyMode > pop > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0090 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.resize(0, 90);
      logInfo(`step4 resize(0, 90): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('qeEC2oAAaz');
      logInfo(`step5 push("qeEC2oAAaz"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>applyMode>pop>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>applyMode>pop>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>applyMode>pop>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qeEC2oAAaz');
      logInfo(`pop>applyMode>pop>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qeEC2oAAaz');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0091
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0091
     * @tc.desc      FoldLayoutState call flow pop > push > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0091 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('UPawgHO');
      logInfo(`step2 push("UPawgHO"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`pop>push>pop>applyMode final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`pop>push>pop>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('UPawgHO');
      logInfo(`pop>push>pop>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('UPawgHO');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0092
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0092
     * @tc.desc      FoldLayoutState call flow applyMode > push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0092 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('a');
      logInfo(`step2 push("a"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(3648, 0);
      logInfo(`step3 resize(3648, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('EURv');
      logInfo(`step4 push("EURv"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`applyMode>push>resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('EURv');
      logInfo(`applyMode>push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('EURv');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0093
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0093
     * @tc.desc      FoldLayoutState call flow resize > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0093 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(288, 0);
      logInfo(`step1 resize(288, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(1344, 40);
      logInfo(`step2 resize(1344, 40): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('oH3I6lc6');
      logInfo(`step3 push("oH3I6lc6"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('oH3I6lc6');
      logInfo(`resize>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('oH3I6lc6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0094
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0094
     * @tc.desc      FoldLayoutState call flow resize > resize > resize > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0094 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(480, 70);
      logInfo(`step1 resize(480, 70): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, 25);
      logInfo(`step2 resize(0, 25): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(150, 0);
      logInfo(`step3 resize(150, 0): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('rD6V');
      logInfo(`step4 push("rD6V"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`resize>resize>resize>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>resize>resize>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>resize>resize>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>resize>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('rD6V');
      logInfo(`resize>resize>resize>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('rD6V');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0095
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0095
     * @tc.desc      FoldLayoutState call flow pop > applyMode > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0095 begin`);
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
      const step4: string = subject.resize(1440, 40);
      logInfo(`step4 resize(1440, 40): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`pop>applyMode>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0096
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0096
     * @tc.desc      FoldLayoutState call flow push > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0096 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('LSyiarJKOkGy');
      logInfo(`step1 push("LSyiarJKOkGy"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>pop>applyMode final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('LSyiarJKOkGy');
      logInfo(`push>pop>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('LSyiarJKOkGy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0097
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0097
     * @tc.desc      FoldLayoutState call flow push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0097 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('GXwk');
      logInfo(`step1 push("GXwk"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(2304, 171);
      logInfo(`step2 resize(2304, 171): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('jQoCKzFT');
      logInfo(`step3 push("jQoCKzFT"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('jQoCKzFT');
      logInfo(`push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('jQoCKzFT');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0097 end`);
    });
  });
}
