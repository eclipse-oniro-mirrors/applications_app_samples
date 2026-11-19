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
export default function foldLayoutStateFlow15Test(): void {
  describe('FoldLayoutStateFlow15Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0661
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0661
     * @tc.desc      FoldLayoutState call flow pop > resize > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0661', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0661 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(0, 57.87);
      logInfo(`step2 resize(0, 57.87): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('K6BUwB');
      logInfo(`step3 push("K6BUwB"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(2304, 0);
      logInfo(`step4 resize(2304, 0): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>resize>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>resize>push>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>resize>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>resize>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('K6BUwB');
      logInfo(`pop>resize>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('K6BUwB');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0661 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0662
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0662
     * @tc.desc      FoldLayoutState call flow push > pop > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0662', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0662 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('F');
      logInfo(`step1 push("F"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.resize(0, 57.87);
      logInfo(`step3 resize(0, 57.87): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('YHJP3jG');
      logInfo(`step4 push("YHJP3jG"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>pop>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>pop>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>pop>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YHJP3jG');
      logInfo(`push>pop>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YHJP3jG');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0662 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0663
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0663
     * @tc.desc      FoldLayoutState call flow push > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0663', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0663 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('YHJP3jG');
      logInfo(`step1 push("YHJP3jG"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(3552, 0);
      logInfo(`step2 resize(3552, 0): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, -26);
      logInfo(`step3 resize(0, -26): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YHJP3jG');
      logInfo(`push>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YHJP3jG');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0663 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0664
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0664
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0664', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0664 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('R');
      logInfo(`step1 push("R"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 155);
      logInfo(`step3 resize(0, 155): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('4Q7Zrm0J4JM');
      logInfo(`step4 push("4Q7Zrm0J4JM"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(3552, 0);
      logInfo(`step5 resize(3552, 0): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>applyMode>resize>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>applyMode>resize>push>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>resize>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>applyMode>resize>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4Q7Zrm0J4JM');
      logInfo(`push>applyMode>resize>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4Q7Zrm0J4JM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0664 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0665
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0665
     * @tc.desc      FoldLayoutState call flow resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0665', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0665 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(2112, 25);
      logInfo(`step1 resize(2112, 25): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('rJ9AV30EEVk');
      logInfo(`step2 push("rJ9AV30EEVk"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('rJ9AV30EEVk');
      logInfo(`resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('rJ9AV30EEVk');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0665 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0666
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0666
     * @tc.desc      FoldLayoutState call flow push > push > applyMode > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0666', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0666 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('kBXEt17y5');
      logInfo(`step1 push("kBXEt17y5"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('zp');
      logInfo(`step2 push("zp"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('tWI');
      logInfo(`step4 push("tWI"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`push>push>applyMode>push>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>applyMode>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push>applyMode>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tWI');
      logInfo(`push>push>applyMode>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tWI');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0666 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0667
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0667
     * @tc.desc      FoldLayoutState call flow resize > push > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0667', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0667 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(288, 0);
      logInfo(`step1 resize(288, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('uyAR92H');
      logInfo(`step2 push("uyAR92H"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 25);
      logInfo(`step3 resize(0, 25): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>push>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>resize>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push>resize>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('uyAR92H');
      logInfo(`resize>push>resize>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('uyAR92H');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0667 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0668
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0668
     * @tc.desc      FoldLayoutState call flow pop > applyMode > resize > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0668', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0668 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(2304, 150);
      logInfo(`step3 resize(2304, 150): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(0, 160);
      logInfo(`step4 resize(0, 160): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`pop>applyMode>resize>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0668 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0669
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0669
     * @tc.desc      FoldLayoutState call flow push > pop > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0669', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0669 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push(' abc ');
      logInfo(`step1 push(" abc "): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.resize(96, 0);
      logInfo(`step3 resize(96, 0): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>pop>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>pop>resize>applyMode final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop>resize>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' abc ');
      logInfo(`push>pop>resize>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' abc ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0669 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0670
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0670
     * @tc.desc      FoldLayoutState call flow push > push > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0670', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0670 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('RyK3kaGb5JT8');
      logInfo(`step1 push("RyK3kaGb5JT8"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('dqt91');
      logInfo(`step2 push("dqt91"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 150);
      logInfo(`step3 resize(0, 150): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`push>push>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>push>resize>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>push>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dqt91');
      logInfo(`push>push>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dqt91');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0670 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0671
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0671
     * @tc.desc      FoldLayoutState call flow push > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0671', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0671 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('8T7');
      logInfo(`step1 push("8T7"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(-240, -26);
      logInfo(`step2 resize(-240, -26): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(3, 74);
      logInfo(`step3 resize(3, 74): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('8T7');
      logInfo(`push>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('8T7');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0671 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0672
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0672
     * @tc.desc      FoldLayoutState call flow push > pop > resize > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0672', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0672 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('FOjVMSWqIjQ0');
      logInfo(`step1 push("FOjVMSWqIjQ0"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.resize(480, 70);
      logInfo(`step3 resize(480, 70): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('lcBs');
      logInfo(`step4 push("lcBs"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(3840, 0);
      logInfo(`step5 resize(3840, 0): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>pop>resize>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>pop>resize>push>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>pop>resize>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>pop>resize>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('lcBs');
      logInfo(`push>pop>resize>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('lcBs');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0672 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0673
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0673
     * @tc.desc      FoldLayoutState call flow pop > resize > push > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0673', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0673 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(672, 170);
      logInfo(`step2 resize(672, 170): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('uZytFIypEi1j');
      logInfo(`step3 push("uZytFIypEi1j"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('PzXCY7UNxdB8');
      logInfo(`step4 push("PzXCY7UNxdB8"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>resize>push>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>resize>push>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>resize>push>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('PzXCY7UNxdB8');
      logInfo(`pop>resize>push>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('PzXCY7UNxdB8');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0673 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0674
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0674
     * @tc.desc      FoldLayoutState call flow pop > applyMode > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0674', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0674 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('uyAR92H');
      logInfo(`step3 push("uyAR92H"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>applyMode>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>applyMode>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>applyMode>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('uyAR92H');
      logInfo(`pop>applyMode>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('uyAR92H');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0674 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0675
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0675
     * @tc.desc      FoldLayoutState call flow pop > pop > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0675', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0675 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('  ');
      logInfo(`step3 push("  "): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>pop>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>pop>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>pop>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('  ');
      logInfo(`pop>pop>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('  ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0675 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0676
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0676
     * @tc.desc      FoldLayoutState call flow pop > resize > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0676', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0676 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(96, 0);
      logInfo(`step2 resize(96, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('Tlyklexgjl');
      logInfo(`step3 push("Tlyklexgjl"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(100, 0);
      logInfo(`step4 resize(100, 0): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>resize>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>resize>push>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>resize>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>resize>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Tlyklexgjl');
      logInfo(`pop>resize>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Tlyklexgjl');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0676 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0677
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0677
     * @tc.desc      FoldLayoutState call flow push > push > pop > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0677', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0677 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('ji260s');
      logInfo(`step1 push("ji260s"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('Ogz');
      logInfo(`step2 push("Ogz"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.push('ClKjbpd');
      logInfo(`step5 push("ClKjbpd"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>push>pop>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>pop>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push>pop>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ClKjbpd');
      logInfo(`push>push>pop>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ClKjbpd');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0677 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0678
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0678
     * @tc.desc      FoldLayoutState call flow resize > pop > resize > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0678', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0678 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(3072, -26);
      logInfo(`step1 resize(3072, -26): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.resize(0, 5);
      logInfo(`step3 resize(0, 5): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.resize(96, 85);
      logInfo(`step5 resize(96, 85): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>pop>resize>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0678 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0679
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0679
     * @tc.desc      FoldLayoutState call flow resize > resize > pop > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0679', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0679 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 30);
      logInfo(`step1 resize(0, 30): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(1344, 0);
      logInfo(`step2 resize(1344, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('c');
      logInfo(`step5 push("c"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`resize>resize>pop>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>resize>pop>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>resize>pop>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>pop>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('c');
      logInfo(`resize>resize>pop>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('c');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0679 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0680
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0680
     * @tc.desc      FoldLayoutState call flow resize > resize > applyMode > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0680', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0680 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 14.95);
      logInfo(`step1 resize(0, 14.95): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(3264, 90);
      logInfo(`step2 resize(3264, 90): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('x123');
      logInfo(`step4 push("x123"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('jgH8k');
      logInfo(`step5 push("jgH8k"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>resize>applyMode>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>applyMode>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>resize>applyMode>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('jgH8k');
      logInfo(`resize>resize>applyMode>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('jgH8k');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0680 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0681
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0681
     * @tc.desc      FoldLayoutState call flow applyMode > pop > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0681', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0681 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.resize(2112, 0);
      logInfo(`step3 resize(2112, 0): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('9njw0');
      logInfo(`step4 push("9njw0"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>pop>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`applyMode>pop>resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>pop>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>pop>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9njw0');
      logInfo(`applyMode>pop>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9njw0');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0681 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0682
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0682
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0682', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0682 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('rD6V');
      logInfo(`step2 push("rD6V"): step2=${step2}`);
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
      expect(subject.lastRoute).assertEqual('rD6V');
      logInfo(`applyMode>push>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('rD6V');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0682 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0683
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0683
     * @tc.desc      FoldLayoutState call flow push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0683', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0683 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('kBXEt17y5');
      logInfo(`step1 push("kBXEt17y5"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      logInfo(`push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('kBXEt17y5');
      logInfo(`push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('kBXEt17y5');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0683 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0684
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0684
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0684', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0684 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('Hello World');
      logInfo(`step2 push("Hello World"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`applyMode>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Hello World');
      logInfo(`applyMode>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Hello World');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0684 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0685
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0685
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0685', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0685 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('5lJ');
      logInfo(`step1 push("5lJ"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(360, 15);
      logInfo(`step3 resize(360, 15): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`push>applyMode>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>applyMode>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('5lJ');
      logInfo(`push>applyMode>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('5lJ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0685 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0686
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0686
     * @tc.desc      FoldLayoutState call flow applyMode > applyMode > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0686', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0686 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('xHello World');
      logInfo(`step3 push("xHello World"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('Ogz');
      logInfo(`step4 push("Ogz"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>applyMode>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>applyMode>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>applyMode>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Ogz');
      logInfo(`applyMode>applyMode>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Ogz');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0686 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0687
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0687
     * @tc.desc      FoldLayoutState call flow applyMode > pop > resize > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0687', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0687 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.resize(1080, 170);
      logInfo(`step3 resize(1080, 170): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('6');
      logInfo(`step5 push("6"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>pop>resize>applyMode>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>pop>resize>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>pop>resize>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('6');
      logInfo(`applyMode>pop>resize>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0687 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0688
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0688
     * @tc.desc      FoldLayoutState call flow pop > applyMode > applyMode > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0688', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0688 begin`);
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
      const step4: string = subject.resize(2, 0);
      logInfo(`step4 resize(2, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`pop>applyMode>applyMode>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>applyMode>applyMode>resize>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0688 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0689
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0689
     * @tc.desc      FoldLayoutState call flow push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0689', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0689 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('iFaP');
      logInfo(`step1 push("iFaP"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('iFaP');
      logInfo(`push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('iFaP');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0689 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0690
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0690
     * @tc.desc      FoldLayoutState call flow resize > pop > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0690', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0690 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 170);
      logInfo(`step1 resize(0, 170): step1=${step1}`);
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
      logInfo(`resize>pop>pop>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0690 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0691
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0691
     * @tc.desc      FoldLayoutState call flow resize > applyMode > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0691', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0691 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 74);
      logInfo(`step1 resize(0, 74): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('qSLy');
      logInfo(`step3 push("qSLy"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`resize>applyMode>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>applyMode>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qSLy');
      logInfo(`resize>applyMode>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qSLy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0691 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0692
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0692
     * @tc.desc      FoldLayoutState call flow pop > push > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0692', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0692 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('vlnTz');
      logInfo(`step2 push("vlnTz"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('90dKoy45Hf3u');
      logInfo(`step4 push("90dKoy45Hf3u"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>push>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('90dKoy45Hf3u');
      logInfo(`pop>push>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('90dKoy45Hf3u');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0692 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0693
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0693
     * @tc.desc      FoldLayoutState call flow push > resize > resize > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0693', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0693 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('R5CyIGe');
      logInfo(`step1 push("R5CyIGe"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(2688, 0);
      logInfo(`step2 resize(2688, 0): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(2688, 0);
      logInfo(`step3 resize(2688, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(0, 137);
      logInfo(`step4 resize(0, 137): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('N9YsM');
      logInfo(`step5 push("N9YsM"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>resize>resize>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>resize>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>resize>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('N9YsM');
      logInfo(`push>resize>resize>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('N9YsM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0693 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0694
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0694
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0694', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0694 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('EURv');
      logInfo(`step2 push("EURv"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('EURv');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('EURv');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0694 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0695
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0695
     * @tc.desc      FoldLayoutState call flow resize > push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0695', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0695 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 74);
      logInfo(`step1 resize(0, 74): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('abc_1');
      logInfo(`step2 push("abc_1"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(-1918, 25);
      logInfo(`step3 resize(-1918, 25): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('VEJ2W');
      logInfo(`step4 push("VEJ2W"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('VEJ2W');
      logInfo(`resize>push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('VEJ2W');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0695 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0696
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0696
     * @tc.desc      FoldLayoutState call flow pop > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0696', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0696 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('Yef3X');
      logInfo(`step2 push("Yef3X"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      logInfo(`pop>push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`pop>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yef3X');
      logInfo(`pop>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yef3X');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0696 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0697
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0697
     * @tc.desc      FoldLayoutState call flow applyMode > resize > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0697', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0697 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(1728, 25);
      logInfo(`step2 resize(1728, 25): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`applyMode>resize>pop>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0697 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0698
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0698
     * @tc.desc      FoldLayoutState call flow resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0698', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0698 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(192, 0);
      logInfo(`step1 resize(192, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('123');
      logInfo(`step2 push("123"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('123');
      logInfo(`resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('123');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0698 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0699
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0699
     * @tc.desc      FoldLayoutState call flow resize > applyMode > resize > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0699', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0699 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(2496, 20);
      logInfo(`step1 resize(2496, 20): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(0, 95);
      logInfo(`step3 resize(0, 95): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(2784, 0);
      logInfo(`step4 resize(2784, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('SsA');
      logInfo(`step5 push("SsA"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`resize>applyMode>resize>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>applyMode>resize>resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>applyMode>resize>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>applyMode>resize>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('SsA');
      logInfo(`resize>applyMode>resize>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('SsA');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0699 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0700
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0700
     * @tc.desc      FoldLayoutState call flow push > resize > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0700 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('oH3I6lc6');
      logInfo(`step1 push("oH3I6lc6"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(1536, 125);
      logInfo(`step2 resize(1536, 125): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('zrixuUyU');
      logInfo(`step3 push("zrixuUyU"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>resize>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('zrixuUyU');
      logInfo(`push>resize>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('zrixuUyU');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0700 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0701
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0701
     * @tc.desc      FoldLayoutState call flow pop > pop > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0701', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0701 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('jgH8k');
      logInfo(`step3 push("jgH8k"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('9DG9');
      logInfo(`step4 push("9DG9"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>pop>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>pop>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>pop>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9DG9');
      logInfo(`pop>pop>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9DG9');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0701 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0702
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0702
     * @tc.desc      FoldLayoutState call flow push > resize > resize > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0702', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0702 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('8MSq17COqw');
      logInfo(`step1 push("8MSq17COqw"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(3648, 55);
      logInfo(`step2 resize(3648, 55): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(1440, 170);
      logInfo(`step3 resize(1440, 170): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('qxHlmS');
      logInfo(`step4 push("qxHlmS"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`push>resize>resize>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>resize>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize>resize>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qxHlmS');
      logInfo(`push>resize>resize>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qxHlmS');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0702 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0703
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0703
     * @tc.desc      FoldLayoutState call flow push > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0703', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0703 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('sGb');
      logInfo(`step1 push("sGb"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.push('iRJm14qh130');
      logInfo(`step3 push("iRJm14qh130"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`push>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('iRJm14qh130');
      logInfo(`push>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('iRJm14qh130');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0703 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0704
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0704
     * @tc.desc      FoldLayoutState call flow resize > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0704', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0704 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, -42);
      logInfo(`step1 resize(0, -42): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(150, 0);
      logInfo(`step2 resize(150, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('QWl');
      logInfo(`step3 push("QWl"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`resize>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QWl');
      logInfo(`resize>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QWl');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0704 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0705
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0705
     * @tc.desc      FoldLayoutState call flow pop > resize > push > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0705', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0705 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(0, 175);
      logInfo(`step2 resize(0, 175): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('QuD8OSFzUc');
      logInfo(`step3 push("QuD8OSFzUc"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`pop>resize>push>pop>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>resize>push>pop>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QuD8OSFzUc');
      logInfo(`pop>resize>push>pop>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QuD8OSFzUc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0705 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0706
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0706
     * @tc.desc      FoldLayoutState call flow resize > pop > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0706', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0706 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(288, 25);
      logInfo(`step1 resize(288, 25): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('sGb');
      logInfo(`step3 push("sGb"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('vlnTz');
      logInfo(`step4 push("vlnTz"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>pop>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>pop>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('vlnTz');
      logInfo(`resize>pop>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('vlnTz');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0706 end`);
    });
  });
}
