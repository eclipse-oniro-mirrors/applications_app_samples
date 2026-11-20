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

import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { BUNDLE, loggedCase as it } from '../support/BoundedCase';
import { localize } from '../../../main/ets/common/LocaleStrings';
import {
  FieldChoice, FieldDecision, FieldTriple, MergePlan, MergeResult, applyMerge, conflictKeys,
  planMerge, previewLines, resolveAll, tripleStats
} from '../../../main/ets/learning/payload/MergePlan';

/** 造一个三方字段。 */
function tripleOf(key: string, label: string, base: string, local: string,
  remote: string): FieldTriple {
  const triple: FieldTriple = new FieldTriple(key, label);
  triple.base = base;
  triple.local = local;
  triple.remote = remote;
  return triple;
}

/** 一组覆盖各种冲突形态的字段。 */
function mixedTriples(): FieldTriple[] {
  return [
    tripleOf('title', '标题', '原标题', '新标题', '原标题'),
    tripleOf('body', '正文', '原正文', '原正文', '对端正文'),
    tripleOf('tags', '标签', 'a,b', 'a,b,c', 'a,b,c'),
    tripleOf('pinned', '置顶', 'false', 'true', 'false'),
    tripleOf('group', '分组', '默认', '工作', '生活')
  ];
}

