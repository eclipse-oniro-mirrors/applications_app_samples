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
export default function foldLayoutStateFlow9Test(): void {
  describe('FoldLayoutStateFlow9Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0379
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0379
     * @tc.desc      FoldLayoutState call flow applyMode > push > resize > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0379 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('5lJ');
      logInfo(`step2 push("5lJ"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(960, 110);
      logInfo(`step3 resize(960, 110): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('oH3I6lc6');
      logInfo(`step4 push("oH3I6lc6"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('pop');
      logInfo(`applyMode>push>resize>push>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>push>resize>push>pop final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>resize>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('oH3I6lc6');
      logInfo(`applyMode>push>resize>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('oH3I6lc6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0379 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0380
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0380
     * @tc.desc      FoldLayoutState call flow applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0380 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('NsFMQIb');
      logInfo(`step2 push("NsFMQIb"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('NsFMQIb');
      logInfo(`applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('NsFMQIb');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0380 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0381
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0381
     * @tc.desc      FoldLayoutState call flow pop > push > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0381 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('  ');
      logInfo(`step2 push("  "): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('HDWLlwbDkiF');
      logInfo(`step3 push("HDWLlwbDkiF"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(0, 26.32);
      logInfo(`step4 resize(0, 26.32): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`pop>push>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>push>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('HDWLlwbDkiF');
      logInfo(`pop>push>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('HDWLlwbDkiF');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0381 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0382
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0382
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0382 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('wTtoDGQ');
      logInfo(`step1 push("wTtoDGQ"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(2, 26.32);
      logInfo(`step3 resize(2, 26.32): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(1536, -1);
      logInfo(`step4 resize(1536, -1): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`push>applyMode>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>applyMode>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('wTtoDGQ');
      logInfo(`push>applyMode>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('wTtoDGQ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0382 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0383
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0383
     * @tc.desc      FoldLayoutState call flow push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0383 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push(' ');
      logInfo(`step1 push(" "): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.push('KBshc');
      logInfo(`step2 push("KBshc"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      logInfo(`push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('KBshc');
      logInfo(`push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('KBshc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0383 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0384
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0384
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0384 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('Yt2U6');
      logInfo(`step2 push("Yt2U6"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(2976, 55);
      logInfo(`step4 resize(2976, 55): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`applyMode>push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Yt2U6');
      logInfo(`applyMode>push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Yt2U6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0384 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0385
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0385
     * @tc.desc      FoldLayoutState call flow push > pop > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0385 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('tHzc');
      logInfo(`step1 push("tHzc"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.push('Hello WorldHello World');
      logInfo(`step3 push("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`push>pop>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>pop>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>pop>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Hello WorldHello World');
      logInfo(`push>pop>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0385 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0386
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0386
     * @tc.desc      FoldLayoutState call flow resize > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0386 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 137);
      logInfo(`step1 resize(0, 137): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('KBshc');
      logInfo(`step3 push("KBshc"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('KBshc');
      logInfo(`resize>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('KBshc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0386 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0387
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0387
     * @tc.desc      FoldLayoutState call flow applyMode > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0387 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('Hello World_1');
      logInfo(`step2 push("Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('tpDXECg1oDVa');
      logInfo(`step3 push("tpDXECg1oDVa"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`applyMode>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('tpDXECg1oDVa');
      logInfo(`applyMode>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('tpDXECg1oDVa');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0387 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0388
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0388
     * @tc.desc      FoldLayoutState call flow resize > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0388 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1824, 0);
      logInfo(`step1 resize(1824, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('');
      logInfo(`step2 push(""): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('dCj4QjbZ');
      logInfo(`step3 push("dCj4QjbZ"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`resize>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dCj4QjbZ');
      logInfo(`resize>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dCj4QjbZ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0388 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0389
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0389
     * @tc.desc      FoldLayoutState call flow pop > push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0389 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('xIX8');
      logInfo(`step2 push("xIX8"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(150, 0);
      logInfo(`step4 resize(150, 0): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>push>applyMode>resize final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('xIX8');
      logInfo(`pop>push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('xIX8');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0389 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0390
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0390
     * @tc.desc      FoldLayoutState call flow push > pop > applyMode > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0390 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('abcabc');
      logInfo(`step1 push("abcabc"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('popAndNotifyLater');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.push('YHJP3jG');
      logInfo(`step4 push("YHJP3jG"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`push>pop>applyMode>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`push>pop>applyMode>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>pop>applyMode>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('YHJP3jG');
      logInfo(`push>pop>applyMode>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('YHJP3jG');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0390 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0391
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0391
     * @tc.desc      FoldLayoutState call flow resize > pop > push > applyMode > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0391 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, -26);
      logInfo(`step1 resize(0, -26): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('ji260s');
      logInfo(`step3 push("ji260s"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.pop();
      logInfo(`step5 pop(): step5=${step5}`);
      expect(step5).assertEqual('popAndNotifyLater');
      logInfo(`resize>pop>push>applyMode>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>push>applyMode>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ji260s');
      logInfo(`resize>pop>push>applyMode>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ji260s');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0391 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0392
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0392
     * @tc.desc      FoldLayoutState call flow pop > push > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0392 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('N9S');
      logInfo(`step2 push("N9S"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('W73nlYj0Yns');
      logInfo(`step3 push("W73nlYj0Yns"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>push>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('W73nlYj0Yns');
      logInfo(`pop>push>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('W73nlYj0Yns');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0392 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0393
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0393
     * @tc.desc      FoldLayoutState call flow applyMode > applyMode > applyMode > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0393 begin`);
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
      const step4: string = subject.resize(0, 40);
      logInfo(`step4 resize(0, 40): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push(' abc ');
      logInfo(`step5 push(" abc "): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>applyMode>applyMode>resize>push...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>applyMode>applyMode>resize>push...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>applyMode>applyMode>resize>push...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual(' abc ');
      logInfo(`applyMode>applyMode>applyMode>resize>push...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual(' abc ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0393 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0394
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0394
     * @tc.desc      FoldLayoutState call flow applyMode > push > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0394 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('i');
      logInfo(`step2 push("i"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('CI9bhwEXM');
      logInfo(`step3 push("CI9bhwEXM"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>push>push>applyMode final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>push>applyMode final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>push>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CI9bhwEXM');
      logInfo(`applyMode>push>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CI9bhwEXM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0394 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0395
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0395
     * @tc.desc      FoldLayoutState call flow pop > pop > pop > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0395 begin`);
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
      const step4: string = subject.push('ClKjbpd');
      logInfo(`step4 push("ClKjbpd"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.resize(0, 110);
      logInfo(`step5 resize(0, 110): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>pop>pop>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>pop>pop>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>pop>pop>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ClKjbpd');
      logInfo(`pop>pop>pop>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ClKjbpd');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0395 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0396
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0396
     * @tc.desc      FoldLayoutState call flow resize > applyMode > push > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0396 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(-1, 1);
      logInfo(`step1 resize(-1, 1): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('sTCHk');
      logInfo(`step3 push("sTCHk"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.resize(0, 45);
      logInfo(`step4 resize(0, 45): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(3648, -1);
      logInfo(`step5 resize(3648, -1): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>applyMode>push>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>applyMode>push>resize>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>applyMode>push>resize>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('sTCHk');
      logInfo(`resize>applyMode>push>resize>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('sTCHk');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0396 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0397
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0397
     * @tc.desc      FoldLayoutState call flow pop > pop > applyMode > resize > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0397 begin`);
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
      const step4: string = subject.resize(0, 115);
      logInfo(`step4 resize(0, 115): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(1248, 74);
      logInfo(`step5 resize(1248, 74): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>pop>applyMode>resize>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0397 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0398
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0398
     * @tc.desc      FoldLayoutState call flow resize > push > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0398 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1632, 35);
      logInfo(`step1 resize(1632, 35): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('HGlC7');
      logInfo(`step2 push("HGlC7"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.push('U3mw2rw');
      logInfo(`step4 push("U3mw2rw"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`resize>push>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('U3mw2rw');
      logInfo(`resize>push>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('U3mw2rw');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0398 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0399
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0399
     * @tc.desc      FoldLayoutState call flow applyMode > push > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0399 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('CI9bhwEXM');
      logInfo(`step2 push("CI9bhwEXM"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      logInfo(`applyMode>push>pop>applyMode final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`applyMode>push>pop>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('CI9bhwEXM');
      logInfo(`applyMode>push>pop>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('CI9bhwEXM');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0399 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0400
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0400
     * @tc.desc      FoldLayoutState call flow applyMode > pop > applyMode > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0400 begin`);
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
      const step4: string = subject.push('uyAR92H');
      logInfo(`step4 push("uyAR92H"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`applyMode>pop>applyMode>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>pop>applyMode>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>pop>applyMode>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('uyAR92H');
      logInfo(`applyMode>pop>applyMode>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('uyAR92H');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0400 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0401
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0401
     * @tc.desc      FoldLayoutState call flow resize > applyMode > push > applyMode > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0401 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(3168, 40);
      logInfo(`step1 resize(3168, 40): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('PoDMfGp');
      logInfo(`step3 push("PoDMfGp"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>applyMode>push>applyMode>applyMode...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>applyMode>push>applyMode>applyMode...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>applyMode>push>applyMode>applyMode...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('PoDMfGp');
      logInfo(`resize>applyMode>push>applyMode>applyMode...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('PoDMfGp');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0401 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0402
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0402
     * @tc.desc      FoldLayoutState call flow resize > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0402 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(-1, 70);
      logInfo(`step1 resize(-1, 70): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('aa');
      logInfo(`step2 push("aa"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('nKriyYENMO');
      logInfo(`step3 push("nKriyYENMO"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('nKriyYENMO');
      logInfo(`resize>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('nKriyYENMO');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0402 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0403
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0403
     * @tc.desc      FoldLayoutState call flow applyMode > pop > pop > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0403 begin`);
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
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0403 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0404
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0404
     * @tc.desc      FoldLayoutState call flow resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0404 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(0, 160);
      logInfo(`step1 resize(0, 160): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('nFUhCnCae');
      logInfo(`step2 push("nFUhCnCae"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('nFUhCnCae');
      logInfo(`resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('nFUhCnCae');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0404 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0405
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0405
     * @tc.desc      FoldLayoutState call flow resize > applyMode > applyMode > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0405 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1080, 170);
      logInfo(`step1 resize(1080, 170): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.push('lcBs');
      logInfo(`step5 push("lcBs"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>applyMode>applyMode>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>applyMode>applyMode>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>applyMode>applyMode>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('lcBs');
      logInfo(`resize>applyMode>applyMode>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('lcBs');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0405 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0406
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0406
     * @tc.desc      FoldLayoutState call flow resize > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0406 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(1824, 5);
      logInfo(`step1 resize(1824, 5): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('R');
      logInfo(`step2 push("R"): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('HGlC7');
      logInfo(`step3 push("HGlC7"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`resize>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`resize>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('HGlC7');
      logInfo(`resize>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('HGlC7');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0406 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0407
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0407
     * @tc.desc      FoldLayoutState call flow applyMode > push > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0407 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('Y5EuigHue1');
      logInfo(`step2 push("Y5EuigHue1"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      logInfo(`applyMode>push>pop final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`applyMode>push>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('Y5EuigHue1');
      logInfo(`applyMode>push>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('Y5EuigHue1');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0407 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0408
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0408
     * @tc.desc      FoldLayoutState call flow pop > push > resize > pop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0408 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('GXwk');
      logInfo(`step2 push("GXwk"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 70);
      logInfo(`step3 resize(0, 70): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      logInfo(`pop>push>resize>pop final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>push>resize>pop final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('GXwk');
      logInfo(`pop>push>resize>pop final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('GXwk');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0408 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0409
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0409
     * @tc.desc      FoldLayoutState call flow resize > pop > pop > resize > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0409 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(2614, 0);
      logInfo(`step1 resize(2614, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.resize(2208, 0);
      logInfo(`step4 resize(2208, 0): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('h0qFiCDbj');
      logInfo(`step5 push("h0qFiCDbj"): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`resize>pop>pop>resize>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>pop>pop>resize>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`resize>pop>pop>resize>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>pop>pop>resize>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('h0qFiCDbj');
      logInfo(`resize>pop>pop>resize>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('h0qFiCDbj');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0409 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0410
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0410
     * @tc.desc      FoldLayoutState call flow pop > resize > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0410 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.resize(1056, 0);
      logInfo(`step2 resize(1056, 0): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.push('dF');
      logInfo(`step4 push("dF"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      logInfo(`pop>resize>pop>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`pop>resize>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>resize>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>resize>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('dF');
      logInfo(`pop>resize>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('dF');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0410 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0411
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0411
     * @tc.desc      FoldLayoutState call flow applyMode > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0411 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('nKriyYENMO');
      logInfo(`step2 push("nKriyYENMO"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('2MtjEnIZ1MzG');
      logInfo(`step3 push("2MtjEnIZ1MzG"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`applyMode>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`applyMode>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('2MtjEnIZ1MzG');
      logInfo(`applyMode>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('2MtjEnIZ1MzG');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0411 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0412
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0412
     * @tc.desc      FoldLayoutState call flow pop > push > push > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0412 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('x123');
      logInfo(`step2 push("x123"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('OCQv0K2gECA');
      logInfo(`step3 push("OCQv0K2gECA"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.push('QuD8OSFzUc');
      logInfo(`step4 push("QuD8OSFzUc"): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.resize(672, -1);
      logInfo(`step5 resize(672, -1): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`pop>push>push>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`pop>push>push>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(3);
      logInfo(`pop>push>push>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('QuD8OSFzUc');
      logInfo(`pop>push>push>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('QuD8OSFzUc');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0412 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0413
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0413
     * @tc.desc      FoldLayoutState call flow resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0413 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(2400, 3);
      logInfo(`step1 resize(2400, 3): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      logInfo(`resize>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('md');
      logInfo(`resize>applyMode final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0413 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0414
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0414
     * @tc.desc      FoldLayoutState call flow push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0414 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('   ');
      logInfo(`step1 push("   "): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.applyMode();
      logInfo(`step2 applyMode(): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.resize(0, 90);
      logInfo(`step3 resize(0, 90): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      logInfo(`push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('   ');
      logInfo(`push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('   ');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0414 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0415
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0415
     * @tc.desc      FoldLayoutState call flow resize > resize > push > pop > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0415 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(480, 70);
      logInfo(`step1 resize(480, 70): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, 15);
      logInfo(`step2 resize(0, 15): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.push('yK');
      logInfo(`step3 push("yK"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('popAndNotifyLater');
      const step5: string = subject.resize(0, -26);
      logInfo(`step5 resize(0, -26): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>resize>push>pop>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>resize>push>pop>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('yK');
      logInfo(`resize>resize>push>pop>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('yK');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0415 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0416
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0416
     * @tc.desc      FoldLayoutState call flow push > resize > pop > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0416 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.push('1Af');
      logInfo(`step1 push("1Af"): step1=${step1}`);
      expect(step1).assertEqual('Split');
      const step2: string = subject.resize(0, 50);
      logInfo(`step2 resize(0, 50): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.push('ZQqNgSwkhzgH');
      logInfo(`step4 push("ZQqNgSwkhzgH"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.push('qSLy');
      logInfo(`step5 push("qSLy"): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`push>resize>pop>push>push final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`push>resize>pop>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`push>resize>pop>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('qSLy');
      logInfo(`push>resize>pop>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('qSLy');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0416 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0417
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0417
     * @tc.desc      FoldLayoutState call flow applyMode > resize > pop > push > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0417 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.resize(0, 125);
      logInfo(`step2 resize(0, 125): step2=${step2}`);
      expect(step2).assertEqual('Stack');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('pop');
      const step4: string = subject.push('ZuapEZV');
      logInfo(`step4 push("ZuapEZV"): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(0, 55);
      logInfo(`step5 resize(0, 55): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`applyMode>resize>pop>push>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`applyMode>resize>pop>push>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>resize>pop>push>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('ZuapEZV');
      logInfo(`applyMode>resize>pop>push>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('ZuapEZV');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0417 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0418
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0418
     * @tc.desc      FoldLayoutState call flow pop > pop > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0418 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('aa');
      logInfo(`step3 push("aa"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`pop>pop>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>pop>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`pop>pop>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('aa');
      logInfo(`pop>pop>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('aa');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0418 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0419
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0419
     * @tc.desc      FoldLayoutState call flow resize > pop > push > applyMode > resize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0419 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(288, 74);
      logInfo(`step1 resize(288, 74): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.pop();
      logInfo(`step2 pop(): step2=${step2}`);
      expect(step2).assertEqual('pop');
      const step3: string = subject.push('pD4L2s');
      logInfo(`step3 push("pD4L2s"): step3=${step3}`);
      expect(step3).assertEqual('Stack');
      const step4: string = subject.applyMode();
      logInfo(`step4 applyMode(): step4=${step4}`);
      expect(step4).assertEqual('Stack');
      const step5: string = subject.resize(0, -6);
      logInfo(`step5 resize(0, -6): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>pop>push>applyMode>resize final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('sm');
      logInfo(`resize>pop>push>applyMode>resize final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`resize>pop>push>applyMode>resize final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('pD4L2s');
      logInfo(`resize>pop>push>applyMode>resize final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('pD4L2s');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0419 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0420
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0420
     * @tc.desc      FoldLayoutState call flow resize > push > pop > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0420 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(100, 0);
      logInfo(`step1 resize(100, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('aa');
      logInfo(`step2 push("aa"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.pop();
      logInfo(`step4 pop(): step4=${step4}`);
      expect(step4).assertEqual('pop');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Stack');
      logInfo(`resize>push>pop>pop>applyMode final: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`resize>push>pop>pop>applyMode final: subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(2);
      logInfo(`resize>push>pop>pop>applyMode final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('aa');
      logInfo(`resize>push>pop>pop>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('aa');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0420 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0421
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0421
     * @tc.desc      FoldLayoutState call flow resize > push > pop > push > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0421 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.resize(672, 0);
      logInfo(`step1 resize(672, 0): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('sX8IIO6eY');
      logInfo(`step2 push("sX8IIO6eY"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.pop();
      logInfo(`step3 pop(): step3=${step3}`);
      expect(step3).assertEqual('popAndNotifyLater');
      const step4: string = subject.push('oH3I6lc6');
      logInfo(`step4 push("oH3I6lc6"): step4=${step4}`);
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
      expect(subject.lastRoute).assertEqual('oH3I6lc6');
      logInfo(`resize>push>pop>push>applyMode final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('oH3I6lc6');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0421 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0422
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0422
     * @tc.desc      FoldLayoutState call flow applyMode > push > applyMode > resize > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0422 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.applyMode();
      logInfo(`step1 applyMode(): step1=${step1}`);
      expect(step1).assertEqual('Stack');
      const step2: string = subject.push('gHL');
      logInfo(`step2 push("gHL"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.applyMode();
      logInfo(`step3 applyMode(): step3=${step3}`);
      expect(step3).assertEqual('Split');
      const step4: string = subject.resize(150, 0);
      logInfo(`step4 resize(150, 0): step4=${step4}`);
      expect(step4).assertEqual('Split');
      const step5: string = subject.applyMode();
      logInfo(`step5 applyMode(): step5=${step5}`);
      expect(step5).assertEqual('Split');
      logInfo(`applyMode>push>applyMode>resize>applyMode...: subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('lg');
      logInfo(`applyMode>push>applyMode>resize>applyMode...: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`applyMode>push>applyMode>resize>applyMode...: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(1);
      logInfo(`applyMode>push>applyMode>resize>applyMode...: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('gHL');
      logInfo(`applyMode>push>applyMode>resize>applyMode...: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('gHL');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0422 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0423
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0423
     * @tc.desc      FoldLayoutState call flow applyMode > pop > pop > applyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0423 begin`);
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
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0423 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_FLOW_0424
     * @tc.name      FoldableAdaptation_FoldLayoutStateFlow_0424
     * @tc.desc      FoldLayoutState call flow pop > push > push keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutStateFlow_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0424 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      const step1: string = subject.pop();
      logInfo(`step1 pop(): step1=${step1}`);
      expect(step1).assertEqual('pop');
      const step2: string = subject.push('4O');
      logInfo(`step2 push("4O"): step2=${step2}`);
      expect(step2).assertEqual('Split');
      const step3: string = subject.push('OY6Mf8kO');
      logInfo(`step3 push("OY6Mf8kO"): step3=${step3}`);
      expect(step3).assertEqual('Split');
      logInfo(`pop>push>push final: subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Split');
      logInfo(`pop>push>push final: subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(2);
      logInfo(`pop>push>push final: subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('OY6Mf8kO');
      logInfo(`pop>push>push final: subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('OY6Mf8kO');
      logInfo(`${BUNDLE}FoldLayoutStateFlow_0424 end`);
    });
  });
}
