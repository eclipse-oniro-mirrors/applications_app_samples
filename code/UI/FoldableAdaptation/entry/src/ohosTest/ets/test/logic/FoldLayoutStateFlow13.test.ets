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
export default function foldLayoutStateFlow13Test(): void {
  describe('FoldLayoutStateFlow13Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0566
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0566
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0566 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('xa');
      logInfo(`step2 push("xa"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xa');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xa');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0566 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0567
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0567
     * @tc.desc      FoldLayoutState call flow resize > push > push > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0567 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(100, 0);
      logInfo(`step1 resize(100, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('RyK3kaGb5JT8');
      logInfo(`step2 push("RyK3kaGb5JT8"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('SjtxzP');
      logInfo(`step3 push("SjtxzP"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('Z4vDoy5');
      logInfo(`step4 push("Z4vDoy5"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.push('hOgzRi6');
      logInfo(`step5 push("hOgzRi6"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`resize>push>push>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push>push>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>push>push>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(4);
      logInfo(`resize>push>push>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('hOgzRi6');
      logInfo(`resize>push>push>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('hOgzRi6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0567 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0568
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0568
     * @tc.desc      FoldLayoutState call flow push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0568 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('iRJm14qh130');
      logInfo(`step1 push("iRJm14qh130"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      logInfo(`push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('iRJm14qh130');
      logInfo(`push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('iRJm14qh130');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0568 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0569
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0569
     * @tc.desc      FoldLayoutState call flow push > push > applyMode > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0569 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('RtNmV8fr7eoq');
      logInfo(`step1 push("RtNmV8fr7eoq"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('sb');
      logInfo(`step2 push("sb"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>push>applyMode>applyMode>applyMode f...: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>applyMode>applyMode>applyMode f...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push>applyMode>applyMode>applyMode f...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sb');
      logInfo(`push>push>applyMode>applyMode>applyMode f...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0569 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0570
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0570
     * @tc.desc      FoldLayoutState call flow applyMode > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0570 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('0O2ydtygn');
      logInfo(`step2 push("0O2ydtygn"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      logInfo(`applyMode>push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`applyMode>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('0O2ydtygn');
      logInfo(`applyMode>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('0O2ydtygn');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0570 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0571
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0571
     * @tc.desc      FoldLayoutState call flow pop > applyMode > pop > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0571 begin`);
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
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0571 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0572
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0572
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0572 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('TfYsI');
      logInfo(`step2 push("TfYsI"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.resize(-1, 1);
      logInfo(`step5 resize(-1, 1): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>push>applyMode>applyMode>resize...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>push>applyMode>applyMode>resize...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>applyMode>applyMode>resize...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('TfYsI');
      logInfo(`applyMode>push>applyMode>applyMode>resize...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('TfYsI');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0572 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0573
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0573
     * @tc.desc      FoldLayoutState call flow resize > push > applyMode > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0573 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(2562, 0);
      logInfo(`step1 resize(2562, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('YHJP3jG');
      logInfo(`step2 push("YHJP3jG"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      const step5: string = subject.resize(1920, 0);
      logInfo(`step5 resize(1920, 0): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>push>applyMode>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push>applyMode>pop>resize final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`resize>push>applyMode>pop>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YHJP3jG');
      logInfo(`resize>push>applyMode>pop>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YHJP3jG');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0573 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0574
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0574
     * @tc.desc      FoldLayoutState call flow push > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0574 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('');
      logInfo(`step1 push(""): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('xHello World');
      logInfo(`step2 push("xHello World"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      logInfo(`push>push>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xHello World');
      logInfo(`push>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xHello World');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0574 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0575
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0575
     * @tc.desc      FoldLayoutState call flow resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0575 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1277, 130);
      logInfo(`step1 resize(1277, 130): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('4GfSqEf6wuR');
      logInfo(`step2 push("4GfSqEf6wuR"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('4GfSqEf6wuR');
      logInfo(`resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('4GfSqEf6wuR');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0575 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0576
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0576
     * @tc.desc      FoldLayoutState call flow pop > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0576 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('lcBs');
      logInfo(`step2 push("lcBs"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('3eGu6S2yD');
      logInfo(`step3 push("3eGu6S2yD"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`pop>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('3eGu6S2yD');
      logInfo(`pop>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('3eGu6S2yD');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0576 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0577
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0577
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0577 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('ww8f84g');
      logInfo(`step2 push("ww8f84g"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ww8f84g');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ww8f84g');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0577 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0578
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0578
     * @tc.desc      FoldLayoutState call flow applyMode > push > push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0578 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('abc');
      logInfo(`step2 push("abc"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('pzsVfTEd2');
      logInfo(`step3 push("pzsVfTEd2"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(96, 180);
      logInfo(`step4 resize(96, 180): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('yK');
      logInfo(`step5 push("yK"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>push>push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>push>push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`applyMode>push>push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('yK');
      logInfo(`applyMode>push>push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('yK');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0578 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0579
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0579
     * @tc.desc      FoldLayoutState call flow push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0579 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('F');
      logInfo(`step1 push("F"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(1080, 170);
      logInfo(`step2 resize(1080, 170): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('F');
      logInfo(`push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('F');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0579 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0580
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0580
     * @tc.desc      FoldLayoutState call flow resize > push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0580 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1344, 0);
      logInfo(`step1 resize(1344, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('mQAHnIEj');
      logInfo(`step2 push("mQAHnIEj"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(2688, 0);
      logInfo(`step4 resize(2688, 0): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`resize>push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push>applyMode>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mQAHnIEj');
      logInfo(`resize>push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mQAHnIEj');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0580 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0581
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0581
     * @tc.desc      FoldLayoutState call flow push > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0581 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('l');
      logInfo(`step1 push("l"): step1=${step1}`);
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
      expect(subject.lastRoute).assertEqual('l');
      logInfo(`push>pop>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('l');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0581 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0582
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0582
     * @tc.desc      FoldLayoutState call flow applyMode > resize > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0582 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, -26);
      logInfo(`step2 resize(0, -26): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('tpDXECg1oDVa');
      logInfo(`step3 push("tpDXECg1oDVa"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('  ');
      logInfo(`step4 push("  "): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`applyMode>resize>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>resize>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>resize>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('  ');
      logInfo(`applyMode>resize>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('  ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0582 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0583
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0583
     * @tc.desc      FoldLayoutState call flow pop > applyMode > applyMode > applyMode > applyMode keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0583 begin`);
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
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0583 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0584
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0584
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0584 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('UPawgHO');
      logInfo(`step1 push("UPawgHO"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('i');
      logInfo(`step2 push("i"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('i');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('i');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0584 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0585
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0585
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0585 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('CI9bhwEXM');
      logInfo(`step2 push("CI9bhwEXM"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CI9bhwEXM');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CI9bhwEXM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0585 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0586
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0586
     * @tc.desc      FoldLayoutState call flow push > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0586 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('123123');
      logInfo(`step1 push("123123"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('sTCHk');
      logInfo(`step2 push("sTCHk"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('SjtxzP');
      logInfo(`step3 push("SjtxzP"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`push>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`push>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('SjtxzP');
      logInfo(`push>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('SjtxzP');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0586 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0587
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0587
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0587 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('ZQqNgSwkhzgH');
      logInfo(`step2 push("ZQqNgSwkhzgH"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ZQqNgSwkhzgH');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ZQqNgSwkhzgH');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0587 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0588
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0588
     * @tc.desc      FoldLayoutState call flow applyMode > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0588 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('XD3RMuwT');
      logInfo(`step2 push("XD3RMuwT"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(3744, 5);
      logInfo(`step3 resize(3744, 5): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`applyMode>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('md');
      logInfo(`applyMode>push>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('XD3RMuwT');
      logInfo(`applyMode>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('XD3RMuwT');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0588 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0589
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0589
     * @tc.desc      FoldLayoutState call flow resize > push > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0589 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(3093, 0);
      logInfo(`step1 resize(3093, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('9njw0');
      logInfo(`step2 push("9njw0"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`resize>push>applyMode>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push>applyMode>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>push>applyMode>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push>applyMode>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9njw0');
      logInfo(`resize>push>applyMode>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9njw0');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0589 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0590
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0590
     * @tc.desc      FoldLayoutState call flow resize > resize > resize > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0590 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(-240, 75);
      logInfo(`step1 resize(-240, 75): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, -51);
      logInfo(`step2 resize(0, -51): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(1080, 170);
      logInfo(`step3 resize(1080, 170): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('x ');
      logInfo(`step5 push("x "): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>resize>resize>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>resize>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>resize>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('x ');
      logInfo(`resize>resize>resize>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('x ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0590 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0591
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0591
     * @tc.desc      FoldLayoutState call flow push > applyMode > applyMode > applyMode > applyMode keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0591 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('c');
      logInfo(`step1 push("c"): step1=${step1}`);
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
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>applyMode>applyMode>applyMode>applyM...: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>applyMode>applyMode>applyMode>applyM...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>applyMode>applyMode>applyM...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('c');
      logInfo(`push>applyMode>applyMode>applyMode>applyM...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('c');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0591 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0592
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0592
     * @tc.desc      FoldLayoutState call flow pop > resize > applyMode > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0592 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(1824, 0);
      logInfo(`step2 resize(1824, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(1277, 0);
      logInfo(`step4 resize(1277, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('9Wc2oBe2nx');
      logInfo(`step5 push("9Wc2oBe2nx"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`pop>resize>applyMode>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>resize>applyMode>resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>resize>applyMode>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>resize>applyMode>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9Wc2oBe2nx');
      logInfo(`pop>resize>applyMode>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9Wc2oBe2nx');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0592 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0593
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0593
     * @tc.desc      FoldLayoutState call flow resize > applyMode > push > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0593 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 60);
      logInfo(`step1 resize(0, 60): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('YS9Ja');
      logInfo(`step3 push("YS9Ja"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('90dKoy45Hf3u');
      logInfo(`step4 push("90dKoy45Hf3u"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>applyMode>push>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>applyMode>push>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>applyMode>push>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('90dKoy45Hf3u');
      logInfo(`resize>applyMode>push>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('90dKoy45Hf3u');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0593 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0594
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0594
     * @tc.desc      FoldLayoutState call flow push > pop > applyMode > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0594 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('VyysdnpG2WsO');
      logInfo(`step1 push("VyysdnpG2WsO"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(3093, 35);
      logInfo(`step4 resize(3093, 35): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(10, 150);
      logInfo(`step5 resize(10, 150): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>pop>applyMode>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>pop>applyMode>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('VyysdnpG2WsO');
      logInfo(`push>pop>applyMode>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('VyysdnpG2WsO');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0594 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0595
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0595
     * @tc.desc      FoldLayoutState call flow pop > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0595 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('OCQv0K2gECA');
      logInfo(`step2 push("OCQv0K2gECA"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('123');
      logInfo(`step3 push("123"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`pop>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('123');
      logInfo(`pop>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('123');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0595 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0596
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0596
     * @tc.desc      FoldLayoutState call flow resize > resize > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0596 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(10, 0);
      logInfo(`step1 resize(10, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(-1918, 0);
      logInfo(`step2 resize(-1918, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.push('Wekqg0YAP');
      logInfo(`step4 push("Wekqg0YAP"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>resize>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Wekqg0YAP');
      logInfo(`resize>resize>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Wekqg0YAP');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0596 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0597
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0597
     * @tc.desc      FoldLayoutState call flow resize > push > applyMode > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0597 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 87);
      logInfo(`step1 resize(0, 87): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('OCQv0K2gECA');
      logInfo(`step2 push("OCQv0K2gECA"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(1824, 25);
      logInfo(`step4 resize(1824, 25): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('9Wc2oBe2nx');
      logInfo(`step5 push("9Wc2oBe2nx"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>push>applyMode>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>applyMode>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>push>applyMode>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('9Wc2oBe2nx');
      logInfo(`resize>push>applyMode>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('9Wc2oBe2nx');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0597 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0598
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0598
     * @tc.desc      FoldLayoutState call flow applyMode > push > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0598 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('wI');
      logInfo(`step2 push("wI"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('9QogxUHO');
      logInfo(`step3 push("9QogxUHO"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('sGb');
      logInfo(`step4 push("sGb"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>push>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`applyMode>push>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sGb');
      logInfo(`applyMode>push>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sGb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0598 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0599
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0599
     * @tc.desc      FoldLayoutState call flow resize > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0599 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(100, 200);
      logInfo(`step1 resize(100, 200): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(1824, 0);
      logInfo(`step2 resize(1824, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('SsA');
      logInfo(`step3 push("SsA"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`resize>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('SsA');
      logInfo(`resize>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('SsA');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0599 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0600
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0600
     * @tc.desc      FoldLayoutState call flow pop > push > push > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0600 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('9Wc2oBe2nx');
      logInfo(`step2 push("9Wc2oBe2nx"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('a_1');
      logInfo(`step3 push("a_1"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('a_1');
      logInfo(`step5 push("a_1"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`pop>push>push>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>push>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>push>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('a_1');
      logInfo(`pop>push>push>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('a_1');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0600 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0601
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0601
     * @tc.desc      FoldLayoutState call flow push > push > applyMode > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0601 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('h0qFiCDbj');
      logInfo(`step1 push("h0qFiCDbj"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('x ');
      logInfo(`step2 push("x "): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('EURv');
      logInfo(`step4 push("EURv"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.resize(1277, 155);
      logInfo(`step5 resize(1277, 155): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>push>applyMode>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>push>applyMode>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`push>push>applyMode>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('EURv');
      logInfo(`push>push>applyMode>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('EURv');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0601 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0602
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0602
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0602 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('8T7');
      logInfo(`step1 push("8T7"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('UPawgHO');
      logInfo(`step2 push("UPawgHO"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('UPawgHO');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('UPawgHO');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0602 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0603
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0603
     * @tc.desc      FoldLayoutState call flow push > resize > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0603 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('ww8f84g');
      logInfo(`step1 push("ww8f84g"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(288, 25);
      logInfo(`step2 resize(288, 25): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('ji260s');
      logInfo(`step3 push("ji260s"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>resize>push>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ji260s');
      logInfo(`push>resize>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ji260s');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0603 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0604
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0604
     * @tc.desc      FoldLayoutState call flow push > resize > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0604 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('qeEC2oAAaz');
      logInfo(`step1 push("qeEC2oAAaz"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(-1, 70);
      logInfo(`step2 resize(-1, 70): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.resize(480, 70);
      logInfo(`step4 resize(480, 70): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>resize>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>pop>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qeEC2oAAaz');
      logInfo(`push>resize>pop>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qeEC2oAAaz');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0604 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0605
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0605
     * @tc.desc      FoldLayoutState call flow pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0605 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('sb');
      logInfo(`step2 push("sb"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sb');
      logInfo(`pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0605 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0606
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0606
     * @tc.desc      FoldLayoutState call flow pop > pop > applyMode > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0606 begin`);
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
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0606 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0607
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0607
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0607 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('XD3RMuwT');
      logInfo(`step2 push("XD3RMuwT"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('90dKoy45Hf3u');
      logInfo(`step4 push("90dKoy45Hf3u"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`applyMode>push>applyMode>push>pop final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>applyMode>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>applyMode>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('90dKoy45Hf3u');
      logInfo(`applyMode>push>applyMode>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('90dKoy45Hf3u');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0607 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0608
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0608
     * @tc.desc      FoldLayoutState call flow push > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0608 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('HGlC7');
      logInfo(`step1 push("HGlC7"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(1536, -1);
      logInfo(`step2 resize(1536, -1): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('hOgzRi6');
      logInfo(`step3 push("hOgzRi6"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('hOgzRi6');
      logInfo(`push>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('hOgzRi6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0608 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0609
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0609
     * @tc.desc      FoldLayoutState call flow push > resize > resize > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0609 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('wIpNBSRvHA5K');
      logInfo(`step1 push("wIpNBSRvHA5K"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(2304, 0);
      logInfo(`step2 resize(2304, 0): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(3456, 0);
      logInfo(`step3 resize(3456, 0): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('ZQqNgSwkhzgH');
      logInfo(`step4 push("ZQqNgSwkhzgH"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.push('mQAHnIEj');
      logInfo(`step5 push("mQAHnIEj"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>resize>resize>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`push>resize>resize>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>resize>resize>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`push>resize>resize>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('mQAHnIEj');
      logInfo(`push>resize>resize>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('mQAHnIEj');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0609 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0610
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0610
     * @tc.desc      FoldLayoutState call flow pop > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0610 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('xIX8');
      logInfo(`step3 push("xIX8"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`pop>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xIX8');
      logInfo(`pop>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xIX8');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0610 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0611
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0611
     * @tc.desc      FoldLayoutState call flow applyMode > resize > resize > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0611 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(2976, 1);
      logInfo(`step2 resize(2976, 1): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.resize(192, 0);
      logInfo(`step3 resize(192, 0): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`applyMode>resize>resize>pop>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`applyMode>resize>resize>pop>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0611 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0612
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0612
     * @tc.desc      FoldLayoutState call flow push > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0612 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('N9S');
      logInfo(`step1 push("N9S"): step1=${step1}`);
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
      expect(subject.lastRoute).assertEqual('N9S');
      logInfo(`push>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('N9S');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0612 end`);
    });
  });
}
