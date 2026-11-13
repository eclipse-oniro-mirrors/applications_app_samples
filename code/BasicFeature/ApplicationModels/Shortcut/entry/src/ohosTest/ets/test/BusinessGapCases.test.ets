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
import { caseName, expect, it } from '../support/TestCase';
import { TodoItem, TodoState } from '../../../main/ets/business/TodoRules';
import { BatchItem, BatchJournal, BatchPlan, BatchPreview, BatchPreviewItem, BatchResult, batchResultText, copyBatch, copyJournal, copyPreview } from '../../../main/ets/services/VisibilityBatch';

function todoOf(id: string, title: string, priority: number, state: TodoState, dueAt: number): TodoItem {
  const item: TodoItem = new TodoItem(id, title, priority);
  item.state = state;
  item.dueAt = dueAt;
  return item;
}

function idsOf(items: TodoItem[]): string {
  return items.map((item: TodoItem): string => item.id).join(',');
}

function batchPlanOf(items: BatchItem[]): BatchPlan {
  const plan: BatchPlan = new BatchPlan();
  plan.batchId = 'batch-7';
  plan.createdAt = 1700;
  plan.interrupted = true;
  plan.items = items;
  return plan;
}

function batchItemOf(id: string, result: BatchResult): BatchItem {
  const item: BatchItem = new BatchItem();
  item.id = id;
  item.originalKnown = true;
  item.originalVisible = false;
  item.target = true;
  item.attempt = 2;
  item.result = result;
  item.restoreAttempt = 1;
  item.restoreResult = 'failed';
  item.retryBlocked = true;
  item.lastKnown = true;
  item.lastVisible = true;
  return item;
}

function previewOf(items: BatchPreviewItem[]): BatchPreview {
  const preview: BatchPreview = new BatchPreview();
  preview.token = 11;
  preview.batchId = 'batch-3';
  preview.mode = 'retry';
  preview.items = items;
  return preview;
}

