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
import {
  COLLECTION_RULES, CollectionAction, CollectionItem, CollectionLevel, CollectionRule,
  CollectionRuleKind, actionLabel, auditCollectionRules, govern, judgeItem, needsConfirm,
  pinQuota, ruleIds, ruleLines, ruleOf, rulesOfKind, shrinksList
} from '../../../main/ets/business/CollectionRules';
import {
  FilterChain, FilterField, FilterNode, FilterOperator, FilterTarget, PRESET_CHAINS,
  applyChain, auditChains, chainByName, chainCounts, chainIds, chainLines, chainNames, chainOf,
  evaluateChain, fieldLabel, matchNode, mergeChains, negateLast, operatorLabel, operatorOptions
} from '../../../main/ets/business/FilterChain';

const DAY: number = 86400000;
const NOW: number = 1700000000000;

function item(id: string, title: string, ageMs: number, tags: string[]): CollectionItem {
  const value: CollectionItem = new CollectionItem(id, title, '摘要');
  value.source = 'note';
  value.tags = tags;
  value.savedAt = NOW - ageMs;
  return value;
}

function target(id: string, title: string, state: string, tags: string[], group: string,
  pinned: boolean, updatedAt: number): FilterTarget {
  const value: FilterTarget = new FilterTarget(id, title, state);
  value.tags = tags;
  value.group = group;
  value.pinned = pinned;
  value.updatedAt = updatedAt;
  return value;
}

function targets(): FilterTarget[] {
  return [
    target('t1', '整理今日待办', 'open', ['便签'], '工作中', true, 1700000000000),
    target('t2', '已完成事项', 'done', ['收藏'], '归档', false, 1600000000000),
    target('t3', '测试用例整理', 'doing', ['便签', '测试'], '工作中', false, 1690000000000)
  ];
}

