/** Production transaction regressions; controlled stores do not constitute device restart evidence. */
import { describe, expect } from '@ohos/hypium';
import { LearningFixture, inboundWant, payloadBag, rawPayload, withLearning } from '../support/LearningFixtures';
import { scenario } from '../support/BoundedCase';

function v2(id: string, revision: number, text: string, tag: string): string {
  const bag = payloadBag(text, tag, 0, text.length);
  bag['version'] = 2;
  bag['documentId'] = id;
  bag['revision'] = revision;
  return JSON.stringify(bag);
}

export default function continuationTransactions(): void {
  describe('ContinuationTransactions', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0100
     * @tc.name      testContinuationTransactions0001
     * @tc.desc      Verify tX 001 legacy identity atomic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationTransactions0001', (): void => {
      withLearning((f: LearningFixture): void => {
        f.controller.markWindowReady();
        f.controller.handleLaunch(inboundWant(rawPayload('旧版来文', 'legacy', 0, 4)), 3);
        const after = f.controller.snapshot();
        expect(after.committed).assertTrue();
        expect(after.documentId).assertEqual('');
        expect(after.revision).assertEqual(0);
        withLearning((reopened: LearningFixture): void => {
          expect(reopened.controller.snapshot().text).assertEqual(after.text);
          expect(reopened.controller.snapshot().documentId).assertEqual(after.documentId);
          expect(reopened.controller.snapshot().revision).assertEqual(after.revision);
        }, f.store.stored());
      }, v2('doc-existing', 55, '已保存', 'seed'));
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0200
     * @tc.name      testContinuationTransactions0002
     * @tc.desc      Verify tX 002 dirty always requires choice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationTransactions0002', (): void => {
      [v2('doc-a', 900, '较新远端', 'higher'), rawPayload('旧端来文', 'v1-dirty', 0, 4)].forEach((raw: string): void => {
        withLearning((f: LearningFixture): void => {
          f.controller.updateText('未保存的编辑');
          f.controller.markWindowReady();
          f.controller.handleLaunch(inboundWant(raw), 3);
          expect(f.controller.snapshot().conflictPending).assertTrue();
          expect(f.controller.snapshot().committed).assertFalse();
          expect(f.store.putCalls).assertEqual(0);
          f.controller.rejectConflict();
          expect(f.controller.snapshot().text).assertEqual('未保存的编辑');
          expect(f.controller.snapshot().revision).assertEqual(2);
          expect(f.store.putCalls).assertEqual(0);
        }, v2('doc-a', 2, '已保存', 'seed'));
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0300
     * @tc.name      testContinuationTransactions0003
     * @tc.desc      Verify tX 003 unrelated revision isolation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationTransactions0003', (): void => {
      withLearning((f: LearningFixture): void => {
        f.controller.updateText('A未保存');
        f.controller.markWindowReady();
        f.controller.handleLaunch(inboundWant(v2('doc-b', 3, 'B正文', 'switch')), 3);
        expect(f.controller.snapshot().conflictPending).assertTrue();
        f.controller.acceptConflict();
        expect(f.controller.snapshot().committed).assertTrue();
        expect(f.controller.snapshot().documentId).assertEqual('doc-b');
        expect(f.controller.snapshot().revision).assertEqual(4);
        const disk = JSON.parse(f.store.stored() as string) as Record<string, Object>;
        expect(disk['revision']).assertEqual(4);
      }, v2('doc-limit', 1000000000, 'A正文', 'seed'));
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0400
     * @tc.name      testContinuationTransactions0004
     * @tc.desc      Verify tX 005 accepted final snapshot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationTransactions0004', (): void => {
      [5, 1000000000].forEach((revision: number): void => {
        withLearning((f: LearningFixture): void => {
          let lastActive: boolean = true;
          let lastEditable: boolean = false;
          const unsubscribe = f.controller.subscribe((snapshot): void => {
            lastActive = snapshot.sessionActive;
            lastEditable = snapshot.canEdit;
          });
          f.controller.markWindowReady();
          f.controller.handleLaunch(inboundWant(v2('doc-a', 1, '远端旧版', 'accept-final')), 3);
          f.controller.acceptConflict();
          expect(lastActive).assertFalse();
          expect(lastEditable).assertTrue();
          expect(f.controller.snapshot().sessionActive).assertFalse();
          expect(f.controller.snapshot().canEdit).assertTrue();
          expect(f.controller.snapshot().committed).assertEqual(revision < 1000000000);
          f.controller.newDocument();
          expect(f.controller.snapshot().revision).assertEqual(1);
          unsubscribe();
        }, v2('doc-a', revision, '本机已保存', 'seed'));
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0500
     * @tc.name      testContinuationTransactions0005
     * @tc.desc      Verify tX 006 dirty identity switch same content
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationTransactions0005', (): void => {
      withLearning((f: LearningFixture): void => {
        f.controller.updateText('相同正文');
        f.controller.updateSelection(0, 4);
        f.controller.markWindowReady();
        f.controller.handleLaunch(inboundWant(v2('doc-b', 3, '相同正文', 'same-content')), 3);
        expect(f.controller.snapshot().conflictPending).assertTrue();
        expect(f.controller.snapshot().conflictKind).assertEqual('document');
        expect(f.store.putCalls).assertEqual(0);
        f.controller.rejectConflict();
        expect(f.controller.snapshot().documentId).assertEqual('doc-a');
        expect(f.controller.snapshot().revision).assertEqual(2);
        expect(f.controller.snapshot().text).assertEqual('相同正文');
        expect(f.store.putCalls).assertEqual(0);
        // 拒绝后 dirty 也应保留，同文档更高版本仍需选择。
        f.controller.handleLaunch(inboundWant(v2('doc-a', 9, '其他正文', 'still-dirty')), 3);
        expect(f.controller.snapshot().conflictPending).assertTrue();
      }, v2('doc-a', 2, '已保存正文', 'seed'));
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0600
     * @tc.name      testContinuationTransactions0006
     * @tc.desc      Verify tX 004 new document transaction
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testContinuationTransactions0006', (): void => {
      withLearning((f: LearningFixture): void => {
        f.controller.updateText('上限后的编辑🌱');
        const before = f.controller.snapshot();
        f.store.failFlushCalls = [1];
        f.controller.newDocument();
        expect(f.controller.snapshot().documentId).assertEqual(before.documentId);
        expect(f.controller.snapshot().revision).assertEqual(1000000000);
        expect(f.controller.snapshot().text).assertEqual(before.text);
        f.controller.newDocument();
        const after = f.controller.snapshot();
        expect(after.documentId !== before.documentId).assertTrue();
        expect(after.revision).assertEqual(1);
        expect(after.text).assertEqual(before.text);
        expect(after.selectionEnd).assertEqual(before.selectionEnd);
        withLearning((reopened: LearningFixture): void => {
          expect(reopened.controller.snapshot().documentId).assertEqual(after.documentId);
          expect(reopened.controller.snapshot().text).assertEqual(after.text);
        }, f.store.stored());
      }, v2('doc-limit', 1000000000, '原文', 'seed'));
    });
  });
}
