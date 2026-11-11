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
  DOC_RULES, DocKind, DocRule, DocumentSlot, DocumentWorkspace, WorkspaceAudit, checkIsolation,
  docLines, multiSlotKinds, workspaceLines
} from '../../../main/ets/learning/document/DocumentWorkspace';
import {
  BRANCH_RULES, BranchRule, FieldState, FormField, FormRow, FormSession, FormSnapshot, FormStage,
  branchLines, formSummary
} from '../../../main/ets/learning/document/FormSession';
import {
  FieldChoice, FieldDecision, FieldTriple, MergePlan, MergeResult, applyMerge, conflictKeys,
  planMerge, previewLines, resolveAll, tripleStats
} from '../../../main/ets/learning/payload/MergePlan';
import {
  RECOVERY_RULES, RecoveryAction, RecoveryCase, RecoveryDecision, RecoveryInput, actionsOf,
  hasLossyAction, planRecovery, recoveryLines, recoverySummary, requiresReread
} from '../../../main/ets/learning/recovery/RecoveryPlan';

function slotOf(id: string, kind: DocKind, title: string, revision: number): DocumentSlot {
  const slot: DocumentSlot = new DocumentSlot(id, kind, title);
  slot.revision = revision;
  slot.ownerApp = 'app.continuation';
  return slot;
}

function tripleOf(key: string, base: string, local: string, remote: string): FieldTriple {
  const triple: FieldTriple = new FieldTriple(key, key);
  triple.base = base;
  triple.local = local;
  triple.remote = remote;
  return triple;
}

function recoveryOf(failure: RecoveryCase, cache: boolean, dirty: boolean, reread: boolean): RecoveryInput {
  const input: RecoveryInput = new RecoveryInput();
  input.failure = failure;
  input.hasLocalCache = cache;
  input.localDirty = dirty;
  input.rereadOk = reread;
  return input;
}

