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
export default function foldLayoutStateFlow12Test(): void {
  describe('FoldLayoutStateFlow12Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0519
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0519
     * @tc.desc      FoldLayoutState call flow push > resize > resize > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0519 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('90dKoy45Hf3u');
      logInfo(`step1 push("90dKoy45Hf3u"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(720, -1);
      logInfo(`step2 resize(720, -1): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(150, 0);
      logInfo(`step3 resize(150, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(1728, 25);
      logInfo(`step4 resize(1728, 25): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('9DG9');
      logInfo(`step5 push("9DG9"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>resize>resize>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>resize>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>resize>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9DG9');
      logInfo(`push>resize>resize>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9DG9');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0519 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0520
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0520
     * @tc.desc      FoldLayoutState call flow pop > resize > pop > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0520 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(360, 15);
      logInfo(`step2 resize(360, 15): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('abc');
      logInfo(`step5 push("abc"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>resize>pop>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>resize>pop>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>resize>pop>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('abc');
      logInfo(`pop>resize>pop>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('abc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0520 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0521
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0521
     * @tc.desc      FoldLayoutState call flow push > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0521 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('abcabc');
      logInfo(`step1 push("abcabc"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.resize(333.66, 0);
      logInfo(`step3 resize(333.66, 0): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>pop>resize final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('abcabc');
      logInfo(`push>pop>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('abcabc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0521 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0522
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0522
     * @tc.desc      FoldLayoutState call flow push > pop > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0522 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('wIpNBSRvHA5K');
      logInfo(`step1 push("wIpNBSRvHA5K"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.resize(2976, 55);
      logInfo(`step4 resize(2976, 55): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>pop>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>pop>pop>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('wIpNBSRvHA5K');
      logInfo(`push>pop>pop>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('wIpNBSRvHA5K');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0522 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0523
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0523
     * @tc.desc      FoldLayoutState call flow push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0523 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('dF');
      logInfo(`step1 push("dF"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      logInfo(`push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dF');
      logInfo(`push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dF');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0523 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0524
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0524
     * @tc.desc      FoldLayoutState call flow resize > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0524 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 70);
      logInfo(`step1 resize(0, 70): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('U3mw2rw');
      logInfo(`step2 push("U3mw2rw"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('gHL');
      logInfo(`step3 push("gHL"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('gHL');
      logInfo(`resize>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('gHL');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0524 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0525
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0525
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0525 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('3eGu6S2yD');
      logInfo(`step1 push("3eGu6S2yD"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('Yef3X');
      logInfo(`step2 push("Yef3X"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yef3X');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yef3X');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0525 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0526
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0526
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0526 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('YS9Ja');
      logInfo(`step2 push("YS9Ja"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YS9Ja');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YS9Ja');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0526 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0527
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0527
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0527 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('RryHPn0');
      logInfo(`step2 push("RryHPn0"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('RryHPn0');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('RryHPn0');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0527 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0528
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0528
     * @tc.desc      FoldLayoutState call flow resize > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0528 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(192, 100);
      logInfo(`step1 resize(192, 100): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('VhQmnpFbrF');
      logInfo(`step3 push("VhQmnpFbrF"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('VhQmnpFbrF');
      logInfo(`resize>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('VhQmnpFbrF');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0528 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0529
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0529
     * @tc.desc      FoldLayoutState call flow push > pop > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0529 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('10UttR');
      logInfo(`step1 push("10UttR"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>pop>applyMode>applyMode final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop>applyMode>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('10UttR');
      logInfo(`push>pop>applyMode>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('10UttR');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0529 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0530
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0530
     * @tc.desc      FoldLayoutState call flow resize > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0530 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, -6);
      logInfo(`step1 resize(0, -6): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('5jHJZ');
      logInfo(`step3 push("5jHJZ"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>applyMode>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('5jHJZ');
      logInfo(`resize>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('5jHJZ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0530 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0531
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0531
     * @tc.desc      FoldLayoutState call flow push > applyMode > push > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0531 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('nKriyYENMO');
      logInfo(`step1 push("nKriyYENMO"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('  ');
      logInfo(`step3 push("  "): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('4Q7Zrm0J4JM');
      logInfo(`step5 push("4Q7Zrm0J4JM"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>applyMode>push>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>push>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>applyMode>push>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4Q7Zrm0J4JM');
      logInfo(`push>applyMode>push>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4Q7Zrm0J4JM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0531 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0532
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0532
     * @tc.desc      FoldLayoutState call flow applyMode > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0532 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('pzsVfTEd2');
      logInfo(`step3 push("pzsVfTEd2"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`applyMode>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('pzsVfTEd2');
      logInfo(`applyMode>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('pzsVfTEd2');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0532 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0533
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0533
     * @tc.desc      FoldLayoutState call flow resize > resize > pop > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0533 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1080, 170);
      logInfo(`step1 resize(1080, 170): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(2614, 0);
      logInfo(`step2 resize(2614, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`resize>resize>pop>pop>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>resize>pop>pop>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0533 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0534
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0534
     * @tc.desc      FoldLayoutState call flow resize > push > resize > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0534 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1652.93, 0);
      logInfo(`step1 resize(1652.93, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('Y');
      logInfo(`step2 push("Y"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(2208, 140);
      logInfo(`step3 resize(2208, 140): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>push>resize>applyMode>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>resize>applyMode>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push>resize>applyMode>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Y');
      logInfo(`resize>push>resize>applyMode>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Y');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0534 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0535
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0535
     * @tc.desc      FoldLayoutState call flow resize > applyMode > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0535 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1056, 0);
      logInfo(`step1 resize(1056, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.resize(720, -1);
      logInfo(`step4 resize(720, -1): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>applyMode>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0535 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0536
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0536
     * @tc.desc      FoldLayoutState call flow applyMode > push > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0536 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('sb');
      logInfo(`step2 push("sb"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('1Af');
      logInfo(`step3 push("1Af"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('CNNTXFFap');
      logInfo(`step4 push("CNNTXFFap"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>push>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`applyMode>push>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CNNTXFFap');
      logInfo(`applyMode>push>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CNNTXFFap');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0536 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0537
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0537
     * @tc.desc      FoldLayoutState call flow push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0537 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('Y04PixjyIvmu');
      logInfo(`step1 push("Y04PixjyIvmu"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Y04PixjyIvmu');
      logInfo(`push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Y04PixjyIvmu');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0537 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0538
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0538
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0538 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('6');
      logInfo(`step2 push("6"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('6');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0538 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0539
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0539
     * @tc.desc      FoldLayoutState call flow resize > pop > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0539 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(96, 85);
      logInfo(`step1 resize(96, 85): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('QBy');
      logInfo(`step3 push("QBy"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`resize>pop>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QBy');
      logInfo(`resize>pop>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QBy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0539 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0540
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0540
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0540 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('jQoCKzFT');
      logInfo(`step1 push("jQoCKzFT"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(150, 0);
      logInfo(`step3 resize(150, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(2304, 171);
      logInfo(`step4 resize(2304, 171): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>applyMode>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>applyMode>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('jQoCKzFT');
      logInfo(`push>applyMode>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('jQoCKzFT');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0540 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0541
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0541
     * @tc.desc      FoldLayoutState call flow applyMode > applyMode > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0541 begin`);
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
      const step4: string = subject.push('1Af');
      logInfo(`step4 push("1Af"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>applyMode>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>applyMode>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>applyMode>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('1Af');
      logInfo(`applyMode>applyMode>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('1Af');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0541 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0542
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0542
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0542 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('9njw0');
      logInfo(`step1 push("9njw0"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 180);
      logInfo(`step3 resize(0, 180): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>applyMode>resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>applyMode>resize>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9njw0');
      logInfo(`push>applyMode>resize>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9njw0');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0542 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0543
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0543
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0543 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('6W9');
      logInfo(`step2 push("6W9"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('6W9');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('6W9');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0543 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0544
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0544
     * @tc.desc      FoldLayoutState call flow resize > resize > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0544 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 137);
      logInfo(`step1 resize(0, 137): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(2562, 95);
      logInfo(`step2 resize(2562, 95): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('sb');
      logInfo(`step4 push("sb"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>resize>applyMode>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sb');
      logInfo(`resize>resize>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0544 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0545
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0545
     * @tc.desc      FoldLayoutState call flow resize > resize > resize > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0545 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(10, 130);
      logInfo(`step1 resize(10, 130): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(96, 85);
      logInfo(`step2 resize(96, 85): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(3744, 5);
      logInfo(`step3 resize(3744, 5): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`resize>resize>resize>applyMode>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('md');
      logInfo(`resize>resize>resize>applyMode>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0545 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0546
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0546
     * @tc.desc      FoldLayoutState call flow push > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0546 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push(' 123 ');
      logInfo(`step1 push(" 123 "): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`push>applyMode>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' 123 ');
      logInfo(`push>applyMode>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' 123 ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0546 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0547
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0547
     * @tc.desc      FoldLayoutState call flow push > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0547 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('4');
      logInfo(`step1 push("4"): step1=${step1}`);
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
      expect(subject.lastRoute).assertEqual('4');
      logInfo(`push>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0547 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0548
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0548
     * @tc.desc      FoldLayoutState call flow applyMode > push > push > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0548 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('8MSq17COqw');
      logInfo(`step2 push("8MSq17COqw"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('YS9Ja');
      logInfo(`step3 push("YS9Ja"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('zrixuUyU');
      logInfo(`step5 push("zrixuUyU"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>push>push>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>push>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>push>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('zrixuUyU');
      logInfo(`applyMode>push>push>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('zrixuUyU');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0548 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0549
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0549
     * @tc.desc      FoldLayoutState call flow pop > resize > push > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0549 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(1536, 125);
      logInfo(`step2 resize(1536, 125): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('sX8IIO6eY');
      logInfo(`step3 push("sX8IIO6eY"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`pop>resize>push>applyMode>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>resize>push>applyMode>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sX8IIO6eY');
      logInfo(`pop>resize>push>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sX8IIO6eY');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0549 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0550
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0550
     * @tc.desc      FoldLayoutState call flow resize > pop > applyMode > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0550 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(360, 0);
      logInfo(`step1 resize(360, 0): step1=${step1}`);
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
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>pop>applyMode>applyMode>applyMode ...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>pop>applyMode>applyMode>applyMode ...: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0550 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0551
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0551
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0551 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('HEwnWVlBQqim');
      logInfo(`step2 push("HEwnWVlBQqim"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('HEwnWVlBQqim');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('HEwnWVlBQqim');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0551 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0552
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0552
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0552 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('nFUhCnCae');
      logInfo(`step2 push("nFUhCnCae"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('nFUhCnCae');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('nFUhCnCae');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0552 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0553
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0553
     * @tc.desc      FoldLayoutState call flow applyMode > resize > resize > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0553 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(150, 95);
      logInfo(`step2 resize(150, 95): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(3456, 95);
      logInfo(`step3 resize(3456, 95): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('rD6V');
      logInfo(`step4 push("rD6V"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`applyMode>resize>resize>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>resize>resize>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('rD6V');
      logInfo(`applyMode>resize>resize>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('rD6V');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0553 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0554
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0554
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0554 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('jgH8k');
      logInfo(`step2 push("jgH8k"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('KNq');
      logInfo(`step4 push("KNq"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>push>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('KNq');
      logInfo(`applyMode>push>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('KNq');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0554 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0555
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0555
     * @tc.desc      FoldLayoutState call flow applyMode > pop > resize > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0555 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.resize(0, -1);
      logInfo(`step3 resize(0, -1): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('Yt2U6');
      logInfo(`step4 push("Yt2U6"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>pop>resize>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>pop>resize>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>pop>resize>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yt2U6');
      logInfo(`applyMode>pop>resize>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yt2U6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0555 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0556
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0556
     * @tc.desc      FoldLayoutState call flow push > resize > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0556 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('qSLy');
      logInfo(`step1 push("qSLy"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(0, -42);
      logInfo(`step2 resize(0, -42): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(0, 171);
      logInfo(`step3 resize(0, 171): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`push>resize>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qSLy');
      logInfo(`push>resize>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qSLy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0556 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0557
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0557
     * @tc.desc      FoldLayoutState call flow push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0557 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('A6XSmSNXcSK');
      logInfo(`step1 push("A6XSmSNXcSK"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      logInfo(`push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('A6XSmSNXcSK');
      logInfo(`push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('A6XSmSNXcSK');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0557 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0558
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0558
     * @tc.desc      FoldLayoutState call flow pop > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0558 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('sTCHk');
      logInfo(`step3 push("sTCHk"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`pop>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sTCHk');
      logInfo(`pop>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sTCHk');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0558 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0559
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0559
     * @tc.desc      FoldLayoutState call flow push > resize > applyMode > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0559 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('wIpNBSRvHA5K');
      logInfo(`step1 push("wIpNBSRvHA5K"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(0, 65);
      logInfo(`step2 resize(0, 65): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('123123');
      logInfo(`step4 push("123123"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(1440, 0);
      logInfo(`step5 resize(1440, 0): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>resize>applyMode>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>resize>applyMode>push>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>resize>applyMode>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>applyMode>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('123123');
      logInfo(`push>resize>applyMode>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('123123');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0559 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0560
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0560
     * @tc.desc      FoldLayoutState call flow push > push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0560 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('LSyiarJKOkGy');
      logInfo(`step1 push("LSyiarJKOkGy"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('dqt91');
      logInfo(`step2 push("dqt91"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(288, 185);
      logInfo(`step3 resize(288, 185): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('9QogxUHO');
      logInfo(`step4 push("9QogxUHO"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`push>push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9QogxUHO');
      logInfo(`push>push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9QogxUHO');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0560 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0561
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0561
     * @tc.desc      FoldLayoutState call flow applyMode > applyMode > resize > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0561 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(192, 0);
      logInfo(`step3 resize(192, 0): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('F');
      logInfo(`step4 push("F"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>applyMode>resize>push>applyMode...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`applyMode>applyMode>resize>push>applyMode...: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>applyMode>resize>push>applyMode...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>applyMode>resize>push>applyMode...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('F');
      logInfo(`applyMode>applyMode>resize>push>applyMode...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('F');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0561 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0562
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0562
     * @tc.desc      FoldLayoutState call flow resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0562 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(150, 0);
      logInfo(`step1 resize(150, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('zp');
      logInfo(`step2 push("zp"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('zp');
      logInfo(`resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('zp');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0562 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0563
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0563
     * @tc.desc      FoldLayoutState call flow applyMode > push > push > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0563 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('ClKjbpd');
      logInfo(`step2 push("ClKjbpd"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('DMGUNUr5X6');
      logInfo(`step3 push("DMGUNUr5X6"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>push>push>applyMode>applyMode f...: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>push>applyMode>applyMode f...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>push>applyMode>applyMode f...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('DMGUNUr5X6');
      logInfo(`applyMode>push>push>applyMode>applyMode f...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('DMGUNUr5X6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0563 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0564
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0564
     * @tc.desc      FoldLayoutState call flow applyMode > push > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0564 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('LSyiarJKOkGy');
      logInfo(`step2 push("LSyiarJKOkGy"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('pzsVfTEd2');
      logInfo(`step3 push("pzsVfTEd2"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`applyMode>push>push>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('pzsVfTEd2');
      logInfo(`applyMode>push>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('pzsVfTEd2');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0564 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0565
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0565
     * @tc.desc      FoldLayoutState call flow applyMode > pop > pop > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0565 begin`);
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
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('qSLy');
      logInfo(`step5 push("qSLy"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>pop>pop>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>pop>pop>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>pop>pop>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qSLy');
      logInfo(`applyMode>pop>pop>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qSLy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0565 end`);
    });
  });
}
