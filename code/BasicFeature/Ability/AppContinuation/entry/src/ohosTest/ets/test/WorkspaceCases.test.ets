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
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0001
     * @tc.desc      Verify rule table covers three kinds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0001', 0, (): void => {
      loggedExpect(DOC_RULES.length, 'WorkspaceCases.test.ets:A0001', BUNDLE + '_DocumentWorkspaceCases_0001').assertEqual(12);
      loggedExpect(docLines().length, 'WorkspaceCases.test.ets:A0002', BUNDLE + '_DocumentWorkspaceCases_0001').assertEqual(12);
      loggedExpect(multiSlotKinds().length, 'WorkspaceCases.test.ets:A0003', BUNDLE + '_DocumentWorkspaceCases_0001').assertEqual(3);
      DOC_RULES.forEach((rule: DocRule): void => {
        loggedExpect(rule.code.length > 0, 'WorkspaceCases.test.ets:A0004', BUNDLE + '_DocumentWorkspaceCases_0001').assertTrue();
        loggedExpect(rule.note.length > 0, 'WorkspaceCases.test.ets:A0005', BUNDLE + '_DocumentWorkspaceCases_0001').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0200
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0002
     * @tc.desc      Verify open and switch keep active slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0002', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      loggedExpect(workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3)), 'WorkspaceCases.test.ets:A0006', BUNDLE + '_DocumentWorkspaceCases_0002').assertTrue();
      loggedExpect(workspace.open(slotOf('read-1', DocKind.READING, '阅读进度', 7)), 'WorkspaceCases.test.ets:A0007', BUNDLE + '_DocumentWorkspaceCases_0002').assertTrue();
      loggedExpect(workspace.activeSlotId(), 'WorkspaceCases.test.ets:A0008', BUNDLE + '_DocumentWorkspaceCases_0002').assertEqual('read-1');
      loggedExpect(workspace.switchTo('note-1'), 'WorkspaceCases.test.ets:A0009', BUNDLE + '_DocumentWorkspaceCases_0002').assertTrue();
      loggedExpect(workspace.activeSlotId(), 'WorkspaceCases.test.ets:A0010', BUNDLE + '_DocumentWorkspaceCases_0002').assertEqual('note-1');
      loggedExpect(workspace.allSlots().length, 'WorkspaceCases.test.ets:A0011', BUNDLE + '_DocumentWorkspaceCases_0002').assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0300
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0003
     * @tc.desc      Verify unknown switch is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0003', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      loggedExpect(workspace.switchTo('note-x'), 'WorkspaceCases.test.ets:A0012', BUNDLE + '_DocumentWorkspaceCases_0003').assertFalse();
      loggedExpect(workspace.activeSlotId(), 'WorkspaceCases.test.ets:A0013', BUNDLE + '_DocumentWorkspaceCases_0003').assertEqual('note-1');
      loggedExpect(workspace.switchTo('note-1'), 'WorkspaceCases.test.ets:A0014', BUNDLE + '_DocumentWorkspaceCases_0003').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0400
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0004
     * @tc.desc      Verify empty identifier is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0004', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      const blank: DocumentSlot = new DocumentSlot('', DocKind.NOTE, '无标识');
      loggedExpect(blank.usable(), 'WorkspaceCases.test.ets:A0015', BUNDLE + '_DocumentWorkspaceCases_0004').assertFalse();
      loggedExpect(workspace.open(blank), 'WorkspaceCases.test.ets:A0016', BUNDLE + '_DocumentWorkspaceCases_0004').assertFalse();
      loggedExpect(workspace.allSlots().length, 'WorkspaceCases.test.ets:A0017', BUNDLE + '_DocumentWorkspaceCases_0004').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0500
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0005
     * @tc.desc      Verify single slot kind rejects second instance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0005', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      loggedExpect(workspace.canOpen(DocKind.FORM), 'WorkspaceCases.test.ets:A0018', BUNDLE + '_DocumentWorkspaceCases_0005').assertTrue();
      loggedExpect(workspace.open(slotOf('form-1', DocKind.FORM, '报销单', 1)), 'WorkspaceCases.test.ets:A0019', BUNDLE + '_DocumentWorkspaceCases_0005').assertTrue();
      loggedExpect(workspace.canOpen(DocKind.FORM), 'WorkspaceCases.test.ets:A0020', BUNDLE + '_DocumentWorkspaceCases_0005').assertFalse();
      loggedExpect(workspace.open(slotOf('form-2', DocKind.FORM, '第二份报销单', 1)), 'WorkspaceCases.test.ets:A0021', BUNDLE + '_DocumentWorkspaceCases_0005').assertFalse();
      loggedExpect(workspace.countOf(DocKind.FORM), 'WorkspaceCases.test.ets:A0022', BUNDLE + '_DocumentWorkspaceCases_0005').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0600
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0006
     * @tc.desc      Verify reopen same slot updates revision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0006', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      loggedExpect(workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录（改）', 5)), 'WorkspaceCases.test.ets:A0023', BUNDLE + '_DocumentWorkspaceCases_0006').assertTrue();
      loggedExpect(workspace.allSlots().length, 'WorkspaceCases.test.ets:A0024', BUNDLE + '_DocumentWorkspaceCases_0006').assertEqual(1);
      const active = workspace.active();
      loggedExpect(active === undefined, 'WorkspaceCases.test.ets:A0025', BUNDLE + '_DocumentWorkspaceCases_0006').assertFalse();
      loggedExpect(active === undefined ? 0 : active.revision, 'WorkspaceCases.test.ets:A0026', BUNDLE + '_DocumentWorkspaceCases_0006').assertEqual(5);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0700
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0007
     * @tc.desc      Verify archive clears active and restorable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0007', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      loggedExpect(workspace.archive('note-1'), 'WorkspaceCases.test.ets:A0027', BUNDLE + '_DocumentWorkspaceCases_0007').assertTrue();
      loggedExpect(workspace.activeSlotId(), 'WorkspaceCases.test.ets:A0028', BUNDLE + '_DocumentWorkspaceCases_0007').assertEqual('');
      loggedExpect(workspace.archivedSlots().length, 'WorkspaceCases.test.ets:A0029', BUNDLE + '_DocumentWorkspaceCases_0007').assertEqual(1);
      loggedExpect(workspace.activeSlots().length, 'WorkspaceCases.test.ets:A0030', BUNDLE + '_DocumentWorkspaceCases_0007').assertEqual(0);
      loggedExpect(workspace.restore('note-1'), 'WorkspaceCases.test.ets:A0031', BUNDLE + '_DocumentWorkspaceCases_0007').assertTrue();
      loggedExpect(workspace.activeSlots().length, 'WorkspaceCases.test.ets:A0032', BUNDLE + '_DocumentWorkspaceCases_0007').assertEqual(1);
      loggedExpect(workspace.activeSlotId(), 'WorkspaceCases.test.ets:A0033', BUNDLE + '_DocumentWorkspaceCases_0007').assertEqual('note-1');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0800
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0008
     * @tc.desc      Verify archive twice is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0008', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      loggedExpect(workspace.archive('note-1'), 'WorkspaceCases.test.ets:A0034', BUNDLE + '_DocumentWorkspaceCases_0008').assertTrue();
      loggedExpect(workspace.archive('note-1'), 'WorkspaceCases.test.ets:A0035', BUNDLE + '_DocumentWorkspaceCases_0008').assertFalse();
      loggedExpect(workspace.restore('note-x'), 'WorkspaceCases.test.ets:A0036', BUNDLE + '_DocumentWorkspaceCases_0008').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0900
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0009
     * @tc.desc      Verify close removes slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0009', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.open(slotOf('read-1', DocKind.READING, '阅读进度', 1));
      loggedExpect(workspace.close('note-1'), 'WorkspaceCases.test.ets:A0037', BUNDLE + '_DocumentWorkspaceCases_0009').assertTrue();
      loggedExpect(workspace.allSlots().length, 'WorkspaceCases.test.ets:A0038', BUNDLE + '_DocumentWorkspaceCases_0009').assertEqual(1);
      loggedExpect(workspace.close('note-1'), 'WorkspaceCases.test.ets:A0039', BUNDLE + '_DocumentWorkspaceCases_0009').assertFalse();
      loggedExpect(workspace.activeSlotId(), 'WorkspaceCases.test.ets:A0040', BUNDLE + '_DocumentWorkspaceCases_0009').assertEqual('read-1');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_1000
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0010
     * @tc.desc      Verify isolation rejects three mismatches
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0010', 0, (): void => {
      const slot: DocumentSlot = slotOf('note-1', DocKind.NOTE, '学习记录', 3);
      loggedExpect(checkIsolation(slot, DocKind.NOTE, 'app.continuation', 3).length, 'WorkspaceCases.test.ets:A0041', BUNDLE + '_DocumentWorkspaceCases_0010').assertEqual(0);
      const kindMismatch: string[] = checkIsolation(slot, DocKind.FORM, 'app.continuation', 3);
      loggedExpect(kindMismatch.length, 'WorkspaceCases.test.ets:A0042', BUNDLE + '_DocumentWorkspaceCases_0010').assertEqual(1);
      loggedExpect(kindMismatch[0].indexOf('类别不一致') >= 0, 'WorkspaceCases.test.ets:A0043', BUNDLE + '_DocumentWorkspaceCases_0010').assertTrue();
      const appMismatch: string[] = checkIsolation(slot, DocKind.NOTE, 'other.app', 3);
      loggedExpect(appMismatch.length, 'WorkspaceCases.test.ets:A0044', BUNDLE + '_DocumentWorkspaceCases_0010').assertEqual(1);
      loggedExpect(appMismatch[0].indexOf('来源应用不一致') >= 0, 'WorkspaceCases.test.ets:A0045', BUNDLE + '_DocumentWorkspaceCases_0010').assertTrue();
      const revisionMismatch: string[] = checkIsolation(slot, DocKind.NOTE, 'app.continuation', 2);
      loggedExpect(revisionMismatch.length, 'WorkspaceCases.test.ets:A0046', BUNDLE + '_DocumentWorkspaceCases_0010').assertEqual(1);
      loggedExpect(revisionMismatch[0].indexOf('修订号回退') >= 0, 'WorkspaceCases.test.ets:A0047', BUNDLE + '_DocumentWorkspaceCases_0010').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_1100
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0011
     * @tc.desc      Verify audit reports duplicates and findings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0011', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      const audit: WorkspaceAudit = workspace.audit();
      loggedExpect(audit.ok(), 'WorkspaceCases.test.ets:A0048', BUNDLE + '_DocumentWorkspaceCases_0011').assertTrue();
      loggedExpect(audit.active, 'WorkspaceCases.test.ets:A0049', BUNDLE + '_DocumentWorkspaceCases_0011').assertEqual(1);
      loggedExpect(audit.archived, 'WorkspaceCases.test.ets:A0050', BUNDLE + '_DocumentWorkspaceCases_0011').assertEqual(0);
      loggedExpect(audit.summary().indexOf('工作区正常') >= 0, 'WorkspaceCases.test.ets:A0051', BUNDLE + '_DocumentWorkspaceCases_0011').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTWORKSPACECASES_1200
     * @tc.name      com.samples.appcontinuation_DocumentWorkspaceCases_0012
     * @tc.desc      Verify workspace lines always have summary
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(BUNDLE + '_DocumentWorkspaceCases_0012', 0, (): void => {
      const empty: DocumentWorkspace = new DocumentWorkspace();
      loggedExpect(workspaceLines(empty)[0].indexOf('工作区正常') >= 0, 'WorkspaceCases.test.ets:A0052', BUNDLE + '_DocumentWorkspaceCases_0012').assertTrue();
      loggedExpect(workspaceLines(empty)[1], 'WorkspaceCases.test.ets:A0053', BUNDLE + '_DocumentWorkspaceCases_0012').assertEqual('没有进行中的可接续对象');
      const filled: DocumentWorkspace = new DocumentWorkspace();
      filled.open(slotOf('note-1', DocKind.NOTE, '学习记录', 3));
      filled.archive('note-1');
      loggedExpect(workspaceLines(filled).length >= 3, 'WorkspaceCases.test.ets:A0054', BUNDLE + '_DocumentWorkspaceCases_0012').assertTrue();
      loggedExpect(filled.keepsDraft(DocKind.FORM), 'WorkspaceCases.test.ets:A0055', BUNDLE + '_DocumentWorkspaceCases_0012').assertTrue();
      loggedExpect(filled.keepsDraft(DocKind.READING), 'WorkspaceCases.test.ets:A0056', BUNDLE + '_DocumentWorkspaceCases_0012').assertFalse();
    });
  });

  describe('FormSessionCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0100
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0001
     * @tc.desc      Verify branch table has five rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0001', 0, (): void => {
      loggedExpect(BRANCH_RULES.length, 'WorkspaceCases.test.ets:A0057', BUNDLE + '_FormSessionCases_0001').assertEqual(5);
      loggedExpect(branchLines().length, 'WorkspaceCases.test.ets:A0058', BUNDLE + '_FormSessionCases_0001').assertEqual(5);
      BRANCH_RULES.forEach((rule: BranchRule): void => {
        loggedExpect(rule.revealsFields.length > 0, 'WorkspaceCases.test.ets:A0059', BUNDLE + '_FormSessionCases_0001').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0200
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0002
     * @tc.desc      Verify field refresh distinguishes three states
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0002', 0, (): void => {
      const field: FormField = new FormField('amount', '金额', true, 4);
      loggedExpect(field.state, 'WorkspaceCases.test.ets:A0060', BUNDLE + '_FormSessionCases_0002').assertEqual(FieldState.EMPTY);
      field.value = '12';
      field.refresh();
      loggedExpect(field.state, 'WorkspaceCases.test.ets:A0061', BUNDLE + '_FormSessionCases_0002').assertEqual(FieldState.FILLED);
      field.value = '123456';
      field.refresh();
      loggedExpect(field.state, 'WorkspaceCases.test.ets:A0062', BUNDLE + '_FormSessionCases_0002').assertEqual(FieldState.INVALID);
      loggedExpect(field.blocking(), 'WorkspaceCases.test.ets:A0063', BUNDLE + '_FormSessionCases_0002').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0300
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0003
     * @tc.desc      Verify optional empty field does not block
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0003', 0, (): void => {
      const field: FormField = new FormField('remark', '备注', false, 10);
      field.refresh();
      loggedExpect(field.blocking(), 'WorkspaceCases.test.ets:A0064', BUNDLE + '_FormSessionCases_0003').assertFalse();
      field.value = '说明';
      field.refresh();
      loggedExpect(field.blocking(), 'WorkspaceCases.test.ets:A0065', BUNDLE + '_FormSessionCases_0003').assertFalse();
      loggedExpect(field.describe().indexOf('备注') >= 0, 'WorkspaceCases.test.ets:A0066', BUNDLE + '_FormSessionCases_0003').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0400
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0004
     * @tc.desc      Verify branch reveals only triggered fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0004', 0, (): void => {
      const session: FormSession = new FormSession('expense-1');
      const kind: FormField = new FormField('kind', '类型', true, 8);
      session.addField(kind);
      const budget: FormField = new FormField('budget', '预算科目', true, 16);
      budget.visibleWhen = ['budget'];
      session.addField(budget);
      const remark: FormField = new FormField('remark', '备注', false, 60);
      remark.visibleWhen = ['remark'];
      session.addField(remark);
      loggedExpect(session.visibleFields().length, 'WorkspaceCases.test.ets:A0067', BUNDLE + '_FormSessionCases_0004').assertEqual(1);
      loggedExpect(session.setValue('kind', '采购'), 'WorkspaceCases.test.ets:A0068', BUNDLE + '_FormSessionCases_0004').assertTrue();
      loggedExpect(session.visibleFields().length, 'WorkspaceCases.test.ets:A0069', BUNDLE + '_FormSessionCases_0004').assertEqual(2);
      loggedExpect(session.activeBranches().length, 'WorkspaceCases.test.ets:A0070', BUNDLE + '_FormSessionCases_0004').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0500
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0005
     * @tc.desc      Verify required row blocks submit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0005', 0, (): void => {
      const session: FormSession = new FormSession('purchase-1');
      session.addField(new FormField('kind', '类型', true, 8));
      session.setValue('kind', '采购');
      loggedExpect(session.missingRows().length, 'WorkspaceCases.test.ets:A0071', BUNDLE + '_FormSessionCases_0005').assertEqual(1);
      loggedExpect(session.canSubmit(), 'WorkspaceCases.test.ets:A0072', BUNDLE + '_FormSessionCases_0005').assertFalse();
      const row: FormRow = new FormRow('r1');
      session.addRow(row);
      loggedExpect(session.missingRows().length, 'WorkspaceCases.test.ets:A0073', BUNDLE + '_FormSessionCases_0005').assertEqual(1);
      row.set('name', '电脑');
      loggedExpect(session.missingRows().length, 'WorkspaceCases.test.ets:A0074', BUNDLE + '_FormSessionCases_0005').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0600
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0006
     * @tc.desc      Verify progress counts only visible fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0006', 0, (): void => {
      const session: FormSession = new FormSession('leave-1');
      session.addField(new FormField('kind', '类型', true, 8));
      const start: FormField = new FormField('startDate', '开始', true, 10);
      start.visibleWhen = ['startDate'];
      session.addField(start);
      session.setValue('kind', '请假');
      loggedExpect(session.progressPercent(), 'WorkspaceCases.test.ets:A0075', BUNDLE + '_FormSessionCases_0006').assertEqual(50);
      session.setValue('startDate', '2025-01-01');
      loggedExpect(session.progressPercent(), 'WorkspaceCases.test.ets:A0076', BUNDLE + '_FormSessionCases_0006').assertEqual(100);
      loggedExpect(session.filledCount(), 'WorkspaceCases.test.ets:A0077', BUNDLE + '_FormSessionCases_0006').assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0700
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0007
     * @tc.desc      Verify confirm requires all blocking resolved
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0007', 0, (): void => {
      const session: FormSession = new FormSession('simple-1');
      session.addField(new FormField('title', '标题', true, 20));
      loggedExpect(session.canSubmit(), 'WorkspaceCases.test.ets:A0078', BUNDLE + '_FormSessionCases_0007').assertFalse();
      loggedExpect(session.confirm(), 'WorkspaceCases.test.ets:A0079', BUNDLE + '_FormSessionCases_0007').assertFalse();
      loggedExpect(session.review(), 'WorkspaceCases.test.ets:A0080', BUNDLE + '_FormSessionCases_0007').assertFalse();
      session.setValue('title', '报销');
      loggedExpect(session.review(), 'WorkspaceCases.test.ets:A0081', BUNDLE + '_FormSessionCases_0007').assertTrue();
      loggedExpect(session.currentStage(), 'WorkspaceCases.test.ets:A0082', BUNDLE + '_FormSessionCases_0007').assertEqual(FormStage.REVIEWING);
      loggedExpect(session.confirm(), 'WorkspaceCases.test.ets:A0083', BUNDLE + '_FormSessionCases_0007').assertTrue();
      loggedExpect(session.currentStage(), 'WorkspaceCases.test.ets:A0084', BUNDLE + '_FormSessionCases_0007').assertEqual(FormStage.CONFIRMED);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0800
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0008
     * @tc.desc      Verify confirmed rejects further edits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0008', 0, (): void => {
      const session: FormSession = new FormSession('simple-2');
      session.addField(new FormField('title', '标题', true, 20));
      session.setValue('title', '报销');
      session.confirm();
      loggedExpect(session.setValue('title', '改后'), 'WorkspaceCases.test.ets:A0085', BUNDLE + '_FormSessionCases_0008').assertFalse();
      loggedExpect(session.valueOf('title'), 'WorkspaceCases.test.ets:A0086', BUNDLE + '_FormSessionCases_0008').assertEqual('报销');
      loggedExpect(session.addRow(new FormRow('r1')), 'WorkspaceCases.test.ets:A0087', BUNDLE + '_FormSessionCases_0008').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_0900
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0009
     * @tc.desc      Verify archive only after confirm
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0009', 0, (): void => {
      const session: FormSession = new FormSession('simple-3');
      session.addField(new FormField('title', '标题', true, 20));
      session.setValue('title', '报销');
      loggedExpect(session.archive(), 'WorkspaceCases.test.ets:A0088', BUNDLE + '_FormSessionCases_0009').assertFalse();
      session.confirm();
      loggedExpect(session.archive(), 'WorkspaceCases.test.ets:A0089', BUNDLE + '_FormSessionCases_0009').assertTrue();
      loggedExpect(session.currentStage(), 'WorkspaceCases.test.ets:A0090', BUNDLE + '_FormSessionCases_0009').assertEqual(FormStage.ARCHIVED);
      loggedExpect(session.reopen(), 'WorkspaceCases.test.ets:A0091', BUNDLE + '_FormSessionCases_0009').assertFalse();
      loggedExpect(session.canSubmit(), 'WorkspaceCases.test.ets:A0092', BUNDLE + '_FormSessionCases_0009').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_1000
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0010
     * @tc.desc      Verify snapshot round trip restores fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0010', 0, (): void => {
      const session: FormSession = new FormSession('note-1');
      session.addField(new FormField('title', '标题', true, 20));
      session.setValue('title', '学习记录');
      const row: FormRow = new FormRow('r1');
      row.set('tag', '接口');
      session.addRow(row);
      const snapshot: FormSnapshot = session.snapshot();
      loggedExpect(snapshot.usable(), 'WorkspaceCases.test.ets:A0093', BUNDLE + '_FormSessionCases_0010').assertTrue();
      loggedExpect(snapshot.fieldKeys.length, 'WorkspaceCases.test.ets:A0094', BUNDLE + '_FormSessionCases_0010').assertEqual(1);
      loggedExpect(snapshot.rowIds.length, 'WorkspaceCases.test.ets:A0095', BUNDLE + '_FormSessionCases_0010').assertEqual(1);
      const restored: FormSession = new FormSession('');
      loggedExpect(restored.apply(snapshot), 'WorkspaceCases.test.ets:A0096', BUNDLE + '_FormSessionCases_0010').assertTrue();
      loggedExpect(restored.valueOf('title'), 'WorkspaceCases.test.ets:A0097', BUNDLE + '_FormSessionCases_0010').assertEqual('学习记录');
      loggedExpect(restored.currentStage(), 'WorkspaceCases.test.ets:A0098', BUNDLE + '_FormSessionCases_0010').assertEqual(FormStage.EDITING);
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_1100
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0011
     * @tc.desc      Verify restore recomputes stage not confirmed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0011', 0, (): void => {
      const session: FormSession = new FormSession('simple-4');
      session.addField(new FormField('title', '标题', true, 20));
      session.setValue('title', '已提交');
      session.confirm();
      const snapshot: FormSnapshot = session.snapshot();
      loggedExpect(snapshot.stage.stage, 'WorkspaceCases.test.ets:A0099', BUNDLE + '_FormSessionCases_0011').assertEqual(FormStage.CONFIRMED);
      const restored: FormSession = new FormSession('');
      restored.apply(snapshot);
      loggedExpect(restored.currentStage(), 'WorkspaceCases.test.ets:A0100', BUNDLE + '_FormSessionCases_0011').assertEqual(FormStage.EDITING);
      loggedExpect(restored.canSubmit(), 'WorkspaceCases.test.ets:A0101', BUNDLE + '_FormSessionCases_0011').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_1200
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0012
     * @tc.desc      Verify invalid snapshot is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0012', 0, (): void => {
      const session: FormSession = new FormSession('x');
      const blank: FormSnapshot = new FormSnapshot();
      loggedExpect(blank.usable(), 'WorkspaceCases.test.ets:A0102', BUNDLE + '_FormSessionCases_0012').assertFalse();
      loggedExpect(session.apply(blank), 'WorkspaceCases.test.ets:A0103', BUNDLE + '_FormSessionCases_0012').assertFalse();
      loggedExpect(formSummary(session).indexOf(localize('ac_formsession_005')) >= 0, 'WorkspaceCases.test.ets:A0104', BUNDLE + '_FormSessionCases_0012').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_FORMSESSIONCASES_1300
     * @tc.name      com.samples.appcontinuation_FormSessionCases_0013
     * @tc.desc      Verify row accessors keep keys aligned
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_FormSessionCases_0013', 0, (): void => {
      const row: FormRow = new FormRow('r1');
      row.set('a', '1');
      row.set('b', '2');
      row.set('a', '3');
      loggedExpect(row.valueOf('a'), 'WorkspaceCases.test.ets:A0105', BUNDLE + '_FormSessionCases_0013').assertEqual('3');
      loggedExpect(row.valueOf('b'), 'WorkspaceCases.test.ets:A0106', BUNDLE + '_FormSessionCases_0013').assertEqual('2');
      loggedExpect(row.valueOf('c'), 'WorkspaceCases.test.ets:A0107', BUNDLE + '_FormSessionCases_0013').assertEqual('');
      loggedExpect(row.filled(), 'WorkspaceCases.test.ets:A0108', BUNDLE + '_FormSessionCases_0013').assertTrue();
      const empty: FormRow = new FormRow('r2');
      loggedExpect(empty.filled(), 'WorkspaceCases.test.ets:A0109', BUNDLE + '_FormSessionCases_0013').assertFalse();
      loggedExpect(empty.describe().indexOf('r2') >= 0, 'WorkspaceCases.test.ets:A0110', BUNDLE + '_FormSessionCases_0013').assertTrue();
    });
  });

  describe('MergePlanCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0100
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0001
     * @tc.desc      Verify automatic choice follows history
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0001', 0, (): void => {
      const localOnly: FieldTriple = tripleOf('title', 'a', 'b', 'a');
      loggedExpect(localOnly.localChanged(), 'WorkspaceCases.test.ets:A0111', BUNDLE + '_MergePlanCases_0001').assertTrue();
      loggedExpect(localOnly.remoteChanged(), 'WorkspaceCases.test.ets:A0112', BUNDLE + '_MergePlanCases_0001').assertFalse();
      loggedExpect(localOnly.automaticChoice(), 'WorkspaceCases.test.ets:A0113', BUNDLE + '_MergePlanCases_0001').assertEqual(FieldChoice.LOCAL);
      const remoteOnly: FieldTriple = tripleOf('body', 'a', 'a', 'b');
      loggedExpect(remoteOnly.automaticChoice(), 'WorkspaceCases.test.ets:A0114', BUNDLE + '_MergePlanCases_0001').assertEqual(FieldChoice.REMOTE);
      const untouched: FieldTriple = tripleOf('tags', 'a', 'a', 'a');
      loggedExpect(untouched.automaticChoice(), 'WorkspaceCases.test.ets:A0115', BUNDLE + '_MergePlanCases_0001').assertEqual(FieldChoice.BASE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0200
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0002
     * @tc.desc      Verify converged counts as local
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0002', 0, (): void => {
      const triple: FieldTriple = tripleOf('tags', 'a', 'b', 'b');
      loggedExpect(triple.converged(), 'WorkspaceCases.test.ets:A0116', BUNDLE + '_MergePlanCases_0002').assertTrue();
      loggedExpect(triple.conflict(), 'WorkspaceCases.test.ets:A0117', BUNDLE + '_MergePlanCases_0002').assertFalse();
      loggedExpect(triple.automaticChoice(), 'WorkspaceCases.test.ets:A0118', BUNDLE + '_MergePlanCases_0002').assertEqual(FieldChoice.LOCAL);
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0300
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0003
     * @tc.desc      Verify true conflict needs manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0003', 0, (): void => {
      const triple: FieldTriple = tripleOf('tags', 'a', 'b', 'c');
      loggedExpect(triple.conflict(), 'WorkspaceCases.test.ets:A0119', BUNDLE + '_MergePlanCases_0003').assertTrue();
      loggedExpect(triple.automaticChoice(), 'WorkspaceCases.test.ets:A0120', BUNDLE + '_MergePlanCases_0003').assertEqual(FieldChoice.MANUAL);
      loggedExpect(triple.describe().indexOf('基线 a') >= 0, 'WorkspaceCases.test.ets:A0121', BUNDLE + '_MergePlanCases_0003').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0400
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0004
     * @tc.desc      Verify plan settles non conflicting fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0004', 0, (): void => {
      const triples: FieldTriple[] = [
        tripleOf('title', 'a', 'b', 'a'),
        tripleOf('body', 'a', 'a', 'c'),
        tripleOf('tags', 'a', 'b', 'c')
      ];
      const plan: MergePlan = planMerge(triples, true);
      loggedExpect(plan.decisions.length, 'WorkspaceCases.test.ets:A0122', BUNDLE + '_MergePlanCases_0004').assertEqual(3);
      loggedExpect(plan.settledCount(), 'WorkspaceCases.test.ets:A0123', BUNDLE + '_MergePlanCases_0004').assertEqual(2);
      loggedExpect(plan.conflictCount(), 'WorkspaceCases.test.ets:A0124', BUNDLE + '_MergePlanCases_0004').assertEqual(1);
      loggedExpect(plan.hasManual(), 'WorkspaceCases.test.ets:A0125', BUNDLE + '_MergePlanCases_0004').assertTrue();
      loggedExpect(conflictKeys(plan)[0], 'WorkspaceCases.test.ets:A0126', BUNDLE + '_MergePlanCases_0004').assertEqual('tags');
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0500
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0005
     * @tc.desc      Verify apply leaves pending keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0005', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('title', 'a', 'b', 'a'), tripleOf('tags', 'a', 'b', 'c')];
      const plan: MergePlan = planMerge(triples, true);
      const result: MergeResult = applyMerge(plan);
      loggedExpect(result.complete(), 'WorkspaceCases.test.ets:A0127', BUNDLE + '_MergePlanCases_0005').assertFalse();
      loggedExpect(result.pending.length, 'WorkspaceCases.test.ets:A0128', BUNDLE + '_MergePlanCases_0005').assertEqual(1);
      loggedExpect(result.valueOf('title'), 'WorkspaceCases.test.ets:A0129', BUNDLE + '_MergePlanCases_0005').assertEqual('b');
      loggedExpect(result.valueOf('tags'), 'WorkspaceCases.test.ets:A0130', BUNDLE + '_MergePlanCases_0005').assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0600
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0006
     * @tc.desc      Verify choose resolves pending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0006', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('tags', 'a', 'b', 'c')];
      const plan: MergePlan = planMerge(triples, true);
      loggedExpect(plan.choose('tags', FieldChoice.REMOTE, 'c'), 'WorkspaceCases.test.ets:A0131', BUNDLE + '_MergePlanCases_0006').assertTrue();
      loggedExpect(plan.hasManual(), 'WorkspaceCases.test.ets:A0132', BUNDLE + '_MergePlanCases_0006').assertFalse();
      loggedExpect(applyMerge(plan).valueOf('tags'), 'WorkspaceCases.test.ets:A0133', BUNDLE + '_MergePlanCases_0006').assertEqual('c');
      loggedExpect(plan.choose('missing', FieldChoice.LOCAL, 'x'), 'WorkspaceCases.test.ets:A0134', BUNDLE + '_MergePlanCases_0006').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0700
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0007
     * @tc.desc      Verify choose manual is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0007', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('tags', 'a', 'b', 'c')];
      const plan: MergePlan = planMerge(triples, true);
      loggedExpect(plan.choose('tags', FieldChoice.MANUAL, ''), 'WorkspaceCases.test.ets:A0135', BUNDLE + '_MergePlanCases_0007').assertFalse();
      loggedExpect(plan.hasManual(), 'WorkspaceCases.test.ets:A0136', BUNDLE + '_MergePlanCases_0007').assertTrue();
      loggedExpect(plan.decisionOf('tags') === undefined, 'WorkspaceCases.test.ets:A0137', BUNDLE + '_MergePlanCases_0007').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0800
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0008
     * @tc.desc      Verify missing baseline forces manual
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0008', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('title', 'a', 'b', 'a'), tripleOf('tags', 'a', 'b', 'c')];
      const plan: MergePlan = planMerge(triples, false);
      loggedExpect(plan.hasManual(), 'WorkspaceCases.test.ets:A0138', BUNDLE + '_MergePlanCases_0008').assertTrue();
      loggedExpect(plan.settledCount(), 'WorkspaceCases.test.ets:A0139', BUNDLE + '_MergePlanCases_0008').assertEqual(0);
      loggedExpect(plan.decisions[0].reason.indexOf('缺少共同基线') >= 0, 'WorkspaceCases.test.ets:A0140', BUNDLE + '_MergePlanCases_0008').assertTrue();
      loggedExpect(plan.conflictCount(), 'WorkspaceCases.test.ets:A0141', BUNDLE + '_MergePlanCases_0008').assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_0900
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0009
     * @tc.desc      Verify resolve all settles every pending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0009', 0, (): void => {
      const triples: FieldTriple[] = [tripleOf('title', 'a', 'b', 'c'), tripleOf('tags', 'a', 'b', 'd')];
      const plan: MergePlan = planMerge(triples, true);
      loggedExpect(plan.hasManual(), 'WorkspaceCases.test.ets:A0142', BUNDLE + '_MergePlanCases_0009').assertTrue();
      loggedExpect(resolveAll(plan, triples, FieldChoice.REMOTE), 'WorkspaceCases.test.ets:A0143', BUNDLE + '_MergePlanCases_0009').assertEqual(2);
      loggedExpect(plan.hasManual(), 'WorkspaceCases.test.ets:A0144', BUNDLE + '_MergePlanCases_0009').assertFalse();
      loggedExpect(applyMerge(plan).valueOf('title'), 'WorkspaceCases.test.ets:A0145', BUNDLE + '_MergePlanCases_0009').assertEqual('c');
      loggedExpect(applyMerge(plan).complete(), 'WorkspaceCases.test.ets:A0146', BUNDLE + '_MergePlanCases_0009').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_1000
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0010
     * @tc.desc      Verify stats and preview are readable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0010', 0, (): void => {
      const triples: FieldTriple[] = [
        tripleOf('title', 'a', 'b', 'a'),
        tripleOf('body', 'a', 'a', 'c'),
        tripleOf('tags', 'a', 'b', 'b'),
        tripleOf('note', 'a', 'b', 'c')
      ];
      const stats: string = tripleStats(triples);
      loggedExpect(stats.indexOf('仅本地改 1') >= 0, 'WorkspaceCases.test.ets:A0147', BUNDLE + '_MergePlanCases_0010').assertTrue();
      loggedExpect(stats.indexOf('仅对端改 1') >= 0, 'WorkspaceCases.test.ets:A0148', BUNDLE + '_MergePlanCases_0010').assertTrue();
      loggedExpect(stats.indexOf('双方一致 1') >= 0, 'WorkspaceCases.test.ets:A0149', BUNDLE + '_MergePlanCases_0010').assertTrue();
      loggedExpect(stats.indexOf('真冲突 1') >= 0, 'WorkspaceCases.test.ets:A0150', BUNDLE + '_MergePlanCases_0010').assertTrue();
      const plan: MergePlan = planMerge(triples, true);
      loggedExpect(previewLines(plan)[0].indexOf('共 4 个字段') >= 0, 'WorkspaceCases.test.ets:A0151', BUNDLE + '_MergePlanCases_0010').assertTrue();
      loggedExpect(previewLines(plan).length >= 6, 'WorkspaceCases.test.ets:A0152', BUNDLE + '_MergePlanCases_0010').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_MERGEPLANCASES_1100
     * @tc.name      com.samples.appcontinuation_MergePlanCases_0011
     * @tc.desc      Verify empty plan is honest
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_MergePlanCases_0011', 0, (): void => {
      const plan: MergePlan = planMerge([], true);
      loggedExpect(plan.decisions.length, 'WorkspaceCases.test.ets:A0153', BUNDLE + '_MergePlanCases_0011').assertEqual(0);
      loggedExpect(plan.hasManual(), 'WorkspaceCases.test.ets:A0154', BUNDLE + '_MergePlanCases_0011').assertFalse();
      loggedExpect(previewLines(plan)[0], 'WorkspaceCases.test.ets:A0155', BUNDLE + '_MergePlanCases_0011').assertEqual('没有可合并的字段');
    });
  });

  describe('RecoveryPlanCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0100
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0001
     * @tc.desc      Verify rule table has twelve codes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_RecoveryPlanCases_0001', 0, (): void => {
      loggedExpect(RECOVERY_RULES.length, 'WorkspaceCases.test.ets:A0156', BUNDLE + '_RecoveryPlanCases_0001').assertEqual(12);
      loggedExpect(recoveryLines().length, 'WorkspaceCases.test.ets:A0157', BUNDLE + '_RecoveryPlanCases_0001').assertEqual(12);
      RECOVERY_RULES.forEach((rule): void => {
        loggedExpect(rule.code.length, 'WorkspaceCases.test.ets:A0158', BUNDLE + '_RecoveryPlanCases_0001').assertEqual(5);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0200
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0002
     * @tc.desc      Verify target missing with cache rolls back
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0002', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.TARGET_MISSING, true, false, true));
      loggedExpect(decision.code, 'WorkspaceCases.test.ets:A0159', BUNDLE + '_RecoveryPlanCases_0002').assertEqual('RC-01');
      loggedExpect(decision.action, 'WorkspaceCases.test.ets:A0160', BUNDLE + '_RecoveryPlanCases_0002').assertEqual(RecoveryAction.ROLLBACK);
      loggedExpect(decision.lossy, 'WorkspaceCases.test.ets:A0161', BUNDLE + '_RecoveryPlanCases_0002').assertFalse();
      loggedExpect(decision.actionable(), 'WorkspaceCases.test.ets:A0162', BUNDLE + '_RecoveryPlanCases_0002').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0300
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0003
     * @tc.desc      Verify target missing without cache retries once
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0003', 0, (): void => {
      const first: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.TARGET_MISSING, false, false, true));
      loggedExpect(first.code, 'WorkspaceCases.test.ets:A0163', BUNDLE + '_RecoveryPlanCases_0003').assertEqual('RC-10');
      loggedExpect(first.action, 'WorkspaceCases.test.ets:A0164', BUNDLE + '_RecoveryPlanCases_0003').assertEqual(RecoveryAction.RETRY);
      const input: RecoveryInput = recoveryOf(RecoveryCase.TARGET_MISSING, false, false, true);
      input.retried = true;
      const second: RecoveryDecision = planRecovery(input);
      loggedExpect(second.code, 'WorkspaceCases.test.ets:A0165', BUNDLE + '_RecoveryPlanCases_0003').assertEqual('RC-02');
      loggedExpect(second.action, 'WorkspaceCases.test.ets:A0166', BUNDLE + '_RecoveryPlanCases_0003').assertEqual(RecoveryAction.EXPORT_THEN_RESET);
      loggedExpect(second.lossy, 'WorkspaceCases.test.ets:A0167', BUNDLE + '_RecoveryPlanCases_0003').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0400
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0004
     * @tc.desc      Verify version changed keeps local when clean
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0004', 0, (): void => {
      const input: RecoveryInput = recoveryOf(RecoveryCase.VERSION_CHANGED, false, false, true);
      input.remoteNewer = true;
      const decision: RecoveryDecision = planRecovery(input);
      loggedExpect(decision.code, 'WorkspaceCases.test.ets:A0168', BUNDLE + '_RecoveryPlanCases_0004').assertEqual('RC-03');
      loggedExpect(decision.action, 'WorkspaceCases.test.ets:A0169', BUNDLE + '_RecoveryPlanCases_0004').assertEqual(RecoveryAction.KEEP_LOCAL);
      loggedExpect(decision.userText.indexOf('不覆盖对端') >= 0, 'WorkspaceCases.test.ets:A0170', BUNDLE + '_RecoveryPlanCases_0004').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0500
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0005
     * @tc.desc      Verify version changed asks user when dirty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0005', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.VERSION_CHANGED, false, true, true));
      loggedExpect(decision.code, 'WorkspaceCases.test.ets:A0171', BUNDLE + '_RecoveryPlanCases_0005').assertEqual('RC-04');
      loggedExpect(decision.action, 'WorkspaceCases.test.ets:A0172', BUNDLE + '_RecoveryPlanCases_0005').assertEqual(RecoveryAction.ASK_USER);
      const input: RecoveryInput = recoveryOf(RecoveryCase.VERSION_CHANGED, false, true, true);
      input.retried = true;
      loggedExpect(planRecovery(input).code, 'WorkspaceCases.test.ets:A0173', BUNDLE + '_RecoveryPlanCases_0005').assertEqual('RC-03');
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0600
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0006
     * @tc.desc      Verify version changed refetches when not newer
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0006', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.VERSION_CHANGED, false, false, true));
      loggedExpect(decision.code, 'WorkspaceCases.test.ets:A0174', BUNDLE + '_RecoveryPlanCases_0006').assertEqual('RC-12');
      loggedExpect(decision.action, 'WorkspaceCases.test.ets:A0175', BUNDLE + '_RecoveryPlanCases_0006').assertEqual(RecoveryAction.RETRY);
      loggedExpect(decision.mustReread, 'WorkspaceCases.test.ets:A0176', BUNDLE + '_RecoveryPlanCases_0006').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0700
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0007
     * @tc.desc      Verify write uncertain reads back first
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0007', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.WRITE_UNCERTAIN, true, false, true));
      loggedExpect(decision.code, 'WorkspaceCases.test.ets:A0177', BUNDLE + '_RecoveryPlanCases_0007').assertEqual('RC-05');
      loggedExpect(decision.mustReread, 'WorkspaceCases.test.ets:A0178', BUNDLE + '_RecoveryPlanCases_0007').assertTrue();
      loggedExpect(decision.action, 'WorkspaceCases.test.ets:A0179', BUNDLE + '_RecoveryPlanCases_0007').assertEqual(RecoveryAction.RETRY);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0800
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0008
     * @tc.desc      Verify write uncertain without reread asks user
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0008', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.WRITE_UNCERTAIN, false, false, false));
      loggedExpect(decision.code, 'WorkspaceCases.test.ets:A0180', BUNDLE + '_RecoveryPlanCases_0008').assertEqual('RC-06');
      loggedExpect(decision.action, 'WorkspaceCases.test.ets:A0181', BUNDLE + '_RecoveryPlanCases_0008').assertEqual(RecoveryAction.ASK_USER);
      loggedExpect(decision.lossy, 'WorkspaceCases.test.ets:A0182', BUNDLE + '_RecoveryPlanCases_0008').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_0900
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0009
     * @tc.desc      Verify write uncertain with dirty exports
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0009', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.WRITE_UNCERTAIN, true, true, true));
      loggedExpect(decision.code, 'WorkspaceCases.test.ets:A0183', BUNDLE + '_RecoveryPlanCases_0009').assertEqual('RC-11');
      loggedExpect(decision.action, 'WorkspaceCases.test.ets:A0184', BUNDLE + '_RecoveryPlanCases_0009').assertEqual(RecoveryAction.EXPORT_THEN_RESET);
      loggedExpect(decision.lossy, 'WorkspaceCases.test.ets:A0185', BUNDLE + '_RecoveryPlanCases_0009').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_1000
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0010
     * @tc.desc      Verify stale receipt is ignored unless higher
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0010', 0, (): void => {
      const ignored: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.STALE_RECEIPT, false, false, true));
      loggedExpect(ignored.code, 'WorkspaceCases.test.ets:A0186', BUNDLE + '_RecoveryPlanCases_0010').assertEqual('RC-07');
      loggedExpect(ignored.actionable(), 'WorkspaceCases.test.ets:A0187', BUNDLE + '_RecoveryPlanCases_0010').assertFalse();
      const input: RecoveryInput = recoveryOf(RecoveryCase.STALE_RECEIPT, false, false, true);
      input.receiptHigher = true;
      const asked: RecoveryDecision = planRecovery(input);
      loggedExpect(asked.code, 'WorkspaceCases.test.ets:A0188', BUNDLE + '_RecoveryPlanCases_0010').assertEqual('RC-08');
      loggedExpect(asked.action, 'WorkspaceCases.test.ets:A0189', BUNDLE + '_RecoveryPlanCases_0010').assertEqual(RecoveryAction.ASK_USER);
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_1100
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0011
     * @tc.desc      Verify no failure returns silent decision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0011', 0, (): void => {
      const decision: RecoveryDecision = planRecovery(recoveryOf(RecoveryCase.NONE, false, false, true));
      loggedExpect(decision.code, 'WorkspaceCases.test.ets:A0190', BUNDLE + '_RecoveryPlanCases_0011').assertEqual('RC-09');
      loggedExpect(decision.actionable(), 'WorkspaceCases.test.ets:A0191', BUNDLE + '_RecoveryPlanCases_0011').assertFalse();
      loggedExpect(recoverySummary(decision), 'WorkspaceCases.test.ets:A0192', BUNDLE + '_RecoveryPlanCases_0011').assertEqual('当前没有需要处置的恢复失败');
    });

    /**
     * @tc.number    SUB_CONTINUATION_RECOVERYPLANCASES_1200
     * @tc.name      com.samples.appcontinuation_RecoveryPlanCases_0012
     * @tc.desc      Verify helpers expose risk and actions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_RecoveryPlanCases_0012', 0, (): void => {
      loggedExpect(requiresReread(RecoveryCase.WRITE_UNCERTAIN), 'WorkspaceCases.test.ets:A0193', BUNDLE + '_RecoveryPlanCases_0012').assertTrue();
      loggedExpect(requiresReread(RecoveryCase.STALE_RECEIPT), 'WorkspaceCases.test.ets:A0194', BUNDLE + '_RecoveryPlanCases_0012').assertFalse();
      loggedExpect(hasLossyAction(RecoveryCase.TARGET_MISSING), 'WorkspaceCases.test.ets:A0195', BUNDLE + '_RecoveryPlanCases_0012').assertTrue();
      loggedExpect(hasLossyAction(RecoveryCase.VERSION_CHANGED), 'WorkspaceCases.test.ets:A0196', BUNDLE + '_RecoveryPlanCases_0012').assertFalse();
      loggedExpect(actionsOf(RecoveryCase.TARGET_MISSING).length, 'WorkspaceCases.test.ets:A0197', BUNDLE + '_RecoveryPlanCases_0012').assertEqual(3);
      const summary: string = recoverySummary(planRecovery(recoveryOf(RecoveryCase.WRITE_UNCERTAIN, true, true, true)));
      loggedExpect(summary.indexOf('可能丢失未保存内容') >= 0, 'WorkspaceCases.test.ets:A0198', BUNDLE + '_RecoveryPlanCases_0012').assertTrue();
    });
  });
}
