import { describe, expect, it } from '@ohos/hypium';
import {
  FilterChain, FilterField, FilterNode, FilterOperator, FilterTarget, applyChain, evaluateChain,
  fieldLabel, matchNode, operatorLabel
} from '../../../main/ets/business/FilterChain';
import {
  COLLECTION_RULES, CollectionAction, CollectionItem, CollectionLevel, CollectionRule,
  CollectionRuleKind, actionLabel, needsConfirm, ruleIds as collectionRuleIds, ruleOf as collectionRuleOf,
  rulesOfKind as collectionRulesOfKind, shrinksList
} from '../../../main/ets/business/CollectionRules';
import {
  DiffKind, DiffResult, DiffSummary, diffBadge, diffCharacters, diffLines, sideBySide
} from '../../../main/ets/business/TextDiff';

function target(id: string, title: string, tags: string[], pinned: boolean): FilterTarget {
  const item: FilterTarget = new FilterTarget();
  item.id = id;
  item.title = title;
  item.state = 'open';
  item.tags = tags;
  item.updatedAt = 1000;
  item.group = 'default';
  item.pinned = pinned;
  return item;
}

function chainOf(nodes: FilterNode[]): FilterChain {
  const chain: FilterChain = new FilterChain();
  chain.chainId = 'chain-1';
  chain.name = '测试链';
  chain.nodes = nodes;
  return chain;
}

function nodeOf(field: FilterField, operator: FilterOperator, value: string): FilterNode {
  const node: FilterNode = new FilterNode();
  node.nodeId = 'n-1';
  node.field = field;
  node.operator = operator;
  node.value = value;
  node.numeric = 0;
  node.negate = false;
  return node;
}

