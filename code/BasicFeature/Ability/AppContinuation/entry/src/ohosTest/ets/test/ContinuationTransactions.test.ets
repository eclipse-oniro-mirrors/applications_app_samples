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

/** Production transaction regressions; controlled stores do not constitute device restart evidence. */
import { AbilityConstant } from '@kit.AbilityKit';
import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { LearningFixture, inboundWant, payloadBag, rawPayload, withLearning } from '../support/LearningFixtures';
import { BUNDLE, scenario } from '../support/BoundedCase';

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
     * @tc.name      com.samples.appcontinuation_ContinuationTransactions_0001
     * @tc.desc      Verify tX 001 legacy identity atomic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationTransactions_0001', (): void => {
      withLearning((f: LearningFixture): void => {
        f.controller.markWindowReady();
        f.controller.handleLaunch(inboundWant(rawPayload('旧版来文', 'legacy', 0, 4)), AbilityConstant.LaunchReason.CONTINUATION);
        const after = f.controller.snapshot();
        loggedExpect(after.committed, 'ContinuationTransactions.test.ets:A0001', BUNDLE + '_ContinuationTransactions_0001').assertTrue();
        loggedExpect(after.documentId, 'ContinuationTransactions.test.ets:A0002', BUNDLE + '_ContinuationTransactions_0001').assertEqual('');
        loggedExpect(after.revision, 'ContinuationTransactions.test.ets:A0003', BUNDLE + '_ContinuationTransactions_0001').assertEqual(0);
        withLearning((reopened: LearningFixture): void => {
          loggedExpect(reopened.controller.snapshot().text, 'ContinuationTransactions.test.ets:A0004', BUNDLE + '_ContinuationTransactions_0001').assertEqual(after.text);
          loggedExpect(reopened.controller.snapshot().documentId, 'ContinuationTransactions.test.ets:A0005', BUNDLE + '_ContinuationTransactions_0001').assertEqual(after.documentId);
          loggedExpect(reopened.controller.snapshot().revision, 'ContinuationTransactions.test.ets:A0006', BUNDLE + '_ContinuationTransactions_0001').assertEqual(after.revision);
        }, f.store.stored());
      }, v2('doc-existing', 55, '已保存', 'seed'));
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0200
     * @tc.name      com.samples.appcontinuation_ContinuationTransactions_0002
     * @tc.desc      Verify tX 002 dirty always requires choice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationTransactions_0002', (): void => {
      [v2('doc-a', 900, '较新远端', 'higher'), rawPayload('旧端来文', 'v1-dirty', 0, 4)].forEach((raw: string): void => {
        withLearning((f: LearningFixture): void => {
          f.controller.updateText('未保存的编辑');
          f.controller.markWindowReady();
          f.controller.handleLaunch(inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
          loggedExpect(f.controller.snapshot().conflictPending, 'ContinuationTransactions.test.ets:A0007', BUNDLE + '_ContinuationTransactions_0002').assertTrue();
          loggedExpect(f.controller.snapshot().committed, 'ContinuationTransactions.test.ets:A0008', BUNDLE + '_ContinuationTransactions_0002').assertFalse();
          loggedExpect(f.store.putCalls, 'ContinuationTransactions.test.ets:A0009', BUNDLE + '_ContinuationTransactions_0002').assertEqual(0);
          f.controller.rejectConflict();
          loggedExpect(f.controller.snapshot().text, 'ContinuationTransactions.test.ets:A0010', BUNDLE + '_ContinuationTransactions_0002').assertEqual('未保存的编辑');
          loggedExpect(f.controller.snapshot().revision, 'ContinuationTransactions.test.ets:A0011', BUNDLE + '_ContinuationTransactions_0002').assertEqual(2);
          loggedExpect(f.store.putCalls, 'ContinuationTransactions.test.ets:A0012', BUNDLE + '_ContinuationTransactions_0002').assertEqual(0);
        }, v2('doc-a', 2, '已保存', 'seed'));
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0300
     * @tc.name      com.samples.appcontinuation_ContinuationTransactions_0003
     * @tc.desc      Verify tX 003 unrelated revision isolation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationTransactions_0003', (): void => {
      withLearning((f: LearningFixture): void => {
        f.controller.updateText('A未保存');
        f.controller.markWindowReady();
        f.controller.handleLaunch(inboundWant(v2('doc-b', 3, 'B正文', 'switch')), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(f.controller.snapshot().conflictPending, 'ContinuationTransactions.test.ets:A0013', BUNDLE + '_ContinuationTransactions_0003').assertTrue();
        f.controller.acceptConflict();
        loggedExpect(f.controller.snapshot().committed, 'ContinuationTransactions.test.ets:A0014', BUNDLE + '_ContinuationTransactions_0003').assertTrue();
        loggedExpect(f.controller.snapshot().documentId, 'ContinuationTransactions.test.ets:A0015', BUNDLE + '_ContinuationTransactions_0003').assertEqual('doc-b');
        loggedExpect(f.controller.snapshot().revision, 'ContinuationTransactions.test.ets:A0016', BUNDLE + '_ContinuationTransactions_0003').assertEqual(4);
        const disk = JSON.parse(f.store.stored() as string) as Record<string, Object>;
        loggedExpect(disk['revision'], 'ContinuationTransactions.test.ets:A0017', BUNDLE + '_ContinuationTransactions_0003').assertEqual(4);
      }, v2('doc-limit', 1000000000, 'A正文', 'seed'));
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0400
     * @tc.name      com.samples.appcontinuation_ContinuationTransactions_0004
     * @tc.desc      Verify tX 005 accepted final snapshot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationTransactions_0004', (): void => {
      [5, 1000000000].forEach((revision: number): void => {
        withLearning((f: LearningFixture): void => {
          let lastActive: boolean = true;
          let lastEditable: boolean = false;
          const unsubscribe = f.controller.subscribe((snapshot): void => {
            lastActive = snapshot.sessionActive;
            lastEditable = snapshot.canEdit;
          });
          f.controller.markWindowReady();
          f.controller.handleLaunch(inboundWant(v2('doc-a', 1, '远端旧版', 'accept-final')), AbilityConstant.LaunchReason.CONTINUATION);
          f.controller.acceptConflict();
          loggedExpect(lastActive, 'ContinuationTransactions.test.ets:A0018', BUNDLE + '_ContinuationTransactions_0004').assertFalse();
          loggedExpect(lastEditable, 'ContinuationTransactions.test.ets:A0019', BUNDLE + '_ContinuationTransactions_0004').assertTrue();
          loggedExpect(f.controller.snapshot().sessionActive, 'ContinuationTransactions.test.ets:A0020', BUNDLE + '_ContinuationTransactions_0004').assertFalse();
          loggedExpect(f.controller.snapshot().canEdit, 'ContinuationTransactions.test.ets:A0021', BUNDLE + '_ContinuationTransactions_0004').assertTrue();
          loggedExpect(f.controller.snapshot().committed, 'ContinuationTransactions.test.ets:A0022', BUNDLE + '_ContinuationTransactions_0004').assertEqual(revision < 1000000000);
          f.controller.newDocument();
          loggedExpect(f.controller.snapshot().revision, 'ContinuationTransactions.test.ets:A0023', BUNDLE + '_ContinuationTransactions_0004').assertEqual(1);
          unsubscribe();
        }, v2('doc-a', revision, '本机已保存', 'seed'));
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0500
     * @tc.name      com.samples.appcontinuation_ContinuationTransactions_0005
     * @tc.desc      Verify tX 006 dirty identity switch same content
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationTransactions_0005', (): void => {
      withLearning((f: LearningFixture): void => {
        f.controller.updateText('相同正文');
        f.controller.updateSelection(0, 4);
        f.controller.markWindowReady();
        f.controller.handleLaunch(inboundWant(v2('doc-b', 3, '相同正文', 'same-content')), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(f.controller.snapshot().conflictPending, 'ContinuationTransactions.test.ets:A0024', BUNDLE + '_ContinuationTransactions_0005').assertTrue();
        loggedExpect(f.controller.snapshot().conflictKind, 'ContinuationTransactions.test.ets:A0025', BUNDLE + '_ContinuationTransactions_0005').assertEqual('document');
        loggedExpect(f.store.putCalls, 'ContinuationTransactions.test.ets:A0026', BUNDLE + '_ContinuationTransactions_0005').assertEqual(0);
        f.controller.rejectConflict();
        loggedExpect(f.controller.snapshot().documentId, 'ContinuationTransactions.test.ets:A0027', BUNDLE + '_ContinuationTransactions_0005').assertEqual('doc-a');
        loggedExpect(f.controller.snapshot().revision, 'ContinuationTransactions.test.ets:A0028', BUNDLE + '_ContinuationTransactions_0005').assertEqual(2);
        loggedExpect(f.controller.snapshot().text, 'ContinuationTransactions.test.ets:A0029', BUNDLE + '_ContinuationTransactions_0005').assertEqual('相同正文');
        loggedExpect(f.store.putCalls, 'ContinuationTransactions.test.ets:A0030', BUNDLE + '_ContinuationTransactions_0005').assertEqual(0);
        // 拒绝后 dirty 也应保留，同文档更高版本仍需选择。
        f.controller.handleLaunch(inboundWant(v2('doc-a', 9, '其他正文', 'still-dirty')), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(f.controller.snapshot().conflictPending, 'ContinuationTransactions.test.ets:A0031', BUNDLE + '_ContinuationTransactions_0005').assertTrue();
      }, v2('doc-a', 2, '已保存正文', 'seed'));
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0600
     * @tc.name      com.samples.appcontinuation_ContinuationTransactions_0006
     * @tc.desc      Verify tX 004 new document transaction
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario(BUNDLE + '_ContinuationTransactions_0006', (): void => {
      withLearning((f: LearningFixture): void => {
        f.controller.updateText('上限后的编辑🌱');
        const before = f.controller.snapshot();
        f.store.failFlushCalls = [1];
        f.controller.newDocument();
        loggedExpect(f.controller.snapshot().documentId, 'ContinuationTransactions.test.ets:A0032', BUNDLE + '_ContinuationTransactions_0006').assertEqual(before.documentId);
        loggedExpect(f.controller.snapshot().revision, 'ContinuationTransactions.test.ets:A0033', BUNDLE + '_ContinuationTransactions_0006').assertEqual(1000000000);
        loggedExpect(f.controller.snapshot().text, 'ContinuationTransactions.test.ets:A0034', BUNDLE + '_ContinuationTransactions_0006').assertEqual(before.text);
        f.controller.newDocument();
        const after = f.controller.snapshot();
        loggedExpect(after.documentId !== before.documentId, 'ContinuationTransactions.test.ets:A0035', BUNDLE + '_ContinuationTransactions_0006').assertTrue();
        loggedExpect(after.revision, 'ContinuationTransactions.test.ets:A0036', BUNDLE + '_ContinuationTransactions_0006').assertEqual(1);
        loggedExpect(after.text, 'ContinuationTransactions.test.ets:A0037', BUNDLE + '_ContinuationTransactions_0006').assertEqual(before.text);
        loggedExpect(after.selectionEnd, 'ContinuationTransactions.test.ets:A0038', BUNDLE + '_ContinuationTransactions_0006').assertEqual(before.selectionEnd);
        withLearning((reopened: LearningFixture): void => {
          loggedExpect(reopened.controller.snapshot().documentId, 'ContinuationTransactions.test.ets:A0039', BUNDLE + '_ContinuationTransactions_0006').assertEqual(after.documentId);
          loggedExpect(reopened.controller.snapshot().text, 'ContinuationTransactions.test.ets:A0040', BUNDLE + '_ContinuationTransactions_0006').assertEqual(after.text);
        }, f.store.stored());
      }, v2('doc-limit', 1000000000, '原文', 'seed'));
    });
  });
}
