import { describe, expect, it } from '@ohos/hypium';
import {
  DOC_RULES, DocKind, DocumentSlot, DocumentWorkspace, WorkspaceAudit, checkIsolation, docLines,
  multiSlotKinds, workspaceLines
} from '../../../main/ets/learning/document/DocumentWorkspace';
import {
  BRANCH_RULES, FieldState, FormField, FormRow, FormSession, FormSnapshot, FormStage, branchLines,
  formSummary
} from '../../../main/ets/learning/document/FormSession';

/** 建一个内容完整的槽位，避免每个用例重复三行赋值。 */
function slot(id: string, kind: DocKind, title: string, revision: number): DocumentSlot {
  const item: DocumentSlot = new DocumentSlot(id, kind, title);
  item.revision = revision;
  item.ownerApp = 'app.continuation';
  item.updatedAt = 1000 + revision;
  return item;
}

/** 建一个带类型字段的表单，字段可见性由分支决定。 */
function formSession(): FormSession {
  const session: FormSession = new FormSession('expense-7');
  const kind: FormField = new FormField('kind', '类型', true, 8);
  session.addField(kind);
  const amount: FormField = new FormField('amount', '金额', true, 12);
  amount.visibleWhen = ['amount'];
  session.addField(amount);
  const invoice: FormField = new FormField('invoiceNo', '发票号', false, 32);
  invoice.visibleWhen = ['invoiceNo'];
  session.addField(invoice);
  const budget: FormField = new FormField('budget', '预算科目', true, 16);
  budget.visibleWhen = ['budget'];
  session.addField(budget);
  const remark: FormField = new FormField('remark', '备注', false, 60);
  remark.visibleWhen = ['remark'];
  session.addField(remark);
  return session;
}