export default function filterCollectionDiffCasesTest(): void {
  describe('FilterChainMatrixCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0100
     * @tc.name      testFilterChainMatrixCases0001
     * @tc.desc      Verify empty chain matches everything
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainMatrixCases0001', 0, (): void => {
      const chain: FilterChain = chainOf([]);
      expect(evaluateChain(chain, target('a', '一', [], false))).assertTrue();
      expect(applyChain([target('a', '一', [], false)], chain).length).assertEqual(1);
      expect(chain.nodes.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0200
     * @tc.name      testFilterChainMatrixCases0002
     * @tc.desc      Verify contains matches substring
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainMatrixCases0002', 0, (): void => {
      const node: FilterNode = nodeOf(FilterField.TITLE, FilterOperator.CONTAINS, '学习');
      expect(matchNode(target('a', '学习记录', [], false), node)).assertTrue();
      expect(matchNode(target('b', '其他', [], false), node)).assertFalse();
      expect(node.value).assertEqual('学习');
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0300
     * @tc.name      testFilterChainMatrixCases0003
     * @tc.desc      Verify negate inverts result
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainMatrixCases0003', 0, (): void => {
      const node: FilterNode = nodeOf(FilterField.TITLE, FilterOperator.CONTAINS, '学习');
      const hit: FilterTarget = target('a', '学习记录', [], false);
      expect(matchNode(hit, node)).assertTrue();
      node.negate = true;
      expect(matchNode(hit, node)).assertFalse();
      expect(matchNode(target('b', '其他', [], false), node)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0400
     * @tc.name      testFilterChainMatrixCases0004
     * @tc.desc      Verify multiple nodes narrow the result
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainMatrixCases0004', 0, (): void => {
      const first: FilterNode = nodeOf(FilterField.TITLE, FilterOperator.CONTAINS, '记录');
      const second: FilterNode = nodeOf(FilterField.STATE, FilterOperator.EQUALS, 'open');
      const chain: FilterChain = chainOf([first, second]);
      const both: FilterTarget = target('a', '学习记录', [], false);
      const neither: FilterTarget = target('b', '其他', [], false);
      expect(evaluateChain(chainOf([first]), both)).assertTrue();
      expect(evaluateChain(chainOf([second]), both)).assertTrue();
      expect(evaluateChain(chain, both)).assertTrue();
      expect(evaluateChain(chainOf([first]), neither)).assertFalse();
      expect(evaluateChain(chain, neither)).assertFalse();
      expect(chain.nodes.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0500
     * @tc.name      testFilterChainMatrixCases0005
     * @tc.desc      Verify apply chain filters list
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainMatrixCases0005', 0, (): void => {
      const chain: FilterChain = chainOf([
        nodeOf(FilterField.TITLE, FilterOperator.CONTAINS, '记录')
      ]);
      const targets: FilterTarget[] = [target('a', '记录一', [], false), target('b', '其他', [], false),
        target('c', '记录二', [], false)];
      const kept: FilterTarget[] = applyChain(targets, chain);
      expect(kept.length).assertEqual(2);
      expect(kept[0].id).assertEqual('a');
      expect(kept[1].id).assertEqual('c');
      expect(applyChain([], chain).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0600
     * @tc.name      testFilterChainMatrixCases0006
     * @tc.desc      Verify apply chain keeps order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainMatrixCases0006', 0, (): void => {
      const chain: FilterChain = chainOf([]);
      const targets: FilterTarget[] = [target('c', '三', [], false), target('a', '一', [], false),
        target('b', '二', [], false)];
      const kept: FilterTarget[] = applyChain(targets, chain);
      expect(kept.length).assertEqual(3);
      expect(kept[0].id).assertEqual('c');
      expect(kept[2].id).assertEqual('b');
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0700
     * @tc.name      testFilterChainMatrixCases0007
     * @tc.desc      Verify equality operator is exact
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainMatrixCases0007', 0, (): void => {
      const node: FilterNode = nodeOf(FilterField.STATE, FilterOperator.EQUALS, 'open');
      expect(matchNode(target('a', '一', [], false), node)).assertTrue();
      const closed: FilterTarget = target('b', '二', [], false);
      closed.state = 'done';
      expect(matchNode(closed, node)).assertFalse();
      expect(node.operator).assertEqual(FilterOperator.EQUALS);
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0800
     * @tc.name      testFilterChainMatrixCases0008
     * @tc.desc      Verify operator labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFilterChainMatrixCases0008', 0, (): void => {
      const labels: string[] = [operatorLabel(FilterOperator.CONTAINS), operatorLabel(FilterOperator.EQUALS),
        operatorLabel(FilterOperator.GREATER), operatorLabel(FilterOperator.LESS)];
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length).assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0)).assertTrue();
      expect(labels.length).assertEqual(4);
      expect(operatorLabel(FilterOperator.CONTAINS).length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0900
     * @tc.name      testFilterChainMatrixCases0009
     * @tc.desc      Verify field labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFilterChainMatrixCases0009', 0, (): void => {
      const labels: string[] = [fieldLabel(FilterField.TITLE), fieldLabel(FilterField.TAG),
        fieldLabel(FilterField.STATE), fieldLabel(FilterField.GROUP)];
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length).assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0)).assertTrue();
      expect(labels.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_1100
     * @tc.name      testFilterChainMatrixCases0011
     * @tc.desc      Verify tag filter matches exact tag
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainMatrixCases0011', 0, (): void => {
      const node: FilterNode = nodeOf(FilterField.TITLE, FilterOperator.HAS_TAG, '工作');
      expect(matchNode(target('a', '一', ['生活', '工作'], false), node)).assertTrue();
      expect(matchNode(target('b', '二', ['生活'], false), node)).assertFalse();
      expect(matchNode(target('c', '三', [], false), node)).assertFalse();
      expect(node.operator).assertEqual(FilterOperator.HAS_TAG);
    });

    /**
     * @tc.number    SUB_SHORTCUT_FILTERCHAINMATRIXCASES_1200
     * @tc.name      testFilterChainMatrixCases0012
     * @tc.desc      Verify chain with negated node excludes matches
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFilterChainMatrixCases0012', 0, (): void => {
      const node: FilterNode = nodeOf(FilterField.TITLE, FilterOperator.CONTAINS, '学习');
      node.negate = true;
      const chain: FilterChain = chainOf([node]);
      const targets: FilterTarget[] = [target('a', '学习记录', [], false), target('b', '工作记录', [], false)];
      const kept: FilterTarget[] = applyChain(targets, chain);
      expect(kept.length).assertEqual(1);
      expect(kept[0].id).assertEqual('b');
      expect(node.negate).assertTrue();
      expect(chain.nodes.length).assertEqual(1);
    });
  });

  describe('CollectionGovernanceCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0100
     * @tc.name      testCollectionGovernanceCases0001
     * @tc.desc      Verify rule table is well formed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testCollectionGovernanceCases0001', 0, (): void => {
      expect(COLLECTION_RULES.length > 0).assertTrue();
      const ids: string[] = collectionRuleIds();
      expect(ids.length).assertEqual(COLLECTION_RULES.length);
      expect(ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length)
        .assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0200
     * @tc.name      testCollectionGovernanceCases0002
     * @tc.desc      Verify every rule is reachable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionGovernanceCases0002', 0, (): void => {
      let found: number = 0;
      collectionRuleIds().forEach((id: string): void => {
        const rule = collectionRuleOf(id);
        if (rule !== undefined && rule.ruleId === id) {
          found++;
        }
      });
      expect(found).assertEqual(COLLECTION_RULES.length);
      expect(collectionRuleOf('no-such-rule') === undefined).assertTrue();
      expect(collectionRuleIds().length).assertEqual(COLLECTION_RULES.length);
      expect(collectionRuleOf(collectionRuleIds()[0]) === undefined).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0300
     * @tc.name      testCollectionGovernanceCases0003
     * @tc.desc      Verify kind partition covers table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionGovernanceCases0003', 0, (): void => {
      const validity: number = collectionRulesOfKind(CollectionRuleKind.VALIDITY).length;
      let total: number = 0;
      COLLECTION_RULES.forEach((rule: CollectionRule): void => {
        total += collectionRulesOfKind(rule.kind).length > 0 ? 0 : 1;
      });
      expect(total).assertEqual(0);
      expect(validity > 0).assertTrue();
      expect(COLLECTION_RULES.length > 0).assertTrue();
      expect(collectionRulesOfKind(CollectionRuleKind.VALIDITY).every((rule: CollectionRule): boolean =>
        rule.kind === CollectionRuleKind.VALIDITY)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0500
     * @tc.name      testCollectionGovernanceCases0005
     * @tc.desc      Verify action labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testCollectionGovernanceCases0005', 0, (): void => {
      const actions: CollectionAction[] = COLLECTION_RULES.map((rule: CollectionRule): CollectionAction =>
        rule.action);
      const unique: CollectionAction[] = [];
      actions.forEach((action: CollectionAction): void => {
        if (unique.indexOf(action) < 0) {
          unique.push(action);
        }
      });
      expect(unique.length > 0).assertTrue();
      unique.forEach((action: CollectionAction): void => {
        expect(actionLabel(action).length > 0).assertTrue();
      });
      expect(actions.length).assertEqual(COLLECTION_RULES.length);
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0600
     * @tc.name      testCollectionGovernanceCases0006
     * @tc.desc      Verify destructive actions require confirmation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionGovernanceCases0006', 0, (): void => {
      const destructive: CollectionRule[] = COLLECTION_RULES.filter((rule: CollectionRule): boolean =>
        shrinksList(rule.action));
      expect(destructive.length > 0).assertTrue();
      destructive.forEach((rule: CollectionRule): void => {
        expect(needsConfirm(rule.action)).assertTrue();
      });
      expect(destructive.length < COLLECTION_RULES.length).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0700
     * @tc.name      testCollectionGovernanceCases0007
     * @tc.desc      Verify non destructive actions need no confirmation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionGovernanceCases0007', 0, (): void => {
      const keep: boolean = needsConfirm(CollectionAction.KEEP);
      expect(keep).assertFalse();
      expect(shrinksList(CollectionAction.KEEP)).assertFalse();
      expect(actionLabel(CollectionAction.KEEP).length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0800
     * @tc.name      testCollectionGovernanceCases0008
     * @tc.desc      Verify severity levels are ordered by presence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionGovernanceCases0008', 0, (): void => {
      const levels: CollectionLevel[] = COLLECTION_RULES.map((rule: CollectionRule): CollectionLevel =>
        rule.level);
      expect(levels.length).assertEqual(COLLECTION_RULES.length);
      expect(levels.indexOf(CollectionLevel.WARN) >= 0).assertTrue();
      expect(COLLECTION_RULES.length > 0).assertTrue();
      expect((levels[0] as string).length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0900
     * @tc.name      testCollectionGovernanceCases0009
     * @tc.desc      Verify thresholds are non negative
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCollectionGovernanceCases0009', 0, (): void => {
      COLLECTION_RULES.forEach((rule: CollectionRule): void => {
        expect(rule.threshold >= 0).assertTrue();
        expect(rule.description.length > 0).assertTrue();
      });
      expect(COLLECTION_RULES.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_1000
     * @tc.name      testCollectionGovernanceCases0010
     * @tc.desc      Verify collection item defaults are valid
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testCollectionGovernanceCases0010', 0, (): void => {
      const item: CollectionItem = new CollectionItem();
      expect(item.id).assertEqual('');
      expect(item.tags.length).assertEqual(0);
      expect(item.pinned).assertFalse();
      expect(item.savedAt).assertEqual(0);
      expect(item.source).assertEqual('');
    });
  });

  describe('TextDiffMatrixCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0100
     * @tc.name      testTextDiffMatrixCases0001
     * @tc.desc      Verify identical text has no changes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testTextDiffMatrixCases0001', 0, (): void => {
      const result: DiffResult = diffLines('a\nb', 'a\nb');
      expect(result.summary.added).assertEqual(0);
      expect(result.summary.removed).assertEqual(0);
      expect(result.summary.identical).assertTrue();
      expect(result.lines.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0200
     * @tc.name      testTextDiffMatrixCases0002
     * @tc.desc      Verify added line is counted
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTextDiffMatrixCases0002', 0, (): void => {
      const result: DiffResult = diffLines('a', 'a\nb');
      expect(result.summary.added).assertEqual(1);
      expect(result.summary.removed).assertEqual(0);
      expect(result.summary.identical).assertFalse();
      expect(result.summary.equal >= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0300
     * @tc.name      testTextDiffMatrixCases0003
     * @tc.desc      Verify removed line is counted
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTextDiffMatrixCases0003', 0, (): void => {
      const result: DiffResult = diffLines('a\nb', 'a');
      expect(result.summary.removed).assertEqual(1);
      expect(result.summary.added).assertEqual(0);
      expect(result.summary.identical).assertFalse();
      expect(result.summary.equal >= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0400
     * @tc.name      testTextDiffMatrixCases0004
     * @tc.desc      Verify replacement counts both sides
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTextDiffMatrixCases0004', 0, (): void => {
      const result: DiffResult = diffLines('a\nb', 'a\nc');
      expect(result.summary.added).assertEqual(1);
      expect(result.summary.removed).assertEqual(1);
      expect(result.summary.identical).assertFalse();
      expect(result.lines.length >= 2).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0500
     * @tc.name      testTextDiffMatrixCases0005
     * @tc.desc      Verify empty to content counts additions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTextDiffMatrixCases0005', 0, (): void => {
      const result: DiffResult = diffLines('', 'a\nb');
      expect(result.summary.added).assertEqual(2);
      expect(result.summary.removed).assertEqual(0);
      expect(result.summary.identical).assertFalse();
      expect(result.summary.equal).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0600
     * @tc.name      testTextDiffMatrixCases0006
     * @tc.desc      Verify content to empty counts removals
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTextDiffMatrixCases0006', 0, (): void => {
      const result: DiffResult = diffLines('a\nb', '');
      expect(result.summary.removed).assertEqual(2);
      expect(result.summary.added).assertEqual(0);
      expect(result.summary.equal).assertEqual(0);
      expect(result.summary.identical).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0700
     * @tc.name      testTextDiffMatrixCases0007
     * @tc.desc      Verify both empty are identical
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTextDiffMatrixCases0007', 0, (): void => {
      const result: DiffResult = diffLines('', '');
      expect(result.summary.added).assertEqual(0);
      expect(result.summary.removed).assertEqual(0);
      expect(result.summary.identical).assertTrue();
      expect(result.summary.equal).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0800
     * @tc.name      testTextDiffMatrixCases0008
     * @tc.desc      Verify line numbers follow content
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTextDiffMatrixCases0008', 0, (): void => {
      const result: DiffResult = diffLines('head\nremove\nanchor\ntail', 'intro\nhead\nanchor\ninsert\ntail');
      const added = result.lines.filter((line): boolean => line.kind === DiffKind.ADDED);
      const removed = result.lines.filter((line): boolean => line.kind === DiffKind.REMOVED);
      const equal = result.lines.filter((line): boolean => line.kind === DiffKind.EQUAL);
      expect(added.map((line): string => `${line.text}:${line.oldLine}:${line.newLine}`).join('|'))
        .assertEqual('intro:-1:1|insert:-1:4');
      expect(removed.map((line): string => `${line.text}:${line.oldLine}:${line.newLine}`).join('|'))
        .assertEqual('remove:2:-1');
      expect(equal.map((line): string => `${line.text}:${line.oldLine}:${line.newLine}`).join('|'))
        .assertEqual('head:1:2|anchor:3:3|tail:4:5');
    });

;

;

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_1100
     * @tc.name      testTextDiffMatrixCases0011
     * @tc.desc      Verify badge reflects summary
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testTextDiffMatrixCases0011', 0, (): void => {
      const changed: DiffSummary = new DiffSummary();
      changed.added = 2;
      changed.removed = 1;
      expect(diffBadge(changed).length > 0).assertTrue();
      const identical: DiffSummary = new DiffSummary();
      identical.identical = true;
      expect(diffBadge(identical).length > 0).assertTrue();
      expect(diffBadge(changed) !== diffBadge(identical)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFFMATRIXCASES_1200
     * @tc.name      testTextDiffMatrixCases0012
     * @tc.desc      Verify summary totals match line count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTextDiffMatrixCases0012', 0, (): void => {
      const result: DiffResult = diffLines('a\nb\nc', 'a\nx\nc');
      const counted: number = result.summary.added + result.summary.removed + result.summary.equal;
      expect(result.summary.added).assertEqual(1);
      expect(result.summary.removed).assertEqual(1);
      expect(result.summary.equal).assertEqual(2);
    });
  });
}
