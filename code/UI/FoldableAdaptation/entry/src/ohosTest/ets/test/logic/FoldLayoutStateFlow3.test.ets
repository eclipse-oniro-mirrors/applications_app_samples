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
export default function foldLayoutStateFlow3Test(): void {
  describe('FoldLayoutStateFlow3Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0098
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0098
     * @tc.desc      FoldLayoutState call flow resize > resize > push > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0098 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, -6);
      logInfo(`step1 resize(0, -6): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(1277, 137);
      logInfo(`step2 resize(1277, 137): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('wTtoDGQ');
      logInfo(`step3 push("wTtoDGQ"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`resize>resize>push>applyMode>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>push>applyMode>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('wTtoDGQ');
      logInfo(`resize>resize>push>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('wTtoDGQ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0099
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0099
     * @tc.desc      FoldLayoutState call flow push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0099 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('zp');
      logInfo(`step1 push("zp"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(96, 0);
      logInfo(`step2 resize(96, 0): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('zp');
      logInfo(`push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('zp');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0100
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0100
     * @tc.desc      FoldLayoutState call flow resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0100 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(100, 0);
      logInfo(`step1 resize(100, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      logInfo(`resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0101
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0101
     * @tc.desc      FoldLayoutState call flow pop > resize > pop > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0101 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(0, 125);
      logInfo(`step2 resize(0, 125): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.push(' Hello World ');
      logInfo(`step4 push(" Hello World "): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('N9YsM');
      logInfo(`step5 push("N9YsM"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>resize>pop>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>resize>pop>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>resize>pop>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('N9YsM');
      logInfo(`pop>resize>pop>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('N9YsM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0102
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0102
     * @tc.desc      FoldLayoutState call flow applyMode > pop > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0102 begin`);
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
      const step4: string = subject.resize(3648, 0);
      logInfo(`step4 resize(3648, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`applyMode>pop>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`applyMode>pop>pop>resize final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0103
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0103
     * @tc.desc      FoldLayoutState call flow resize > applyMode > pop > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0103 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(2400, 165);
      logInfo(`step1 resize(2400, 165): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>applyMode>pop>pop>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0104
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0104
     * @tc.desc      FoldLayoutState call flow resize > push > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0104 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(10, 150);
      logInfo(`step1 resize(10, 150): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('zrixuUyU');
      logInfo(`step2 push("zrixuUyU"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('EB3x5Oew');
      logInfo(`step3 push("EB3x5Oew"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>push>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>push>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('EB3x5Oew');
      logInfo(`resize>push>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('EB3x5Oew');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0105
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0105
     * @tc.desc      FoldLayoutState call flow push > push > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0105 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('UsBf6');
      logInfo(`step1 push("UsBf6"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('l');
      logInfo(`step2 push("l"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`push>push>applyMode>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>applyMode>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>push>applyMode>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('l');
      logInfo(`push>push>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('l');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0106
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0106
     * @tc.desc      FoldLayoutState call flow resize > pop > applyMode > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0106 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(3168, 125);
      logInfo(`step1 resize(3168, 125): step1=${step1}`);
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
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`resize>pop>applyMode>pop>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0107
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0107
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0107 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('Y5EuigHue1');
      logInfo(`step2 push("Y5EuigHue1"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Y5EuigHue1');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Y5EuigHue1');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0108
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0108
     * @tc.desc      FoldLayoutState call flow push > applyMode > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0108 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('N');
      logInfo(`step1 push("N"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`push>applyMode>applyMode>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>applyMode>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>applyMode>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('N');
      logInfo(`push>applyMode>applyMode>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('N');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0109
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0109
     * @tc.desc      FoldLayoutState call flow push > pop > push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0109 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('VhQmnpFbrF');
      logInfo(`step1 push("VhQmnpFbrF"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.push('8T7');
      logInfo(`step3 push("8T7"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.resize(0, 14.95);
      logInfo(`step5 resize(0, 14.95): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>pop>push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>pop>push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>pop>push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('8T7');
      logInfo(`push>pop>push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('8T7');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0110
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0110
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0110 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('J');
      logInfo(`step2 push("J"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.push('sX8IIO6eY');
      logInfo(`step5 push("sX8IIO6eY"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>push>applyMode>applyMode>push f...: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>applyMode>applyMode>push f...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>applyMode>applyMode>push f...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sX8IIO6eY');
      logInfo(`applyMode>push>applyMode>applyMode>push f...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sX8IIO6eY');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0111
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0111
     * @tc.desc      FoldLayoutState call flow push > push > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0111 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('');
      logInfo(`step1 push(""): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('N');
      logInfo(`step2 push("N"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(672, -1);
      logInfo(`step3 resize(672, -1): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>push>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>push>resize>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push>resize>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('N');
      logInfo(`push>push>resize>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('N');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0112
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0112
     * @tc.desc      FoldLayoutState call flow applyMode > resize > push > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0112 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(1248, 74);
      logInfo(`step2 resize(1248, 74): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('SsA');
      logInfo(`step3 push("SsA"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`applyMode>resize>push>pop>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>resize>push>pop>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('SsA');
      logInfo(`applyMode>resize>push>pop>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('SsA');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0113
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0113
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0113 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push(' abc ');
      logInfo(`step2 push(" abc "): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`applyMode>push>applyMode>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`applyMode>push>applyMode>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' abc ');
      logInfo(`applyMode>push>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' abc ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0114
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0114
     * @tc.desc      FoldLayoutState call flow applyMode > push > resize > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0114 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('x ');
      logInfo(`step2 push("x "): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(2208, 60);
      logInfo(`step3 resize(2208, 60): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('xHello World');
      logInfo(`step4 push("xHello World"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('sGb');
      logInfo(`step5 push("sGb"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>push>resize>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>push>resize>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`applyMode>push>resize>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sGb');
      logInfo(`applyMode>push>resize>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sGb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0115
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0115
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0115 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('RuomdZQ75zH8');
      logInfo(`step1 push("RuomdZQ75zH8"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(1920, 0);
      logInfo(`step3 resize(1920, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`push>applyMode>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>applyMode>resize>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>applyMode>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('RuomdZQ75zH8');
      logInfo(`push>applyMode>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('RuomdZQ75zH8');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0116
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0116
     * @tc.desc      FoldLayoutState call flow pop > push > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0116 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('R');
      logInfo(`step2 push("R"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 88);
      logInfo(`step3 resize(0, 88): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`pop>push>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>push>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('R');
      logInfo(`pop>push>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('R');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0117
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0117
     * @tc.desc      FoldLayoutState call flow resize > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0117 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(864, 85);
      logInfo(`step1 resize(864, 85): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(3072, -26);
      logInfo(`step2 resize(3072, -26): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      logInfo(`resize>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0118
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0118
     * @tc.desc      FoldLayoutState call flow pop > pop > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0118 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.resize(-1918, 0);
      logInfo(`step3 resize(-1918, 0): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`pop>pop>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0119
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0119
     * @tc.desc      FoldLayoutState call flow push > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0119 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push(' ');
      logInfo(`step1 push(" "): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('CNNTXFFap');
      logInfo(`step2 push("CNNTXFFap"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(3168, 125);
      logInfo(`step3 resize(3168, 125): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CNNTXFFap');
      logInfo(`push>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CNNTXFFap');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0120
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0120
     * @tc.desc      FoldLayoutState call flow applyMode > resize > push > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0120 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, 10);
      logInfo(`step2 resize(0, 10): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('WBBuD');
      logInfo(`step3 push("WBBuD"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('UIsHfKGJMN');
      logInfo(`step5 push("UIsHfKGJMN"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>resize>push>applyMode>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>resize>push>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>resize>push>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('UIsHfKGJMN');
      logInfo(`applyMode>resize>push>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('UIsHfKGJMN');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0121
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0121
     * @tc.desc      FoldLayoutState call flow applyMode > pop > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0121 begin`);
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
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0122
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0122
     * @tc.desc      FoldLayoutState call flow push > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0122 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('K6BUwB');
      logInfo(`step1 push("K6BUwB"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('1Af');
      logInfo(`step2 push("1Af"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`push>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('1Af');
      logInfo(`push>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('1Af');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0123
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0123
     * @tc.desc      FoldLayoutState call flow applyMode > applyMode > push > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0123 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push(' 123 ');
      logInfo(`step3 push(" 123 "): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(150, 95);
      logInfo(`step4 resize(150, 95): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(0, 110);
      logInfo(`step5 resize(0, 110): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>applyMode>push>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>applyMode>push>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>applyMode>push>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' 123 ');
      logInfo(`applyMode>applyMode>push>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' 123 ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0124
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0124
     * @tc.desc      FoldLayoutState call flow resize > resize > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0124 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(3360, 0);
      logInfo(`step1 resize(3360, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(3168, 125);
      logInfo(`step2 resize(3168, 125): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(0, 125);
      logInfo(`step3 resize(0, 125): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`resize>resize>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0125
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0125
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0125 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('ClKjbpd');
      logInfo(`step1 push("ClKjbpd"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(360, 15);
      logInfo(`step3 resize(360, 15): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>applyMode>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>applyMode>resize>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ClKjbpd');
      logInfo(`push>applyMode>resize>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ClKjbpd');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0126
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0126
     * @tc.desc      FoldLayoutState call flow resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0126 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(672, -1);
      logInfo(`step1 resize(672, -1): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('N');
      logInfo(`step2 push("N"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('N');
      logInfo(`resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('N');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0127
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0127
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0127 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('FOjVMSWqIjQ0');
      logInfo(`step2 push("FOjVMSWqIjQ0"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('FOjVMSWqIjQ0');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('FOjVMSWqIjQ0');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0128
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0128
     * @tc.desc      FoldLayoutState call flow push > push > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0128 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('Wekqg0YAP');
      logInfo(`step1 push("Wekqg0YAP"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('KNq');
      logInfo(`step2 push("KNq"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.resize(0, 75);
      logInfo(`step4 resize(0, 75): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>push>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>push>pop>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>push>pop>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('KNq');
      logInfo(`push>push>pop>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('KNq');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0129
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0129
     * @tc.desc      FoldLayoutState call flow pop > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0129 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(0, 35);
      logInfo(`step2 resize(0, 35): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`pop>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0130
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0130
     * @tc.desc      FoldLayoutState call flow pop > resize > applyMode > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0130 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(360, 15);
      logInfo(`step2 resize(360, 15): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(2562, 83.1);
      logInfo(`step4 resize(2562, 83.1): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>resize>applyMode>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0131
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0131
     * @tc.desc      FoldLayoutState call flow pop > resize > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0131 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(1248, 0);
      logInfo(`step2 resize(1248, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('tHzc');
      logInfo(`step3 push("tHzc"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>resize>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>resize>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>resize>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>resize>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tHzc');
      logInfo(`pop>resize>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tHzc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0132
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0132
     * @tc.desc      FoldLayoutState call flow pop > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0132 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.resize(0, 129);
      logInfo(`step3 resize(0, 129): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`pop>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0133
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0133
     * @tc.desc      FoldLayoutState call flow resize > pop > pop > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0133 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(150, 95);
      logInfo(`step1 resize(150, 95): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.resize(150, 0);
      logInfo(`step5 resize(150, 0): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>pop>pop>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>pop>pop>pop>resize final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0134
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0134
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0134 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('Hello WorldHello World');
      logInfo(`step2 push("Hello WorldHello World"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Hello WorldHello World');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0135
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0135
     * @tc.desc      FoldLayoutState call flow push > resize > applyMode > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0135 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('tpDXECg1oDVa');
      logInfo(`step1 push("tpDXECg1oDVa"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(0, 160);
      logInfo(`step2 resize(0, 160): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('LSyiarJKOkGy');
      logInfo(`step4 push("LSyiarJKOkGy"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`push>resize>applyMode>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>applyMode>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>applyMode>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('LSyiarJKOkGy');
      logInfo(`push>resize>applyMode>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('LSyiarJKOkGy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0136
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0136
     * @tc.desc      FoldLayoutState call flow applyMode > pop > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0136 begin`);
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
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0137
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0137
     * @tc.desc      FoldLayoutState call flow push > resize > applyMode > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0137 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('rguyajgqo3wy');
      logInfo(`step1 push("rguyajgqo3wy"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(360, 15);
      logInfo(`step2 resize(360, 15): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(0, -51);
      logInfo(`step5 resize(0, -51): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>resize>applyMode>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>applyMode>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>applyMode>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('rguyajgqo3wy');
      logInfo(`push>resize>applyMode>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('rguyajgqo3wy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0138
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0138
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0138 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push(' abc ');
      logInfo(`step2 push(" abc "): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' abc ');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' abc ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0139
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0139
     * @tc.desc      FoldLayoutState call flow push > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0139 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('qSLy');
      logInfo(`step1 push("qSLy"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('dqt91');
      logInfo(`step2 push("dqt91"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`push>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dqt91');
      logInfo(`push>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dqt91');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0140
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0140
     * @tc.desc      FoldLayoutState call flow applyMode > push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0140 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('XD3RMuwT');
      logInfo(`step2 push("XD3RMuwT"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(3360, 120);
      logInfo(`step3 resize(3360, 120): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('QBy');
      logInfo(`step4 push("QBy"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`applyMode>push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QBy');
      logInfo(`applyMode>push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QBy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0141
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0141
     * @tc.desc      FoldLayoutState call flow resize > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0141 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(3072, -26);
      logInfo(`step1 resize(3072, -26): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('I9UN1cxnnrd');
      logInfo(`step2 push("I9UN1cxnnrd"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(-240, 88);
      logInfo(`step3 resize(-240, 88): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('I9UN1cxnnrd');
      logInfo(`resize>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('I9UN1cxnnrd');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0142
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0142
     * @tc.desc      FoldLayoutState call flow resize > pop > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0142 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(768, 0);
      logInfo(`step1 resize(768, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.resize(-240, 140);
      logInfo(`step3 resize(-240, 140): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(-1, 70);
      logInfo(`step4 resize(-1, 70): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>pop>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0143
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0143
     * @tc.desc      FoldLayoutState call flow resize > resize > push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0143 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 45);
      logInfo(`step1 resize(0, 45): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(-240, 0);
      logInfo(`step2 resize(-240, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('gp6swYZ');
      logInfo(`step3 push("gp6swYZ"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(2562, 95);
      logInfo(`step4 resize(2562, 95): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('RtNmV8fr7eoq');
      logInfo(`step5 push("RtNmV8fr7eoq"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>resize>push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>resize>push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('RtNmV8fr7eoq');
      logInfo(`resize>resize>push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('RtNmV8fr7eoq');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0144
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0144
     * @tc.desc      FoldLayoutState call flow push > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0144 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('dF');
      logInfo(`step1 push("dF"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(2400, 3);
      logInfo(`step2 resize(2400, 3): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 150);
      logInfo(`step3 resize(0, 150): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dF');
      logInfo(`push>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dF');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0145
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0145
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0145 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('Yef3X');
      logInfo(`step2 push("Yef3X"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yef3X');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yef3X');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0145 end`);
    });
  });
}