export default function workspaceCasesTest(): void {
  describe('DocumentWorkspaceCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0100
     * @tc.name      testDocumentWorkspaceCases0001
     * @tc.desc      Verify rule table covers three kinds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testDocumentWorkspaceCases0001', 0, (): void => {
      expect(DOC_RULES.length).assertEqual(12);
      expect(docLines().length).assertEqual(12);
      expect(multiSlotKinds().length).assertEqual(3);
      DOC_RULES.forEach((rule: DocRule): void => {
        expect(rule.code.length > 0).assertTrue();
        expect(rule.note.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0200
     * @tc.name      testDocumentWorkspaceCases0002
     * @tc.desc      Verify open and switch keep active slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0002', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      expect(workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3))).assertTrue();
      expect(workspace.open(slotOf('read-1', DocKind.READING, '阅读进度', 7))).assertTrue();
      expect(workspace.activeSlotId()).assertEqual('read-1');
      expect(workspace.switchTo('note-1')).assertTrue();
      expect(workspace.activeSlotId()).assertEqual('note-1');
      expect(workspace.allSlots().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0300
     * @tc.name      testDocumentWorkspaceCases0003
     * @tc.desc      Verify unknown switch is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0003', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      expect(workspace.switchTo('note-x')).assertFalse();
      expect(workspace.activeSlotId()).assertEqual('note-1');
      expect(workspace.switchTo('note-1')).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0400
     * @tc.name      testDocumentWorkspaceCases0004
     * @tc.desc      Verify empty identifier is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0004', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      const blank: DocumentSlot = new DocumentSlot('', DocKind.NOTE, '无标识');
      expect(blank.usable()).assertFalse();
      expect(workspace.open(blank)).assertFalse();
      expect(workspace.allSlots().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0500
     * @tc.name      testDocumentWorkspaceCases0005
     * @tc.desc      Verify single slot kind rejects second instance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0005', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      expect(workspace.canOpen(DocKind.FORM)).assertTrue();
      expect(workspace.open(slotOf('form-1', DocKind.FORM, '报销单', 1))).assertTrue();
      expect(workspace.canOpen(DocKind.FORM)).assertFalse();
      expect(workspace.open(slotOf('form-2', DocKind.FORM, '第二份报销单', 1))).assertFalse();
      expect(workspace.countOf(DocKind.FORM)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0600
     * @tc.name      testDocumentWorkspaceCases0006
     * @tc.desc      Verify reopen same slot updates revision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0006', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      expect(workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录（改）', 5))).assertTrue();
      expect(workspace.allSlots().length).assertEqual(1);
      const active = workspace.active();
      expect(active === undefined).assertFalse();
      expect(active === undefined ? 0 : active.revision).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0700
     * @tc.name      testDocumentWorkspaceCases0007
     * @tc.desc      Verify archive clears active and restorable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0007', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      expect(workspace.archive('note-1')).assertTrue();
      expect(workspace.activeSlotId()).assertEqual('');
      expect(workspace.archivedSlots().length).assertEqual(1);
      expect(workspace.activeSlots().length).assertEqual(0);
      expect(workspace.restore('note-1')).assertTrue();
      expect(workspace.activeSlots().length).assertEqual(1);
      expect(workspace.activeSlotId()).assertEqual('note-1');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0800
     * @tc.name      testDocumentWorkspaceCases0008
     * @tc.desc      Verify archive twice is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0008', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      expect(workspace.archive('note-1')).assertTrue();
      expect(workspace.archive('note-1')).assertFalse();
      expect(workspace.restore('note-x')).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0900
     * @tc.name      testDocumentWorkspaceCases0009
     * @tc.desc      Verify close removes slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0009', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.open(slotOf('read-1', DocKind.READING, '阅读进度', 1));
      expect(workspace.close('note-1')).assertTrue();
      expect(workspace.allSlots().length).assertEqual(1);
      expect(workspace.close('note-1')).assertFalse();
      expect(workspace.activeSlotId()).assertEqual('read-1');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_1000
     * @tc.name      testDocumentWorkspaceCases0010
     * @tc.desc      Verify isolation rejects three mismatches
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0010', 0, (): void => {
      const slot: DocumentSlot = slotOf('note-1', DocKind.NOTE, '学习记录', 3);
      expect(checkIsolation(slot, DocKind.NOTE, 'app.continuation', 3).length).assertEqual(0);
      const kindMismatch: string[] = checkIsolation(slot, DocKind.FORM, 'app.continuation', 3);
      expect(kindMismatch.length).assertEqual(1);
      expect(kindMismatch[0].indexOf('类别不一致') >= 0).assertTrue();
      const appMismatch: string[] = checkIsolation(slot, DocKind.NOTE, 'other.app', 3);
      expect(appMismatch.length).assertEqual(1);
      expect(appMismatch[0].indexOf('来源应用不一致') >= 0).assertTrue();
      const revisionMismatch: string[] = checkIsolation(slot, DocKind.NOTE, 'app.continuation', 2);
      expect(revisionMismatch.length).assertEqual(1);
      expect(revisionMismatch[0].indexOf('修订号回退') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_1100
     * @tc.name      testDocumentWorkspaceCases0011
     * @tc.desc      Verify audit reports duplicates and findings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentWorkspaceCases0011', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      const audit: WorkspaceAudit = workspace.audit();
      expect(audit.ok()).assertTrue();
      expect(audit.active).assertEqual(1);
      expect(audit.archived).assertEqual(0);
      expect(audit.summary().indexOf('工作区正常') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_1200
     * @tc.name      testDocumentWorkspaceCases0012
     * @tc.desc      Verify workspace lines always have summary
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testDocumentWorkspaceCases0012', 0, (): void => {
      const empty: DocumentWorkspace = new DocumentWorkspace();
      expect(workspaceLines(empty)[0].indexOf('工作区正常') >= 0).assertTrue();
      expect(workspaceLines(empty)[1]).assertEqual('没有进行中的可接续对象');
      const filled: DocumentWorkspace = new DocumentWorkspace();
      filled.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      filled.archive('note-1');
      expect(workspaceLines(filled).length >= 3).assertTrue();
      expect(filled.keepsDraft(DocKind.FORM)).assertTrue();
      expect(filled.keepsDraft(DocKind.READING)).assertFalse();
    });
  });

  describe('FormSessionCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0100
     * @tc.name      testFormSessionCases0001
     * @tc.desc      Verify branch table has five rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0001', 0, (): void => {
      expect(BRANCH_RULES.length).assertEqual(5);
      expect(branchLines().length).assertEqual(5);
      BRANCH_RULES.forEach((rule: BranchRule): void => {
        expect(rule.revealsFields.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0200
     * @tc.name      testFormSessionCases0002
     * @tc.desc      Verify field refresh distinguishes three states
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0002', 0, (): void => {
      const field: FormField = new FormField('amount', '金额', true, 4);
      expect(field.state).assertEqual(FieldState.EMPTY);
      field.value = '12';
      field.refresh();
      expect(field.state).assertEqual(FieldState.FILLED);
      field.value = '123456';
      field.refresh();
      expect(field.state).assertEqual(FieldState.INVALID);
      expect(field.blocking()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0300
     * @tc.name      testFormSessionCases0003
     * @tc.desc      Verify optional empty field does not block
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0003', 0, (): void => {
      const field: FormField = new FormField('remark', '备注', false, 10);
      field.refresh();
      expect(field.blocking()).assertFalse();
      field.value = '说明';
      field.refresh();
      expect(field.blocking()).assertFalse();
      expect(field.describe().indexOf('备注') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0400
     * @tc.name      testFormSessionCases0004
     * @tc.desc      Verify branch reveals only triggered fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0004', 0, (): void => {
      const session: FormSession = new FormSession('expense-1');
      const kind: FormField = new FormField('kind', '类型', true, 8);
      session.addField(kind);
      const budget: FormField = new FormField('budget', '预算科目', true, 16);
      budget.visibleWhen = ['budget'];
      session.addField(budget);
      const remark: FormField = new FormField('remark', '备注', false, 60);
      remark.visibleWhen = ['remark'];
      session.addField(remark);
      expect(session.visibleFields().length).assertEqual(1);
      expect(session.setValue('kind', '采购')).assertTrue();
      expect(session.visibleFields().length).assertEqual(2);
      expect(session.activeBranches().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0500
     * @tc.name      testFormSessionCases0005
     * @tc.desc      Verify required row blocks submit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0005', 0, (): void => {
      const session: FormSession = new FormSession('purchase-1');
      session.addField(new FormField('kind', '类型', true, 8));
      session.setValue('kind', '采购');
      expect(session.missingRows().length).assertEqual(1);
      expect(session.canSubmit()).assertFalse();
      const row: FormRow = new FormRow('r1');
      session.addRow(row);
      expect(session.missingRows().length).assertEqual(1);
      row.set('name', '电脑');
      expect(session.missingRows().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0600
     * @tc.name      testFormSessionCases0006
     * @tc.desc      Verify progress counts only visible fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0006', 0, (): void => {
      const session: FormSession = new FormSession('leave-1');
      session.addField(new FormField('kind', '类型', true, 8));
      const start: FormField = new FormField('startDate', '开始', true, 10);
      start.visibleWhen = ['startDate'];
      session.addField(start);
      session.setValue('kind', '请假');
      expect(session.progressPercent()).assertEqual(50);
      session.setValue('startDate', '2025-01-01');
      expect(session.progressPercent()).assertEqual(100);
      expect(session.filledCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0700
     * @tc.name      testFormSessionCases0007
     * @tc.desc      Verify confirm requires all blocking resolved
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0007', 0, (): void => {
      const session: FormSession = new FormSession('simple-1');
      session.addField(new FormField('title', '标题', true, 20));
      expect(session.canSubmit()).assertFalse();
      expect(session.confirm()).assertFalse();
      expect(session.review()).assertFalse();
      session.setValue('title', '报销');
      expect(session.review()).assertTrue();
      expect(session.currentStage()).assertEqual(FormStage.REVIEWING);
      expect(session.confirm()).assertTrue();
      expect(session.currentStage()).assertEqual(FormStage.CONFIRMED);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0800
     * @tc.name      testFormSessionCases0008
     * @tc.desc      Verify confirmed rejects further edits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0008', 0, (): void => {
      const session: FormSession = new FormSession('simple-2');
      session.addField(new FormField('title', '标题', true, 20));
      session.setValue('title', '报销');
      session.confirm();
      expect(session.setValue('title', '改后')).assertFalse();
      expect(session.valueOf('title')).assertEqual('报销');
      expect(session.addRow(new FormRow('r1'))).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0900
     * @tc.name      testFormSessionCases0009
     * @tc.desc      Verify archive only after confirm
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0009', 0, (): void => {
      const session: FormSession = new FormSession('simple-3');
      session.addField(new FormField('title', '标题', true, 20));
      session.setValue('title', '报销');
      expect(session.archive()).assertFalse();
      session.confirm();
      expect(session.archive()).assertTrue();
      expect(session.currentStage()).assertEqual(FormStage.ARCHIVED);
      expect(session.reopen()).assertFalse();
      expect(session.canSubmit()).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_1000
     * @tc.name      testFormSessionCases0010
     * @tc.desc      Verify snapshot round trip restores fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0010', 0, (): void => {
      const session: FormSession = new FormSession('note-1');
      session.addField(new FormField('title', '标题', true, 20));
      session.setValue('title', '学习记录');
      const row: FormRow = new FormRow('r1');
      row.set('tag', '接口');
      session.addRow(row);
      const snapshot: FormSnapshot = session.snapshot();
      expect(snapshot.usable()).assertTrue();
      expect(snapshot.fieldKeys.length).assertEqual(1);
      expect(snapshot.rowIds.length).assertEqual(1);
      const restored: FormSession = new FormSession('');
      expect(restored.apply(snapshot)).assertTrue();
      expect(restored.valueOf('title')).assertEqual('学习记录');
      expect(restored.currentStage()).assertEqual(FormStage.EDITING);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_1100
     * @tc.name      testFormSessionCases0011
     * @tc.desc      Verify restore recomputes stage not confirmed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0011', 0, (): void => {
      const session: FormSession = new FormSession('simple-4');
      session.addField(new FormField('title', '标题', true, 20));
      session.setValue('title', '已提交');
      session.confirm();
      const snapshot: FormSnapshot = session.snapshot();
      expect(snapshot.stage.stage).assertEqual(FormStage.CONFIRMED);
      const restored: FormSession = new FormSession('');
      restored.apply(snapshot);
      expect(restored.currentStage()).assertEqual(FormStage.EDITING);
      expect(restored.canSubmit()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_1200
     * @tc.name      testFormSessionCases0012
     * @tc.desc      Verify invalid snapshot is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0012', 0, (): void => {
      const session: FormSession = new FormSession('x');
      const blank: FormSnapshot = new FormSnapshot();
      expect(blank.usable()).assertFalse();
      expect(session.apply(blank)).assertFalse();
      expect(formSummary(session).indexOf(localize('ac_formsession_005')) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_1300
     * @tc.name      testFormSessionCases0013
     * @tc.desc      Verify row accessors keep keys aligned
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFormSessionCases0013', 0, (): void => {
      const row: FormRow = new FormRow('r1');
      row.set('a', '1');
      row.set('b', '2');
      row.set('a', '3');
      expect(row.valueOf('a')).assertEqual('3');
      expect(row.valueOf('b')).assertEqual('2');
      expect(row.valueOf('c')).assertEqual('');
      expect(row.filled()).assertTrue();
      const empty: FormRow = new FormRow('r2');
      expect(empty.filled()).assertFalse();
      expect(empty.describe().indexOf('r2') >= 0).assertTrue();
    });
  });

  describe('MergePlanCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0100
     * @tc.name      testMergePlanCases0001
     * @tc.desc      Verify automatic choice follows history
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0001', 0, (): void => {
      const localOnly: FieldTriple = tripleOf('title', 'a', 'b', 'a');
      expect(localOnly.localChanged()).assertTrue();
      expect(localOnly.remoteChanged()).assertFalse();
      expect(localOnly.automaticChoice()).assertEqual(FieldChoice.LOCAL);
      const remoteOnly: FieldTriple = tripleOf('body', 'a', 'a', 'b');
      expect(remoteOnly.automaticChoice()).assertEqual(FieldChoice.REMOTE);
      const untouched: FieldTriple = tripleOf('tags', 'a', 'a', 'a');
      expect(untouched.automaticChoice()).assertEqual(FieldChoice.BASE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0200
     * @tc.name      testMergePlanCases0002
     * @tc.desc      Verify converged counts as local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0002', 0, (): void => {
      const triple: FieldTriple = tripleOf('tags', 'a', 'b', 'b');
      expect(triple.converged()).assertTrue();
      expect(triple.conflict()).assertFalse();
      expect(triple.automaticChoice()).assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0300
     * @tc.name      testMergePlanCases0003
     * @tc.desc      Verify true conflict needs manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0003', 0, (): void => {
      const triple: FieldTriple = tripleOf('tags', 'a', 'b', 'c');
      expect(triple.conflict()).assertTrue();
      expect(triple.automaticChoice()).assertEqual(FieldChoice.MANUAL);
      expect(triple.describe().indexOf('基线 a') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0400
     * @tc.name      testMergePlanCases0004
     * @tc.desc      Verify plan settles non conflicting fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0004', 0, (): void => {
      const triples: FieldTriple[] = [
        tripleOf('title', 'a', 'b', 'a'),
        tripleOf('body', 'a', 'a', 'c'),
        tripleOf('tags', 'a', 'b', 'c')
      ];
      const plan: MergePlan = planMerge(triples, true);
      expect(plan.decisions.length).assertEqual(3);
      expect(plan.settledCount()).assertEqual(2);
      expect(plan.conflictCount()).assertEqual(1);
      expect(plan.hasManual()).assertTrue();
      expect(conflictKeys(plan)[0]).assertEqual('tags');
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0500
     * @tc.name      testMergePlanCases0005
     * @tc.desc      Verify apply leaves pending keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0005', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('title', 'a', 'b', 'a'), tripleOf('tags', 'a', 'b', 'c')];
      const plan: MergePlan = planMerge(triples, true);
      const result: MergeResult = applyMerge(plan);
      expect(result.complete()).assertFalse();
      expect(result.pending.length).assertEqual(1);
      expect(result.valueOf('title')).assertEqual('b');
      expect(result.valueOf('tags')).assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0600
     * @tc.name      testMergePlanCases0006
     * @tc.desc      Verify choose resolves pending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0006', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('tags', 'a', 'b', 'c')];
      const plan: MergePlan = planMerge(triples, true);
      expect(plan.choose('tags', FieldChoice.REMOTE, 'c')).assertTrue();
      expect(plan.hasManual()).assertFalse();
      expect(applyMerge(plan).valueOf('tags')).assertEqual('c');
      expect(plan.choose('missing', FieldChoice.LOCAL, 'x')).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0700
     * @tc.name      testMergePlanCases0007
     * @tc.desc      Verify choose manual is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0007', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('tags', 'a', 'b', 'c')];
      const plan: MergePlan = planMerge(triples, true);
      expect(plan.choose('tags', FieldChoice.MANUAL, '')).assertFalse();
      expect(plan.hasManual()).assertTrue();
      expect(plan.decisionOf('tags') === undefined).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0800
     * @tc.name      testMergePlanCases0008
     * @tc.desc      Verify missing baseline forces manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0008', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('title', 'a', 'b', 'a'), tripleOf('tags', 'a', 'b', 'c')];
      const plan: MergePlan = planMerge(triples, false);
      expect(plan.hasManual()).assertTrue();
      expect(plan.settledCount()).assertEqual(0);
      expect(plan.decisions[0].reason.indexOf('缺少共同基线') >= 0).assertTrue();
      expect(plan.conflictCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0900
     * @tc.name      testMergePlanCases0009
     * @tc.desc      Verify resolve all settles every pending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0009', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('title', 'a', 'b', 'c'), tripleOf('tags', 'a', 'b', 'd')];
      const plan: MergePlan = planMerge(triples, true);
      expect(plan.hasManual()).assertTrue();
      expect(resolveAll(plan, triples, FieldChoice.REMOTE)).assertEqual(2);
      expect(plan.hasManual()).assertFalse();
      expect(applyMerge(plan).valueOf('title')).assertEqual('c');
      expect(applyMerge(plan).complete()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_1000
     * @tc.name      testMergePlanCases0010
     * @tc.desc      Verify stats and preview are readable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0010', 0, (): void => {
      const triples: FieldTriple[] = [
        tripleOf('title', 'a', 'b', 'a'),
        tripleOf('body', 'a', 'a', 'c'),
        tripleOf('tags', 'a', 'b', 'b'),
        tripleOf('note', 'a', 'b', 'c')
      ];
      const stats: string = tripleStats(triples);
      expect(stats.indexOf('仅本地改 1') >= 0).assertTrue();
      expect(stats.indexOf('仅对端改 1') >= 0).assertTrue();
      expect(stats.indexOf('双方一致 1') >= 0).assertTrue();
      expect(stats.indexOf('真冲突 1') >= 0).assertTrue();
      const plan: MergePlan = planMerge(triples, true);
      expect(previewLines(plan)[0].indexOf('共 4 个字段') >= 0).assertTrue();
      expect(previewLines(plan).length >= 6).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_1100
     * @tc.name      testMergePlanCases0011
     * @tc.desc      Verify empty plan is honest
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testMergePlanCases0011', 0, (): void => {
      const plan: MergePlan = planMerge([], true);
      expect(plan.decisions.length).assertEqual(0);
      expect(plan.hasManual()).assertFalse();
      expect(previewLines(plan)[0]).assertEqual('没有可合并的字段');
    });
  });

  describe('RecoveryPlanCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0100
     * @tc.name      testRecoveryPlanCases0001
     * @tc.desc      Verify rule table has twelve codes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testRecoveryPlanCases0001', 0, (): void => {
      expect(RECOVERY_RULES.length).assertEqual(12);
      expect(recoveryLines().length).assertEqual(12);
      RECOVERY_RULES.forEach((rule): void => {
        expect(rule.code.length).assertEqual(5);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0200
     * @tc.name      testRecoveryPlanCases0002
     * @tc.desc      Verify target missing with cache rolls back
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0002', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.TARGET_MISSING, true, false, true));
      expect(decision.code).assertEqual('RC-01');
      expect(decision.action).assertEqual(RecoveryAction.ROLLBACK);
      expect(decision.lossy).assertFalse();
      expect(decision.actionable()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0300
     * @tc.name      testRecoveryPlanCases0003
     * @tc.desc      Verify target missing without cache retries once
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0003', 0, (): void => {
      const first: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.TARGET_MISSING, false, false, true));
      expect(first.code).assertEqual('RC-10');
      expect(first.action).assertEqual(RecoveryAction.RETRY);
      const input: RecoveryInput = recoveryOf(RecoveryCase.TARGET_MISSING, false, false, true);
      input.retried = true;
      const second: RecoveryDecision = planRecovery(input);
      expect(second.code).assertEqual('RC-02');
      expect(second.action).assertEqual(RecoveryAction.EXPORT_THEN_RESET);
      expect(second.lossy).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0400
     * @tc.name      testRecoveryPlanCases0004
     * @tc.desc      Verify version changed keeps local when clean
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0004', 0, (): void => {
      const input: RecoveryInput = recoveryOf(RecoveryCase.VERSION_CHANGED, false, false, true);
      input.remoteNewer = true;
      const decision: RecoveryDecision = planRecovery(input);
      expect(decision.code).assertEqual('RC-03');
      expect(decision.action).assertEqual(RecoveryAction.KEEP_LOCAL);
      expect(decision.userText.indexOf('不覆盖对端') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0500
     * @tc.name      testRecoveryPlanCases0005
     * @tc.desc      Verify version changed asks user when dirty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0005', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.VERSION_CHANGED, false, true, true));
      expect(decision.code).assertEqual('RC-04');
      expect(decision.action).assertEqual(RecoveryAction.ASK_USER);
      const input: RecoveryInput = recoveryOf(RecoveryCase.VERSION_CHANGED, false, true, true);
      input.retried = true;
      expect(planRecovery(input).code).assertEqual('RC-03');
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0600
     * @tc.name      testRecoveryPlanCases0006
     * @tc.desc      Verify version changed refetches when not newer
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0006', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.VERSION_CHANGED, false, false, true));
      expect(decision.code).assertEqual('RC-12');
      expect(decision.action).assertEqual(RecoveryAction.RETRY);
      expect(decision.mustReread).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0700
     * @tc.name      testRecoveryPlanCases0007
     * @tc.desc      Verify write uncertain reads back first
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0007', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.WRITE_UNCERTAIN, true, false, true));
      expect(decision.code).assertEqual('RC-05');
      expect(decision.mustReread).assertTrue();
      expect(decision.action).assertEqual(RecoveryAction.RETRY);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0800
     * @tc.name      testRecoveryPlanCases0008
     * @tc.desc      Verify write uncertain without reread asks user
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0008', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.WRITE_UNCERTAIN, false, false, false));
      expect(decision.code).assertEqual('RC-06');
      expect(decision.action).assertEqual(RecoveryAction.ASK_USER);
      expect(decision.lossy).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0900
     * @tc.name      testRecoveryPlanCases0009
     * @tc.desc      Verify write uncertain with dirty exports
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0009', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.WRITE_UNCERTAIN, true, true, true));
      expect(decision.code).assertEqual('RC-11');
      expect(decision.action).assertEqual(RecoveryAction.EXPORT_THEN_RESET);
      expect(decision.lossy).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_1000
     * @tc.name      testRecoveryPlanCases0010
     * @tc.desc      Verify stale receipt is ignored unless higher
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0010', 0, (): void => {
      const ignored: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.STALE_RECEIPT, false, false, true));
      expect(ignored.code).assertEqual('RC-07');
      expect(ignored.actionable()).assertFalse();
      const input: RecoveryInput = recoveryOf(RecoveryCase.STALE_RECEIPT, false, false, true);
      input.receiptHigher = true;
      const asked: RecoveryDecision = planRecovery(input);
      expect(asked.code).assertEqual('RC-08');
      expect(asked.action).assertEqual(RecoveryAction.ASK_USER);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_1100
     * @tc.name      testRecoveryPlanCases0011
     * @tc.desc      Verify no failure returns silent decision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0011', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.NONE, false, false, true));
      expect(decision.code).assertEqual('RC-09');
      expect(decision.actionable()).assertFalse();
      expect(recoverySummary(decision)).assertEqual('当前没有需要处置的恢复失败');
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_1200
     * @tc.name      testRecoveryPlanCases0012
     * @tc.desc      Verify helpers expose risk and actions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRecoveryPlanCases0012', 0, (): void => {
      expect(requiresReread(RecoveryCase.WRITE_UNCERTAIN)).assertTrue();
      expect(requiresReread(RecoveryCase.STALE_RECEIPT)).assertFalse();
      expect(hasLossyAction(RecoveryCase.TARGET_MISSING)).assertTrue();
      expect(hasLossyAction(RecoveryCase.VERSION_CHANGED)).assertFalse();
      expect(actionsOf(RecoveryCase.TARGET_MISSING).length).assertEqual(3);
      const summary: string = recoverySummary(planRecovery(recoveryOf(RecoveryCase.WRITE_UNCERTAIN, true, true, true)));
      expect(summary.indexOf('可能丢失未保存内容') >= 0).assertTrue();
    });
  });
}
