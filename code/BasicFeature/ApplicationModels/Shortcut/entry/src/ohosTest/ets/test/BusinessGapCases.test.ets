import { describe, expect, it } from '@ohos/hypium';
import { TodoItem, TodoState } from '../../../main/ets/business/TodoRules';
import {
  BatchItem,
  BatchJournal,
  BatchPlan,
  BatchPreview,
  BatchPreviewItem,
  BatchResult,
  batchResultText,
  copyBatch,
  copyJournal,
  copyPreview
} from '../../../main/ets/services/VisibilityBatch';

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

    it('testBatchCopyCases0001', 0, (): void => {
      const item: BatchItem = new BatchItem();
      expect(item.id).assertEqual('');
      expect(item.attempt).assertEqual(0);
      expect(item.result).assertEqual('not-run');
      expect(item.restoreResult).assertEqual('not-run');
      expect(item.retryBlocked).assertFalse();
      expect(item.originalKnown).assertFalse();
      expect(item.target).assertFalse();
      expect(item.lastVisible).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0200
     * @tc.name      testBatchCopyCases0002
     * @tc.desc      Verify batch journal defaults
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testBatchCopyCases0002', 0, (): void => {
      const journal: BatchJournal = new BatchJournal();
      expect(journal.version).assertEqual(1);
      expect(journal.sequence).assertEqual(0);
      expect(journal.batches.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0300
     * @tc.name      testBatchCopyCases0003
     * @tc.desc      Verify batch preview item defaults
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testBatchCopyCases0003', 0, (): void => {
      const item: BatchPreviewItem = new BatchPreviewItem();
      expect(item.id).assertEqual('');
      expect(item.eligible).assertTrue();
      expect(item.externalChange).assertFalse();
      expect(item.reason).assertEqual('');
      expect(item.target).assertFalse();
      expect(item.currentVisible).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0400
     * @tc.name      testBatchCopyCases0004
     * @tc.desc      Verify batch result text covers all outcomes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testBatchCopyCases0004', 0, (): void => {
      expect(batchResultText('confirmed')).assertEqual('已确认');
      expect(batchResultText('failed')).assertEqual('失败（已核对未达目标）');
      expect(batchResultText('unknown')).assertEqual('未知（须先核对）');
      expect(batchResultText('not-run')).assertEqual('未执行');
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0500
     * @tc.name      testBatchCopyCases0005
     * @tc.desc      Verify copy batch is deep
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBatchCopyCases0005', 0, (): void => {
      const source: BatchPlan = batchPlanOf([batchItemOf('a', 'confirmed')]);
      const copy: BatchPlan = copyBatch(source);
      expect(copy.batchId).assertEqual('batch-7');
      expect(copy.createdAt).assertEqual(1700);
      expect(copy.interrupted).assertTrue();
      expect(copy.items.length).assertEqual(1);
      expect(copy.items[0].restoreResult).assertEqual('failed');
      expect(copy.items[0].retryBlocked).assertTrue();
      source.items[0].id = 'changed';
      source.items[0].attempt = 99;
      expect(copy.items[0].id).assertEqual('a');
      expect(copy.items[0].attempt).assertEqual(2);
      expect(copy.items.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0600
     * @tc.name      testBatchCopyCases0006
     * @tc.desc      Verify copy batch handles empty items
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBatchCopyCases0006', 0, (): void => {
      const source: BatchPlan = batchPlanOf([]);
      const copy: BatchPlan = copyBatch(source);
      expect(copy.items.length).assertEqual(0);
      expect(copy.batchId).assertEqual('batch-7');
      source.items.push(batchItemOf('late', 'failed'));
      expect(copy.items.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0700
     * @tc.name      testBatchCopyCases0007
     * @tc.desc      Verify copy journal copies plans
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBatchCopyCases0007', 0, (): void => {
      const journal: BatchJournal = new BatchJournal();
      journal.sequence = 9;
      journal.batches = [batchPlanOf([batchItemOf('a', 'confirmed')])];
      const copy: BatchJournal = copyJournal(journal);
      expect(copy.version).assertEqual(1);
      expect(copy.sequence).assertEqual(9);
      expect(copy.batches.length).assertEqual(1);
      expect(copy.batches[0].items.length).assertEqual(1);
      journal.batches[0].items[0].target = false;
      expect(copy.batches[0].items[0].target).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_BATCHCOPYCASES_0800
     * @tc.name      testBatchCopyCases0008
     * @tc.desc      Verify copy preview copies items
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBatchCopyCases0008', 0, (): void => {
      const item: BatchPreviewItem = new BatchPreviewItem();
      item.id = 'a';
      item.eligible = false;
      item.reason = '外部已变';
      const preview: BatchPreview = previewOf([item]);
      const copy: BatchPreview = copyPreview(preview);
      expect(copy.token).assertEqual(11);
      expect(copy.batchId).assertEqual('batch-3');
      expect(copy.mode).assertEqual('retry');
      expect(copy.items.length).assertEqual(1);
      expect(copy.items[0].eligible).assertFalse();
      expect(copy.items[0].reason).assertEqual('外部已变');
      item.reason = 'changed';
      expect(copy.items[0].reason).assertEqual('外部已变');
    });
  });
}