export default function collectionFilterCasesTest(): void {
  describe('CollectionRuleCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONRULECASES_0100
     * @tc.name      testCollectionRuleCases0001
     * @tc.desc      Verify rule table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testCollectionRuleCases0001', 0, (): void => {
      expect(COLLECTION_RULES.length).assertEqual(20);
      expect(ruleIds().length).assertEqual(20);
      expect(ruleLines().length).assertEqual(20);
      const audit = auditCollectionRules();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('收藏规则表自洽');
      COLLECTION_RULES.forEach((rule: CollectionRule): void => {
        expect(rule.description.length > 0).assertTrue();
        expect(rule.threshold >= 0).assertTrue();
        expect(rule.text().indexOf(rule.ruleId) === 0).assertTrue();
      });
      expect(ruleOf('CL-99')).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONRULECASES_0200
     * @tc.name      testCollectionRuleCases0002
     * @tc.desc      Verify kind distribution covers every bucket
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionRuleCases0002', 0, (): void => {
      expect(rulesOfKind(CollectionRuleKind.VALIDITY).length).assertEqual(5);
      expect(rulesOfKind(CollectionRuleKind.DUPLICATE).length).assertEqual(3);
      expect(rulesOfKind(CollectionRuleKind.TAG).length).assertEqual(4);
      expect(rulesOfKind(CollectionRuleKind.PIN).length).assertEqual(3);
      expect(rulesOfKind(CollectionRuleKind.AGE).length).assertEqual(3);
      expect(rulesOfKind(CollectionRuleKind.TIME).length).assertEqual(2);
      expect(actionLabel(CollectionAction.MERGE)).assertEqual('合并');
      expect(actionLabel(CollectionAction.WARN_ONLY)).assertEqual('仅提醒');
      expect(needsConfirm(CollectionAction.DROP)).assertTrue();
      expect(needsConfirm(CollectionAction.KEEP)).assertFalse();
      expect(shrinksList(CollectionAction.MERGE)).assertTrue();
      expect(shrinksList(CollectionAction.RETAG)).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONRULECASES_0300
     * @tc.name      testCollectionRuleCases0003
     * @tc.desc      Verify judge item covers validity rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionRuleCases0003', 0, (): void => {
      const broken: CollectionItem = new CollectionItem('', '无标识', '摘要');
      expect(judgeItem(broken, NOW, []).ruleId).assertEqual('CL-01');
      expect(judgeItem(broken, NOW, []).action).assertEqual(CollectionAction.DROP);
      expect(judgeItem(broken, NOW, []).level).assertEqual(CollectionLevel.ERROR);
      const emptyTitle: CollectionItem = new CollectionItem('x1', '   ', '摘要');
      expect(judgeItem(emptyTitle, NOW, []).ruleId).assertEqual('CL-02');
      const unknownTime: CollectionItem = new CollectionItem('x2', '标题', '摘要');
      unknownTime.savedAt = 0;
      expect(judgeItem(unknownTime, NOW, []).ruleId).assertEqual('CL-16');
      expect(judgeItem(unknownTime, NOW, []).action).assertEqual(CollectionAction.KEEP);
      const future: CollectionItem = new CollectionItem('x3', '标题', '摘要');
      future.savedAt = NOW + 2 * DAY;
      expect(judgeItem(future, NOW, []).ruleId).assertEqual('CL-17');
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONRULECASES_0400
     * @tc.name      testCollectionRuleCases0004
     * @tc.desc      Verify judge item covers tag and age rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionRuleCases0004', 0, (): void => {
      const manyTags: CollectionItem = item('x4', '标签多', 1000, ['a', 'b', 'c', 'd', 'e', 'f']);
      expect(judgeItem(manyTags, NOW, []).ruleId).assertEqual('CL-07');
      expect(judgeItem(manyTags, NOW, []).action).assertEqual(CollectionAction.RETAG);
      const duplicated: CollectionItem = item('x5', '重复标签', 1000, ['a', 'a']);
      expect(judgeItem(duplicated, NOW, []).ruleId).assertEqual('CL-07');
      const old: CollectionItem = item('x6', '老资料', 400 * DAY, ['资料']);
      expect(judgeItem(old, NOW, []).ruleId).assertEqual('CL-13');
      expect(judgeItem(old, NOW, []).action).assertEqual(CollectionAction.DROP);
      const halfYear: CollectionItem = item('x7', '半年未读', 200 * DAY, ['资料']);
      expect(judgeItem(halfYear, NOW, []).ruleId).assertEqual('CL-14');
      expect(judgeItem(halfYear, NOW, []).action).assertEqual(CollectionAction.WARN_ONLY);
      const fresh: CollectionItem = item('x8', '新收藏', 1000, ['资料']);
      expect(judgeItem(fresh, NOW, []).ruleId).assertEqual('CL-20');
      expect(judgeItem(fresh, NOW, []).action).assertEqual(CollectionAction.KEEP);
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONRULECASES_0500
     * @tc.name      testCollectionRuleCases0005
     * @tc.desc      Verify govern plans every item
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionRuleCases0005', 0, (): void => {
      const items: CollectionItem[] = sampleItems();
      const plan = govern(items, NOW);
      expect(plan.verdicts.length).assertEqual(5);
      expect(plan.countOf(CollectionAction.KEEP)).assertEqual(2);
      expect(plan.countOf(CollectionAction.MERGE)).assertEqual(1);
      expect(plan.countOf(CollectionAction.DROP)).assertEqual(1);
      expect(plan.countOf(CollectionAction.RETAG)).assertEqual(1);
      expect(plan.confirmCount()).assertEqual(2);
      expect(plan.projectedTotal()).assertEqual(3);
      expect(plan.text().indexOf('共 5 条') === 0).assertTrue();
      expect(plan.lines().length).assertEqual(5);
      plan.verdicts.forEach((verdict): void => {
        expect(verdict.text().indexOf(verdict.itemId) === 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONRULECASES_0600
     * @tc.name      testCollectionRuleCases0006
     * @tc.desc      Verify duplicate ids are dropped first
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionRuleCases0006', 0, (): void => {
      const items: CollectionItem[] = sampleItems();
      const clone: CollectionItem = new CollectionItem('c1', '另一个标题', '摘要');
      clone.source = 'web';
      clone.tags = ['资料'];
      clone.savedAt = NOW - 5000;
      items.push(clone);
      const plan = govern(items, NOW);
      expect(plan.countOf(CollectionAction.DROP)).assertEqual(2);
      expect(plan.countOf(CollectionAction.MERGE)).assertEqual(1);
      expect(plan.projectedTotal()).assertEqual(3);
      const dropped = plan.verdicts.filter((verdict): boolean =>
        verdict.ruleId === 'CL-06');
      expect(dropped.length).assertEqual(1);
      expect(dropped[0].level).assertEqual(CollectionLevel.ERROR);
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONRULECASES_0700
     * @tc.name      testCollectionRuleCases0007
     * @tc.desc      Verify pin quota keeps newest
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionRuleCases0007', 0, (): void => {
      const first: CollectionItem = item('p1', '最早置顶', 30 * DAY, ['资料']);
      first.pinned = true;
      const second: CollectionItem = item('p2', '中间置顶', 10 * DAY, ['资料']);
      second.pinned = true;
      const third: CollectionItem = item('p3', '最新置顶', 1 * DAY, ['资料']);
      third.pinned = true;
      const unpinned: CollectionItem = item('p4', '未置顶', 1000, ['资料']);
      const over = pinQuota([first, second, third, unpinned], 1);
      expect(over.length).assertEqual(2);
      expect(over[0]).assertEqual('p1');
      expect(over[1]).assertEqual('p2');
      expect(pinQuota([first, second, third], 5).length).assertEqual(0);
      expect(pinQuota([], 3).length).assertEqual(0);
    });
  });

  describe('FilterChainCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINCASES_0100
     * @tc.name      testFilterChainCases0001
     * @tc.desc      Verify chain table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testFilterChainCases0001', 0, (): void => {
      expect(PRESET_CHAINS.length).assertEqual(15);
      expect(chainIds().length).assertEqual(15);
      expect(chainNames().length).assertEqual(15);
      expect(chainLines().length).assertEqual(15);
      const audit = auditChains();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('筛选链自洽');
      PRESET_CHAINS.forEach((chain: FilterChain): void => {
        expect(chain.name.length > 0).assertTrue();
        expect(chain.text().indexOf(chain.name) === 0).assertTrue();
      });
      expect(chainOf('FC-99')).assertEqual(undefined);
      expect(chainOf('FC-01')?.empty()).assertTrue();
      expect(chainOf('FC-12')?.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINCASES_0200
     * @tc.name      testFilterChainCases0002
     * @tc.desc      Verify labels match enums
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainCases0002', 0, (): void => {
      expect(operatorLabel(FilterOperator.CONTAINS)).assertEqual('包含');
      expect(operatorLabel(FilterOperator.IS_FALSE)).assertEqual('为假');
      expect(fieldLabel(FilterField.UPDATED)).assertEqual('更新时间');
      expect(fieldLabel(FilterField.PINNED)).assertEqual('置顶');
      expect(operatorOptions(FilterField.UPDATED).length).assertEqual(2);
      expect(operatorOptions(FilterField.PINNED).length).assertEqual(2);
      expect(operatorOptions(FilterField.TAG)[0]).assertEqual(FilterOperator.HAS_TAG);
      const node: FilterNode = new FilterNode('n1', FilterField.TITLE,
        FilterOperator.CONTAINS, '整理');
      expect(node.text()).assertEqual('标题包含整理');
      expect(node.signature().indexOf('title') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINCASES_0300
     * @tc.name      testFilterChainCases0003
     * @tc.desc      Verify match node covers every operator
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainCases0003', 0, (): void => {
      const t1: FilterTarget = targets()[0];
      expect(matchNode(t1, new FilterNode('a', FilterField.TITLE,
        FilterOperator.CONTAINS, '整理'))).assertTrue();
      expect(matchNode(t1, new FilterNode('a', FilterField.TITLE,
        FilterOperator.CONTAINS, '不存在'))).assertFalse();
      expect(matchNode(t1, new FilterNode('a', FilterField.STATE,
        FilterOperator.EQUALS, 'open'))).assertTrue();
      expect(matchNode(t1, new FilterNode('a', FilterField.STATE,
        FilterOperator.NOT_EQUALS, 'done'))).assertTrue();
      expect(matchNode(t1, new FilterNode('a', FilterField.TAG,
        FilterOperator.HAS_TAG, '便签'))).assertTrue();
      expect(matchNode(t1, new FilterNode('a', FilterField.TAG,
        FilterOperator.NOT_HAS_TAG, '收藏'))).assertTrue();
      expect(matchNode(t1, new FilterNode('a', FilterField.UPDATED,
        FilterOperator.GREATER, '', 1600000000000))).assertTrue();
      expect(matchNode(t1, new FilterNode('a', FilterField.UPDATED,
        FilterOperator.LESS, '', 1600000000000))).assertFalse();
      expect(matchNode(t1, new FilterNode('a', FilterField.PINNED,
        FilterOperator.IS_TRUE, ''))).assertTrue();
      expect(matchNode(t1, new FilterNode('a', FilterField.PINNED,
        FilterOperator.IS_FALSE, ''))).assertFalse();
      expect(matchNode(t1, new FilterNode('a', FilterField.PINNED,
        FilterOperator.IS_TRUE, '', 0, true))).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINCASES_0400
     * @tc.name      testFilterChainCases0004
     * @tc.desc      Verify chain evaluation and counts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainCases0004', 0, (): void => {
      const list: FilterTarget[] = targets();
      const counts: number[] = chainCounts(list);
      expect(counts.length).assertEqual(15);
      expect(counts[0]).assertEqual(3);
      expect(counts[1]).assertEqual(1);
      expect(counts[2]).assertEqual(1);
      expect(counts[3]).assertEqual(1);
      expect(counts[4]).assertEqual(1);
      expect(counts[5]).assertEqual(2);
      expect(counts[6]).assertEqual(2);
      expect(counts[7]).assertEqual(2);
      expect(counts[8]).assertEqual(2);
      expect(counts[11]).assertEqual(1);
      expect(counts[12]).assertEqual(2);
      expect(counts[13]).assertEqual(1);
      expect(counts[14]).assertEqual(2);
      expect(applyChain(list, PRESET_CHAINS[0]).length).assertEqual(3);
      expect(evaluateChain(new FilterChain('x', '空', []), list[0])).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINCASES_0500
     * @tc.name      testFilterChainCases0005
     * @tc.desc      Verify merge and negate chains
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainCases0005', 0, (): void => {
      const merged: FilterChain = mergeChains(PRESET_CHAINS[1], PRESET_CHAINS[4]);
      expect(merged.size()).assertEqual(2);
      expect(merged.nodes[0].field).assertEqual(FilterField.STATE);
      expect(merged.nodes[1].field).assertEqual(FilterField.PINNED);
      expect(merged.name).assertEqual('待处理 + 已置顶');
      const selfMerge: FilterChain = mergeChains(PRESET_CHAINS[1], PRESET_CHAINS[1]);
      expect(selfMerge.size()).assertEqual(1);
      const negated: FilterChain = negateLast(PRESET_CHAINS[1]);
      expect(negated.size()).assertEqual(1);
      expect(negated.name.indexOf('排除') > 0).assertTrue();
      expect(negated.nodes[0].negate).assertTrue();
      expect(applyChain(targets(), negated).length).assertEqual(2);
      expect(negateLast(new FilterChain('e', '空', [])).size()).assertEqual(0);
      expect(chainByName('不存在的链').name).assertEqual('全部');
      expect(chainByName('已置顶').size()).assertEqual(1);
    });
  });
}

function sampleItems(): CollectionItem[] {
  const recent: CollectionItem = item('c1', '近期笔记', 3600000, ['便签']);
  const duplicate: CollectionItem = item('c2', '近期笔记', 7200000, ['便签']);
  const old: CollectionItem = item('c3', '去年的资料', 400 * DAY, ['资料']);
  const messy: CollectionItem = item('c4', '标签过多', DAY,
    ['a', 'b', 'c', 'd', 'e', 'f']);
  const pinned: CollectionItem = item('c5', '置顶资料', 10 * DAY, ['资料']);
  pinned.pinned = true;
  return [recent, duplicate, old, messy, pinned];
}