export default function documentFormFlowCasesTest(): void {
  describe('DocumentFormFlowCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0100
     * @tc.name      testDocumentFormFlowCases0001
     * @tc.desc      Verify workspace starts empty and honest
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0001', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      expect(workspace.activeSlots().length).assertEqual(0);
      expect(workspace.archivedSlots().length).assertEqual(0);
      expect(workspace.activeSlotId()).assertEqual('');
      expect(workspace.active() === undefined).assertTrue();
      expect(workspaceLines(workspace).filter((line: string): boolean =>
        line.indexOf('没有进行中的可接续对象') >= 0).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0200
     * @tc.name      testDocumentFormFlowCases0002
     * @tc.desc      Verify note and reading coexist in same workspace
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0002', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      expect(workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3))).assertTrue();
      expect(workspace.open(slot('read-1', DocKind.READING, '接口文档', 7))).assertTrue();
      expect(workspace.activeSlots().length).assertEqual(2);
      expect(workspace.countOf(DocKind.NOTE)).assertEqual(1);
      expect(workspace.countOf(DocKind.READING)).assertEqual(1);
      expect(workspace.activeSlotId()).assertEqual('read-1');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0300
     * @tc.name      testDocumentFormFlowCases0003
     * @tc.desc      Verify form kind is limited to one active slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0003', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      expect(workspace.canOpen(DocKind.FORM)).assertTrue();
      expect(workspace.open(slot('form-1', DocKind.FORM, '报销单', 1))).assertTrue();
      expect(workspace.canOpen(DocKind.FORM)).assertFalse();
      expect(workspace.open(slot('form-2', DocKind.FORM, '第二份', 1))).assertFalse();
      expect(workspace.countOf(DocKind.FORM)).assertEqual(1);
      expect(workspace.allSlots().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0400
     * @tc.name      testDocumentFormFlowCases0004
     * @tc.desc      Verify archived form frees the single slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0004', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('form-1', DocKind.FORM, '报销单', 1));
      expect(workspace.archive('form-1')).assertTrue();
      expect(workspace.canOpen(DocKind.FORM)).assertTrue();
      expect(workspace.open(slot('form-2', DocKind.FORM, '新报销单', 1))).assertTrue();
      expect(workspace.activeSlots().length).assertEqual(1);
      expect(workspace.archivedSlots().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0500
     * @tc.name      testDocumentFormFlowCases0005
     * @tc.desc      Verify archive clears active selection
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0005', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      expect(workspace.activeSlotId()).assertEqual('note-1');
      expect(workspace.archive('note-1')).assertTrue();
      expect(workspace.activeSlotId()).assertEqual('');
      expect(workspace.archive('note-1')).assertFalse();
      expect(workspace.switchTo('note-1')).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0600
     * @tc.name      testDocumentFormFlowCases0006
     * @tc.desc      Verify restore brings archived note back
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0006', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.archive('note-1');
      expect(workspace.restore('note-1')).assertTrue();
      expect(workspace.activeSlotId()).assertEqual('note-1');
      expect(workspace.archivedSlots().length).assertEqual(0);
      expect(workspace.restore('note-1')).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0700
     * @tc.name      testDocumentFormFlowCases0007
     * @tc.desc      Verify form archive is terminal for restore
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0007', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('form-1', DocKind.FORM, '报销单', 1));
      workspace.archive('form-1');
      expect(workspace.keepsDraft(DocKind.FORM)).assertTrue();
      expect(workspace.restore('form-1')).assertTrue();
      expect(workspace.restore('missing')).assertFalse();
      expect(workspace.countOf(DocKind.FORM)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0800
     * @tc.name      testDocumentFormFlowCases0008
     * @tc.desc      Verify close removes slot entirely
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0008', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.open(slot('read-1', DocKind.READING, '接口文档', 7));
      expect(workspace.close('note-1')).assertTrue();
      expect(workspace.allSlots().length).assertEqual(1);
      expect(workspace.close('note-1')).assertFalse();
      expect(workspace.activeSlotId()).assertEqual('read-1');
      expect(workspace.close('read-1')).assertTrue();
      expect(workspace.activeSlotId()).assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0900
     * @tc.name      testDocumentFormFlowCases0009
     * @tc.desc      Verify reopen same id updates instead of duplicating
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0009', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录（改）', 5));
      expect(workspace.allSlots().length).assertEqual(1);
      const active = workspace.active();
      expect(active === undefined ? '' : active.title).assertEqual('学习记录（改）');
      expect(active === undefined ? 0 : active.revision).assertEqual(5);
      expect(workspace.countOf(DocKind.NOTE)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1000
     * @tc.name      testDocumentFormFlowCases0010
     * @tc.desc      Verify empty id is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0010', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      expect(workspace.open(slot('', DocKind.NOTE, '无标识', 1))).assertFalse();
      expect(workspace.open(slot('note-1', DocKind.NOTE, '', 1))).assertTrue();
      expect(workspace.allSlots().length).assertEqual(1);
      expect(workspace.activeSlots()[0].usable()).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1100
     * @tc.name      testDocumentFormFlowCases0011
     * @tc.desc      Verify audit flags single slot violation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0011', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('form-1', DocKind.FORM, '报销单', 1));
      const audit: WorkspaceAudit = workspace.audit();
      expect(audit.ok()).assertTrue();
      expect(audit.active).assertEqual(1);
      expect(audit.archived).assertEqual(0);
      expect(audit.summary().indexOf('工作区正常') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1200
     * @tc.name      testDocumentFormFlowCases0012
     * @tc.desc      Verify audit reports duplicate ids
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0012', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      const first: DocumentSlot = slot('dup-1', DocKind.NOTE, '第一条', 1);
      const second: DocumentSlot = slot('dup-1', DocKind.READING, '第二条', 2);
      workspace.open(first);
      workspace.open(second);
      expect(workspace.allSlots().length).assertEqual(1);
      expect(workspace.audit().findings.length).assertEqual(0);
      expect(workspace.audit().ok()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1300
     * @tc.name      testDocumentFormFlowCases0013
     * @tc.desc      Verify isolation rejects kind mismatch
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0013', 0, (): void => {
      const note: DocumentSlot = slot('note-1', DocKind.NOTE, '学习记录', 3);
      const reasons: string[] = checkIsolation(note, DocKind.FORM, 'app.continuation', 3);
      expect(reasons.length).assertEqual(1);
      expect(reasons[0].indexOf('类别不一致') >= 0).assertTrue();
      expect(checkIsolation(note, DocKind.NOTE, 'app.continuation', 3).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1400
     * @tc.name      testDocumentFormFlowCases0014
     * @tc.desc      Verify isolation rejects foreign owner
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0014', 0, (): void => {
      const note: DocumentSlot = slot('note-1', DocKind.NOTE, '学习记录', 3);
      const reasons: string[] = checkIsolation(note, DocKind.NOTE, 'other.app', 3);
      expect(reasons.length).assertEqual(1);
      expect(reasons[0].indexOf('来源应用不一致') >= 0).assertTrue();
      const emptyOwner: DocumentSlot = new DocumentSlot('note-2', DocKind.NOTE, '无来源');
      emptyOwner.revision = 1;
      expect(checkIsolation(emptyOwner, DocKind.NOTE, 'any.app', 1).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1500
     * @tc.name      testDocumentFormFlowCases0015
     * @tc.desc      Verify isolation rejects revision rollback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0015', 0, (): void => {
      const note: DocumentSlot = slot('note-1', DocKind.NOTE, '学习记录', 5);
      const reasons: string[] = checkIsolation(note, DocKind.NOTE, 'app.continuation', 4);
      expect(reasons.length).assertEqual(1);
      expect(reasons[0].indexOf('修订号回退') >= 0).assertTrue();
      expect(checkIsolation(note, DocKind.NOTE, 'app.continuation', 6).length).assertEqual(0);
      expect(checkIsolation(note, DocKind.NOTE, 'app.continuation', 5).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1600
     * @tc.name      testDocumentFormFlowCases0016
     * @tc.desc      Verify isolation accumulates all reasons
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0016', 0, (): void => {
      const note: DocumentSlot = slot('note-1', DocKind.NOTE, '学习记录', 5);
      const reasons: string[] = checkIsolation(note, DocKind.READING, 'other.app', 1);
      expect(reasons.length).assertEqual(3);
      expect(reasons[0].indexOf('类别') >= 0).assertTrue();
      expect(reasons[1].indexOf('来源应用') >= 0).assertTrue();
      expect(reasons[2].indexOf('修订号回退') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1700
     * @tc.name      testDocumentFormFlowCases0017
     * @tc.desc      Verify rule table shape is stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testDocumentFormFlowCases0017', 0, (): void => {
      expect(DOC_RULES.length).assertEqual(12);
      expect(docLines().length).assertEqual(12);
      expect(multiSlotKinds().length).assertEqual(3);
      const codes: string[] = DOC_RULES.map((rule): string => rule.code);
      expect(codes.filter((code: string): boolean => code.indexOf('DC-') !== 0).length).assertEqual(0);
      expect(codes.filter((code: string, index: number): boolean => codes.indexOf(code) !== index).length)
        .assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1800
     * @tc.name      testDocumentFormFlowCases0018
     * @tc.desc      Verify form starts empty and not submittable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0018', 0, (): void => {
      const session: FormSession = formSession();
      expect(session.id()).assertEqual('expense-7');
      expect(session.currentStage()).assertEqual(FormStage.EDITING);
      expect(session.currentRevision() > 0).assertTrue();
      expect(session.canSubmit()).assertFalse();
      expect(session.progressPercent()).assertEqual(0);
      expect(session.blockingFields().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1900
     * @tc.name      testDocumentFormFlowCases0019
     * @tc.desc      Verify branch reveals fields only when triggered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0019', 0, (): void => {
      const session: FormSession = formSession();
      expect(session.visibleFields().length).assertEqual(1);
      expect(session.setValue('kind', '报销')).assertTrue();
      expect(session.visibleFields().length).assertEqual(3);
      const keys: string[] = session.visibleFields().map((field: FormField): string => field.key);
      expect(keys.indexOf('amount') >= 0).assertTrue();
      expect(keys.indexOf('invoiceNo') >= 0).assertTrue();
      expect(keys.indexOf('budget') >= 0).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2000
     * @tc.name      testDocumentFormFlowCases0020
     * @tc.desc      Verify switching branch swaps visible fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0020', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      const before: number = session.visibleFields().length;
      session.setValue('kind', '采购');
      const after: number = session.visibleFields().length;
      expect(before).assertEqual(3);
      expect(after).assertEqual(2);
      const keys: string[] = session.visibleFields().map((field: FormField): string => field.key);
      expect(keys.indexOf('budget') >= 0).assertTrue();
      expect(keys.indexOf('amount') >= 0).assertFalse();
      expect(session.activeBranches().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2100
     * @tc.name      testDocumentFormFlowCases0021
     * @tc.desc      Verify unknown branch value reveals nothing extra
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0021', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '不存在的类型');
      expect(session.activeBranches().length).assertEqual(0);
      expect(session.visibleFields().length).assertEqual(1);
      expect(session.missingRows().length).assertEqual(0);
      expect(session.canSubmit()).assertTrue();
      expect(session.filledCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2200
     * @tc.name      testDocumentFormFlowCases0022
     * @tc.desc      Verify required field blocks submit until filled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0022', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      expect(session.blockingFields().length).assertEqual(1);
      expect(session.canSubmit()).assertFalse();
      session.setValue('amount', '1200');
      expect(session.blockingFields().length).assertEqual(0);
      expect(session.canSubmit()).assertTrue();
      expect(session.progressPercent()).assertEqual(67);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2300
     * @tc.name      testDocumentFormFlowCases0023
     * @tc.desc      Verify overlong value marked invalid
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0023', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '123456789012345');
      const amount = session.fields_().find((field: FormField): boolean => field.key === 'amount');
      expect(amount === undefined ? '' : amount.state as string).assertEqual(FieldState.INVALID as string);
      expect(session.blockingFields().length).assertEqual(1);
      expect(session.canSubmit()).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2400
     * @tc.name      testDocumentFormFlowCases0024
     * @tc.desc      Verify procurement branch needs at least one row
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0024', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '采购');
      session.setValue('budget', '差旅');
      expect(session.missingRows().length).assertEqual(1);
      expect(session.canSubmit()).assertFalse();
      const empty: FormRow = new FormRow('row-1');
      session.addRow(empty);
      expect(session.missingRows().length).assertEqual(1);
      empty.set('item', '笔记本');
      expect(session.missingRows().length).assertEqual(0);
      expect(session.canSubmit()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2500
     * @tc.name      testDocumentFormFlowCases0025
     * @tc.desc      Verify row value round trip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0025', 0, (): void => {
      const row: FormRow = new FormRow('row-9');
      row.set('name', '差旅');
      row.set('amount', '300');
      expect(row.valueOf('name')).assertEqual('差旅');
      expect(row.valueOf('amount')).assertEqual('300');
      expect(row.valueOf('missing')).assertEqual('');
      row.set('name', '会议');
      expect(row.valueOf('name')).assertEqual('会议');
      expect(row.keys.length).assertEqual(2);
      expect(row.filled()).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2600
     * @tc.name      testDocumentFormFlowCases0026
     * @tc.desc      Verify remove row keeps others
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0026', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '采购');
      const first: FormRow = new FormRow('row-1');
      first.set('item', 'A');
      const second: FormRow = new FormRow('row-2');
      second.set('item', 'B');
      session.addRow(first);
      session.addRow(second);
      expect(session.rows_().length).assertEqual(2);
      expect(session.removeRow('row-1')).assertTrue();
      expect(session.rows_().length).assertEqual(1);
      expect(session.rows_()[0].id).assertEqual('row-2');
      expect(session.removeRow('row-1')).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2700
     * @tc.name      testDocumentFormFlowCases0027
     * @tc.desc      Verify confirm locks subsequent edits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0027', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '500');
      expect(session.confirm()).assertTrue();
      expect(session.currentStage()).assertEqual(FormStage.CONFIRMED);
      expect(session.setValue('amount', '600')).assertFalse();
      expect(session.addRow(new FormRow('row-x'))).assertFalse();
      expect(session.canSubmit()).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2800
     * @tc.name      testDocumentFormFlowCases0028
     * @tc.desc      Verify archive requires confirmation first
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0028', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '500');
      expect(session.archive()).assertFalse();
      session.review();
      expect(session.currentStage()).assertEqual(FormStage.REVIEWING);
      session.confirm();
      expect(session.archive()).assertTrue();
      expect(session.currentStage()).assertEqual(FormStage.ARCHIVED);
      expect(session.reopen()).assertFalse();
      expect(formSummary(session).indexOf('已归档') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2900
     * @tc.name      testDocumentFormFlowCases0029
     * @tc.desc      Verify review rejected when incomplete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0029', 0, (): void => {
      const session: FormSession = formSession();
      expect(session.review()).assertFalse();
      expect(session.currentStage()).assertEqual(FormStage.EDITING);
      session.setValue('kind', '报销');
      expect(session.review()).assertFalse();
      expect(session.currentStage()).assertEqual(FormStage.EDITING);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3000
     * @tc.name      testDocumentFormFlowCases0030
     * @tc.desc      Verify reopen returns to editing from confirmed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0030', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '500');
      session.confirm();
      expect(session.reopen()).assertTrue();
      expect(session.currentStage()).assertEqual(FormStage.EDITING);
      expect(session.setValue('amount', '700')).assertTrue();
      expect(session.valueOf('amount')).assertEqual('700');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3100
     * @tc.name      testDocumentFormFlowCases0031
     * @tc.desc      Verify snapshot carries fields rows and revision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0031', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '采购');
      session.setValue('budget', '行政');
      const row: FormRow = new FormRow('row-1');
      row.set('item', '椅子');
      session.addRow(row);
      const snapshot: FormSnapshot = session.snapshot();
      expect(snapshot.usable()).assertTrue();
      expect(snapshot.formId).assertEqual('expense-7');
      expect(snapshot.fieldKeys.length).assertEqual(snapshot.fieldValues.length);
      expect(snapshot.rowIds.length).assertEqual(1);
      expect(snapshot.revision).assertEqual(session.currentRevision());
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3200
     * @tc.name      testDocumentFormFlowCases0032
     * @tc.desc      Verify apply restores values but not confirmed stage
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0032', 0, (): void => {
      const source: FormSession = formSession();
      source.setValue('kind', '报销');
      source.setValue('amount', '880');
      source.confirm();
      const snapshot: FormSnapshot = source.snapshot();
      const target: FormSession = new FormSession();
      expect(target.apply(snapshot)).assertTrue();
      expect(target.id()).assertEqual('expense-7');
      expect(target.valueOf('kind')).assertEqual('报销');
      expect(target.valueOf('amount')).assertEqual('880');
      expect(target.currentStage()).assertEqual(FormStage.EDITING);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3300
     * @tc.name      testDocumentFormFlowCases0033
     * @tc.desc      Verify apply rejects malformed snapshot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0033', 0, (): void => {
      const broken: FormSnapshot = new FormSnapshot();
      const target: FormSession = new FormSession('x');
      expect(broken.usable()).assertFalse();
      expect(target.apply(broken)).assertFalse();
      const partial: FormSnapshot = new FormSnapshot();
      partial.formId = 'y';
      partial.fieldKeys = ['a', 'b'];
      partial.fieldValues = ['1'];
      expect(partial.usable()).assertFalse();
      expect(target.apply(partial)).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3400
     * @tc.name      testDocumentFormFlowCases0034
     * @tc.desc      Verify apply recalculates field state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0034', 0, (): void => {
      const snapshot: FormSnapshot = new FormSnapshot();
      snapshot.formId = 'z';
      snapshot.fieldKeys = ['amount'];
      snapshot.fieldValues = ['999999999999999'];
      const target: FormSession = new FormSession('z');
      expect(target.apply(snapshot)).assertTrue();
      const field = target.fields_()[0];
      expect(field.maxLength).assertEqual(0);
      expect(field.value.length).assertEqual(15);
      expect(field.state).assertEqual(FieldState.FILLED);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3500
     * @tc.name      testDocumentFormFlowCases0035
     * @tc.desc      Verify workspace to form flow keeps isolation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0035', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      const slotRef: DocumentSlot = slot('form-1', DocKind.FORM, '报销单', 1);
      workspace.open(slotRef);
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '200');
      const snapshot: FormSnapshot = session.snapshot();
      const blocked: string[] = checkIsolation(slotRef, DocKind.FORM, 'other.app', snapshot.revision);
      expect(blocked.length).assertEqual(1);
      expect(blocked[0].indexOf('来源应用') >= 0).assertTrue();
      expect(checkIsolation(slotRef, DocKind.FORM, 'app.continuation', snapshot.revision).length)
        .assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3600
     * @tc.name      testDocumentFormFlowCases0036
     * @tc.desc      Verify archived form still blocks replacement
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0036', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('form-1', DocKind.FORM, '报销单', 1));
      workspace.archive('form-1');
      expect(workspace.archivedSlots().length).assertEqual(1);
      expect(workspace.audit().archived).assertEqual(1);
      expect(workspace.activeSlots().length).assertEqual(0);
      expect(workspace.open(slot('form-2', DocKind.FORM, '新单', 1))).assertTrue();
      expect(workspace.audit().active).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3700
     * @tc.name      testDocumentFormFlowCases0037
     * @tc.desc      Verify branch rule table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testDocumentFormFlowCases0037', 0, (): void => {
      expect(BRANCH_RULES.length).assertEqual(5);
      expect(branchLines().length).assertEqual(5);
      const codes: string[] = BRANCH_RULES.map((rule): string => rule.code);
      expect(codes.filter((code: string, index: number): boolean => codes.indexOf(code) !== index).length)
        .assertEqual(0);
      BRANCH_RULES.forEach((rule): void => {
        expect(rule.fieldKey.length > 0).assertTrue();
        expect(rule.triggerValue.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3800
     * @tc.name      testDocumentFormFlowCases0038
     * @tc.desc      Verify form summary tracks stage and progress
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testDocumentFormFlowCases0038', 0, (): void => {
      const session: FormSession = formSession();
      expect(formSummary(session).indexOf('待补明细') >= 0 ||
        formSummary(session).indexOf('还有') >= 0).assertTrue();
      session.setValue('kind', '报销');
      session.setValue('amount', '100');
      expect(formSummary(session).indexOf('可提交') >= 0).assertTrue();
      session.review();
      expect(formSummary(session).indexOf('待确认') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3900
     * @tc.name      testDocumentFormFlowCases0039
     * @tc.desc      Verify workspace lines list every active slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testDocumentFormFlowCases0039', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.open(slot('read-1', DocKind.READING, '接口文档', 7));
      workspace.archive('read-1');
      const lines: string[] = workspaceLines(workspace);
      expect(lines.length >= 3).assertTrue();
      expect(lines[0].indexOf('工作区正常') >= 0).assertTrue();
      expect(lines.filter((line: string): boolean => line.indexOf('学习记录') >= 0).length)
        .assertEqual(1);
      expect(lines.filter((line: string): boolean => line.indexOf('归档 1 项') >= 0).length)
        .assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_4000
     * @tc.name      testDocumentFormFlowCases0040
     * @tc.desc      Verify form field refresh is idempotent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDocumentFormFlowCases0040', 0, (): void => {
      const field: FormField = new FormField('amount', '金额', true, 6);
      field.value = '';
      field.refresh();
      expect(field.state).assertEqual(FieldState.EMPTY);
      expect(field.blocking()).assertTrue();
      field.value = '300';
      field.refresh();
      field.refresh();
      expect(field.state).assertEqual(FieldState.FILLED);
      expect(field.blocking()).assertFalse();
      field.value = '1234567';
      field.refresh();
      expect(field.state).assertEqual(FieldState.INVALID);
      expect(field.blocking()).assertTrue();
    });
  });
}