export default function businessGapCasesTest(): void {
  describe('BatchCopyCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0100
     * @tc.name      testBatchCopyCases0001
     * @tc.desc      Verify batch item defaults
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('BatchCopyCases', '0001'), 0, (): void => {
      const item: BatchItem = new BatchItem();
      expect(item.id, caseName('BatchCopyCases', '0001'), 'BusinessGapCases.test.ets:A0001').assertEqual('');
      expect(item.attempt, caseName('BatchCopyCases', '0001'), 'BusinessGapCases.test.ets:A0002').assertEqual(0);
      expect(item.result, caseName('BatchCopyCases', '0001'), 'BusinessGapCases.test.ets:A0003').assertEqual('not-run');
      expect(item.restoreResult, caseName('BatchCopyCases', '0001'), 'BusinessGapCases.test.ets:A0004').assertEqual('not-run');
      expect(item.retryBlocked, caseName('BatchCopyCases', '0001'), 'BusinessGapCases.test.ets:A0005').assertFalse();
      expect(item.originalKnown, caseName('BatchCopyCases', '0001'), 'BusinessGapCases.test.ets:A0006').assertFalse();
      expect(item.target, caseName('BatchCopyCases', '0001'), 'BusinessGapCases.test.ets:A0007').assertFalse();
      expect(item.lastVisible, caseName('BatchCopyCases', '0001'), 'BusinessGapCases.test.ets:A0008').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0200
     * @tc.name      testBatchCopyCases0002
     * @tc.desc      Verify batch journal defaults
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('BatchCopyCases', '0002'), 0, (): void => {
      const journal: BatchJournal = new BatchJournal();
      expect(journal.version, caseName('BatchCopyCases', '0002'), 'BusinessGapCases.test.ets:A0009').assertEqual(1);
      expect(journal.sequence, caseName('BatchCopyCases', '0002'), 'BusinessGapCases.test.ets:A0010').assertEqual(0);
      expect(journal.batches.length, caseName('BatchCopyCases', '0002'), 'BusinessGapCases.test.ets:A0011').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0300
     * @tc.name      testBatchCopyCases0003
     * @tc.desc      Verify batch preview item defaults
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('BatchCopyCases', '0003'), 0, (): void => {
      const item: BatchPreviewItem = new BatchPreviewItem();
      expect(item.id, caseName('BatchCopyCases', '0003'), 'BusinessGapCases.test.ets:A0012').assertEqual('');
      expect(item.eligible, caseName('BatchCopyCases', '0003'), 'BusinessGapCases.test.ets:A0013').assertTrue();
      expect(item.externalChange, caseName('BatchCopyCases', '0003'), 'BusinessGapCases.test.ets:A0014').assertFalse();
      expect(item.reason, caseName('BatchCopyCases', '0003'), 'BusinessGapCases.test.ets:A0015').assertEqual('');
      expect(item.target, caseName('BatchCopyCases', '0003'), 'BusinessGapCases.test.ets:A0016').assertFalse();
      expect(item.currentVisible, caseName('BatchCopyCases', '0003'), 'BusinessGapCases.test.ets:A0017').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0400
     * @tc.name      testBatchCopyCases0004
     * @tc.desc      Verify batch result text covers all outcomes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('BatchCopyCases', '0004'), 0, (): void => {
      expect(batchResultText('confirmed'), caseName('BatchCopyCases', '0004'), 'BusinessGapCases.test.ets:A0018').assertEqual('已确认');
      expect(batchResultText('failed'), caseName('BatchCopyCases', '0004'), 'BusinessGapCases.test.ets:A0019').assertEqual('失败（已核对未达目标）');
      expect(batchResultText('unknown'), caseName('BatchCopyCases', '0004'), 'BusinessGapCases.test.ets:A0020').assertEqual('未知（须先核对）');
      expect(batchResultText('not-run'), caseName('BatchCopyCases', '0004'), 'BusinessGapCases.test.ets:A0021').assertEqual('未执行');
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0500
     * @tc.name      testBatchCopyCases0005
     * @tc.desc      Verify copy batch is deep
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BatchCopyCases', '0005'), 0, (): void => {
      const source: BatchPlan = batchPlanOf([batchItemOf('a', 'confirmed')]);
      const copy: BatchPlan = copyBatch(source);
      expect(copy.batchId, caseName('BatchCopyCases', '0005'), 'BusinessGapCases.test.ets:A0022').assertEqual('batch-7');
      expect(copy.createdAt, caseName('BatchCopyCases', '0005'), 'BusinessGapCases.test.ets:A0023').assertEqual(1700);
      expect(copy.interrupted, caseName('BatchCopyCases', '0005'), 'BusinessGapCases.test.ets:A0024').assertTrue();
      expect(copy.items.length, caseName('BatchCopyCases', '0005'), 'BusinessGapCases.test.ets:A0025').assertEqual(1);
      expect(copy.items[0].restoreResult, caseName('BatchCopyCases', '0005'), 'BusinessGapCases.test.ets:A0026').assertEqual('failed');
      expect(copy.items[0].retryBlocked, caseName('BatchCopyCases', '0005'), 'BusinessGapCases.test.ets:A0027').assertTrue();
      source.items[0].id = 'changed';
      source.items[0].attempt = 99;
      expect(copy.items[0].id, caseName('BatchCopyCases', '0005'), 'BusinessGapCases.test.ets:A0028').assertEqual('a');
      expect(copy.items[0].attempt, caseName('BatchCopyCases', '0005'), 'BusinessGapCases.test.ets:A0029').assertEqual(2);
      expect(copy.items.length, caseName('BatchCopyCases', '0005'), 'BusinessGapCases.test.ets:A0030').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0600
     * @tc.name      testBatchCopyCases0006
     * @tc.desc      Verify copy batch handles empty items
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BatchCopyCases', '0006'), 0, (): void => {
      const source: BatchPlan = batchPlanOf([]);
      const copy: BatchPlan = copyBatch(source);
      expect(copy.items.length, caseName('BatchCopyCases', '0006'), 'BusinessGapCases.test.ets:A0031').assertEqual(0);
      expect(copy.batchId, caseName('BatchCopyCases', '0006'), 'BusinessGapCases.test.ets:A0032').assertEqual('batch-7');
      source.items.push(batchItemOf('late', 'failed'));
      expect(copy.items.length, caseName('BatchCopyCases', '0006'), 'BusinessGapCases.test.ets:A0033').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0700
     * @tc.name      testBatchCopyCases0007
     * @tc.desc      Verify copy journal copies plans
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BatchCopyCases', '0007'), 0, (): void => {
      const journal: BatchJournal = new BatchJournal();
      journal.sequence = 9;
      journal.batches = [batchPlanOf([batchItemOf('a', 'confirmed')])];
      const copy: BatchJournal = copyJournal(journal);
      expect(copy.version, caseName('BatchCopyCases', '0007'), 'BusinessGapCases.test.ets:A0034').assertEqual(1);
      expect(copy.sequence, caseName('BatchCopyCases', '0007'), 'BusinessGapCases.test.ets:A0035').assertEqual(9);
      expect(copy.batches.length, caseName('BatchCopyCases', '0007'), 'BusinessGapCases.test.ets:A0036').assertEqual(1);
      expect(copy.batches[0].items.length, caseName('BatchCopyCases', '0007'), 'BusinessGapCases.test.ets:A0037').assertEqual(1);
      journal.batches[0].items[0].target = false;
      expect(copy.batches[0].items[0].target, caseName('BatchCopyCases', '0007'), 'BusinessGapCases.test.ets:A0038').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0800
     * @tc.name      testBatchCopyCases0008
     * @tc.desc      Verify copy preview copies items
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BatchCopyCases', '0008'), 0, (): void => {
      const item: BatchPreviewItem = new BatchPreviewItem();
      item.id = 'a';
      item.eligible = false;
      item.reason = '外部已变';
      const preview: BatchPreview = previewOf([item]);
      const copy: BatchPreview = copyPreview(preview);
      expect(copy.token, caseName('BatchCopyCases', '0008'), 'BusinessGapCases.test.ets:A0039').assertEqual(11);
      expect(copy.batchId, caseName('BatchCopyCases', '0008'), 'BusinessGapCases.test.ets:A0040').assertEqual('batch-3');
      expect(copy.mode, caseName('BatchCopyCases', '0008'), 'BusinessGapCases.test.ets:A0041').assertEqual('retry');
      expect(copy.items.length, caseName('BatchCopyCases', '0008'), 'BusinessGapCases.test.ets:A0042').assertEqual(1);
      expect(copy.items[0].eligible, caseName('BatchCopyCases', '0008'), 'BusinessGapCases.test.ets:A0043').assertFalse();
      expect(copy.items[0].reason, caseName('BatchCopyCases', '0008'), 'BusinessGapCases.test.ets:A0044').assertEqual('外部已变');
      item.reason = 'changed';
      expect(copy.items[0].reason, caseName('BatchCopyCases', '0008'), 'BusinessGapCases.test.ets:A0045').assertEqual('外部已变');
    });
  });
}
