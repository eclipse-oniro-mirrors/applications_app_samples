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

/** v1/v2 payload compatibility and same-document revision conflicts. */
import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { AbilityConstant, Want } from '@kit.AbilityKit';
import { LearningSnapshot, OperationRecord, TEXT_PAYLOAD_KEY } from '../../../main/ets/learning/LearningTypes';
import { BUNDLE, scenario } from '../support/BoundedCase';
import { inboundWant, LearningFixture, payloadBag, resultInfo, withLearning } from '../support/LearningFixtures';

function versionedBag(documentId: string, revision: number, text: string, tag: string,
  start: number = 0, end: number = 2): Record<string, Object> {
  const bag = payloadBag(text, tag, start, end);
  bag['version'] = 2;
  bag['documentId'] = documentId;
  bag['revision'] = revision;
  return bag;
}

function restoreCalls(fixture: LearningFixture): number {
  return fixture.controller.snapshot().records.filter((row: OperationRecord) => row.operation === 'RESTORE').length;
}

export default function continuationVersioning(): void {
  describe('ContinuationVersioning', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0100
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0001
     * @tc.desc      Verify v2载荷携带文档标识与修订号并完整恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0001', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag('doc-alpha', 5, 'v2正文🌱', 'v2-tag', 2, 6))), AbilityConstant.LaunchReason.CONTINUATION);
        const value: LearningSnapshot = fixture.controller.snapshot();
        loggedExpect(value.committed, 'ContinuationVersioning.test.ets:A0001', BUNDLE + '_ContinuationVersioning_0001').assertTrue();
        loggedExpect(value.text, 'ContinuationVersioning.test.ets:A0002', BUNDLE + '_ContinuationVersioning_0001').assertEqual('v2正文🌱');
        loggedExpect(value.documentId, 'ContinuationVersioning.test.ets:A0003', BUNDLE + '_ContinuationVersioning_0001').assertEqual('doc-alpha');
        loggedExpect(value.revision, 'ContinuationVersioning.test.ets:A0004', BUNDLE + '_ContinuationVersioning_0001').assertEqual(5);
        loggedExpect(value.selectionStart, 'ContinuationVersioning.test.ets:A0005', BUNDLE + '_ContinuationVersioning_0001').assertEqual(2);
        loggedExpect(value.selectionEnd, 'ContinuationVersioning.test.ets:A0006', BUNDLE + '_ContinuationVersioning_0001').assertEqual(6);
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0007', BUNDLE + '_ContinuationVersioning_0001').assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0200
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0002
     * @tc.desc      Verify v3或缺失文档字段的v2载荷被拒绝且不写库
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0002', (): void => {
      const invalid: string[] = [];
      const future = versionedBag('doc-alpha', 1, '未来版本', 'v3-tag');
      future['version'] = 3;
      invalid.push(JSON.stringify(future));
      const missingId = versionedBag('', 1, '缺少标识', 'v2-no-id');
      invalid.push(JSON.stringify(missingId));
      const negative = versionedBag('doc-alpha', -1, '负修订', 'v2-neg');
      invalid.push(JSON.stringify(negative));
      invalid.forEach((raw: string): void => {
        withLearning((fixture: LearningFixture): void => {
          fixture.controller.updateText('本机原文');
          fixture.controller.markWindowReady();
          fixture.controller.handleLaunch(inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
          const value = fixture.controller.snapshot();
          loggedExpect(value.committed, 'ContinuationVersioning.test.ets:A0008', BUNDLE + '_ContinuationVersioning_0002').assertFalse();
          loggedExpect(value.text, 'ContinuationVersioning.test.ets:A0009', BUNDLE + '_ContinuationVersioning_0002').assertEqual('本机原文');
          loggedExpect(value.sessionActive, 'ContinuationVersioning.test.ets:A0010', BUNDLE + '_ContinuationVersioning_0002').assertFalse();
          loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0011', BUNDLE + '_ContinuationVersioning_0002').assertEqual(0);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0300
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0003
     * @tc.desc      Verify 同文档旧修订进入冲突且接受后按本机修订加一提交
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0003', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机已保存');
        fixture.controller.saveText();
        const afterSave = fixture.controller.snapshot();
        loggedExpect(afterSave.documentId.length > 0, 'ContinuationVersioning.test.ets:A0012', BUNDLE + '_ContinuationVersioning_0003').assertTrue();
        loggedExpect(afterSave.revision, 'ContinuationVersioning.test.ets:A0013', BUNDLE + '_ContinuationVersioning_0003').assertEqual(1);
        const writes = fixture.store.putCalls;
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(afterSave.documentId, 0, '旧的接续正文', 'stale-tag', 0, 4))), AbilityConstant.LaunchReason.CONTINUATION);
        let value = fixture.controller.snapshot();
        loggedExpect(value.conflictPending, 'ContinuationVersioning.test.ets:A0014', BUNDLE + '_ContinuationVersioning_0003').assertTrue();
        loggedExpect(value.committed, 'ContinuationVersioning.test.ets:A0015', BUNDLE + '_ContinuationVersioning_0003').assertFalse();
        loggedExpect(value.text, 'ContinuationVersioning.test.ets:A0016', BUNDLE + '_ContinuationVersioning_0003').assertEqual('本机已保存');
        loggedExpect(value.conflictSummary.indexOf('r0') >= 0, 'ContinuationVersioning.test.ets:A0017', BUNDLE + '_ContinuationVersioning_0003').assertTrue();
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0018', BUNDLE + '_ContinuationVersioning_0003').assertEqual(writes);

        fixture.controller.acceptConflict();
        value = fixture.controller.snapshot();
        loggedExpect(value.conflictPending, 'ContinuationVersioning.test.ets:A0019', BUNDLE + '_ContinuationVersioning_0003').assertFalse();
        loggedExpect(value.committed, 'ContinuationVersioning.test.ets:A0020', BUNDLE + '_ContinuationVersioning_0003').assertTrue();
        loggedExpect(value.text, 'ContinuationVersioning.test.ets:A0021', BUNDLE + '_ContinuationVersioning_0003').assertEqual('旧的接续正文');
        loggedExpect(value.revision, 'ContinuationVersioning.test.ets:A0022', BUNDLE + '_ContinuationVersioning_0003').assertEqual(2);
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0023', BUNDLE + '_ContinuationVersioning_0003').assertEqual(writes + 1);
        loggedExpect(restoreCalls(fixture), 'ContinuationVersioning.test.ets:A0024', BUNDLE + '_ContinuationVersioning_0003').assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0400
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0004
     * @tc.desc      Verify 冲突选择保留本机时不写入且释放会话
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0004', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机版本');
        fixture.controller.saveText();
        const documentId = fixture.controller.snapshot().documentId;
        const writes = fixture.store.putCalls;
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(documentId, 1, '同号不同内容', 'divergent-tag', 0, 3))), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(fixture.controller.snapshot().conflictPending, 'ContinuationVersioning.test.ets:A0025', BUNDLE + '_ContinuationVersioning_0004').assertTrue();
        fixture.controller.rejectConflict();
        const value = fixture.controller.snapshot();
        loggedExpect(value.conflictPending, 'ContinuationVersioning.test.ets:A0026', BUNDLE + '_ContinuationVersioning_0004').assertFalse();
        loggedExpect(value.text, 'ContinuationVersioning.test.ets:A0027', BUNDLE + '_ContinuationVersioning_0004').assertEqual('本机版本');
        loggedExpect(value.committed, 'ContinuationVersioning.test.ets:A0028', BUNDLE + '_ContinuationVersioning_0004').assertFalse();
        loggedExpect(value.sessionActive, 'ContinuationVersioning.test.ets:A0029', BUNDLE + '_ContinuationVersioning_0004').assertFalse();
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0030', BUNDLE + '_ContinuationVersioning_0004').assertEqual(writes);
        const restore = value.records.find((row: OperationRecord) => row.operation === 'RESTORE');
        loggedExpect(restore !== undefined, 'ContinuationVersioning.test.ets:A0031', BUNDLE + '_ContinuationVersioning_0004').assertTrue();
        if (restore !== undefined) {
          loggedExpect(restore.result.indexOf('保留本机') >= 0, 'ContinuationVersioning.test.ets:A0032', BUNDLE + '_ContinuationVersioning_0004').assertTrue();
        }
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0500
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0005
     * @tc.desc      Verify 保存后的v2参数可被另一实例恢复且修订号递增
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0005', (): void => {
      let documentId = '';
      withLearning((source: LearningFixture): void => {
        source.controller.updateText('源端第二版');
        source.controller.saveText();
        documentId = source.controller.snapshot().documentId;
        const parameters: Record<string, Object> = {};
        loggedExpect(source.controller.buildContinuation(parameters), 'ContinuationVersioning.test.ets:A0033', BUNDLE + '_ContinuationVersioning_0005').assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const decoded = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        loggedExpect(decoded['version'], 'ContinuationVersioning.test.ets:A0034', BUNDLE + '_ContinuationVersioning_0005').assertEqual(2);
        loggedExpect(decoded['documentId'], 'ContinuationVersioning.test.ets:A0035', BUNDLE + '_ContinuationVersioning_0005').assertEqual(documentId);
        loggedExpect(decoded['revision'], 'ContinuationVersioning.test.ets:A0036', BUNDLE + '_ContinuationVersioning_0005').assertEqual(1);
        withLearning((target: LearningFixture): void => {
          target.controller.markWindowReady();
          target.controller.handleLaunch({ parameters: parameters } as Want, AbilityConstant.LaunchReason.CONTINUATION);
          const restored = target.controller.snapshot();
          loggedExpect(restored.committed, 'ContinuationVersioning.test.ets:A0037', BUNDLE + '_ContinuationVersioning_0005').assertTrue();
          loggedExpect(restored.documentId, 'ContinuationVersioning.test.ets:A0038', BUNDLE + '_ContinuationVersioning_0005').assertEqual(documentId);
          loggedExpect(restored.revision, 'ContinuationVersioning.test.ets:A0039', BUNDLE + '_ContinuationVersioning_0005').assertEqual(1);
          loggedExpect(restored.text, 'ContinuationVersioning.test.ets:A0040', BUNDLE + '_ContinuationVersioning_0005').assertEqual('源端第二版');
          target.controller.updateText('目标端继续编辑');
          target.controller.saveText();
          loggedExpect(target.controller.snapshot().revision, 'ContinuationVersioning.test.ets:A0041', BUNDLE + '_ContinuationVersioning_0005').assertEqual(2);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0600
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0006
     * @tc.desc      Verify 未保存的源端仍发送v1并保持旧端兼容
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0006', (): void => {
      withLearning((source: LearningFixture): void => {
        source.controller.updateText('v1兼容正文');
        const parameters: Record<string, Object> = {};
        loggedExpect(source.controller.buildContinuation(parameters), 'ContinuationVersioning.test.ets:A0042', BUNDLE + '_ContinuationVersioning_0006').assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const decoded = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        loggedExpect(decoded['version'], 'ContinuationVersioning.test.ets:A0043', BUNDLE + '_ContinuationVersioning_0006').assertEqual(1);
        loggedExpect(decoded['documentId'], 'ContinuationVersioning.test.ets:A0044', BUNDLE + '_ContinuationVersioning_0006').assertEqual('');
        withLearning((target: LearningFixture): void => {
          target.controller.markWindowReady();
          target.controller.handleLaunch({ parameters: parameters } as Want, AbilityConstant.LaunchReason.CONTINUATION);
          const value = target.controller.snapshot();
          loggedExpect(value.committed, 'ContinuationVersioning.test.ets:A0045', BUNDLE + '_ContinuationVersioning_0006').assertTrue();
          loggedExpect(value.text, 'ContinuationVersioning.test.ets:A0046', BUNDLE + '_ContinuationVersioning_0006').assertEqual('v1兼容正文');
          loggedExpect(value.documentId, 'ContinuationVersioning.test.ets:A0047', BUNDLE + '_ContinuationVersioning_0006').assertEqual('');
          loggedExpect(value.revision, 'ContinuationVersioning.test.ets:A0048', BUNDLE + '_ContinuationVersioning_0006').assertEqual(0);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0700
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0007
     * @tc.desc      Verify 冲突等待期间重复窗口就绪不重复写库
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0007', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机');
        fixture.controller.saveText();
        const documentId = fixture.controller.snapshot().documentId;
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(documentId, 0, '候选', 'wait-tag', 0, 2))), AbilityConstant.LaunchReason.CONTINUATION);
        const writes = fixture.store.putCalls;
        fixture.controller.markWindowReady();
        fixture.controller.markWindowReady();
        loggedExpect(fixture.controller.snapshot().conflictPending, 'ContinuationVersioning.test.ets:A0049', BUNDLE + '_ContinuationVersioning_0007').assertTrue();
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0050', BUNDLE + '_ContinuationVersioning_0007').assertEqual(writes);
        fixture.controller.acceptConflict();
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0051', BUNDLE + '_ContinuationVersioning_0007').assertEqual(writes + 1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0800
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0008
     * @tc.desc      Verify 冲突接受在快速结果和页面就绪前不得写库
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0008', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机已保存');
        fixture.controller.saveText();
        const documentId = fixture.controller.snapshot().documentId;
        const writes = fixture.store.putCalls;
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(documentId, 0, '冲突候选', 'gate-tag', 0, 4))), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        loggedExpect(fixture.controller.snapshot().conflictPending, 'ContinuationVersioning.test.ets:A0052', BUNDLE + '_ContinuationVersioning_0008').assertTrue();
        fixture.controller.acceptConflict();
        loggedExpect(fixture.controller.snapshot().conflictAccepted, 'ContinuationVersioning.test.ets:A0053', BUNDLE + '_ContinuationVersioning_0008').assertTrue();
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationVersioning.test.ets:A0054', BUNDLE + '_ContinuationVersioning_0008').assertFalse();
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0055', BUNDLE + '_ContinuationVersioning_0008').assertEqual(writes);
        fixture.controller.markWindowReady();
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0056', BUNDLE + '_ContinuationVersioning_0008').assertEqual(writes);
        fixture.controller.registerProbe();
        fixture.native.deliverOn(0, undefined, resultInfo(0));
        const value = fixture.controller.snapshot();
        loggedExpect(value.committed, 'ContinuationVersioning.test.ets:A0057', BUNDLE + '_ContinuationVersioning_0008').assertTrue();
        loggedExpect(value.text, 'ContinuationVersioning.test.ets:A0058', BUNDLE + '_ContinuationVersioning_0008').assertEqual('冲突候选');
        loggedExpect(value.revision, 'ContinuationVersioning.test.ets:A0059', BUNDLE + '_ContinuationVersioning_0008').assertEqual(2);
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0060', BUNDLE + '_ContinuationVersioning_0008').assertEqual(writes + 1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0900
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0009
     * @tc.desc      Verify 冲突接受写入失败保持文档标识和修订号不变
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0009', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机');
        fixture.controller.saveText();
        const before = fixture.controller.snapshot();
        const writes = fixture.store.putCalls;
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(before.documentId, 0, '失败候选', 'fail-tag', 0, 4))), AbilityConstant.LaunchReason.CONTINUATION);
        fixture.store.failPutCalls = [fixture.store.putCalls + 1];
        fixture.controller.acceptConflict();
        const after = fixture.controller.snapshot();
        loggedExpect(after.text, 'ContinuationVersioning.test.ets:A0061', BUNDLE + '_ContinuationVersioning_0009').assertEqual('本机');
        loggedExpect(after.documentId, 'ContinuationVersioning.test.ets:A0062', BUNDLE + '_ContinuationVersioning_0009').assertEqual(before.documentId);
        loggedExpect(after.revision, 'ContinuationVersioning.test.ets:A0063', BUNDLE + '_ContinuationVersioning_0009').assertEqual(before.revision);
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0064', BUNDLE + '_ContinuationVersioning_0009').assertEqual(writes + 2);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_1000
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0010
     * @tc.desc      Verify 文档切换在本机未保存时进入冲突并按新文档提交
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0010', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('文档A');
        fixture.controller.saveText();
        fixture.controller.updateText('文档A未保存修改');
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag('doc-other', 3, '文档B', 'switch-tag', 0, 3))), AbilityConstant.LaunchReason.CONTINUATION);
        let value = fixture.controller.snapshot();
        loggedExpect(value.conflictPending, 'ContinuationVersioning.test.ets:A0065', BUNDLE + '_ContinuationVersioning_0010').assertTrue();
        loggedExpect(value.conflictKind, 'ContinuationVersioning.test.ets:A0066', BUNDLE + '_ContinuationVersioning_0010').assertEqual('document');
        fixture.controller.acceptConflict();
        value = fixture.controller.snapshot();
        loggedExpect(value.documentId, 'ContinuationVersioning.test.ets:A0067', BUNDLE + '_ContinuationVersioning_0010').assertEqual('doc-other');
        loggedExpect(value.text, 'ContinuationVersioning.test.ets:A0068', BUNDLE + '_ContinuationVersioning_0010').assertEqual('文档B');
        loggedExpect(value.revision, 'ContinuationVersioning.test.ets:A0069', BUNDLE + '_ContinuationVersioning_0010').assertEqual(4);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_1100
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0011
     * @tc.desc      Verify 无未保存内容时不同文档直接切换并采用接续修订号
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0011', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('文档A');
        fixture.controller.saveText();
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag('doc-other', 7, '文档B', 'switch-clean', 0, 3))), AbilityConstant.LaunchReason.CONTINUATION);
        const value = fixture.controller.snapshot();
        loggedExpect(value.conflictPending, 'ContinuationVersioning.test.ets:A0070', BUNDLE + '_ContinuationVersioning_0011').assertFalse();
        loggedExpect(value.committed, 'ContinuationVersioning.test.ets:A0071', BUNDLE + '_ContinuationVersioning_0011').assertTrue();
        loggedExpect(value.documentId, 'ContinuationVersioning.test.ets:A0072', BUNDLE + '_ContinuationVersioning_0011').assertEqual('doc-other');
        loggedExpect(value.revision, 'ContinuationVersioning.test.ets:A0073', BUNDLE + '_ContinuationVersioning_0011').assertEqual(7);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_1200
     * @tc.name      com.samples.appcontinuation_ContinuationVersioning_0012
     * @tc.desc      Verify 修订号上限阻止冲突接受且不写库
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationVersioning_0012', (): void => {
      const seed = JSON.stringify({
        version: 2,
        transferId: 'seed',
        page: 'text',
        text: '上限文档',
        selectionStart: 0,
        selectionEnd: 4,
        documentId: 'doc-limit',
        revision: 1000000000
      });
      withLearning((fixture: LearningFixture): void => {
        loggedExpect(fixture.controller.snapshot().revision, 'ContinuationVersioning.test.ets:A0074', BUNDLE + '_ContinuationVersioning_0012').assertEqual(1000000000);
        fixture.controller.updateText('本机修改');
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag('doc-limit', 999999999, '候选', 'limit-tag', 0, 3))), AbilityConstant.LaunchReason.CONTINUATION);
        fixture.controller.acceptConflict();
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationVersioning.test.ets:A0075', BUNDLE + '_ContinuationVersioning_0012').assertFalse();
        loggedExpect(fixture.store.putCalls, 'ContinuationVersioning.test.ets:A0076', BUNDLE + '_ContinuationVersioning_0012').assertEqual(0);
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationVersioning.test.ets:A0077', BUNDLE + '_ContinuationVersioning_0012').assertEqual('本机修改');
      }, seed);
    });
  });
}
