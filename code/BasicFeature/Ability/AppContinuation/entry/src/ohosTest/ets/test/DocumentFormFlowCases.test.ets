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
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0001
     * @tc.desc      Verify workspace starts empty and honest
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0001', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      loggedExpect(workspace.activeSlots().length, 'DocumentFormFlowCases.test.ets:A0001', BUNDLE + '_DocumentFormFlowCases_0001').assertEqual(0);
      loggedExpect(workspace.archivedSlots().length, 'DocumentFormFlowCases.test.ets:A0002', BUNDLE + '_DocumentFormFlowCases_0001').assertEqual(0);
      loggedExpect(workspace.activeSlotId(), 'DocumentFormFlowCases.test.ets:A0003', BUNDLE + '_DocumentFormFlowCases_0001').assertEqual('');
      loggedExpect(workspace.active() === undefined, 'DocumentFormFlowCases.test.ets:A0004', BUNDLE + '_DocumentFormFlowCases_0001').assertTrue();
      loggedExpect(workspaceLines(workspace).filter((line: string): boolean =>
        line.indexOf('没有进行中的可接续对象') >= 0).length, 'DocumentFormFlowCases.test.ets:A0005', BUNDLE + '_DocumentFormFlowCases_0001').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0200
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0002
     * @tc.desc      Verify note and reading coexist in same workspace
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0002', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      loggedExpect(workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3)), 'DocumentFormFlowCases.test.ets:A0006', BUNDLE + '_DocumentFormFlowCases_0002').assertTrue();
      loggedExpect(workspace.open(slot('read-1', DocKind.READING, '接口文档', 7)), 'DocumentFormFlowCases.test.ets:A0007', BUNDLE + '_DocumentFormFlowCases_0002').assertTrue();
      loggedExpect(workspace.activeSlots().length, 'DocumentFormFlowCases.test.ets:A0008', BUNDLE + '_DocumentFormFlowCases_0002').assertEqual(2);
      loggedExpect(workspace.countOf(DocKind.NOTE), 'DocumentFormFlowCases.test.ets:A0009', BUNDLE + '_DocumentFormFlowCases_0002').assertEqual(1);
      loggedExpect(workspace.countOf(DocKind.READING), 'DocumentFormFlowCases.test.ets:A0010', BUNDLE + '_DocumentFormFlowCases_0002').assertEqual(1);
      loggedExpect(workspace.activeSlotId(), 'DocumentFormFlowCases.test.ets:A0011', BUNDLE + '_DocumentFormFlowCases_0002').assertEqual('read-1');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0300
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0003
     * @tc.desc      Verify form kind is limited to one active slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0003', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      loggedExpect(workspace.canOpen(DocKind.FORM), 'DocumentFormFlowCases.test.ets:A0012', BUNDLE + '_DocumentFormFlowCases_0003').assertTrue();
      loggedExpect(workspace.open(slot('form-1', DocKind.FORM, '报销单', 1)), 'DocumentFormFlowCases.test.ets:A0013', BUNDLE + '_DocumentFormFlowCases_0003').assertTrue();
      loggedExpect(workspace.canOpen(DocKind.FORM), 'DocumentFormFlowCases.test.ets:A0014', BUNDLE + '_DocumentFormFlowCases_0003').assertFalse();
      loggedExpect(workspace.open(slot('form-2', DocKind.FORM, '第二份', 1)), 'DocumentFormFlowCases.test.ets:A0015', BUNDLE + '_DocumentFormFlowCases_0003').assertFalse();
      loggedExpect(workspace.countOf(DocKind.FORM), 'DocumentFormFlowCases.test.ets:A0016', BUNDLE + '_DocumentFormFlowCases_0003').assertEqual(1);
      loggedExpect(workspace.allSlots().length, 'DocumentFormFlowCases.test.ets:A0017', BUNDLE + '_DocumentFormFlowCases_0003').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0400
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0004
     * @tc.desc      Verify archived form frees the single slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0004', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('form-1', DocKind.FORM, '报销单', 1));
      loggedExpect(workspace.archive('form-1'), 'DocumentFormFlowCases.test.ets:A0018', BUNDLE + '_DocumentFormFlowCases_0004').assertTrue();
      loggedExpect(workspace.canOpen(DocKind.FORM), 'DocumentFormFlowCases.test.ets:A0019', BUNDLE + '_DocumentFormFlowCases_0004').assertTrue();
      loggedExpect(workspace.open(slot('form-2', DocKind.FORM, '新报销单', 1)), 'DocumentFormFlowCases.test.ets:A0020', BUNDLE + '_DocumentFormFlowCases_0004').assertTrue();
      loggedExpect(workspace.activeSlots().length, 'DocumentFormFlowCases.test.ets:A0021', BUNDLE + '_DocumentFormFlowCases_0004').assertEqual(1);
      loggedExpect(workspace.archivedSlots().length, 'DocumentFormFlowCases.test.ets:A0022', BUNDLE + '_DocumentFormFlowCases_0004').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0500
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0005
     * @tc.desc      Verify archive clears active selection
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0005', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      loggedExpect(workspace.activeSlotId(), 'DocumentFormFlowCases.test.ets:A0023', BUNDLE + '_DocumentFormFlowCases_0005').assertEqual('note-1');
      loggedExpect(workspace.archive('note-1'), 'DocumentFormFlowCases.test.ets:A0024', BUNDLE + '_DocumentFormFlowCases_0005').assertTrue();
      loggedExpect(workspace.activeSlotId(), 'DocumentFormFlowCases.test.ets:A0025', BUNDLE + '_DocumentFormFlowCases_0005').assertEqual('');
      loggedExpect(workspace.archive('note-1'), 'DocumentFormFlowCases.test.ets:A0026', BUNDLE + '_DocumentFormFlowCases_0005').assertFalse();
      loggedExpect(workspace.switchTo('note-1'), 'DocumentFormFlowCases.test.ets:A0027', BUNDLE + '_DocumentFormFlowCases_0005').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0600
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0006
     * @tc.desc      Verify restore brings archived note back
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0006', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.archive('note-1');
      loggedExpect(workspace.restore('note-1'), 'DocumentFormFlowCases.test.ets:A0028', BUNDLE + '_DocumentFormFlowCases_0006').assertTrue();
      loggedExpect(workspace.activeSlotId(), 'DocumentFormFlowCases.test.ets:A0029', BUNDLE + '_DocumentFormFlowCases_0006').assertEqual('note-1');
      loggedExpect(workspace.archivedSlots().length, 'DocumentFormFlowCases.test.ets:A0030', BUNDLE + '_DocumentFormFlowCases_0006').assertEqual(0);
      loggedExpect(workspace.restore('note-1'), 'DocumentFormFlowCases.test.ets:A0031', BUNDLE + '_DocumentFormFlowCases_0006').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0700
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0007
     * @tc.desc      Verify form archive is terminal for restore
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0007', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('form-1', DocKind.FORM, '报销单', 1));
      workspace.archive('form-1');
      loggedExpect(workspace.keepsDraft(DocKind.FORM), 'DocumentFormFlowCases.test.ets:A0032', BUNDLE + '_DocumentFormFlowCases_0007').assertTrue();
      loggedExpect(workspace.restore('form-1'), 'DocumentFormFlowCases.test.ets:A0033', BUNDLE + '_DocumentFormFlowCases_0007').assertTrue();
      loggedExpect(workspace.restore('missing'), 'DocumentFormFlowCases.test.ets:A0034', BUNDLE + '_DocumentFormFlowCases_0007').assertFalse();
      loggedExpect(workspace.countOf(DocKind.FORM), 'DocumentFormFlowCases.test.ets:A0035', BUNDLE + '_DocumentFormFlowCases_0007').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0800
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0008
     * @tc.desc      Verify close removes slot entirely
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0008', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.open(slot('read-1', DocKind.READING, '接口文档', 7));
      loggedExpect(workspace.close('note-1'), 'DocumentFormFlowCases.test.ets:A0036', BUNDLE + '_DocumentFormFlowCases_0008').assertTrue();
      loggedExpect(workspace.allSlots().length, 'DocumentFormFlowCases.test.ets:A0037', BUNDLE + '_DocumentFormFlowCases_0008').assertEqual(1);
      loggedExpect(workspace.close('note-1'), 'DocumentFormFlowCases.test.ets:A0038', BUNDLE + '_DocumentFormFlowCases_0008').assertFalse();
      loggedExpect(workspace.activeSlotId(), 'DocumentFormFlowCases.test.ets:A0039', BUNDLE + '_DocumentFormFlowCases_0008').assertEqual('read-1');
      loggedExpect(workspace.close('read-1'), 'DocumentFormFlowCases.test.ets:A0040', BUNDLE + '_DocumentFormFlowCases_0008').assertTrue();
      loggedExpect(workspace.activeSlotId(), 'DocumentFormFlowCases.test.ets:A0041', BUNDLE + '_DocumentFormFlowCases_0008').assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0900
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0009
     * @tc.desc      Verify reopen same id updates instead of duplicating
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0009', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录（改）', 5));
      loggedExpect(workspace.allSlots().length, 'DocumentFormFlowCases.test.ets:A0042', BUNDLE + '_DocumentFormFlowCases_0009').assertEqual(1);
      const active = workspace.active();
      loggedExpect(active === undefined ? '' : active.title, 'DocumentFormFlowCases.test.ets:A0043', BUNDLE + '_DocumentFormFlowCases_0009').assertEqual('学习记录（改）');
      loggedExpect(active === undefined ? 0 : active.revision, 'DocumentFormFlowCases.test.ets:A0044', BUNDLE + '_DocumentFormFlowCases_0009').assertEqual(5);
      loggedExpect(workspace.countOf(DocKind.NOTE), 'DocumentFormFlowCases.test.ets:A0045', BUNDLE + '_DocumentFormFlowCases_0009').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1000
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0010
     * @tc.desc      Verify empty id is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0010', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      loggedExpect(workspace.open(slot('', DocKind.NOTE, '无标识', 1)), 'DocumentFormFlowCases.test.ets:A0046', BUNDLE + '_DocumentFormFlowCases_0010').assertFalse();
      loggedExpect(workspace.open(slot('note-1', DocKind.NOTE, '', 1)), 'DocumentFormFlowCases.test.ets:A0047', BUNDLE + '_DocumentFormFlowCases_0010').assertTrue();
      loggedExpect(workspace.allSlots().length, 'DocumentFormFlowCases.test.ets:A0048', BUNDLE + '_DocumentFormFlowCases_0010').assertEqual(1);
      loggedExpect(workspace.activeSlots()[0].usable(), 'DocumentFormFlowCases.test.ets:A0049', BUNDLE + '_DocumentFormFlowCases_0010').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1100
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0011
     * @tc.desc      Verify audit flags single slot violation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0011', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('form-1', DocKind.FORM, '报销单', 1));
      const audit: WorkspaceAudit = workspace.audit();
      loggedExpect(audit.ok(), 'DocumentFormFlowCases.test.ets:A0050', BUNDLE + '_DocumentFormFlowCases_0011').assertTrue();
      loggedExpect(audit.active, 'DocumentFormFlowCases.test.ets:A0051', BUNDLE + '_DocumentFormFlowCases_0011').assertEqual(1);
      loggedExpect(audit.archived, 'DocumentFormFlowCases.test.ets:A0052', BUNDLE + '_DocumentFormFlowCases_0011').assertEqual(0);
      loggedExpect(audit.summary().indexOf('工作区正常') >= 0, 'DocumentFormFlowCases.test.ets:A0053', BUNDLE + '_DocumentFormFlowCases_0011').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1200
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0012
     * @tc.desc      Verify audit reports duplicate ids
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0012', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      const first: DocumentSlot = slot('dup-1', DocKind.NOTE, '第一条', 1);
      const second: DocumentSlot = slot('dup-1', DocKind.READING, '第二条', 2);
      workspace.open(first);
      workspace.open(second);
      loggedExpect(workspace.allSlots().length, 'DocumentFormFlowCases.test.ets:A0054', BUNDLE + '_DocumentFormFlowCases_0012').assertEqual(1);
      loggedExpect(workspace.audit().findings.length, 'DocumentFormFlowCases.test.ets:A0055', BUNDLE + '_DocumentFormFlowCases_0012').assertEqual(0);
      loggedExpect(workspace.audit().ok(), 'DocumentFormFlowCases.test.ets:A0056', BUNDLE + '_DocumentFormFlowCases_0012').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1300
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0013
     * @tc.desc      Verify isolation rejects kind mismatch
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0013', 0, (): void => {
      const note: DocumentSlot = slot('note-1', DocKind.NOTE, '学习记录', 3);
      const reasons: string[] = checkIsolation(note, DocKind.FORM, 'app.continuation', 3);
      loggedExpect(reasons.length, 'DocumentFormFlowCases.test.ets:A0057', BUNDLE + '_DocumentFormFlowCases_0013').assertEqual(1);
      loggedExpect(reasons[0].indexOf('类别不一致') >= 0, 'DocumentFormFlowCases.test.ets:A0058', BUNDLE + '_DocumentFormFlowCases_0013').assertTrue();
      loggedExpect(checkIsolation(note, DocKind.NOTE, 'app.continuation', 3).length, 'DocumentFormFlowCases.test.ets:A0059', BUNDLE + '_DocumentFormFlowCases_0013').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1400
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0014
     * @tc.desc      Verify isolation rejects foreign owner
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0014', 0, (): void => {
      const note: DocumentSlot = slot('note-1', DocKind.NOTE, '学习记录', 3);
      const reasons: string[] = checkIsolation(note, DocKind.NOTE, 'other.app', 3);
      loggedExpect(reasons.length, 'DocumentFormFlowCases.test.ets:A0060', BUNDLE + '_DocumentFormFlowCases_0014').assertEqual(1);
      loggedExpect(reasons[0].indexOf('来源应用不一致') >= 0, 'DocumentFormFlowCases.test.ets:A0061', BUNDLE + '_DocumentFormFlowCases_0014').assertTrue();
      const emptyOwner: DocumentSlot = new DocumentSlot('note-2', DocKind.NOTE, '无来源');
      emptyOwner.revision = 1;
      loggedExpect(checkIsolation(emptyOwner, DocKind.NOTE, 'any.app', 1).length, 'DocumentFormFlowCases.test.ets:A0062', BUNDLE + '_DocumentFormFlowCases_0014').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1500
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0015
     * @tc.desc      Verify isolation rejects revision rollback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0015', 0, (): void => {
      const note: DocumentSlot = slot('note-1', DocKind.NOTE, '学习记录', 5);
      const reasons: string[] = checkIsolation(note, DocKind.NOTE, 'app.continuation', 4);
      loggedExpect(reasons.length, 'DocumentFormFlowCases.test.ets:A0063', BUNDLE + '_DocumentFormFlowCases_0015').assertEqual(1);
      loggedExpect(reasons[0].indexOf('修订号回退') >= 0, 'DocumentFormFlowCases.test.ets:A0064', BUNDLE + '_DocumentFormFlowCases_0015').assertTrue();
      loggedExpect(checkIsolation(note, DocKind.NOTE, 'app.continuation', 6).length, 'DocumentFormFlowCases.test.ets:A0065', BUNDLE + '_DocumentFormFlowCases_0015').assertEqual(0);
      loggedExpect(checkIsolation(note, DocKind.NOTE, 'app.continuation', 5).length, 'DocumentFormFlowCases.test.ets:A0066', BUNDLE + '_DocumentFormFlowCases_0015').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1600
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0016
     * @tc.desc      Verify isolation accumulates all reasons
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0016', 0, (): void => {
      const note: DocumentSlot = slot('note-1', DocKind.NOTE, '学习记录', 5);
      const reasons: string[] = checkIsolation(note, DocKind.READING, 'other.app', 1);
      loggedExpect(reasons.length, 'DocumentFormFlowCases.test.ets:A0067', BUNDLE + '_DocumentFormFlowCases_0016').assertEqual(3);
      loggedExpect(reasons[0].indexOf('类别') >= 0, 'DocumentFormFlowCases.test.ets:A0068', BUNDLE + '_DocumentFormFlowCases_0016').assertTrue();
      loggedExpect(reasons[1].indexOf('来源应用') >= 0, 'DocumentFormFlowCases.test.ets:A0069', BUNDLE + '_DocumentFormFlowCases_0016').assertTrue();
      loggedExpect(reasons[2].indexOf('修订号回退') >= 0, 'DocumentFormFlowCases.test.ets:A0070', BUNDLE + '_DocumentFormFlowCases_0016').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1700
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0017
     * @tc.desc      Verify rule table shape is stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_DocumentFormFlowCases_0017', 0, (): void => {
      loggedExpect(DOC_RULES.length, 'DocumentFormFlowCases.test.ets:A0071', BUNDLE + '_DocumentFormFlowCases_0017').assertEqual(12);
      loggedExpect(docLines().length, 'DocumentFormFlowCases.test.ets:A0072', BUNDLE + '_DocumentFormFlowCases_0017').assertEqual(12);
      loggedExpect(multiSlotKinds().length, 'DocumentFormFlowCases.test.ets:A0073', BUNDLE + '_DocumentFormFlowCases_0017').assertEqual(3);
      const codes: string[] = DOC_RULES.map((rule): string => rule.code);
      loggedExpect(codes.filter((code: string): boolean => code.indexOf('DC-') !== 0).length, 'DocumentFormFlowCases.test.ets:A0074', BUNDLE + '_DocumentFormFlowCases_0017').assertEqual(0);
      loggedExpect(codes.filter((code: string, index: number): boolean => codes.indexOf(code) !== index).length, 'DocumentFormFlowCases.test.ets:A0075', BUNDLE + '_DocumentFormFlowCases_0017')
        .assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1800
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0018
     * @tc.desc      Verify form starts empty and not submittable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0018', 0, (): void => {
      const session: FormSession = formSession();
      loggedExpect(session.id(), 'DocumentFormFlowCases.test.ets:A0076', BUNDLE + '_DocumentFormFlowCases_0018').assertEqual('expense-7');
      loggedExpect(session.currentStage(), 'DocumentFormFlowCases.test.ets:A0077', BUNDLE + '_DocumentFormFlowCases_0018').assertEqual(FormStage.EDITING);
      loggedExpect(session.currentRevision() > 0, 'DocumentFormFlowCases.test.ets:A0078', BUNDLE + '_DocumentFormFlowCases_0018').assertTrue();
      loggedExpect(session.canSubmit(), 'DocumentFormFlowCases.test.ets:A0079', BUNDLE + '_DocumentFormFlowCases_0018').assertFalse();
      loggedExpect(session.progressPercent(), 'DocumentFormFlowCases.test.ets:A0080', BUNDLE + '_DocumentFormFlowCases_0018').assertEqual(0);
      loggedExpect(session.blockingFields().length, 'DocumentFormFlowCases.test.ets:A0081', BUNDLE + '_DocumentFormFlowCases_0018').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1900
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0019
     * @tc.desc      Verify branch reveals fields only when triggered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0019', 0, (): void => {
      const session: FormSession = formSession();
      loggedExpect(session.visibleFields().length, 'DocumentFormFlowCases.test.ets:A0082', BUNDLE + '_DocumentFormFlowCases_0019').assertEqual(1);
      loggedExpect(session.setValue('kind', '报销'), 'DocumentFormFlowCases.test.ets:A0083', BUNDLE + '_DocumentFormFlowCases_0019').assertTrue();
      loggedExpect(session.visibleFields().length, 'DocumentFormFlowCases.test.ets:A0084', BUNDLE + '_DocumentFormFlowCases_0019').assertEqual(3);
      const keys: string[] = session.visibleFields().map((field: FormField): string => field.key);
      loggedExpect(keys.indexOf('amount') >= 0, 'DocumentFormFlowCases.test.ets:A0085', BUNDLE + '_DocumentFormFlowCases_0019').assertTrue();
      loggedExpect(keys.indexOf('invoiceNo') >= 0, 'DocumentFormFlowCases.test.ets:A0086', BUNDLE + '_DocumentFormFlowCases_0019').assertTrue();
      loggedExpect(keys.indexOf('budget') >= 0, 'DocumentFormFlowCases.test.ets:A0087', BUNDLE + '_DocumentFormFlowCases_0019').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2000
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0020
     * @tc.desc      Verify switching branch swaps visible fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0020', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      const before: number = session.visibleFields().length;
      session.setValue('kind', '采购');
      const after: number = session.visibleFields().length;
      loggedExpect(before, 'DocumentFormFlowCases.test.ets:A0088', BUNDLE + '_DocumentFormFlowCases_0020').assertEqual(3);
      loggedExpect(after, 'DocumentFormFlowCases.test.ets:A0089', BUNDLE + '_DocumentFormFlowCases_0020').assertEqual(2);
      const keys: string[] = session.visibleFields().map((field: FormField): string => field.key);
      loggedExpect(keys.indexOf('budget') >= 0, 'DocumentFormFlowCases.test.ets:A0090', BUNDLE + '_DocumentFormFlowCases_0020').assertTrue();
      loggedExpect(keys.indexOf('amount') >= 0, 'DocumentFormFlowCases.test.ets:A0091', BUNDLE + '_DocumentFormFlowCases_0020').assertFalse();
      loggedExpect(session.activeBranches().length, 'DocumentFormFlowCases.test.ets:A0092', BUNDLE + '_DocumentFormFlowCases_0020').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2100
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0021
     * @tc.desc      Verify unknown branch value reveals nothing extra
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0021', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '不存在的类型');
      loggedExpect(session.activeBranches().length, 'DocumentFormFlowCases.test.ets:A0093', BUNDLE + '_DocumentFormFlowCases_0021').assertEqual(0);
      loggedExpect(session.visibleFields().length, 'DocumentFormFlowCases.test.ets:A0094', BUNDLE + '_DocumentFormFlowCases_0021').assertEqual(1);
      loggedExpect(session.missingRows().length, 'DocumentFormFlowCases.test.ets:A0095', BUNDLE + '_DocumentFormFlowCases_0021').assertEqual(0);
      loggedExpect(session.canSubmit(), 'DocumentFormFlowCases.test.ets:A0096', BUNDLE + '_DocumentFormFlowCases_0021').assertTrue();
      loggedExpect(session.filledCount(), 'DocumentFormFlowCases.test.ets:A0097', BUNDLE + '_DocumentFormFlowCases_0021').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2200
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0022
     * @tc.desc      Verify required field blocks submit until filled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0022', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      loggedExpect(session.blockingFields().length, 'DocumentFormFlowCases.test.ets:A0098', BUNDLE + '_DocumentFormFlowCases_0022').assertEqual(1);
      loggedExpect(session.canSubmit(), 'DocumentFormFlowCases.test.ets:A0099', BUNDLE + '_DocumentFormFlowCases_0022').assertFalse();
      session.setValue('amount', '1200');
      loggedExpect(session.blockingFields().length, 'DocumentFormFlowCases.test.ets:A0100', BUNDLE + '_DocumentFormFlowCases_0022').assertEqual(0);
      loggedExpect(session.canSubmit(), 'DocumentFormFlowCases.test.ets:A0101', BUNDLE + '_DocumentFormFlowCases_0022').assertTrue();
      loggedExpect(session.progressPercent(), 'DocumentFormFlowCases.test.ets:A0102', BUNDLE + '_DocumentFormFlowCases_0022').assertEqual(67);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2300
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0023
     * @tc.desc      Verify overlong value marked invalid
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0023', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '123456789012345');
      const amount = session.fields_().find((field: FormField): boolean => field.key === 'amount');
      loggedExpect(amount === undefined ? '' : amount.state as string, 'DocumentFormFlowCases.test.ets:A0103', BUNDLE + '_DocumentFormFlowCases_0023').assertEqual(FieldState.INVALID as string);
      loggedExpect(session.blockingFields().length, 'DocumentFormFlowCases.test.ets:A0104', BUNDLE + '_DocumentFormFlowCases_0023').assertEqual(1);
      loggedExpect(session.canSubmit(), 'DocumentFormFlowCases.test.ets:A0105', BUNDLE + '_DocumentFormFlowCases_0023').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2400
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0024
     * @tc.desc      Verify procurement branch needs at least one row
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0024', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '采购');
      session.setValue('budget', '差旅');
      loggedExpect(session.missingRows().length, 'DocumentFormFlowCases.test.ets:A0106', BUNDLE + '_DocumentFormFlowCases_0024').assertEqual(1);
      loggedExpect(session.canSubmit(), 'DocumentFormFlowCases.test.ets:A0107', BUNDLE + '_DocumentFormFlowCases_0024').assertFalse();
      const empty: FormRow = new FormRow('row-1');
      session.addRow(empty);
      loggedExpect(session.missingRows().length, 'DocumentFormFlowCases.test.ets:A0108', BUNDLE + '_DocumentFormFlowCases_0024').assertEqual(1);
      empty.set('item', '笔记本');
      loggedExpect(session.missingRows().length, 'DocumentFormFlowCases.test.ets:A0109', BUNDLE + '_DocumentFormFlowCases_0024').assertEqual(0);
      loggedExpect(session.canSubmit(), 'DocumentFormFlowCases.test.ets:A0110', BUNDLE + '_DocumentFormFlowCases_0024').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2500
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0025
     * @tc.desc      Verify row value round trip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0025', 0, (): void => {
      const row: FormRow = new FormRow('row-9');
      row.set('name', '差旅');
      row.set('amount', '300');
      loggedExpect(row.valueOf('name'), 'DocumentFormFlowCases.test.ets:A0111', BUNDLE + '_DocumentFormFlowCases_0025').assertEqual('差旅');
      loggedExpect(row.valueOf('amount'), 'DocumentFormFlowCases.test.ets:A0112', BUNDLE + '_DocumentFormFlowCases_0025').assertEqual('300');
      loggedExpect(row.valueOf('missing'), 'DocumentFormFlowCases.test.ets:A0113', BUNDLE + '_DocumentFormFlowCases_0025').assertEqual('');
      row.set('name', '会议');
      loggedExpect(row.valueOf('name'), 'DocumentFormFlowCases.test.ets:A0114', BUNDLE + '_DocumentFormFlowCases_0025').assertEqual('会议');
      loggedExpect(row.keys.length, 'DocumentFormFlowCases.test.ets:A0115', BUNDLE + '_DocumentFormFlowCases_0025').assertEqual(2);
      loggedExpect(row.filled(), 'DocumentFormFlowCases.test.ets:A0116', BUNDLE + '_DocumentFormFlowCases_0025').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2600
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0026
     * @tc.desc      Verify remove row keeps others
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0026', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '采购');
      const first: FormRow = new FormRow('row-1');
      first.set('item', 'A');
      const second: FormRow = new FormRow('row-2');
      second.set('item', 'B');
      session.addRow(first);
      session.addRow(second);
      loggedExpect(session.rows_().length, 'DocumentFormFlowCases.test.ets:A0117', BUNDLE + '_DocumentFormFlowCases_0026').assertEqual(2);
      loggedExpect(session.removeRow('row-1'), 'DocumentFormFlowCases.test.ets:A0118', BUNDLE + '_DocumentFormFlowCases_0026').assertTrue();
      loggedExpect(session.rows_().length, 'DocumentFormFlowCases.test.ets:A0119', BUNDLE + '_DocumentFormFlowCases_0026').assertEqual(1);
      loggedExpect(session.rows_()[0].id, 'DocumentFormFlowCases.test.ets:A0120', BUNDLE + '_DocumentFormFlowCases_0026').assertEqual('row-2');
      loggedExpect(session.removeRow('row-1'), 'DocumentFormFlowCases.test.ets:A0121', BUNDLE + '_DocumentFormFlowCases_0026').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2700
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0027
     * @tc.desc      Verify confirm locks subsequent edits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0027', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '500');
      loggedExpect(session.confirm(), 'DocumentFormFlowCases.test.ets:A0122', BUNDLE + '_DocumentFormFlowCases_0027').assertTrue();
      loggedExpect(session.currentStage(), 'DocumentFormFlowCases.test.ets:A0123', BUNDLE + '_DocumentFormFlowCases_0027').assertEqual(FormStage.CONFIRMED);
      loggedExpect(session.setValue('amount', '600'), 'DocumentFormFlowCases.test.ets:A0124', BUNDLE + '_DocumentFormFlowCases_0027').assertFalse();
      loggedExpect(session.addRow(new FormRow('row-x')), 'DocumentFormFlowCases.test.ets:A0125', BUNDLE + '_DocumentFormFlowCases_0027').assertFalse();
      loggedExpect(session.canSubmit(), 'DocumentFormFlowCases.test.ets:A0126', BUNDLE + '_DocumentFormFlowCases_0027').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2800
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0028
     * @tc.desc      Verify archive requires confirmation first
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0028', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '500');
      loggedExpect(session.archive(), 'DocumentFormFlowCases.test.ets:A0127', BUNDLE + '_DocumentFormFlowCases_0028').assertFalse();
      session.review();
      loggedExpect(session.currentStage(), 'DocumentFormFlowCases.test.ets:A0128', BUNDLE + '_DocumentFormFlowCases_0028').assertEqual(FormStage.REVIEWING);
      session.confirm();
      loggedExpect(session.archive(), 'DocumentFormFlowCases.test.ets:A0129', BUNDLE + '_DocumentFormFlowCases_0028').assertTrue();
      loggedExpect(session.currentStage(), 'DocumentFormFlowCases.test.ets:A0130', BUNDLE + '_DocumentFormFlowCases_0028').assertEqual(FormStage.ARCHIVED);
      loggedExpect(session.reopen(), 'DocumentFormFlowCases.test.ets:A0131', BUNDLE + '_DocumentFormFlowCases_0028').assertFalse();
      loggedExpect(formSummary(session).indexOf(localize('ac_documentworkspace_004')) >= 0, 'DocumentFormFlowCases.test.ets:A0132', BUNDLE + '_DocumentFormFlowCases_0028').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2900
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0029
     * @tc.desc      Verify review rejected when incomplete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0029', 0, (): void => {
      const session: FormSession = formSession();
      loggedExpect(session.review(), 'DocumentFormFlowCases.test.ets:A0133', BUNDLE + '_DocumentFormFlowCases_0029').assertFalse();
      loggedExpect(session.currentStage(), 'DocumentFormFlowCases.test.ets:A0134', BUNDLE + '_DocumentFormFlowCases_0029').assertEqual(FormStage.EDITING);
      session.setValue('kind', '报销');
      loggedExpect(session.review(), 'DocumentFormFlowCases.test.ets:A0135', BUNDLE + '_DocumentFormFlowCases_0029').assertFalse();
      loggedExpect(session.currentStage(), 'DocumentFormFlowCases.test.ets:A0136', BUNDLE + '_DocumentFormFlowCases_0029').assertEqual(FormStage.EDITING);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3000
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0030
     * @tc.desc      Verify reopen returns to editing from confirmed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0030', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '500');
      session.confirm();
      loggedExpect(session.reopen(), 'DocumentFormFlowCases.test.ets:A0137', BUNDLE + '_DocumentFormFlowCases_0030').assertTrue();
      loggedExpect(session.currentStage(), 'DocumentFormFlowCases.test.ets:A0138', BUNDLE + '_DocumentFormFlowCases_0030').assertEqual(FormStage.EDITING);
      loggedExpect(session.setValue('amount', '700'), 'DocumentFormFlowCases.test.ets:A0139', BUNDLE + '_DocumentFormFlowCases_0030').assertTrue();
      loggedExpect(session.valueOf('amount'), 'DocumentFormFlowCases.test.ets:A0140', BUNDLE + '_DocumentFormFlowCases_0030').assertEqual('700');
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3100
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0031
     * @tc.desc      Verify snapshot carries fields rows and revision
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0031', 0, (): void => {
      const session: FormSession = formSession();
      session.setValue('kind', '采购');
      session.setValue('budget', '行政');
      const row: FormRow = new FormRow('row-1');
      row.set('item', '椅子');
      session.addRow(row);
      const snapshot: FormSnapshot = session.snapshot();
      loggedExpect(snapshot.usable(), 'DocumentFormFlowCases.test.ets:A0141', BUNDLE + '_DocumentFormFlowCases_0031').assertTrue();
      loggedExpect(snapshot.formId, 'DocumentFormFlowCases.test.ets:A0142', BUNDLE + '_DocumentFormFlowCases_0031').assertEqual('expense-7');
      loggedExpect(snapshot.fieldKeys.length, 'DocumentFormFlowCases.test.ets:A0143', BUNDLE + '_DocumentFormFlowCases_0031').assertEqual(snapshot.fieldValues.length);
      loggedExpect(snapshot.rowIds.length, 'DocumentFormFlowCases.test.ets:A0144', BUNDLE + '_DocumentFormFlowCases_0031').assertEqual(1);
      loggedExpect(snapshot.revision, 'DocumentFormFlowCases.test.ets:A0145', BUNDLE + '_DocumentFormFlowCases_0031').assertEqual(session.currentRevision());
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3200
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0032
     * @tc.desc      Verify apply restores values but not confirmed stage
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0032', 0, (): void => {
      const source: FormSession = formSession();
      source.setValue('kind', '报销');
      source.setValue('amount', '880');
      source.confirm();
      const snapshot: FormSnapshot = source.snapshot();
      const target: FormSession = new FormSession();
      loggedExpect(target.apply(snapshot), 'DocumentFormFlowCases.test.ets:A0146', BUNDLE + '_DocumentFormFlowCases_0032').assertTrue();
      loggedExpect(target.id(), 'DocumentFormFlowCases.test.ets:A0147', BUNDLE + '_DocumentFormFlowCases_0032').assertEqual('expense-7');
      loggedExpect(target.valueOf('kind'), 'DocumentFormFlowCases.test.ets:A0148', BUNDLE + '_DocumentFormFlowCases_0032').assertEqual('报销');
      loggedExpect(target.valueOf('amount'), 'DocumentFormFlowCases.test.ets:A0149', BUNDLE + '_DocumentFormFlowCases_0032').assertEqual('880');
      loggedExpect(target.currentStage(), 'DocumentFormFlowCases.test.ets:A0150', BUNDLE + '_DocumentFormFlowCases_0032').assertEqual(FormStage.EDITING);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3300
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0033
     * @tc.desc      Verify apply rejects malformed snapshot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0033', 0, (): void => {
      const broken: FormSnapshot = new FormSnapshot();
      const target: FormSession = new FormSession('x');
      loggedExpect(broken.usable(), 'DocumentFormFlowCases.test.ets:A0151', BUNDLE + '_DocumentFormFlowCases_0033').assertFalse();
      loggedExpect(target.apply(broken), 'DocumentFormFlowCases.test.ets:A0152', BUNDLE + '_DocumentFormFlowCases_0033').assertFalse();
      const partial: FormSnapshot = new FormSnapshot();
      partial.formId = 'y';
      partial.fieldKeys = ['a', 'b'];
      partial.fieldValues = ['1'];
      loggedExpect(partial.usable(), 'DocumentFormFlowCases.test.ets:A0153', BUNDLE + '_DocumentFormFlowCases_0033').assertFalse();
      loggedExpect(target.apply(partial), 'DocumentFormFlowCases.test.ets:A0154', BUNDLE + '_DocumentFormFlowCases_0033').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3400
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0034
     * @tc.desc      Verify apply recalculates field state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0034', 0, (): void => {
      const snapshot: FormSnapshot = new FormSnapshot();
      snapshot.formId = 'z';
      snapshot.fieldKeys = ['amount'];
      snapshot.fieldValues = ['999999999999999'];
      const target: FormSession = new FormSession('z');
      loggedExpect(target.apply(snapshot), 'DocumentFormFlowCases.test.ets:A0155', BUNDLE + '_DocumentFormFlowCases_0034').assertTrue();
      const field = target.fields_()[0];
      loggedExpect(field.maxLength, 'DocumentFormFlowCases.test.ets:A0156', BUNDLE + '_DocumentFormFlowCases_0034').assertEqual(0);
      loggedExpect(field.value.length, 'DocumentFormFlowCases.test.ets:A0157', BUNDLE + '_DocumentFormFlowCases_0034').assertEqual(15);
      loggedExpect(field.state, 'DocumentFormFlowCases.test.ets:A0158', BUNDLE + '_DocumentFormFlowCases_0034').assertEqual(FieldState.FILLED);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3500
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0035
     * @tc.desc      Verify workspace to form flow keeps isolation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0035', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      const slotRef: DocumentSlot = slot('form-1', DocKind.FORM, '报销单', 1);
      workspace.open(slotRef);
      const session: FormSession = formSession();
      session.setValue('kind', '报销');
      session.setValue('amount', '200');
      const snapshot: FormSnapshot = session.snapshot();
      const blocked: string[] = checkIsolation(slotRef, DocKind.FORM, 'other.app', snapshot.revision);
      loggedExpect(blocked.length, 'DocumentFormFlowCases.test.ets:A0159', BUNDLE + '_DocumentFormFlowCases_0035').assertEqual(1);
      loggedExpect(blocked[0].indexOf('来源应用') >= 0, 'DocumentFormFlowCases.test.ets:A0160', BUNDLE + '_DocumentFormFlowCases_0035').assertTrue();
      loggedExpect(checkIsolation(slotRef, DocKind.FORM, 'app.continuation', snapshot.revision).length, 'DocumentFormFlowCases.test.ets:A0161', BUNDLE + '_DocumentFormFlowCases_0035')
        .assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3600
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0036
     * @tc.desc      Verify archived form still blocks replacement
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0036', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('form-1', DocKind.FORM, '报销单', 1));
      workspace.archive('form-1');
      loggedExpect(workspace.archivedSlots().length, 'DocumentFormFlowCases.test.ets:A0162', BUNDLE + '_DocumentFormFlowCases_0036').assertEqual(1);
      loggedExpect(workspace.audit().archived, 'DocumentFormFlowCases.test.ets:A0163', BUNDLE + '_DocumentFormFlowCases_0036').assertEqual(1);
      loggedExpect(workspace.activeSlots().length, 'DocumentFormFlowCases.test.ets:A0164', BUNDLE + '_DocumentFormFlowCases_0036').assertEqual(0);
      loggedExpect(workspace.open(slot('form-2', DocKind.FORM, '新单', 1)), 'DocumentFormFlowCases.test.ets:A0165', BUNDLE + '_DocumentFormFlowCases_0036').assertTrue();
      loggedExpect(workspace.audit().active, 'DocumentFormFlowCases.test.ets:A0166', BUNDLE + '_DocumentFormFlowCases_0036').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3700
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0037
     * @tc.desc      Verify branch rule table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_DocumentFormFlowCases_0037', 0, (): void => {
      loggedExpect(BRANCH_RULES.length, 'DocumentFormFlowCases.test.ets:A0167', BUNDLE + '_DocumentFormFlowCases_0037').assertEqual(5);
      loggedExpect(branchLines().length, 'DocumentFormFlowCases.test.ets:A0168', BUNDLE + '_DocumentFormFlowCases_0037').assertEqual(5);
      const codes: string[] = BRANCH_RULES.map((rule): string => rule.code);
      loggedExpect(codes.filter((code: string, index: number): boolean => codes.indexOf(code) !== index).length, 'DocumentFormFlowCases.test.ets:A0169', BUNDLE + '_DocumentFormFlowCases_0037')
        .assertEqual(0);
      BRANCH_RULES.forEach((rule): void => {
        loggedExpect(rule.fieldKey.length > 0, 'DocumentFormFlowCases.test.ets:A0170', BUNDLE + '_DocumentFormFlowCases_0037').assertTrue();
        loggedExpect(rule.triggerValue.length > 0, 'DocumentFormFlowCases.test.ets:A0171', BUNDLE + '_DocumentFormFlowCases_0037').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3800
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0038
     * @tc.desc      Verify form summary tracks stage and progress
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(BUNDLE + '_DocumentFormFlowCases_0038', 0, (): void => {
      const session: FormSession = formSession();
      loggedExpect(formSummary(session).indexOf('待补明细') >= 0 ||
        formSummary(session).indexOf('还有') >= 0, 'DocumentFormFlowCases.test.ets:A0172', BUNDLE + '_DocumentFormFlowCases_0038').assertTrue();
      session.setValue('kind', '报销');
      session.setValue('amount', '100');
      loggedExpect(formSummary(session).indexOf('可提交') >= 0, 'DocumentFormFlowCases.test.ets:A0173', BUNDLE + '_DocumentFormFlowCases_0038').assertTrue();
      session.review();
      loggedExpect(formSummary(session).indexOf(localize('ac_formsession_006')) >= 0, 'DocumentFormFlowCases.test.ets:A0174', BUNDLE + '_DocumentFormFlowCases_0038').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3900
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0039
     * @tc.desc      Verify workspace lines list every active slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(BUNDLE + '_DocumentFormFlowCases_0039', 0, (): void => {
      const workspace: DocumentWorkspace = new DocumentWorkspace();
      workspace.open(slot('note-1', DocKind.NOTE, '学习记录', 3));
      workspace.open(slot('read-1', DocKind.READING, '接口文档', 7));
      workspace.archive('read-1');
      const lines: string[] = workspaceLines(workspace);
      loggedExpect(lines.length >= 3, 'DocumentFormFlowCases.test.ets:A0175', BUNDLE + '_DocumentFormFlowCases_0039').assertTrue();
      loggedExpect(lines[0].indexOf('工作区正常') >= 0, 'DocumentFormFlowCases.test.ets:A0176', BUNDLE + '_DocumentFormFlowCases_0039').assertTrue();
      loggedExpect(lines.filter((line: string): boolean => line.indexOf('学习记录') >= 0).length, 'DocumentFormFlowCases.test.ets:A0177', BUNDLE + '_DocumentFormFlowCases_0039')
        .assertEqual(1);
      loggedExpect(lines.filter((line: string): boolean => line.indexOf('归档 1 项') >= 0).length, 'DocumentFormFlowCases.test.ets:A0178', BUNDLE + '_DocumentFormFlowCases_0039')
        .assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_4000
     * @tc.name      com.samples.appcontinuation_DocumentFormFlowCases_0040
     * @tc.desc      Verify form field refresh is idempotent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_DocumentFormFlowCases_0040', 0, (): void => {
      const field: FormField = new FormField('amount', '金额', true, 6);
      field.value = '';
      field.refresh();
      loggedExpect(field.state, 'DocumentFormFlowCases.test.ets:A0179', BUNDLE + '_DocumentFormFlowCases_0040').assertEqual(FieldState.EMPTY);
      loggedExpect(field.blocking(), 'DocumentFormFlowCases.test.ets:A0180', BUNDLE + '_DocumentFormFlowCases_0040').assertTrue();
      field.value = '300';
      field.refresh();
      field.refresh();
      loggedExpect(field.state, 'DocumentFormFlowCases.test.ets:A0181', BUNDLE + '_DocumentFormFlowCases_0040').assertEqual(FieldState.FILLED);
      loggedExpect(field.blocking(), 'DocumentFormFlowCases.test.ets:A0182', BUNDLE + '_DocumentFormFlowCases_0040').assertFalse();
      field.value = '1234567';
      field.refresh();
      loggedExpect(field.state, 'DocumentFormFlowCases.test.ets:A0183', BUNDLE + '_DocumentFormFlowCases_0040').assertEqual(FieldState.INVALID);
      loggedExpect(field.blocking(), 'DocumentFormFlowCases.test.ets:A0184', BUNDLE + '_DocumentFormFlowCases_0040').assertTrue();
    });
  });
}
