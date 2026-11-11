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

import { describe, expect, it } from '@ohos/hypium';
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
     * @tc.name      testFieldTripleCases0001
     * @tc.desc      Verify triple defaults are empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testFieldTripleCases0001', 0, (): void => {
      const triple: FieldTriple = new FieldTriple('title', '标题');
      expect(triple.base).assertEqual('');
      expect(triple.local).assertEqual('');
      expect(triple.remote).assertEqual('');
      expect(triple.localChanged()).assertFalse();
      expect(triple.remoteChanged()).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0200
     * @tc.name      testFieldTripleCases0002
     * @tc.desc      Verify local change is detected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0002', 0, (): void => {
      const triple: FieldTriple = tripleOf('title', '标题', 'a', 'b', 'a');
      expect(triple.localChanged()).assertTrue();
      expect(triple.remoteChanged()).assertFalse();
      expect(triple.conflict()).assertFalse();
      expect(triple.automaticChoice()).assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0300
     * @tc.name      testFieldTripleCases0003
     * @tc.desc      Verify remote change is detected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0003', 0, (): void => {
      const triple: FieldTriple = tripleOf('body', '正文', 'a', 'a', 'b');
      expect(triple.localChanged()).assertFalse();
      expect(triple.remoteChanged()).assertTrue();
      expect(triple.automaticChoice()).assertEqual(FieldChoice.REMOTE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0400
     * @tc.name      testFieldTripleCases0004
     * @tc.desc      Verify untouched field falls back to base
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0004', 0, (): void => {
      const triple: FieldTriple = tripleOf('pinned', '置顶', 'false', 'false', 'false');
      expect(triple.localChanged()).assertFalse();
      expect(triple.remoteChanged()).assertFalse();
      expect(triple.conflict()).assertFalse();
      expect(triple.converged()).assertFalse();
      expect(triple.automaticChoice()).assertEqual(FieldChoice.BASE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0500
     * @tc.name      testFieldTripleCases0005
     * @tc.desc      Verify converged change needs no manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0005', 0, (): void => {
      const triple: FieldTriple = tripleOf('tags', '标签', 'a', 'a,b', 'a,b');
      expect(triple.converged()).assertTrue();
      expect(triple.conflict()).assertFalse();
      expect(triple.automaticChoice()).assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0600
     * @tc.name      testFieldTripleCases0006
     * @tc.desc      Verify true conflict needs manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0006', 0, (): void => {
      const triple: FieldTriple = tripleOf('group', '分组', '默认', '工作', '生活');
      expect(triple.conflict()).assertTrue();
      expect(triple.converged()).assertFalse();
      expect(triple.automaticChoice()).assertEqual(FieldChoice.MANUAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0700
     * @tc.name      testFieldTripleCases0007
     * @tc.desc      Verify conflict and converged are exclusive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0007', 0, (): void => {
      const conflict: FieldTriple = tripleOf('k', 'k', 'a', 'b', 'c');
      const converged: FieldTriple = tripleOf('k', 'k', 'a', 'b', 'b');
      expect(conflict.conflict() && conflict.converged()).assertFalse();
      expect(converged.conflict() && converged.converged()).assertFalse();
      expect(conflict.conflict()).assertTrue();
      expect(converged.converged()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0800
     * @tc.name      testFieldTripleCases0008
     * @tc.desc      Verify empty base counts as a value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0008', 0, (): void => {
      const triple: FieldTriple = tripleOf('draftId', '草稿', '', 'd-1', '');
      expect(triple.localChanged()).assertTrue();
      expect(triple.remoteChanged()).assertFalse();
      expect(triple.automaticChoice()).assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_0900
     * @tc.name      testFieldTripleCases0009
     * @tc.desc      Verify deleting locally is a change
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0009', 0, (): void => {
      const triple: FieldTriple = tripleOf('tag', '标签', '便签', '', '便签');
      expect(triple.localChanged()).assertTrue();
      expect(triple.remoteChanged()).assertFalse();
      expect(triple.automaticChoice()).assertEqual(FieldChoice.LOCAL);
      expect(triple.local).assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_1000
     * @tc.name      testFieldTripleCases0010
     * @tc.desc      Verify triple describe marks blank values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0010', 0, (): void => {
      const triple: FieldTriple = tripleOf('tag', '标签', '', '', '便签');
      expect(triple.describe()).assertEqual('标签｜基线 (空)｜本地 (空)｜对端 便签');
      expect(triple.describe().indexOf('(空)') > 0).assertTrue();
      expect(planMerge([triple], true).decisionOf('tag')?.choice).assertEqual(FieldChoice.REMOTE);
      expect(triple.describe().split('｜').length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDTRIPLECASES_1100
     * @tc.name      testFieldTripleCases0011
     * @tc.desc      Verify triple describe shows all three sides
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldTripleCases0011', 0, (): void => {
      const triple: FieldTriple = tripleOf('title', '标题', '旧', '新', '对端');
      expect(triple.describe()).assertEqual('标题｜基线 旧｜本地 新｜对端 对端');
      expect(triple.describe().split('｜').length).assertEqual(4);
      expect(planMerge([triple], true).decisionOf('title')?.choice).assertEqual(FieldChoice.MANUAL);
      expect(conflictKeys(planMerge([triple], true)).length).assertEqual(1);
    });
  });

  describe('FieldDecisionCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_FIELDDECISIONCASES_0100
     * @tc.name      testFieldDecisionCases0001
     * @tc.desc      Verify decision defaults to base
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testFieldDecisionCases0001', 0, (): void => {
      const decision: FieldDecision = new FieldDecision('title');
      expect(decision.choice).assertEqual(FieldChoice.BASE);
      expect(decision.value).assertEqual('');
      expect(decision.conflicted).assertFalse();
      expect(decision.reason).assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDECISIONCASES_0200
     * @tc.name      testFieldDecisionCases0002
     * @tc.desc      Verify decision describe without conflict
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldDecisionCases0002', 0, (): void => {
      const decision: FieldDecision = new FieldDecision('title', FieldChoice.LOCAL, '新标题');
      expect(decision.describe()).assertEqual('title｜采用本地｜新标题');
      expect(decision.describe().indexOf('冲突')).assertEqual(-1);
      expect(decision.key).assertEqual('title');
      expect(decision.choice).assertEqual(FieldChoice.LOCAL);
      expect(decision.value).assertEqual('新标题');
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDECISIONCASES_0300
     * @tc.name      testFieldDecisionCases0003
     * @tc.desc      Verify decision describe with conflict
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldDecisionCases0003', 0, (): void => {
      const decision: FieldDecision = new FieldDecision('group', FieldChoice.MANUAL, '');
      decision.conflicted = true;
      decision.reason = '双方都改过且取值不同';
      expect(decision.describe()).assertEqual(
        'group｜需人工确认｜(空)｜冲突：双方都改过且取值不同');
      expect(decision.describe().indexOf(localize('ac_mergeplan_004')) > 0).assertTrue();
      expect(decision.conflicted).assertTrue();
      expect(decision.reason).assertEqual('双方都改过且取值不同');
      expect(decision.choice).assertEqual(FieldChoice.MANUAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FIELDDECISIONCASES_0400
     * @tc.name      testFieldDecisionCases0004
     * @tc.desc      Verify decision describe marks blank value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFieldDecisionCases0004', 0, (): void => {
      const decision: FieldDecision = new FieldDecision('tag', FieldChoice.REMOTE, '');
      expect(decision.describe()).assertEqual('tag｜采用对端｜(空)');
      expect(decision.describe().indexOf('(空)') > 0).assertTrue();
      expect(decision.key).assertEqual('tag');
      expect(decision.value).assertEqual('');
      expect(decision.choice).assertEqual(FieldChoice.REMOTE);
    });
  });

  describe('PlanMergeCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0100
     * @tc.name      testPlanMergeCases0001
     * @tc.desc      Verify plan assigns every field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0001', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      expect(plan.decisions.length).assertEqual(5);
      expect(plan.decisionOf('title')?.choice).assertEqual(FieldChoice.LOCAL);
      expect(plan.decisionOf('body')?.choice).assertEqual(FieldChoice.REMOTE);
      expect(plan.decisionOf('group')?.choice).assertEqual(FieldChoice.MANUAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0200
     * @tc.name      testPlanMergeCases0002
     * @tc.desc      Verify plan counts conflicts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0002', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      expect(plan.conflictCount()).assertEqual(1);
      expect(plan.settledCount()).assertEqual(4);
      expect(plan.hasManual()).assertTrue();
      expect(conflictKeys(plan).join(',')).assertEqual('group');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0300
     * @tc.name      testPlanMergeCases0003
     * @tc.desc      Verify converged field uses local value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0003', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      expect(plan.decisionOf('tags')?.value).assertEqual('a,b,c');
      expect(plan.decisionOf('tags')?.conflicted).assertFalse();
      expect(plan.decisionOf('tags')?.reason).assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0400
     * @tc.name      testPlanMergeCases0004
     * @tc.desc      Verify conflict decision carries no value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0004', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const conflict: FieldDecision | undefined = plan.decisionOf('group');
      expect(conflict?.value).assertEqual('');
      expect(conflict?.conflicted).assertTrue();
      expect(conflict?.reason).assertEqual('双方都改过且取值不同');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0500
     * @tc.name      testPlanMergeCases0005
     * @tc.desc      Verify without baseline everything is manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0005', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), false);
      expect(plan.decisions.every((decision: FieldDecision): boolean =>
        decision.choice === FieldChoice.MANUAL)).assertTrue();
      expect(plan.settledCount()).assertEqual(0);
      expect(plan.hasManual()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0600
     * @tc.name      testPlanMergeCases0006
     * @tc.desc      Verify without baseline keeps local as preview
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0006', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), false);
      expect(plan.decisionOf('title')?.value).assertEqual('新标题');
      expect(plan.decisionOf('body')?.value).assertEqual('原正文');
      expect(plan.decisionOf('title')?.reason).assertEqual('缺少共同基线，无法判断谁改过');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0700
     * @tc.name      testPlanMergeCases0007
     * @tc.desc      Verify without baseline marks differences
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0007', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('a', 'A', 'x', 'x', 'y'),
        tripleOf('b', 'B', 'x', 'x', 'x')];
      const plan: MergePlan = planMerge(triples, false);
      expect(plan.decisionOf('a')?.conflicted).assertTrue();
      expect(plan.decisionOf('b')?.conflicted).assertFalse();
      expect(plan.conflictCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0800
     * @tc.name      testPlanMergeCases0008
     * @tc.desc      Verify empty triples produce empty plan
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0008', 0, (): void => {
      const plan: MergePlan = planMerge([], true);
      expect(plan.decisions.length).assertEqual(0);
      expect(plan.hasManual()).assertFalse();
      expect(plan.conflictCount()).assertEqual(0);
      expect(plan.settledCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_0900
     * @tc.name      testPlanMergeCases0009
     * @tc.desc      Verify plan keeps input order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0009', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const keys: string[] = plan.decisions.map((decision: FieldDecision): string => decision.key);
      expect(keys.join(',')).assertEqual('title,body,tags,pinned,group');
      expect(keys.length).assertEqual(5);
      expect(keys.indexOf('missing')).assertEqual(-1);
      expect(plan.decisionOf('title') === undefined).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PLANMERGECASES_1000
     * @tc.name      testPlanMergeCases0010
     * @tc.desc      Verify decision of miss returns undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPlanMergeCases0010', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      expect(plan.decisionOf('missing') === undefined).assertTrue();
      expect(plan.decisionOf('body')?.choice).assertEqual(FieldChoice.REMOTE);
      expect(plan.decisions.length).assertEqual(5);
    });
  });

  describe('ApplyMergeCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0100
     * @tc.name      testApplyMergeCases0001
     * @tc.desc      Verify apply collects settled fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testApplyMergeCases0001', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const result: MergeResult = applyMerge(plan);
      expect(result.keys.length).assertEqual(4);
      expect(result.values.length).assertEqual(4);
      expect(result.pending.join(',')).assertEqual('group');
      expect(result.complete()).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0200
     * @tc.name      testApplyMergeCases0002
     * @tc.desc      Verify apply maps values by key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testApplyMergeCases0002', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const result: MergeResult = applyMerge(plan);
      expect(result.valueOf('title')).assertEqual('新标题');
      expect(result.valueOf('body')).assertEqual('对端正文');
      expect(result.valueOf('tags')).assertEqual('a,b,c');
      expect(result.valueOf('group')).assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0300
     * @tc.name      testApplyMergeCases0003
     * @tc.desc      Verify apply without manual is complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testApplyMergeCases0003', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('a', 'A', 'x', 'y', 'x'),
        tripleOf('b', 'B', 'x', 'x', 'z')];
      const result: MergeResult = applyMerge(planMerge(triples, true));
      expect(result.complete()).assertTrue();
      expect(result.pending.length).assertEqual(0);
      expect(result.describe()).assertEqual('已合并 2 个字段');
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0400
     * @tc.name      testApplyMergeCases0004
     * @tc.desc      Verify apply describe lists pending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testApplyMergeCases0004', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('a', 'A', 'x', 'y', 'x'),
        tripleOf('b', 'B', 'x', 'y', 'z'), tripleOf('c', 'C', 'x', 'm', 'n')];
      const result: MergeResult = applyMerge(planMerge(triples, true));
      expect(result.describe()).assertEqual('还有 2 个字段待确认：b/c');
      expect(result.describe().indexOf('待确认') > 0).assertTrue();
      expect(result.complete()).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0500
     * @tc.name      testApplyMergeCases0005
     * @tc.desc      Verify apply of empty plan
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testApplyMergeCases0005', 0, (): void => {
      const result: MergeResult = applyMerge(planMerge([], true));
      expect(result.keys.length).assertEqual(0);
      expect(result.pending.length).assertEqual(0);
      expect(result.complete()).assertTrue();
      expect(result.valueOf('any')).assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0600
     * @tc.name      testApplyMergeCases0006
     * @tc.desc      Verify choose settles manual field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testApplyMergeCases0006', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      expect(plan.choose('group', FieldChoice.LOCAL, '工作')).assertTrue();
      expect(plan.decisionOf('group')?.choice).assertEqual(FieldChoice.LOCAL);
      expect(plan.decisionOf('group')?.value).assertEqual('工作');
      expect(plan.hasManual()).assertFalse();
      expect(applyMerge(plan).complete()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0700
     * @tc.name      testApplyMergeCases0007
     * @tc.desc      Verify choose rejects unknown key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testApplyMergeCases0007', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      expect(plan.choose('missing', FieldChoice.LOCAL, 'x')).assertFalse();
      expect(plan.hasManual()).assertTrue();
      expect(plan.decisionOf('missing') === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0800
     * @tc.name      testApplyMergeCases0008
     * @tc.desc      Verify choose rejects manual choice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testApplyMergeCases0008', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      expect(plan.choose('group', FieldChoice.MANUAL, 'x')).assertFalse();
      expect(plan.decisionOf('group')?.value).assertEqual('');
      expect(plan.decisionOf('group')?.choice).assertEqual(FieldChoice.MANUAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_APPLYMERGECASES_0900
     * @tc.name      testApplyMergeCases0009
     * @tc.desc      Verify choose can override settled field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testApplyMergeCases0009', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      expect(plan.choose('title', FieldChoice.REMOTE, '原标题')).assertTrue();
      expect(plan.decisionOf('title')?.choice).assertEqual(FieldChoice.REMOTE);
      expect(plan.decisionOf('title')?.value).assertEqual('原标题');
      expect(applyMerge(plan).valueOf('title')).assertEqual('原标题');
    });
  });

  describe('ResolveAllCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0100
     * @tc.name      testResolveAllCases0001
     * @tc.desc      Verify resolve all points to local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveAllCases0001', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, true);
      expect(resolveAll(plan, triples, FieldChoice.LOCAL)).assertEqual(1);
      expect(plan.decisionOf('group')?.choice).assertEqual(FieldChoice.LOCAL);
      expect(plan.decisionOf('group')?.value).assertEqual('工作');
      expect(plan.hasManual()).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0200
     * @tc.name      testResolveAllCases0002
     * @tc.desc      Verify resolve all points to remote
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveAllCases0002', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, true);
      resolveAll(plan, triples, FieldChoice.REMOTE);
      expect(plan.decisionOf('group')?.value).assertEqual('生活');
      expect(applyMerge(plan).valueOf('group')).assertEqual('生活');
      expect(plan.decisionOf('group')?.choice).assertEqual(FieldChoice.REMOTE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0300
     * @tc.name      testResolveAllCases0003
     * @tc.desc      Verify resolve all base still uses local value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveAllCases0003', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('a', 'A', 'x', 'y', 'z')];
      const plan: MergePlan = planMerge(triples, true);
      resolveAll(plan, triples, FieldChoice.BASE);
      expect(plan.decisionOf('a')?.choice).assertEqual(FieldChoice.BASE);
      expect(plan.decisionOf('a')?.value).assertEqual('y');
      expect(applyMerge(plan).valueOf('a')).assertEqual('y');
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0400
     * @tc.name      testResolveAllCases0004
     * @tc.desc      Verify resolve all skips settled fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveAllCases0004', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, true);
      expect(resolveAll(plan, triples, FieldChoice.LOCAL)).assertEqual(1);
      expect(resolveAll(plan, triples, FieldChoice.LOCAL)).assertEqual(0);
      expect(plan.decisionOf('title')?.choice).assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0500
     * @tc.name      testResolveAllCases0005
     * @tc.desc      Verify resolve all with no triples changes nothing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveAllCases0005', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      expect(resolveAll(plan, [], FieldChoice.LOCAL)).assertEqual(0);
      expect(plan.hasManual()).assertTrue();
      expect(resolveAll(plan, [], FieldChoice.REMOTE)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RESOLVEALLCASES_0600
     * @tc.name      testResolveAllCases0006
     * @tc.desc      Verify resolve all after no baseline settles everything
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveAllCases0006', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, false);
      expect(resolveAll(plan, triples, FieldChoice.REMOTE)).assertEqual(5);
      expect(plan.hasManual()).assertFalse();
      const result: MergeResult = applyMerge(plan);
      expect(result.complete()).assertTrue();
      expect(result.valueOf('group')).assertEqual('生活');
    });
  });

  describe('PreviewCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0100
     * @tc.name      testPreviewCases0001
     * @tc.desc      Verify preview of empty plan
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPreviewCases0001', 0, (): void => {
      const lines: string[] = previewLines(planMerge([], true));
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertEqual('没有可合并的字段');
      expect(lines[0].indexOf('没有可合并') === 0).assertTrue();
      expect(previewLines(planMerge([], true)).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0200
     * @tc.name      testPreviewCases0002
     * @tc.desc      Verify preview headline counts fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPreviewCases0002', 0, (): void => {
      const lines: string[] = previewLines(planMerge(mixedTriples(), true));
      expect(lines[0]).assertEqual('共 5 个字段｜已定 4｜冲突 1');
      expect(lines.length).assertEqual(7);
      expect(lines[0].indexOf('共 5 个字段') === 0).assertTrue();
      expect(lines[0].indexOf('冲突 1') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0300
     * @tc.name      testPreviewCases0003
     * @tc.desc      Verify preview lists every decision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPreviewCases0003', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), true);
      const lines: string[] = previewLines(plan);
      expect(lines.some((line: string): boolean => line.indexOf('title｜') === 0)).assertTrue();
      expect(lines.some((line: string): boolean => line.indexOf('group｜') === 0)).assertTrue();
      expect(lines.filter((line: string): boolean => line.indexOf('｜') > 0).length >= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0400
     * @tc.name      testPreviewCases0004
     * @tc.desc      Verify preview warns before write back
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPreviewCases0004', 0, (): void => {
      const lines: string[] = previewLines(planMerge(mixedTriples(), true));
      expect(lines[lines.length - 1]).assertEqual('存在待确认字段：确认前不写回任何一侧');
      expect(lines[lines.length - 1].indexOf('不写回') > 0).assertTrue();
      expect(lines.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONTINUATION_PREVIEWCASES_0500
     * @tc.name      testPreviewCases0005
     * @tc.desc      Verify preview without manual has no warning
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPreviewCases0005', 0, (): void => {
      const plan: MergePlan = planMerge([tripleOf('a', 'A', 'x', 'y', 'x')], true);
      const lines: string[] = previewLines(plan);
      expect(lines.length).assertEqual(2);
      expect(lines[1].indexOf('待确认')).assertEqual(-1);
      expect(plan.hasManual()).assertFalse();
    });
  });

  describe('TripleStatsCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0100
     * @tc.name      testTripleStatsCases0001
     * @tc.desc      Verify stats counts every category
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTripleStatsCases0001', 0, (): void => {
      const stats: string = tripleStats(mixedTriples());
      expect(stats).assertEqual('字段 5｜仅本地改 2｜仅对端改 1｜双方一致 1｜真冲突 1');
      expect(stats.indexOf('字段 5') === 0).assertTrue();
      expect(stats.split('｜').length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0200
     * @tc.name      testTripleStatsCases0002
     * @tc.desc      Verify stats of empty list
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTripleStatsCases0002', 0, (): void => {
      const stats: string = tripleStats([]);
      expect(stats).assertEqual('字段 0｜仅本地改 0｜仅对端改 0｜双方一致 0｜真冲突 0');
      expect(stats.split('｜').length).assertEqual(5);
      expect(stats.indexOf('字段 0') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0300
     * @tc.name      testTripleStatsCases0003
     * @tc.desc      Verify stats categories sum to total
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTripleStatsCases0003', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const stats: string = tripleStats(triples);
      const numbers: number[] = [2, 1, 1, 1];
      expect(numbers.reduce((sum: number, item: number): number => sum + item, 0))
        .assertEqual(triples.length);
      expect(stats.indexOf('真冲突 1') > 0).assertTrue();
      expect(stats).assertEqual('字段 5｜仅本地改 2｜仅对端改 1｜双方一致 1｜真冲突 1');
    });

    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0400
     * @tc.name      testTripleStatsCases0004
     * @tc.desc      Verify conflict keys ignores settled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTripleStatsCases0004', 0, (): void => {
      const plan: MergePlan = planMerge(mixedTriples(), false);
      expect(conflictKeys(plan).length).assertEqual(4);
      expect(conflictKeys(plan).indexOf('body') >= 0).assertTrue();
      expect(conflictKeys(plan).indexOf('tags') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_TRIPLESTATSCASES_0500
     * @tc.name      testTripleStatsCases0005
     * @tc.desc      Verify conflict flag survives manual choice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTripleStatsCases0005', 0, (): void => {
      const triples: FieldTriple[] = mixedTriples();
      const plan: MergePlan = planMerge(triples, true);
      plan.choose('group', FieldChoice.REMOTE, '生活');
      expect(plan.decisionOf('group')?.choice).assertEqual(FieldChoice.REMOTE);
      expect(plan.decisionOf('group')?.conflicted).assertTrue();
      expect(conflictKeys(plan).length).assertEqual(1);
      expect(plan.hasManual()).assertFalse();
    });
  });
}