export default function mergeRecoveryMatrixCasesTest(): void {
  describe('FieldTripleCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0100
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0001
     * @tc.desc      Verify triple defaults are empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_FieldTripleCases_0001', 0, (): void => {
      const triple: FieldTriple = new FieldTriple('title', '标题');
      loggedExpect(triple.base, 'MergeRecoveryMatrixCases.test.ets:A0001', BUNDLE + '_FieldTripleCases_0001').assertEqual('');
      loggedExpect(triple.local, 'MergeRecoveryMatrixCases.test.ets:A0002', BUNDLE + '_FieldTripleCases_0001').assertEqual('');
      loggedExpect(triple.remote, 'MergeRecoveryMatrixCases.test.ets:A0003', BUNDLE + '_FieldTripleCases_0001').assertEqual('');
      loggedExpect(triple.localChanged(), 'MergeRecoveryMatrixCases.test.ets:A0004', BUNDLE + '_FieldTripleCases_0001').assertFalse();
      loggedExpect(triple.remoteChanged(), 'MergeRecoveryMatrixCases.test.ets:A0005', BUNDLE + '_FieldTripleCases_0001').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0200
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0002
     * @tc.desc      Verify local change is detected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0002', 0, (): void => {
      const triple: FieldTriple = tripleOf('title', '标题', 'a', 'b', 'a');
      loggedExpect(triple.localChanged(), 'MergeRecoveryMatrixCases.test.ets:A0006', BUNDLE + '_FieldTripleCases_0002').assertTrue();
      loggedExpect(triple.remoteChanged(), 'MergeRecoveryMatrixCases.test.ets:A0007', BUNDLE + '_FieldTripleCases_0002').assertFalse();
      loggedExpect(triple.conflict(), 'MergeRecoveryMatrixCases.test.ets:A0008', BUNDLE + '_FieldTripleCases_0002').assertFalse();
      loggedExpect(triple.automaticChoice(), 'MergeRecoveryMatrixCases.test.ets:A0009', BUNDLE + '_FieldTripleCases_0002').assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0300
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0003
     * @tc.desc      Verify remote change is detected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0003', 0, (): void => {
      const triple: FieldTriple = tripleOf('body', '正文', 'a', 'a', 'b');
      loggedExpect(triple.localChanged(), 'MergeRecoveryMatrixCases.test.ets:A0010', BUNDLE + '_FieldTripleCases_0003').assertFalse();
      loggedExpect(triple.remoteChanged(), 'MergeRecoveryMatrixCases.test.ets:A0011', BUNDLE + '_FieldTripleCases_0003').assertTrue();
      loggedExpect(triple.automaticChoice(), 'MergeRecoveryMatrixCases.test.ets:A0012', BUNDLE + '_FieldTripleCases_0003').assertEqual(FieldChoice.REMOTE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0400
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0004
     * @tc.desc      Verify untouched field falls back to base
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0004', 0, (): void => {
      const triple: FieldTriple = tripleOf('pinned', '置顶', 'false', 'false', 'false');
      loggedExpect(triple.localChanged(), 'MergeRecoveryMatrixCases.test.ets:A0013', BUNDLE + '_FieldTripleCases_0004').assertFalse();
      loggedExpect(triple.remoteChanged(), 'MergeRecoveryMatrixCases.test.ets:A0014', BUNDLE + '_FieldTripleCases_0004').assertFalse();
      loggedExpect(triple.conflict(), 'MergeRecoveryMatrixCases.test.ets:A0015', BUNDLE + '_FieldTripleCases_0004').assertFalse();
      loggedExpect(triple.converged(), 'MergeRecoveryMatrixCases.test.ets:A0016', BUNDLE + '_FieldTripleCases_0004').assertFalse();
      loggedExpect(triple.automaticChoice(), 'MergeRecoveryMatrixCases.test.ets:A0017', BUNDLE + '_FieldTripleCases_0004').assertEqual(FieldChoice.BASE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0500
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0005
     * @tc.desc      Verify converged change needs no manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0005', 0, (): void => {
      const triple: FieldTriple = tripleOf('tags', '标签', 'a', 'a,b', 'a,b');
      loggedExpect(triple.converged(), 'MergeRecoveryMatrixCases.test.ets:A0018', BUNDLE + '_FieldTripleCases_0005').assertTrue();
      loggedExpect(triple.conflict(), 'MergeRecoveryMatrixCases.test.ets:A0019', BUNDLE + '_FieldTripleCases_0005').assertFalse();
      loggedExpect(triple.automaticChoice(), 'MergeRecoveryMatrixCases.test.ets:A0020', BUNDLE + '_FieldTripleCases_0005').assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0600
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0006
     * @tc.desc      Verify true conflict needs manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0006', 0, (): void => {
      const triple: FieldTriple = tripleOf('group', '分组', '默认', '工作', '生活');
      loggedExpect(triple.conflict(), 'MergeRecoveryMatrixCases.test.ets:A0021', BUNDLE + '_FieldTripleCases_0006').assertTrue();
      loggedExpect(triple.converged(), 'MergeRecoveryMatrixCases.test.ets:A0022', BUNDLE + '_FieldTripleCases_0006').assertFalse();
      loggedExpect(triple.automaticChoice(), 'MergeRecoveryMatrixCases.test.ets:A0023', BUNDLE + '_FieldTripleCases_0006').assertEqual(FieldChoice.MANUAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0700
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0007
     * @tc.desc      Verify conflict and converged are exclusive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0007', 0, (): void => {
      const conflict: FieldTriple = tripleOf('k', 'k', 'a', 'b', 'c');
      const converged: FieldTriple = tripleOf('k', 'k', 'a', 'b', 'b');
      loggedExpect(conflict.conflict() && conflict.converged(), 'MergeRecoveryMatrixCases.test.ets:A0024', BUNDLE + '_FieldTripleCases_0007').assertFalse();
      loggedExpect(converged.conflict() && converged.converged(), 'MergeRecoveryMatrixCases.test.ets:A0025', BUNDLE + '_FieldTripleCases_0007').assertFalse();
      loggedExpect(conflict.conflict(), 'MergeRecoveryMatrixCases.test.ets:A0026', BUNDLE + '_FieldTripleCases_0007').assertTrue();
      loggedExpect(converged.converged(), 'MergeRecoveryMatrixCases.test.ets:A0027', BUNDLE + '_FieldTripleCases_0007').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0800
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0008
     * @tc.desc      Verify empty base counts as a value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0008', 0, (): void => {
      const triple: FieldTriple = tripleOf('draftId', '草稿', '', 'd-1', '');
      loggedExpect(triple.localChanged(), 'MergeRecoveryMatrixCases.test.ets:A0028', BUNDLE + '_FieldTripleCases_0008').assertTrue();
      loggedExpect(triple.remoteChanged(), 'MergeRecoveryMatrixCases.test.ets:A0029', BUNDLE + '_FieldTripleCases_0008').assertFalse();
      loggedExpect(triple.automaticChoice(), 'MergeRecoveryMatrixCases.test.ets:A0030', BUNDLE + '_FieldTripleCases_0008').assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0900
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0009
     * @tc.desc      Verify deleting locally is a change
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0009', 0, (): void => {
      const triple: FieldTriple = tripleOf('tag', '标签', '便签', '', '便签');
      loggedExpect(triple.localChanged(), 'MergeRecoveryMatrixCases.test.ets:A0031', BUNDLE + '_FieldTripleCases_0009').assertTrue();
      loggedExpect(triple.remoteChanged(), 'MergeRecoveryMatrixCases.test.ets:A0032', BUNDLE + '_FieldTripleCases_0009').assertFalse();
      loggedExpect(triple.automaticChoice(), 'MergeRecoveryMatrixCases.test.ets:A0033', BUNDLE + '_FieldTripleCases_0009').assertEqual(FieldChoice.LOCAL);
      loggedExpect(triple.local, 'MergeRecoveryMatrixCases.test.ets:A0034', BUNDLE + '_FieldTripleCases_0009').assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_1000
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0010
     * @tc.desc      Verify triple describe marks blank values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0010', 0, (): void => {
      const triple: FieldTriple = tripleOf('tag', '标签', '', '', '便签');
      loggedExpect(triple.describe(), 'MergeRecoveryMatrixCases.test.ets:A0035', BUNDLE + '_FieldTripleCases_0010').assertEqual('标签｜基线 (空)｜本地 (空)｜对端 便签');
      loggedExpect(triple.describe().indexOf('(空)') > 0, 'MergeRecoveryMatrixCases.test.ets:A0036', BUNDLE + '_FieldTripleCases_0010').assertTrue();
      loggedExpect(planMerge([triple], true).decisionOf('tag')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0037', BUNDLE + '_FieldTripleCases_0010').assertEqual(FieldChoice.REMOTE);
      loggedExpect(triple.describe().split('｜').length, 'MergeRecoveryMatrixCases.test.ets:A0038', BUNDLE + '_FieldTripleCases_0010').assertEqual(4);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_1100
     * @tc.name      com.samples.appcontinuation_FieldTripleCases_0011
     * @tc.desc      Verify triple describe shows all three sides
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldTripleCases_0011', 0, (): void => {
      const triple: FieldTriple = tripleOf('title', '标题', '旧', '新', '对端');
      loggedExpect(triple.describe(), 'MergeRecoveryMatrixCases.test.ets:A0039', BUNDLE + '_FieldTripleCases_0011').assertEqual('标题｜基线 旧｜本地 新｜对端 对端');
      loggedExpect(triple.describe().split('｜').length, 'MergeRecoveryMatrixCases.test.ets:A0040', BUNDLE + '_FieldTripleCases_0011').assertEqual(4);
      loggedExpect(planMerge([triple], true).decisionOf('title')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0041', BUNDLE + '_FieldTripleCases_0011').assertEqual(FieldChoice.MANUAL);
      loggedExpect(conflictKeys(planMerge([triple], true)).length, 'MergeRecoveryMatrixCases.test.ets:A0042', BUNDLE + '_FieldTripleCases_0011').assertEqual(1);
    });
  });

  describe('FieldDecisionCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_FIELDDECISIONCASES_0100
     * @tc.name      com.samples.appcontinuation_FieldDecisionCases_0001
     * @tc.desc      Verify decision defaults to base
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_FieldDecisionCases_0001', 0, (): void => {
      const decision: FieldDecision = new FieldDecision('title');
      loggedExpect(decision.choice, 'MergeRecoveryMatrixCases.test.ets:A0043', BUNDLE + '_FieldDecisionCases_0001').assertEqual(FieldChoice.BASE);
      loggedExpect(decision.value, 'MergeRecoveryMatrixCases.test.ets:A0044', BUNDLE + '_FieldDecisionCases_0001').assertEqual('');
      loggedExpect(decision.conflicted, 'MergeRecoveryMatrixCases.test.ets:A0045', BUNDLE + '_FieldDecisionCases_0001').assertFalse();
      loggedExpect(decision.reason, 'MergeRecoveryMatrixCases.test.ets:A0046', BUNDLE + '_FieldDecisionCases_0001').assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDECISIONCASES_0200
     * @tc.name      com.samples.appcontinuation_FieldDecisionCases_0002
     * @tc.desc      Verify decision describe without conflict
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldDecisionCases_0002', 0, (): void => {
      const decision: FieldDecision = new FieldDecision('title', FieldChoice.LOCAL, '新标题');
      loggedExpect(decision.describe(), 'MergeRecoveryMatrixCases.test.ets:A0047', BUNDLE + '_FieldDecisionCases_0002').assertEqual('title｜采用本地｜新标题');
      loggedExpect(decision.describe().indexOf('冲突'), 'MergeRecoveryMatrixCases.test.ets:A0048', BUNDLE + '_FieldDecisionCases_0002').assertEqual(-1);
      loggedExpect(decision.key, 'MergeRecoveryMatrixCases.test.ets:A0049', BUNDLE + '_FieldDecisionCases_0002').assertEqual('title');
      loggedExpect(decision.choice, 'MergeRecoveryMatrixCases.test.ets:A0050', BUNDLE + '_FieldDecisionCases_0002').assertEqual(FieldChoice.LOCAL);
      loggedExpect(decision.value, 'MergeRecoveryMatrixCases.test.ets:A0051', BUNDLE + '_FieldDecisionCases_0002').assertEqual('新标题');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDECISIONCASES_0300
     * @tc.name      com.samples.appcontinuation_FieldDecisionCases_0003
     * @tc.desc      Verify decision describe with conflict
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldDecisionCases_0003', 0, (): void => {
      const decision: FieldDecision = new FieldDecision('group', FieldChoice.MANUAL, '');
      decision.conflicted = true;
      decision.reason = '双方都改过且取值不同';
      loggedExpect(decision.describe(), 'MergeRecoveryMatrixCases.test.ets:A0052', BUNDLE + '_FieldDecisionCases_0003').assertEqual(
        'group｜需人工确认｜(空)｜冲突：双方都改过且取值不同');
      loggedExpect(decision.describe().indexOf(localize('ac_mergeplan_004')) > 0, 'MergeRecoveryMatrixCases.test.ets:A0053', BUNDLE + '_FieldDecisionCases_0003').assertTrue();
      loggedExpect(decision.conflicted, 'MergeRecoveryMatrixCases.test.ets:A0054', BUNDLE + '_FieldDecisionCases_0003').assertTrue();
      loggedExpect(decision.reason, 'MergeRecoveryMatrixCases.test.ets:A0055', BUNDLE + '_FieldDecisionCases_0003').assertEqual('双方都改过且取值不同');
      loggedExpect(decision.choice, 'MergeRecoveryMatrixCases.test.ets:A0056', BUNDLE + '_FieldDecisionCases_0003').assertEqual(FieldChoice.MANUAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDECISIONCASES_0400
     * @tc.name      com.samples.appcontinuation_FieldDecisionCases_0004
     * @tc.desc      Verify decision describe marks blank value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FieldDecisionCases_0004', 0, (): void => {
      const decision: FieldDecision = new FieldDecision('tag', FieldChoice.REMOTE, '');
      loggedExpect(decision.describe(), 'MergeRecoveryMatrixCases.test.ets:A0057', BUNDLE + '_FieldDecisionCases_0004').assertEqual('tag｜采用对端｜(空)');
      loggedExpect(decision.describe().indexOf('(空)') > 0, 'MergeRecoveryMatrixCases.test.ets:A0058', BUNDLE + '_FieldDecisionCases_0004').assertTrue();
      loggedExpect(decision.key, 'MergeRecoveryMatrixCases.test.ets:A0059', BUNDLE + '_FieldDecisionCases_0004').assertEqual('tag');
      loggedExpect(decision.value, 'MergeRecoveryMatrixCases.test.ets:A0060', BUNDLE + '_FieldDecisionCases_0004').assertEqual('');
      loggedExpect(decision.choice, 'MergeRecoveryMatrixCases.test.ets:A0061', BUNDLE + '_FieldDecisionCases_0004').assertEqual(FieldChoice.REMOTE);
    });
  });

  describe('PlanMergeCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0100
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0001
     * @tc.desc      Verify plan assigns every field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0001', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      loggedExpect(plan.decisions.length, 'MergeRecoveryMatrixCases.test.ets:A0062', BUNDLE + '_PlanMergeCases_0001').assertEqual(5);
      loggedExpect(plan.decisionOf('title')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0063', BUNDLE + '_PlanMergeCases_0001').assertEqual(FieldChoice.LOCAL);
      loggedExpect(plan.decisionOf('body')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0064', BUNDLE + '_PlanMergeCases_0001').assertEqual(FieldChoice.REMOTE);
      loggedExpect(plan.decisionOf('group')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0065', BUNDLE + '_PlanMergeCases_0001').assertEqual(FieldChoice.MANUAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0200
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0002
     * @tc.desc      Verify plan counts conflicts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0002', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      loggedExpect(plan.conflictCount(), 'MergeRecoveryMatrixCases.test.ets:A0066', BUNDLE + '_PlanMergeCases_0002').assertEqual(1);
      loggedExpect(plan.settledCount(), 'MergeRecoveryMatrixCases.test.ets:A0067', BUNDLE + '_PlanMergeCases_0002').assertEqual(4);
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0068', BUNDLE + '_PlanMergeCases_0002').assertTrue();
      loggedExpect(conflictKeys(plan).join(','), 'MergeRecoveryMatrixCases.test.ets:A0069', BUNDLE + '_PlanMergeCases_0002').assertEqual('group');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0300
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0003
     * @tc.desc      Verify converged field uses local value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0003', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      loggedExpect(plan.decisionOf('tags')?.value, 'MergeRecoveryMatrixCases.test.ets:A0070', BUNDLE + '_PlanMergeCases_0003').assertEqual('a,b,c');
      loggedExpect(plan.decisionOf('tags')?.conflicted, 'MergeRecoveryMatrixCases.test.ets:A0071', BUNDLE + '_PlanMergeCases_0003').assertFalse();
      loggedExpect(plan.decisionOf('tags')?.reason, 'MergeRecoveryMatrixCases.test.ets:A0072', BUNDLE + '_PlanMergeCases_0003').assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0400
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0004
     * @tc.desc      Verify conflict decision carries no value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0004', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const conflict: FieldDecision | undefined = plan.decisionOf('group');
      loggedExpect(conflict?.value, 'MergeRecoveryMatrixCases.test.ets:A0073', BUNDLE + '_PlanMergeCases_0004').assertEqual('');
      loggedExpect(conflict?.conflicted, 'MergeRecoveryMatrixCases.test.ets:A0074', BUNDLE + '_PlanMergeCases_0004').assertTrue();
      loggedExpect(conflict?.reason, 'MergeRecoveryMatrixCases.test.ets:A0075', BUNDLE + '_PlanMergeCases_0004').assertEqual('双方都改过且取值不同');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0500
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0005
     * @tc.desc      Verify without baseline everything is manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0005', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), false);
      loggedExpect(plan.decisions.every((decision: FieldDecision): boolean =>
        decision.choice === FieldChoice.MANUAL), 'MergeRecoveryMatrixCases.test.ets:A0076', BUNDLE + '_PlanMergeCases_0005').assertTrue();
      loggedExpect(plan.settledCount(), 'MergeRecoveryMatrixCases.test.ets:A0077', BUNDLE + '_PlanMergeCases_0005').assertEqual(0);
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0078', BUNDLE + '_PlanMergeCases_0005').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0600
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0006
     * @tc.desc      Verify without baseline keeps local as preview
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0006', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), false);
      loggedExpect(plan.decisionOf('title')?.value, 'MergeRecoveryMatrixCases.test.ets:A0079', BUNDLE + '_PlanMergeCases_0006').assertEqual('新标题');
      loggedExpect(plan.decisionOf('body')?.value, 'MergeRecoveryMatrixCases.test.ets:A0080', BUNDLE + '_PlanMergeCases_0006').assertEqual('原正文');
      loggedExpect(plan.decisionOf('title')?.reason, 'MergeRecoveryMatrixCases.test.ets:A0081', BUNDLE + '_PlanMergeCases_0006').assertEqual('缺少共同基线，无法判断谁改过');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0700
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0007
     * @tc.desc      Verify without baseline marks differences
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0007', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('a', 'A', 'x', 'x', 'y'),
        tripleOf('b', 'B', 'x', 'x', 'x')];
      const plan: MergePlan = planMerge(triples, false);
      loggedExpect(plan.decisionOf('a')?.conflicted, 'MergeRecoveryMatrixCases.test.ets:A0082', BUNDLE + '_PlanMergeCases_0007').assertTrue();
      loggedExpect(plan.decisionOf('b')?.conflicted, 'MergeRecoveryMatrixCases.test.ets:A0083', BUNDLE + '_PlanMergeCases_0007').assertFalse();
      loggedExpect(plan.conflictCount(), 'MergeRecoveryMatrixCases.test.ets:A0084', BUNDLE + '_PlanMergeCases_0007').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0800
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0008
     * @tc.desc      Verify empty triples produce empty plan
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0008', 0, (): void => {
      const plan: MergePlan = planMerge([], true);
      loggedExpect(plan.decisions.length, 'MergeRecoveryMatrixCases.test.ets:A0085', BUNDLE + '_PlanMergeCases_0008').assertEqual(0);
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0086', BUNDLE + '_PlanMergeCases_0008').assertFalse();
      loggedExpect(plan.conflictCount(), 'MergeRecoveryMatrixCases.test.ets:A0087', BUNDLE + '_PlanMergeCases_0008').assertEqual(0);
      loggedExpect(plan.settledCount(), 'MergeRecoveryMatrixCases.test.ets:A0088', BUNDLE + '_PlanMergeCases_0008').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0900
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0009
     * @tc.desc      Verify plan keeps input order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0009', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const keys: string[] = plan.decisions.map((decision: FieldDecision): string => decision.key);
      loggedExpect(keys.join(','), 'MergeRecoveryMatrixCases.test.ets:A0089', BUNDLE + '_PlanMergeCases_0009').assertEqual('title,body,tags,pinned,group');
      loggedExpect(keys.length, 'MergeRecoveryMatrixCases.test.ets:A0090', BUNDLE + '_PlanMergeCases_0009').assertEqual(5);
      loggedExpect(keys.indexOf('missing'), 'MergeRecoveryMatrixCases.test.ets:A0091', BUNDLE + '_PlanMergeCases_0009').assertEqual(-1);
      loggedExpect(plan.decisionOf('title') === undefined, 'MergeRecoveryMatrixCases.test.ets:A0092', BUNDLE + '_PlanMergeCases_0009').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_1000
     * @tc.name      com.samples.appcontinuation_PlanMergeCases_0010
     * @tc.desc      Verify decision of miss returns undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PlanMergeCases_0010', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      loggedExpect(plan.decisionOf('missing') === undefined, 'MergeRecoveryMatrixCases.test.ets:A0093', BUNDLE + '_PlanMergeCases_0010').assertTrue();
      loggedExpect(plan.decisionOf('body')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0094', BUNDLE + '_PlanMergeCases_0010').assertEqual(FieldChoice.REMOTE);
      loggedExpect(plan.decisions.length, 'MergeRecoveryMatrixCases.test.ets:A0095', BUNDLE + '_PlanMergeCases_0010').assertEqual(5);
    });
  });

  describe('ApplyMergeCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0100
     * @tc.name      com.samples.appcontinuation_ApplyMergeCases_0001
     * @tc.desc      Verify apply collects settled fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ApplyMergeCases_0001', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const result: MergeResult = applyMerge(plan);
      loggedExpect(result.keys.length, 'MergeRecoveryMatrixCases.test.ets:A0096', BUNDLE + '_ApplyMergeCases_0001').assertEqual(4);
      loggedExpect(result.values.length, 'MergeRecoveryMatrixCases.test.ets:A0097', BUNDLE + '_ApplyMergeCases_0001').assertEqual(4);
      loggedExpect(result.pending.join(','), 'MergeRecoveryMatrixCases.test.ets:A0098', BUNDLE + '_ApplyMergeCases_0001').assertEqual('group');
      loggedExpect(result.complete(), 'MergeRecoveryMatrixCases.test.ets:A0099', BUNDLE + '_ApplyMergeCases_0001').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0200
     * @tc.name      com.samples.appcontinuation_ApplyMergeCases_0002
     * @tc.desc      Verify apply maps values by key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ApplyMergeCases_0002', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const result: MergeResult = applyMerge(plan);
      loggedExpect(result.valueOf('title'), 'MergeRecoveryMatrixCases.test.ets:A0100', BUNDLE + '_ApplyMergeCases_0002').assertEqual('新标题');
      loggedExpect(result.valueOf('body'), 'MergeRecoveryMatrixCases.test.ets:A0101', BUNDLE + '_ApplyMergeCases_0002').assertEqual('对端正文');
      loggedExpect(result.valueOf('tags'), 'MergeRecoveryMatrixCases.test.ets:A0102', BUNDLE + '_ApplyMergeCases_0002').assertEqual('a,b,c');
      loggedExpect(result.valueOf('group'), 'MergeRecoveryMatrixCases.test.ets:A0103', BUNDLE + '_ApplyMergeCases_0002').assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0300
     * @tc.name      com.samples.appcontinuation_ApplyMergeCases_0003
     * @tc.desc      Verify apply without manual is complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ApplyMergeCases_0003', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('a', 'A', 'x', 'y', 'x'),
        tripleOf('b', 'B', 'x', 'x', 'z')];
      const result: MergeResult = applyMerge(planMerge(triples, true));
      loggedExpect(result.complete(), 'MergeRecoveryMatrixCases.test.ets:A0104', BUNDLE + '_ApplyMergeCases_0003').assertTrue();
      loggedExpect(result.pending.length, 'MergeRecoveryMatrixCases.test.ets:A0105', BUNDLE + '_ApplyMergeCases_0003').assertEqual(0);
      loggedExpect(result.describe(), 'MergeRecoveryMatrixCases.test.ets:A0106', BUNDLE + '_ApplyMergeCases_0003').assertEqual('已合并 2 个字段');
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0400
     * @tc.name      com.samples.appcontinuation_ApplyMergeCases_0004
     * @tc.desc      Verify apply describe lists pending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ApplyMergeCases_0004', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('a', 'A', 'x', 'y', 'x'),
        tripleOf('b', 'B', 'x', 'y', 'z'), tripleOf('c', 'C', 'x', 'm', 'n')];
      const result: MergeResult = applyMerge(planMerge(triples, true));
      loggedExpect(result.describe(), 'MergeRecoveryMatrixCases.test.ets:A0107', BUNDLE + '_ApplyMergeCases_0004').assertEqual('还有 2 个字段待确认：b/c');
      loggedExpect(result.describe().indexOf('待确认') > 0, 'MergeRecoveryMatrixCases.test.ets:A0108', BUNDLE + '_ApplyMergeCases_0004').assertTrue();
      loggedExpect(result.complete(), 'MergeRecoveryMatrixCases.test.ets:A0109', BUNDLE + '_ApplyMergeCases_0004').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0500
     * @tc.name      com.samples.appcontinuation_ApplyMergeCases_0005
     * @tc.desc      Verify apply of empty plan
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ApplyMergeCases_0005', 0, (): void => {
      const result: MergeResult = applyMerge(planMerge([], true));
      loggedExpect(result.keys.length, 'MergeRecoveryMatrixCases.test.ets:A0110', BUNDLE + '_ApplyMergeCases_0005').assertEqual(0);
      loggedExpect(result.pending.length, 'MergeRecoveryMatrixCases.test.ets:A0111', BUNDLE + '_ApplyMergeCases_0005').assertEqual(0);
      loggedExpect(result.complete(), 'MergeRecoveryMatrixCases.test.ets:A0112', BUNDLE + '_ApplyMergeCases_0005').assertTrue();
      loggedExpect(result.valueOf('any'), 'MergeRecoveryMatrixCases.test.ets:A0113', BUNDLE + '_ApplyMergeCases_0005').assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0600
     * @tc.name      com.samples.appcontinuation_ApplyMergeCases_0006
     * @tc.desc      Verify choose settles manual field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ApplyMergeCases_0006', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      loggedExpect(plan.choose('group', FieldChoice.LOCAL, '工作'), 'MergeRecoveryMatrixCases.test.ets:A0114', BUNDLE + '_ApplyMergeCases_0006').assertTrue();
      loggedExpect(plan.decisionOf('group')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0115', BUNDLE + '_ApplyMergeCases_0006').assertEqual(FieldChoice.LOCAL);
      loggedExpect(plan.decisionOf('group')?.value, 'MergeRecoveryMatrixCases.test.ets:A0116', BUNDLE + '_ApplyMergeCases_0006').assertEqual('工作');
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0117', BUNDLE + '_ApplyMergeCases_0006').assertFalse();
      loggedExpect(applyMerge(plan).complete(), 'MergeRecoveryMatrixCases.test.ets:A0118', BUNDLE + '_ApplyMergeCases_0006').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0700
     * @tc.name      com.samples.appcontinuation_ApplyMergeCases_0007
     * @tc.desc      Verify choose rejects unknown key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ApplyMergeCases_0007', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      loggedExpect(plan.choose('missing', FieldChoice.LOCAL, 'x'), 'MergeRecoveryMatrixCases.test.ets:A0119', BUNDLE + '_ApplyMergeCases_0007').assertFalse();
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0120', BUNDLE + '_ApplyMergeCases_0007').assertTrue();
      loggedExpect(plan.decisionOf('missing') === undefined, 'MergeRecoveryMatrixCases.test.ets:A0121', BUNDLE + '_ApplyMergeCases_0007').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0800
     * @tc.name      com.samples.appcontinuation_ApplyMergeCases_0008
     * @tc.desc      Verify choose rejects manual choice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ApplyMergeCases_0008', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      loggedExpect(plan.choose('group', FieldChoice.MANUAL, 'x'), 'MergeRecoveryMatrixCases.test.ets:A0122', BUNDLE + '_ApplyMergeCases_0008').assertFalse();
      loggedExpect(plan.decisionOf('group')?.value, 'MergeRecoveryMatrixCases.test.ets:A0123', BUNDLE + '_ApplyMergeCases_0008').assertEqual('');
      loggedExpect(plan.decisionOf('group')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0124', BUNDLE + '_ApplyMergeCases_0008').assertEqual(FieldChoice.MANUAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0900
     * @tc.name      com.samples.appcontinuation_ApplyMergeCases_0009
     * @tc.desc      Verify choose can override settled field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ApplyMergeCases_0009', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      loggedExpect(plan.choose('title', FieldChoice.REMOTE, '原标题'), 'MergeRecoveryMatrixCases.test.ets:A0125', BUNDLE + '_ApplyMergeCases_0009').assertTrue();
      loggedExpect(plan.decisionOf('title')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0126', BUNDLE + '_ApplyMergeCases_0009').assertEqual(FieldChoice.REMOTE);
      loggedExpect(plan.decisionOf('title')?.value, 'MergeRecoveryMatrixCases.test.ets:A0127', BUNDLE + '_ApplyMergeCases_0009').assertEqual('原标题');
      loggedExpect(applyMerge(plan).valueOf('title'), 'MergeRecoveryMatrixCases.test.ets:A0128', BUNDLE + '_ApplyMergeCases_0009').assertEqual('原标题');
    });
  });

  describe('ResolveAllCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0100
     * @tc.name      com.samples.appcontinuation_ResolveAllCases_0001
     * @tc.desc      Verify resolve all points to local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ResolveAllCases_0001', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, true);
      loggedExpect(resolveAll(plan, triples, FieldChoice.LOCAL), 'MergeRecoveryMatrixCases.test.ets:A0129', BUNDLE + '_ResolveAllCases_0001').assertEqual(1);
      loggedExpect(plan.decisionOf('group')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0130', BUNDLE + '_ResolveAllCases_0001').assertEqual(FieldChoice.LOCAL);
      loggedExpect(plan.decisionOf('group')?.value, 'MergeRecoveryMatrixCases.test.ets:A0131', BUNDLE + '_ResolveAllCases_0001').assertEqual('工作');
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0132', BUNDLE + '_ResolveAllCases_0001').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0200
     * @tc.name      com.samples.appcontinuation_ResolveAllCases_0002
     * @tc.desc      Verify resolve all points to remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ResolveAllCases_0002', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, true);
      resolveAll(plan, triples, FieldChoice.REMOTE);
      loggedExpect(plan.decisionOf('group')?.value, 'MergeRecoveryMatrixCases.test.ets:A0133', BUNDLE + '_ResolveAllCases_0002').assertEqual('生活');
      loggedExpect(applyMerge(plan).valueOf('group'), 'MergeRecoveryMatrixCases.test.ets:A0134', BUNDLE + '_ResolveAllCases_0002').assertEqual('生活');
      loggedExpect(plan.decisionOf('group')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0135', BUNDLE + '_ResolveAllCases_0002').assertEqual(FieldChoice.REMOTE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0300
     * @tc.name      com.samples.appcontinuation_ResolveAllCases_0003
     * @tc.desc      Verify resolve all base still uses local value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ResolveAllCases_0003', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('a', 'A', 'x', 'y', 'z')];
      const plan: MergePlan = planMerge(triples, true);
      resolveAll(plan, triples, FieldChoice.BASE);
      loggedExpect(plan.decisionOf('a')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0136', BUNDLE + '_ResolveAllCases_0003').assertEqual(FieldChoice.BASE);
      loggedExpect(plan.decisionOf('a')?.value, 'MergeRecoveryMatrixCases.test.ets:A0137', BUNDLE + '_ResolveAllCases_0003').assertEqual('y');
      loggedExpect(applyMerge(plan).valueOf('a'), 'MergeRecoveryMatrixCases.test.ets:A0138', BUNDLE + '_ResolveAllCases_0003').assertEqual('y');
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0400
     * @tc.name      com.samples.appcontinuation_ResolveAllCases_0004
     * @tc.desc      Verify resolve all skips settled fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ResolveAllCases_0004', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, true);
      loggedExpect(resolveAll(plan, triples, FieldChoice.LOCAL), 'MergeRecoveryMatrixCases.test.ets:A0139', BUNDLE + '_ResolveAllCases_0004').assertEqual(1);
      loggedExpect(resolveAll(plan, triples, FieldChoice.LOCAL), 'MergeRecoveryMatrixCases.test.ets:A0140', BUNDLE + '_ResolveAllCases_0004').assertEqual(0);
      loggedExpect(plan.decisionOf('title')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0141', BUNDLE + '_ResolveAllCases_0004').assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0500
     * @tc.name      com.samples.appcontinuation_ResolveAllCases_0005
     * @tc.desc      Verify resolve all with no triples changes nothing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ResolveAllCases_0005', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      loggedExpect(resolveAll(plan, [], FieldChoice.LOCAL), 'MergeRecoveryMatrixCases.test.ets:A0142', BUNDLE + '_ResolveAllCases_0005').assertEqual(0);
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0143', BUNDLE + '_ResolveAllCases_0005').assertTrue();
      loggedExpect(resolveAll(plan, [], FieldChoice.REMOTE), 'MergeRecoveryMatrixCases.test.ets:A0144', BUNDLE + '_ResolveAllCases_0005').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0600
     * @tc.name      com.samples.appcontinuation_ResolveAllCases_0006
     * @tc.desc      Verify resolve all after no baseline settles everything
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ResolveAllCases_0006', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, false);
      loggedExpect(resolveAll(plan, triples, FieldChoice.REMOTE), 'MergeRecoveryMatrixCases.test.ets:A0145', BUNDLE + '_ResolveAllCases_0006').assertEqual(5);
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0146', BUNDLE + '_ResolveAllCases_0006').assertFalse();
      const result: MergeResult = applyMerge(plan);
      loggedExpect(result.complete(), 'MergeRecoveryMatrixCases.test.ets:A0147', BUNDLE + '_ResolveAllCases_0006').assertTrue();
      loggedExpect(result.valueOf('group'), 'MergeRecoveryMatrixCases.test.ets:A0148', BUNDLE + '_ResolveAllCases_0006').assertEqual('生活');
    });
  });

  describe('PreviewCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0100
     * @tc.name      com.samples.appcontinuation_PreviewCases_0001
     * @tc.desc      Verify preview of empty plan
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PreviewCases_0001', 0, (): void => {
      const lines: string[] = previewLines(planMerge([], true));
      loggedExpect(lines.length, 'MergeRecoveryMatrixCases.test.ets:A0149', BUNDLE + '_PreviewCases_0001').assertEqual(1);
      loggedExpect(lines[0], 'MergeRecoveryMatrixCases.test.ets:A0150', BUNDLE + '_PreviewCases_0001').assertEqual('没有可合并的字段');
      loggedExpect(lines[0].indexOf('没有可合并') === 0, 'MergeRecoveryMatrixCases.test.ets:A0151', BUNDLE + '_PreviewCases_0001').assertTrue();
      loggedExpect(previewLines(planMerge([], true)).length, 'MergeRecoveryMatrixCases.test.ets:A0152', BUNDLE + '_PreviewCases_0001').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0200
     * @tc.name      com.samples.appcontinuation_PreviewCases_0002
     * @tc.desc      Verify preview headline counts fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PreviewCases_0002', 0, (): void => {
      const lines: string[] = previewLines(planMerge(mixedTriples(), true));
      loggedExpect(lines[0], 'MergeRecoveryMatrixCases.test.ets:A0153', BUNDLE + '_PreviewCases_0002').assertEqual('共 5 个字段｜已定 4｜冲突 1');
      loggedExpect(lines.length, 'MergeRecoveryMatrixCases.test.ets:A0154', BUNDLE + '_PreviewCases_0002').assertEqual(7);
      loggedExpect(lines[0].indexOf('共 5 个字段') === 0, 'MergeRecoveryMatrixCases.test.ets:A0155', BUNDLE + '_PreviewCases_0002').assertTrue();
      loggedExpect(lines[0].indexOf('冲突 1') > 0, 'MergeRecoveryMatrixCases.test.ets:A0156', BUNDLE + '_PreviewCases_0002').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0300
     * @tc.name      com.samples.appcontinuation_PreviewCases_0003
     * @tc.desc      Verify preview lists every decision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PreviewCases_0003', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const lines: string[] = previewLines(plan);
      loggedExpect(lines.some((line: string): boolean => line.indexOf('title｜') === 0), 'MergeRecoveryMatrixCases.test.ets:A0157', BUNDLE + '_PreviewCases_0003').assertTrue();
      loggedExpect(lines.some((line: string): boolean => line.indexOf('group｜') === 0), 'MergeRecoveryMatrixCases.test.ets:A0158', BUNDLE + '_PreviewCases_0003').assertTrue();
      loggedExpect(lines.filter((line: string): boolean => line.indexOf('｜') > 0).length >= 5, 'MergeRecoveryMatrixCases.test.ets:A0159', BUNDLE + '_PreviewCases_0003').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0400
     * @tc.name      com.samples.appcontinuation_PreviewCases_0004
     * @tc.desc      Verify preview warns before write back
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PreviewCases_0004', 0, (): void => {
      const lines: string[] = previewLines(planMerge(mixedTriples(), true));
      loggedExpect(lines[lines.length - 1], 'MergeRecoveryMatrixCases.test.ets:A0160', BUNDLE + '_PreviewCases_0004').assertEqual('存在待确认字段：确认前不写回任何一侧');
      loggedExpect(lines[lines.length - 1].indexOf('不写回') > 0, 'MergeRecoveryMatrixCases.test.ets:A0161', BUNDLE + '_PreviewCases_0004').assertTrue();
      loggedExpect(lines.length, 'MergeRecoveryMatrixCases.test.ets:A0162', BUNDLE + '_PreviewCases_0004').assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0500
     * @tc.name      com.samples.appcontinuation_PreviewCases_0005
     * @tc.desc      Verify preview without manual has no warning
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PreviewCases_0005', 0, (): void => {
      const plan: MergePlan = planMerge([tripleOf('a', 'A', 'x', 'y', 'x')], true);
      const lines: string[] = previewLines(plan);
      loggedExpect(lines.length, 'MergeRecoveryMatrixCases.test.ets:A0163', BUNDLE + '_PreviewCases_0005').assertEqual(2);
      loggedExpect(lines[1].indexOf('待确认'), 'MergeRecoveryMatrixCases.test.ets:A0164', BUNDLE + '_PreviewCases_0005').assertEqual(-1);
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0165', BUNDLE + '_PreviewCases_0005').assertFalse();
    });
  });

  describe('TripleStatsCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0100
     * @tc.name      com.samples.appcontinuation_TripleStatsCases_0001
     * @tc.desc      Verify stats counts every category
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_TripleStatsCases_0001', 0, (): void => {
      const stats: string = tripleStats(mixedTriples());
      loggedExpect(stats, 'MergeRecoveryMatrixCases.test.ets:A0166', BUNDLE + '_TripleStatsCases_0001').assertEqual('字段 5｜仅本地改 2｜仅对端改 1｜双方一致 1｜真冲突 1');
      loggedExpect(stats.indexOf('字段 5') === 0, 'MergeRecoveryMatrixCases.test.ets:A0167', BUNDLE + '_TripleStatsCases_0001').assertTrue();
      loggedExpect(stats.split('｜').length, 'MergeRecoveryMatrixCases.test.ets:A0168', BUNDLE + '_TripleStatsCases_0001').assertEqual(5);
    });

    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0200
     * @tc.name      com.samples.appcontinuation_TripleStatsCases_0002
     * @tc.desc      Verify stats of empty list
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_TripleStatsCases_0002', 0, (): void => {
      const stats: string = tripleStats([]);
      loggedExpect(stats, 'MergeRecoveryMatrixCases.test.ets:A0169', BUNDLE + '_TripleStatsCases_0002').assertEqual('字段 0｜仅本地改 0｜仅对端改 0｜双方一致 0｜真冲突 0');
      loggedExpect(stats.split('｜').length, 'MergeRecoveryMatrixCases.test.ets:A0170', BUNDLE + '_TripleStatsCases_0002').assertEqual(5);
      loggedExpect(stats.indexOf('字段 0') === 0, 'MergeRecoveryMatrixCases.test.ets:A0171', BUNDLE + '_TripleStatsCases_0002').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0300
     * @tc.name      com.samples.appcontinuation_TripleStatsCases_0003
     * @tc.desc      Verify stats categories sum to total
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_TripleStatsCases_0003', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const stats: string = tripleStats(triples);
      const numbers: number[] = [2, 1, 1, 1];
      loggedExpect(numbers.reduce((sum: number, item: number): number => sum + item, 0), 'MergeRecoveryMatrixCases.test.ets:A0172', BUNDLE + '_TripleStatsCases_0003')
        .assertEqual(triples.length);
      loggedExpect(stats.indexOf('真冲突 1') > 0, 'MergeRecoveryMatrixCases.test.ets:A0173', BUNDLE + '_TripleStatsCases_0003').assertTrue();
      loggedExpect(stats, 'MergeRecoveryMatrixCases.test.ets:A0174', BUNDLE + '_TripleStatsCases_0003').assertEqual('字段 5｜仅本地改 2｜仅对端改 1｜双方一致 1｜真冲突 1');
    });

    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0400
     * @tc.name      com.samples.appcontinuation_TripleStatsCases_0004
     * @tc.desc      Verify conflict keys ignores settled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_TripleStatsCases_0004', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), false);
      loggedExpect(conflictKeys(plan).length, 'MergeRecoveryMatrixCases.test.ets:A0175', BUNDLE + '_TripleStatsCases_0004').assertEqual(4);
      loggedExpect(conflictKeys(plan).indexOf('body') >= 0, 'MergeRecoveryMatrixCases.test.ets:A0176', BUNDLE + '_TripleStatsCases_0004').assertTrue();
      loggedExpect(conflictKeys(plan).indexOf('tags') < 0, 'MergeRecoveryMatrixCases.test.ets:A0177', BUNDLE + '_TripleStatsCases_0004').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0500
     * @tc.name      com.samples.appcontinuation_TripleStatsCases_0005
     * @tc.desc      Verify conflict flag survives manual choice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_TripleStatsCases_0005', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, true);
      plan.choose('group', FieldChoice.REMOTE, '生活');
      loggedExpect(plan.decisionOf('group')?.choice, 'MergeRecoveryMatrixCases.test.ets:A0178', BUNDLE + '_TripleStatsCases_0005').assertEqual(FieldChoice.REMOTE);
      loggedExpect(plan.decisionOf('group')?.conflicted, 'MergeRecoveryMatrixCases.test.ets:A0179', BUNDLE + '_TripleStatsCases_0005').assertTrue();
      loggedExpect(conflictKeys(plan).length, 'MergeRecoveryMatrixCases.test.ets:A0180', BUNDLE + '_TripleStatsCases_0005').assertEqual(1);
      loggedExpect(plan.hasManual(), 'MergeRecoveryMatrixCases.test.ets:A0181', BUNDLE + '_TripleStatsCases_0005').assertFalse();
    });
  });
}
