/** v1/v2 payload compatibility and same-document revision conflicts. */
import { describe, expect } from '@ohos/hypium';
import { AbilityConstant, Want } from '@kit.AbilityKit';
import { LearningSnapshot, OperationRecord, TEXT_PAYLOAD_KEY } from '../../../main/ets/learning/LearningTypes';
import { scenario } from '../support/BoundedCase';
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
     * @tc.name      testContinuationVersioning0001
     * @tc.desc      Verify v2载荷携带文档标识与修订号并完整恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0001', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag('doc-alpha', 5, 'v2正文🌱', 'v2-tag', 2, 6))), 3);
        const value: LearningSnapshot = fixture.controller.snapshot();
        expect(value.committed).assertTrue();
        expect(value.text).assertEqual('v2正文🌱');
        expect(value.documentId).assertEqual('doc-alpha');
        expect(value.revision).assertEqual(5);
        expect(value.selectionStart).assertEqual(2);
        expect(value.selectionEnd).assertEqual(6);
        expect(fixture.store.putCalls).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0200
     * @tc.name      testContinuationVersioning0002
     * @tc.desc      Verify v3或缺失文档字段的v2载荷被拒绝且不写库
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0002', (): void => {
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
          fixture.controller.handleLaunch(inboundWant(raw), 3);
          const value = fixture.controller.snapshot();
          expect(value.committed).assertFalse();
          expect(value.text).assertEqual('本机原文');
          expect(value.sessionActive).assertFalse();
          expect(fixture.store.putCalls).assertEqual(0);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0300
     * @tc.name      testContinuationVersioning0003
     * @tc.desc      Verify 同文档旧修订进入冲突且接受后按本机修订加一提交
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0003', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机已保存');
        fixture.controller.saveText();
        const afterSave = fixture.controller.snapshot();
        expect(afterSave.documentId.length > 0).assertTrue();
        expect(afterSave.revision).assertEqual(1);
        const writes = fixture.store.putCalls;
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(afterSave.documentId, 0, '旧的接续正文', 'stale-tag', 0, 4))), 3);
        let value = fixture.controller.snapshot();
        expect(value.conflictPending).assertTrue();
        expect(value.committed).assertFalse();
        expect(value.text).assertEqual('本机已保存');
        expect(value.conflictSummary.indexOf('r0') >= 0).assertTrue();
        expect(fixture.store.putCalls).assertEqual(writes);

        fixture.controller.acceptConflict();
        value = fixture.controller.snapshot();
        expect(value.conflictPending).assertFalse();
        expect(value.committed).assertTrue();
        expect(value.text).assertEqual('旧的接续正文');
        expect(value.revision).assertEqual(2);
        expect(fixture.store.putCalls).assertEqual(writes + 1);
        expect(restoreCalls(fixture)).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0400
     * @tc.name      testContinuationVersioning0004
     * @tc.desc      Verify 冲突选择保留本机时不写入且释放会话
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0004', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机版本');
        fixture.controller.saveText();
        const documentId = fixture.controller.snapshot().documentId;
        const writes = fixture.store.putCalls;
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(documentId, 1, '同号不同内容', 'divergent-tag', 0, 3))), 3);
        expect(fixture.controller.snapshot().conflictPending).assertTrue();
        fixture.controller.rejectConflict();
        const value = fixture.controller.snapshot();
        expect(value.conflictPending).assertFalse();
        expect(value.text).assertEqual('本机版本');
        expect(value.committed).assertFalse();
        expect(value.sessionActive).assertFalse();
        expect(fixture.store.putCalls).assertEqual(writes);
        const restore = value.records.find((row: OperationRecord) => row.operation === 'RESTORE');
        expect(restore !== undefined).assertTrue();
        if (restore !== undefined) {
          expect(restore.result.indexOf('保留本机') >= 0).assertTrue();
        }
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0500
     * @tc.name      testContinuationVersioning0005
     * @tc.desc      Verify 保存后的v2参数可被另一实例恢复且修订号递增
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0005', (): void => {
      let documentId = '';
      withLearning((source: LearningFixture): void => {
        source.controller.updateText('源端第二版');
        source.controller.saveText();
        documentId = source.controller.snapshot().documentId;
        const parameters: Record<string, Object> = {};
        expect(source.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const decoded = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        expect(decoded['version']).assertEqual(2);
        expect(decoded['documentId']).assertEqual(documentId);
        expect(decoded['revision']).assertEqual(1);
        withLearning((target: LearningFixture): void => {
          target.controller.markWindowReady();
          target.controller.handleLaunch({ parameters: parameters } as Want, 3);
          const restored = target.controller.snapshot();
          expect(restored.committed).assertTrue();
          expect(restored.documentId).assertEqual(documentId);
          expect(restored.revision).assertEqual(1);
          expect(restored.text).assertEqual('源端第二版');
          target.controller.updateText('目标端继续编辑');
          target.controller.saveText();
          expect(target.controller.snapshot().revision).assertEqual(2);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0600
     * @tc.name      testContinuationVersioning0006
     * @tc.desc      Verify 未保存的源端仍发送v1并保持旧端兼容
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0006', (): void => {
      withLearning((source: LearningFixture): void => {
        source.controller.updateText('v1兼容正文');
        const parameters: Record<string, Object> = {};
        expect(source.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const decoded = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        expect(decoded['version']).assertEqual(1);
        expect(decoded['documentId']).assertEqual('');
        withLearning((target: LearningFixture): void => {
          target.controller.markWindowReady();
          target.controller.handleLaunch({ parameters: parameters } as Want, 3);
          const value = target.controller.snapshot();
          expect(value.committed).assertTrue();
          expect(value.text).assertEqual('v1兼容正文');
          expect(value.documentId).assertEqual('');
          expect(value.revision).assertEqual(0);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0700
     * @tc.name      testContinuationVersioning0007
     * @tc.desc      Verify 冲突等待期间重复窗口就绪不重复写库
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0007', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机');
        fixture.controller.saveText();
        const documentId = fixture.controller.snapshot().documentId;
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(documentId, 0, '候选', 'wait-tag', 0, 2))), 3);
        const writes = fixture.store.putCalls;
        fixture.controller.markWindowReady();
        fixture.controller.markWindowReady();
        expect(fixture.controller.snapshot().conflictPending).assertTrue();
        expect(fixture.store.putCalls).assertEqual(writes);
        fixture.controller.acceptConflict();
        expect(fixture.store.putCalls).assertEqual(writes + 1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0800
     * @tc.name      testContinuationVersioning0008
     * @tc.desc      Verify 冲突接受在快速结果和页面就绪前不得写库
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0008', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机已保存');
        fixture.controller.saveText();
        const documentId = fixture.controller.snapshot().documentId;
        const writes = fixture.store.putCalls;
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(documentId, 0, '冲突候选', 'gate-tag', 0, 4))), 10);
        expect(fixture.controller.snapshot().conflictPending).assertTrue();
        fixture.controller.acceptConflict();
        expect(fixture.controller.snapshot().conflictAccepted).assertTrue();
        expect(fixture.controller.snapshot().committed).assertFalse();
        expect(fixture.store.putCalls).assertEqual(writes);
        fixture.controller.markWindowReady();
        expect(fixture.store.putCalls).assertEqual(writes);
        fixture.controller.registerProbe();
        fixture.native.deliverOn(0, undefined, resultInfo(0));
        const value = fixture.controller.snapshot();
        expect(value.committed).assertTrue();
        expect(value.text).assertEqual('冲突候选');
        expect(value.revision).assertEqual(2);
        expect(fixture.store.putCalls).assertEqual(writes + 1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_0900
     * @tc.name      testContinuationVersioning0009
     * @tc.desc      Verify 冲突接受写入失败保持文档标识和修订号不变
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0009', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('本机');
        fixture.controller.saveText();
        const before = fixture.controller.snapshot();
        const writes = fixture.store.putCalls;
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag(before.documentId, 0, '失败候选', 'fail-tag', 0, 4))), 3);
        fixture.store.failPutCalls = [fixture.store.putCalls + 1];
        fixture.controller.acceptConflict();
        const after = fixture.controller.snapshot();
        expect(after.text).assertEqual('本机');
        expect(after.documentId).assertEqual(before.documentId);
        expect(after.revision).assertEqual(before.revision);
        expect(fixture.store.putCalls).assertEqual(writes + 2);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_1000
     * @tc.name      testContinuationVersioning0010
     * @tc.desc      Verify 文档切换在本机未保存时进入冲突并按新文档提交
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0010', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('文档A');
        fixture.controller.saveText();
        fixture.controller.updateText('文档A未保存修改');
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag('doc-other', 3, '文档B', 'switch-tag', 0, 3))), 3);
        let value = fixture.controller.snapshot();
        expect(value.conflictPending).assertTrue();
        expect(value.conflictKind).assertEqual('document');
        fixture.controller.acceptConflict();
        value = fixture.controller.snapshot();
        expect(value.documentId).assertEqual('doc-other');
        expect(value.text).assertEqual('文档B');
        expect(value.revision).assertEqual(4);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_1100
     * @tc.name      testContinuationVersioning0011
     * @tc.desc      Verify 无未保存内容时不同文档直接切换并采用接续修订号
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0011', (): void => {
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.updateText('文档A');
        fixture.controller.saveText();
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag('doc-other', 7, '文档B', 'switch-clean', 0, 3))), 3);
        const value = fixture.controller.snapshot();
        expect(value.conflictPending).assertFalse();
        expect(value.committed).assertTrue();
        expect(value.documentId).assertEqual('doc-other');
        expect(value.revision).assertEqual(7);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONVERSIONING_1200
     * @tc.name      testContinuationVersioning0012
     * @tc.desc      Verify 修订号上限阻止冲突接受且不写库
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationVersioning0012', (): void => {
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
        expect(fixture.controller.snapshot().revision).assertEqual(1000000000);
        fixture.controller.updateText('本机修改');
        fixture.controller.markWindowReady();
        fixture.controller.handleLaunch(inboundWant(JSON.stringify(
          versionedBag('doc-limit', 999999999, '候选', 'limit-tag', 0, 3))), 3);
        fixture.controller.acceptConflict();
        expect(fixture.controller.snapshot().committed).assertFalse();
        expect(fixture.store.putCalls).assertEqual(0);
        expect(fixture.controller.snapshot().text).assertEqual('本机修改');
      }, seed);
    });
  });
}
