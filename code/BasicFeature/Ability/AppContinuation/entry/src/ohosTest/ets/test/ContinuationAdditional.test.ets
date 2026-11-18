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

/** Additional production-controller tests. Injected callbacks are NOT a real cross-device continuation. */
import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { AbilityConstant, Want, wantConstant } from '@kit.AbilityKit';
import { ContinueObservation } from '../../../main/ets/learning/ContinueClient';
import {
  EnvironmentItem, LearningSnapshot, OperationRecord, TEXT_PAYLOAD_KEY
} from '../../../main/ets/learning/LearningTypes';
import { BUNDLE, scenario } from '../support/BoundedCase';
import {
  ClientFixture, flushPermissionMicrotasks, inboundWant, LearningFixture, payloadBag,
  PermissionReply, platformError, rawPayload, resultInfo
} from '../support/LearningFixtures';
import { checkedClient, checkedLearning, ObservedLearningFixture } from '../support/AdditionalFixtures';

function latest(fixture: LearningFixture, operation: string): OperationRecord {
  const found = fixture.controller.snapshot().records.find((row: OperationRecord): boolean =>
    row.operation === operation);
  if (found === undefined) { throw new Error(`Missing operation ${operation}`); }
  return found;
}

function environmentValue(rows: EnvironmentItem[], key: string): string {
  const found = rows.find((row: EnvironmentItem): boolean => row.key === key);
  if (found === undefined) { throw new Error(`Missing environment ${key}`); }
  return found.value;
}

/** 本组原场景显式模拟接受未保存内容替换；保护/拒绝契约在版本事务组独立断言。 */
function receiveChoosingIncoming(fixture: LearningFixture, want: Want, reason: number): void {
  fixture.controller.handleLaunch(want, reason);
  fixture.controller.acceptConflict();
}

function seedEditor(fixture: LearningFixture): void {
  fixture.controller.updateText('原文🌱');
  fixture.controller.updateSelection(0, 2);
}

function assertEditor(fixture: LearningFixture, text: string = '原文🌱', start: number = 0, end: number = 2): void {
  const value = fixture.controller.snapshot();
  loggedExpect(value.text, 'ContinuationAdditional.test.ets:A0001').assertEqual(text);
  loggedExpect(value.selectionStart, 'ContinuationAdditional.test.ets:A0002').assertEqual(start);
  loggedExpect(value.selectionEnd, 'ContinuationAdditional.test.ets:A0003').assertEqual(end);
}

function restoreCount(fixture: LearningFixture): number {
  return fixture.controller.snapshot().records.filter((row: OperationRecord): boolean =>
    row.operation === 'RESTORE').length;
}

export default function continuationAdditional(): void {
  describe('ContinuationAdditional', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0100
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0001
     * @tc.desc      Verify json序列化精确上限：有效26000接收，26001拒收且不覆盖原文
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0001', (): void => {
      const bag = payloadBag('边界正文', 'json-limit', 0, 2);
      const valid = JSON.stringify(bag);
      const padded = valid + ' '.repeat(26000 - valid.length);
      loggedExpect(padded.length, 'ContinuationAdditional.test.ets:A0004', BUNDLE + '_ContinuationAdditional_0001').assertEqual(26000);
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(padded), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationAdditional.test.ets:A0005', BUNDLE + '_ContinuationAdditional_0001').assertTrue();
        assertEditor(f, '边界正文', 0, 2);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0006', BUNDLE + '_ContinuationAdditional_0001').assertEqual(1);
      });
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(padded + ' '), AbilityConstant.LaunchReason.CONTINUATION);
        assertEditor(f);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationAdditional.test.ets:A0007', BUNDLE + '_ContinuationAdditional_0001').assertFalse();
        loggedExpect(latest(f, 'RESTORE').stage, 'ContinuationAdditional.test.ets:A0008', BUNDLE + '_ContinuationAdditional_0001').assertEqual('候选校验失败');
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0009', BUNDLE + '_ContinuationAdditional_0001').assertEqual(0);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0010', BUNDLE + '_ContinuationAdditional_0001').assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0200
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0002
     * @tc.desc      Verify 控制字符与多行正文：源参数序列化和存储重开无损往返
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0002', (): void => {
      const text = '首行\n第二行\t"引号"\\路径\u0000尾部🌱';
      checkedLearning((source: LearningFixture): void => {
        source.controller.updateText(text);
        source.controller.updateSelection(0, text.length);
        const parameters: Record<string, Object> = {};
        parameters['unrelated'] = 'preserved';
        loggedExpect(source.controller.buildContinuation(parameters), 'ContinuationAdditional.test.ets:A0011', BUNDLE + '_ContinuationAdditional_0002').assertEqual(AbilityConstant.OnContinueResult.AGREE);
        loggedExpect(parameters['unrelated'], 'ContinuationAdditional.test.ets:A0012', BUNDLE + '_ContinuationAdditional_0002').assertEqual('preserved');
        const decoded = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        loggedExpect(decoded['text'], 'ContinuationAdditional.test.ets:A0013', BUNDLE + '_ContinuationAdditional_0002').assertEqual(text);
        checkedLearning((target: LearningFixture): void => {
          target.controller.markWindowReady();
          target.controller.handleLaunch({ parameters: parameters } as Want, AbilityConstant.LaunchReason.CONTINUATION);
          assertEditor(target, text, 0, text.length);
          const stored = target.store.stored();
          checkedLearning((reopened: LearningFixture): void => {
            assertEditor(reopened, text, 0, text.length);
            loggedExpect(reopened.controller.snapshot().committed, 'ContinuationAdditional.test.ets:A0014', BUNDLE + '_ContinuationAdditional_0002').assertFalse();
            loggedExpect(reopened.store.putCalls, 'ContinuationAdditional.test.ets:A0015', BUNDLE + '_ContinuationAdditional_0002').assertEqual(0);
          }, stored);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0300
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0003
     * @tc.desc      Verify 缩短编辑重置旧选区，拒绝非法替换不破坏新选区或已保存文档
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0003', (): void => {
      checkedLearning((f: LearningFixture): void => {
        f.controller.updateText('长段落🌱');
        f.controller.updateSelection(0, 3);
        f.controller.saveText();
        const durable = f.store.stored();
        f.controller.updateText('短');
        assertEditor(f, '短', 1, 1);
        f.controller.updateText('\uD800');
        f.controller.updateSelection(0, 2);
        assertEditor(f, '短', 1, 1);
        loggedExpect(f.store.stored(), 'ContinuationAdditional.test.ets:A0016', BUNDLE + '_ContinuationAdditional_0003').assertEqual(durable);
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0017', BUNDLE + '_ContinuationAdditional_0003').assertEqual(1);
        f.controller.saveText();
        const saved = JSON.parse(f.store.stored() as string) as Record<string, Object>;
        loggedExpect(saved['text'], 'ContinuationAdditional.test.ets:A0018', BUNDLE + '_ContinuationAdditional_0003').assertEqual('短');
        loggedExpect(saved['selectionStart'], 'ContinuationAdditional.test.ets:A0019', BUNDLE + '_ContinuationAdditional_0003').assertEqual(1);
        loggedExpect(saved['selectionEnd'], 'ContinuationAdditional.test.ets:A0020', BUNDLE + '_ContinuationAdditional_0003').assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0400
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0004
     * @tc.desc      Verify 普通启动忽略携带的接续载荷，其他启动原因不终止在途普通恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0004', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(rawPayload('不应恢复', 'normal-reason', 0, 2)), 1);
        assertEditor(f);
        loggedExpect(restoreCount(f), 'ContinuationAdditional.test.ets:A0021', BUNDLE + '_ContinuationAdditional_0004').assertEqual(0);
        loggedExpect(f.native.onCallbacks.length, 'ContinuationAdditional.test.ets:A0022', BUNDLE + '_ContinuationAdditional_0004').assertEqual(0);
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0023', BUNDLE + '_ContinuationAdditional_0004').assertEqual(0);
        f.controller.markWindowGone();
        receiveChoosingIncoming(f, inboundWant(rawPayload('正常接续', 'ordinary-active', 0, 2)), AbilityConstant.LaunchReason.CONTINUATION);
        const id = f.controller.snapshot().sessionRecordId;
        receiveChoosingIncoming(f, {} as Want, 99);
        loggedExpect(f.controller.snapshot().sessionRecordId, 'ContinuationAdditional.test.ets:A0024', BUNDLE + '_ContinuationAdditional_0004').assertEqual(id);
        loggedExpect(f.controller.snapshot().sessionActive, 'ContinuationAdditional.test.ets:A0025', BUNDLE + '_ContinuationAdditional_0004').assertTrue();
        f.controller.markWindowReady();
        assertEditor(f, '正常接续', 0, 2);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0026', BUNDLE + '_ContinuationAdditional_0004').assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0500
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0005
     * @tc.desc      Verify 重复prepare和相同候选不能延长页面阶段15秒期限或替换候选
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0005', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        const raw = rawPayload('保留候选', 'fixed-deadline', 0, 2);
        receiveChoosingIncoming(f, inboundWant(raw), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        f.native.deliverOn(0);
        const id = f.controller.snapshot().sessionRecordId;
        f.clock.advance(10000);
        receiveChoosingIncoming(f, inboundWant(rawPayload('不可替换', 'duplicate-prepare', 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        receiveChoosingIncoming(f, inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
        f.controller.markWindowGone();
        loggedExpect(f.controller.snapshot().sessionRecordId, 'ContinuationAdditional.test.ets:A0027', BUNDLE + '_ContinuationAdditional_0005').assertEqual(id);
        loggedExpect(f.native.onCallbacks.length, 'ContinuationAdditional.test.ets:A0028', BUNDLE + '_ContinuationAdditional_0005').assertEqual(1);
        f.clock.advance(4999);
        loggedExpect(f.controller.snapshot().sessionActive, 'ContinuationAdditional.test.ets:A0029', BUNDLE + '_ContinuationAdditional_0005').assertTrue();
        f.clock.advance(1);
        loggedExpect(latest(f, 'RESTORE').stage, 'ContinuationAdditional.test.ets:A0030', BUNDLE + '_ContinuationAdditional_0005').assertEqual('页面窗口超时');
        loggedExpect(latest(f, 'RESTORE').durationMillis, 'ContinuationAdditional.test.ets:A0031', BUNDLE + '_ContinuationAdditional_0005').assertEqual(15000);
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0032', BUNDLE + '_ContinuationAdditional_0005').assertEqual(0);
        assertEditor(f);
        f.native.deliverOff(0);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0033', BUNDLE + '_ContinuationAdditional_0005').assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0600
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0006
     * @tc.desc      Verify 普通接续超时不注册或注销监听，旧标签拒收而新标签可独立恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0006', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        const expired = rawPayload('超时候选', 'ordinary-expired', 0, 2);
        receiveChoosingIncoming(f, inboundWant(expired), AbilityConstant.LaunchReason.CONTINUATION);
        f.clock.advance(15000);
        loggedExpect(latest(f, 'RESTORE').stage, 'ContinuationAdditional.test.ets:A0034', BUNDLE + '_ContinuationAdditional_0006').assertEqual('页面窗口超时');
        loggedExpect(f.controller.snapshot().canEdit, 'ContinuationAdditional.test.ets:A0035', BUNDLE + '_ContinuationAdditional_0006').assertTrue();
        loggedExpect(f.native.onCallbacks.length, 'ContinuationAdditional.test.ets:A0036', BUNDLE + '_ContinuationAdditional_0006').assertEqual(0);
        loggedExpect(f.native.offCallbacks.length, 'ContinuationAdditional.test.ets:A0037', BUNDLE + '_ContinuationAdditional_0006').assertEqual(0);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(expired), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(restoreCount(f), 'ContinuationAdditional.test.ets:A0038', BUNDLE + '_ContinuationAdditional_0006').assertEqual(1);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0039', BUNDLE + '_ContinuationAdditional_0006').assertEqual(0);
        receiveChoosingIncoming(f, inboundWant(rawPayload('新轮正常', 'ordinary-fresh', 0, 2)), AbilityConstant.LaunchReason.CONTINUATION);
        assertEditor(f, '新轮正常', 0, 2);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationAdditional.test.ets:A0040', BUNDLE + '_ContinuationAdditional_0006').assertTrue();
        loggedExpect(restoreCount(f), 'ContinuationAdditional.test.ets:A0041', BUNDLE + '_ContinuationAdditional_0006').assertEqual(2);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0042', BUNDLE + '_ContinuationAdditional_0006').assertEqual(1);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0043', BUNDLE + '_ContinuationAdditional_0006').assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0700
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0007
     * @tc.desc      Verify 快速结果到达前窗口撤回，重新就绪前不得提交，阶段期限正确重置
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0007', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(rawPayload('窗口撤回', 'withdrawn-window', 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        f.clock.advance(5000);
        f.controller.markWindowGone();
        f.native.deliverOn(0);
        loggedExpect(f.controller.snapshot().sessionState.indexOf('页面窗口') >= 0, 'ContinuationAdditional.test.ets:A0044', BUNDLE + '_ContinuationAdditional_0007').assertTrue();
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0045', BUNDLE + '_ContinuationAdditional_0007').assertEqual(0);
        assertEditor(f);
        f.clock.advance(14999);
        loggedExpect(f.controller.snapshot().sessionActive, 'ContinuationAdditional.test.ets:A0046', BUNDLE + '_ContinuationAdditional_0007').assertTrue();
        f.controller.markWindowReady();
        assertEditor(f, '窗口撤回', 0, 2);
        loggedExpect(latest(f, 'RESTORE').durationMillis, 'ContinuationAdditional.test.ets:A0047', BUNDLE + '_ContinuationAdditional_0007').assertEqual(19999);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0048', BUNDLE + '_ContinuationAdditional_0007').assertEqual(1);
        f.controller.markWindowReady();
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0049', BUNDLE + '_ContinuationAdditional_0007').assertEqual(1);
        f.native.deliverOff(0);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0050', BUNDLE + '_ContinuationAdditional_0007').assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0800
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0008
     * @tc.desc      Verify 已提交后页面失败保留持久文档，后续新轮必须重新等待页面就绪
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0008', (): void => {
      checkedLearning((f: LearningFixture): void => {
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(rawPayload('首轮成功', 'before-page-error', 0, 2)), AbilityConstant.LaunchReason.CONTINUATION);
        const durable = f.store.stored();
        const firstId = f.controller.snapshot().sessionRecordId;
        f.controller.reportPageFailure('not stored as a platform detail');
        loggedExpect(f.store.stored(), 'ContinuationAdditional.test.ets:A0051', BUNDLE + '_ContinuationAdditional_0008').assertEqual(durable);
        loggedExpect(f.controller.record(firstId)?.stage, 'ContinuationAdditional.test.ets:A0052', BUNDLE + '_ContinuationAdditional_0008').assertEqual('已提交');
        receiveChoosingIncoming(f, inboundWant(rawPayload('重载后恢复', 'after-page-error', 0, 2)), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationAdditional.test.ets:A0053', BUNDLE + '_ContinuationAdditional_0008').assertFalse();
        loggedExpect(f.controller.snapshot().sessionActive, 'ContinuationAdditional.test.ets:A0054', BUNDLE + '_ContinuationAdditional_0008').assertTrue();
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0055', BUNDLE + '_ContinuationAdditional_0008').assertEqual(1);
        assertEditor(f, '首轮成功', 0, 2);
        f.controller.markWindowReady();
        assertEditor(f, '重载后恢复', 0, 2);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0056', BUNDLE + '_ContinuationAdditional_0008').assertEqual(2);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0900
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0009
     * @tc.desc      Verify prepare自带无效载荷在建立监听前失败，新有效prepare可重试
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0009', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant('{broken'), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        loggedExpect(latest(f, 'RESTORE').stage, 'ContinuationAdditional.test.ets:A0057', BUNDLE + '_ContinuationAdditional_0009').assertEqual('候选校验失败');
        loggedExpect(f.native.onCallbacks.length, 'ContinuationAdditional.test.ets:A0058', BUNDLE + '_ContinuationAdditional_0009').assertEqual(0);
        loggedExpect(f.native.offCallbacks.length, 'ContinuationAdditional.test.ets:A0059', BUNDLE + '_ContinuationAdditional_0009').assertEqual(0);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0060', BUNDLE + '_ContinuationAdditional_0009').assertEqual(0);
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0061', BUNDLE + '_ContinuationAdditional_0009').assertEqual(0);
        assertEditor(f);
        receiveChoosingIncoming(f, inboundWant(rawPayload('修正后', 'valid-retry', 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        loggedExpect(f.native.onCallbacks.length, 'ContinuationAdditional.test.ets:A0062', BUNDLE + '_ContinuationAdditional_0009').assertEqual(1);
        f.native.deliverOn(0);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationAdditional.test.ets:A0063', BUNDLE + '_ContinuationAdditional_0009').assertTrue();
        assertEditor(f, '修正后', 0, 2);
        f.native.deliverOff(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1000
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0010
     * @tc.desc      Verify 快速轮次on同步失败保留原文，新轮等待旧off后绑定且隔离旧on
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0010', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        f.native.onFailure = platformError(16300501, 'quick registration failed');
        receiveChoosingIncoming(f, inboundWant(rawPayload('失败候选', 'on-sync-failed', 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        loggedExpect(latest(f, 'RESTORE').stage, 'ContinuationAdditional.test.ets:A0064', BUNDLE + '_ContinuationAdditional_0010').assertEqual('ON 同步失败');
        loggedExpect(f.native.offCallbacks.length, 'ContinuationAdditional.test.ets:A0065', BUNDLE + '_ContinuationAdditional_0010').assertEqual(1);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0066', BUNDLE + '_ContinuationAdditional_0010').assertEqual(0);
        assertEditor(f);
        f.native.onFailure = undefined;
        receiveChoosingIncoming(f, inboundWant(rawPayload('新轮候选', 'after-on-failure', 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        loggedExpect(f.native.onCallbacks.length, 'ContinuationAdditional.test.ets:A0067', BUNDLE + '_ContinuationAdditional_0010').assertEqual(1);
        loggedExpect(f.controller.snapshot().quickResult, 'ContinuationAdditional.test.ets:A0068', BUNDLE + '_ContinuationAdditional_0010').assertEqual('等待上一轮监听操作结束');
        f.native.deliverOn(0);
        assertEditor(f);
        f.native.deliverOff(0);
        loggedExpect(f.native.onCallbacks.length, 'ContinuationAdditional.test.ets:A0069', BUNDLE + '_ContinuationAdditional_0010').assertEqual(2);
        f.native.deliverOn(0);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationAdditional.test.ets:A0070', BUNDLE + '_ContinuationAdditional_0010').assertFalse();
        f.native.deliverOn(1);
        assertEditor(f, '新轮候选', 0, 2);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0071', BUNDLE + '_ContinuationAdditional_0010').assertEqual(1);
        f.native.deliverOff(1);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0072', BUNDLE + '_ContinuationAdditional_0010').assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1100
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0011
     * @tc.desc      Verify 候选冲突关闭原标签，未接收的冲突标签可在新普通轮次提交
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0011', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        const first = rawPayload('首个候选', 'conflict-first', 0, 2);
        const other = rawPayload('第二候选', 'conflict-other', 0, 2);
        receiveChoosingIncoming(f, inboundWant(first), AbilityConstant.LaunchReason.CONTINUATION);
        receiveChoosingIncoming(f, inboundWant(other), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(latest(f, 'RESTORE').stage, 'ContinuationAdditional.test.ets:A0073', BUNDLE + '_ContinuationAdditional_0011').assertEqual('候选冲突');
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0074', BUNDLE + '_ContinuationAdditional_0011').assertEqual(0);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(first), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(restoreCount(f), 'ContinuationAdditional.test.ets:A0075', BUNDLE + '_ContinuationAdditional_0011').assertEqual(1);
        assertEditor(f);
        receiveChoosingIncoming(f, inboundWant(other), AbilityConstant.LaunchReason.CONTINUATION);
        assertEditor(f, '第二候选', 0, 2);
        loggedExpect(restoreCount(f), 'ContinuationAdditional.test.ets:A0076', BUNDLE + '_ContinuationAdditional_0011').assertEqual(2);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0077', BUNDLE + '_ContinuationAdditional_0011').assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1200
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0012
     * @tc.desc      Verify 已完成标签去重缓存48项fifo边界，移出的最旧标签可重新接收
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0012', (): void => {
      checkedLearning((f: LearningFixture): void => {
        f.controller.markWindowReady();
        for (let i: number = 0; i < 49; i++) {
          receiveChoosingIncoming(f, inboundWant(rawPayload(`文档-${i}`, `fifo-${i}`, 0, 1)), AbilityConstant.LaunchReason.CONTINUATION);
          loggedExpect(f.controller.snapshot().committed, 'ContinuationAdditional.test.ets:A0078', BUNDLE + '_ContinuationAdditional_0012').assertTrue();
        }
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0079', BUNDLE + '_ContinuationAdditional_0012').assertEqual(49);
        receiveChoosingIncoming(f, inboundWant(rawPayload('文档-1', 'fifo-1', 0, 1)), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0080', BUNDLE + '_ContinuationAdditional_0012').assertEqual(49);
        assertEditor(f, '文档-48', 0, 1);
        receiveChoosingIncoming(f, inboundWant(rawPayload('文档-0', 'fifo-0', 0, 1)), AbilityConstant.LaunchReason.CONTINUATION);
        assertEditor(f, '文档-0', 0, 1);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0081', BUNDLE + '_ContinuationAdditional_0012').assertEqual(50);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0082', BUNDLE + '_ContinuationAdditional_0012').assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1300
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0013
     * @tc.desc      Verify 已有持久文档时put失败用原值回滚并允许后续保存重试
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0013', (): void => {
      const durable = rawPayload('磁盘原文🌱', 'durable-original', 0, 2);
      checkedLearning((f: LearningFixture): void => {
        f.controller.updateText('待保存修改');
        f.controller.updateSelection(1, 3);
        f.store.failPutCalls = [1];
        f.controller.saveText();
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0083', BUNDLE + '_ContinuationAdditional_0013').assertEqual(2);
        loggedExpect(f.store.deleteCalls, 'ContinuationAdditional.test.ets:A0084', BUNDLE + '_ContinuationAdditional_0013').assertEqual(0);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0085', BUNDLE + '_ContinuationAdditional_0013').assertEqual(1);
        loggedExpect(f.store.stored(), 'ContinuationAdditional.test.ets:A0086', BUNDLE + '_ContinuationAdditional_0013').assertEqual(durable);
        assertEditor(f, '待保存修改', 1, 3);
        loggedExpect(latest(f, 'SAVE').errorCode, 'ContinuationAdditional.test.ets:A0087', BUNDLE + '_ContinuationAdditional_0013').assertEqual('15500000');
        f.store.failPutCalls = [];
        f.controller.saveText();
        loggedExpect(latest(f, 'SAVE').level, 'ContinuationAdditional.test.ets:A0088', BUNDLE + '_ContinuationAdditional_0013').assertEqual('INFO');
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0089', BUNDLE + '_ContinuationAdditional_0013').assertEqual(3);
        const saved = JSON.parse(f.store.stored() as string) as Record<string, Object>;
        loggedExpect(saved['text'], 'ContinuationAdditional.test.ets:A0090', BUNDLE + '_ContinuationAdditional_0013').assertEqual('待保存修改');
        loggedExpect(saved['selectionStart'], 'ContinuationAdditional.test.ets:A0091', BUNDLE + '_ContinuationAdditional_0013').assertEqual(1);
        loggedExpect(saved['selectionEnd'], 'ContinuationAdditional.test.ets:A0092', BUNDLE + '_ContinuationAdditional_0013').assertEqual(3);
      }, durable);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1400
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0014
     * @tc.desc      Verify 无旧文档时回滚delete失败，保存清空和接续恢复均停止后续写入
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0014', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.store.failFlushCalls = [1];
        f.store.failDeleteCalls = [1];
        f.controller.saveText();
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0093', BUNDLE + '_ContinuationAdditional_0014').assertEqual(1);
        loggedExpect(f.store.deleteCalls, 'ContinuationAdditional.test.ets:A0094', BUNDLE + '_ContinuationAdditional_0014').assertEqual(1);
        loggedExpect(latest(f, 'SAVE').facts.join(';').indexOf('磁盘状态未知') >= 0, 'ContinuationAdditional.test.ets:A0095', BUNDLE + '_ContinuationAdditional_0014').assertTrue();
        f.store.failFlushCalls = [];
        f.store.failDeleteCalls = [];
        f.controller.saveText();
        f.controller.clearText();
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(rawPayload('不应写入', 'frozen-restore', 0, 2)), AbilityConstant.LaunchReason.CONTINUATION);
        assertEditor(f);
        loggedExpect(f.controller.snapshot().committed, 'ContinuationAdditional.test.ets:A0096', BUNDLE + '_ContinuationAdditional_0014').assertFalse();
        loggedExpect(latest(f, 'RESTORE').stage, 'ContinuationAdditional.test.ets:A0097', BUNDLE + '_ContinuationAdditional_0014').assertEqual('持久化失败');
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0098', BUNDLE + '_ContinuationAdditional_0014').assertEqual(1);
        loggedExpect(f.store.deleteCalls, 'ContinuationAdditional.test.ets:A0099', BUNDLE + '_ContinuationAdditional_0014').assertEqual(1);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0100', BUNDLE + '_ContinuationAdditional_0014').assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1500
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0015
     * @tc.desc      Verify 已有旧文档时回滚put失败冻结后续写入且编辑仍可保留
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0015', (): void => {
      checkedLearning((f: LearningFixture): void => {
        f.controller.updateText('未确认的新内容');
        f.store.failFlushCalls = [1];
        f.store.failPutCalls = [2];
        f.controller.saveText();
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0101', BUNDLE + '_ContinuationAdditional_0015').assertEqual(2);
        loggedExpect(f.store.deleteCalls, 'ContinuationAdditional.test.ets:A0102', BUNDLE + '_ContinuationAdditional_0015').assertEqual(0);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0103', BUNDLE + '_ContinuationAdditional_0015').assertEqual(1);
        loggedExpect(latest(f, 'SAVE').level, 'ContinuationAdditional.test.ets:A0104', BUNDLE + '_ContinuationAdditional_0015').assertEqual('ERROR');
        loggedExpect(f.controller.snapshot().canEdit, 'ContinuationAdditional.test.ets:A0105', BUNDLE + '_ContinuationAdditional_0015').assertTrue();
        f.store.failFlushCalls = [];
        f.store.failPutCalls = [];
        f.controller.updateText('保留后续编辑');
        f.controller.saveText();
        f.controller.clearText();
        assertEditor(f, '保留后续编辑', 6, 6);
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0106', BUNDLE + '_ContinuationAdditional_0015').assertEqual(2);
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0107', BUNDLE + '_ContinuationAdditional_0015').assertEqual(1);
        loggedExpect(latest(f, 'SAVE').facts.join(';').indexOf('停止后续写入') >= 0, 'ContinuationAdditional.test.ets:A0108', BUNDLE + '_ContinuationAdditional_0015').assertTrue();
      }, rawPayload('原磁盘文档', 'before-put-rollback', 0, 2));
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1600
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0016
     * @tc.desc      Verify 同步flush边界仍保留旧ui，只有持久化返回后一次提交正文和选区
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0016', (): void => {
      const f = new ObservedLearningFixture(rawPayload('旧UI内容🌱', 'ordering-original', 0, 2));
      const observed: LearningSnapshot[] = [];
      let flushInspections: number = 0;
      try {
        f.store.beforeFlush = (): void => {
          flushInspections++;
          observed.push(f.controller.snapshot());
        };
        f.controller.markWindowReady();
        f.controller.handleLaunch(inboundWant(rawPayload('新UI内容🌱', 'ordering-new', 2, 4)), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(flushInspections, 'ContinuationAdditional.test.ets:A0109', BUNDLE + '_ContinuationAdditional_0016').assertEqual(1);
        loggedExpect(observed.length, 'ContinuationAdditional.test.ets:A0110', BUNDLE + '_ContinuationAdditional_0016').assertEqual(1);
        const during = observed[0];
        loggedExpect(during.text, 'ContinuationAdditional.test.ets:A0111', BUNDLE + '_ContinuationAdditional_0016').assertEqual('旧UI内容🌱');
        loggedExpect(during.selectionStart, 'ContinuationAdditional.test.ets:A0112', BUNDLE + '_ContinuationAdditional_0016').assertEqual(0);
        loggedExpect(during.selectionEnd, 'ContinuationAdditional.test.ets:A0113', BUNDLE + '_ContinuationAdditional_0016').assertEqual(2);
        loggedExpect(during.committed, 'ContinuationAdditional.test.ets:A0114', BUNDLE + '_ContinuationAdditional_0016').assertFalse();
        const after = f.controller.snapshot();
        loggedExpect(after.text, 'ContinuationAdditional.test.ets:A0115', BUNDLE + '_ContinuationAdditional_0016').assertEqual('新UI内容🌱');
        loggedExpect(after.selectionStart, 'ContinuationAdditional.test.ets:A0116', BUNDLE + '_ContinuationAdditional_0016').assertEqual(2);
        loggedExpect(after.selectionEnd, 'ContinuationAdditional.test.ets:A0117', BUNDLE + '_ContinuationAdditional_0016').assertEqual(4);
        loggedExpect(after.committed, 'ContinuationAdditional.test.ets:A0118', BUNDLE + '_ContinuationAdditional_0016').assertTrue();
        loggedExpect(f.store.flushCalls, 'ContinuationAdditional.test.ets:A0119', BUNDLE + '_ContinuationAdditional_0016').assertEqual(1);
      } finally { f.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1700
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0017
     * @tc.desc      Verify 操作保存开始时环境，深拷贝所有记录数组不反向改动历史
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0017', (): void => {
      checkedLearning((f: LearningFixture): void => {
        f.controller.checkEnvironment();
        f.controller.registerProbe();
        const id = latest(f, 'ON').id;
        f.environment.publicInfo = { apiVersion: 99, deviceType: 'later-device', osFullName: 'later-os' };
        f.controller.checkEnvironment();
        loggedExpect(environmentValue(f.controller.snapshot().environment, 'api'), 'ContinuationAdditional.test.ets:A0120', BUNDLE + '_ContinuationAdditional_0017').assertEqual('99');
        const record = f.controller.record(id);
        if (record === undefined) { throw new Error('Missing historic ON record'); }
        loggedExpect(environmentValue(record.environment, 'api'), 'ContinuationAdditional.test.ets:A0121', BUNDLE + '_ContinuationAdditional_0017').assertEqual('26');
        record.explanation.push('injected explanation');
        record.limits.push('injected limit');
        record.nextSteps.push('injected step');
        record.environment[0].value = 'injected environment';
        record.events[0].phase = 'injected event';
        const again = f.controller.record(id);
        if (again === undefined) { throw new Error('Missing historic ON record after copy mutation'); }
        loggedExpect(again.explanation.indexOf('injected explanation'), 'ContinuationAdditional.test.ets:A0122', BUNDLE + '_ContinuationAdditional_0017').assertEqual(-1);
        loggedExpect(again.limits.indexOf('injected limit'), 'ContinuationAdditional.test.ets:A0123', BUNDLE + '_ContinuationAdditional_0017').assertEqual(-1);
        loggedExpect(again.nextSteps.indexOf('injected step'), 'ContinuationAdditional.test.ets:A0124', BUNDLE + '_ContinuationAdditional_0017').assertEqual(-1);
        loggedExpect(environmentValue(again.environment, 'api'), 'ContinuationAdditional.test.ets:A0125', BUNDLE + '_ContinuationAdditional_0017').assertEqual('26');
        loggedExpect(again.events[0].phase === 'injected event', 'ContinuationAdditional.test.ets:A0126', BUNDLE + '_ContinuationAdditional_0017').assertFalse();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1800
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0018
     * @tc.desc      Verify 快速通知先于候选时，识别新正文后再次脱敏旧结果但不篡改实际正文
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0018', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        const secret = 'LATE_CANDIDATE_SEALED';
        receiveChoosingIncoming(f, inboundWant(), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        const id = f.controller.snapshot().sessionRecordId;
        f.native.deliverOn(0, undefined, resultInfo(0, `received ${secret} safely`));
        receiveChoosingIncoming(f, inboundWant(rawPayload(secret, 'late-sensitive-data', 0, 4)), AbilityConstant.LaunchReason.CONTINUATION);
        const record = f.controller.record(id);
        if (record === undefined) { throw new Error('Missing restore result'); }
        loggedExpect(record.resultInfo.indexOf(secret), 'ContinuationAdditional.test.ets:A0127', BUNDLE + '_ContinuationAdditional_0018').assertEqual(-1);
        loggedExpect(record.resultInfo.indexOf('[正文已隐藏]') >= 0, 'ContinuationAdditional.test.ets:A0128', BUNDLE + '_ContinuationAdditional_0018').assertTrue();
        loggedExpect(record.rawResultState, 'ContinuationAdditional.test.ets:A0129', BUNDLE + '_ContinuationAdditional_0018').assertEqual('0');
        assertEditor(f);
        f.controller.markWindowReady();
        assertEditor(f, secret, 0, 4);
        const stored = JSON.parse(f.store.stored() as string) as Record<string, Object>;
        loggedExpect(stored['text'], 'ContinuationAdditional.test.ets:A0130', BUNDLE + '_ContinuationAdditional_0018').assertEqual(secret);
        f.native.deliverOff(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1900
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0019
     * @tc.desc      Verify 权限异步失败后可重新申请，重复点击门禁释放且旧记录不被新结果改写
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0019', async (): Promise<void> => {
      const f = new LearningFixture();
      try {
        f.controller.requestPermission();
        const firstId = latest(f, 'PERMISSION').id;
        f.environment.reply.reject(platformError(201, 'first denied'));
        await flushPermissionMicrotasks();
        const first = JSON.stringify(f.controller.record(firstId));
        loggedExpect(latest(f, 'PERMISSION').level, 'ContinuationAdditional.test.ets:A0131', BUNDLE + '_ContinuationAdditional_0019').assertEqual('ERROR');
        f.environment.reply = new PermissionReply();
        f.controller.requestPermission();
        f.controller.requestPermission();
        loggedExpect(f.environment.requestCalls, 'ContinuationAdditional.test.ets:A0132', BUNDLE + '_ContinuationAdditional_0019').assertEqual(2);
        const secondId = latest(f, 'PERMISSION').id;
        loggedExpect(secondId === firstId, 'ContinuationAdditional.test.ets:A0133', BUNDLE + '_ContinuationAdditional_0019').assertFalse();
        f.environment.reply.resolve([0, -1]);
        await flushPermissionMicrotasks();
        loggedExpect(latest(f, 'PERMISSION').level, 'ContinuationAdditional.test.ets:A0134', BUNDLE + '_ContinuationAdditional_0019').assertEqual('INFO');
        loggedExpect(latest(f, 'PERMISSION').result, 'ContinuationAdditional.test.ets:A0135', BUNDLE + '_ContinuationAdditional_0019').assertEqual('权限已授权');
        loggedExpect(JSON.stringify(f.controller.record(firstId)), 'ContinuationAdditional.test.ets:A0136', BUNDLE + '_ContinuationAdditional_0019').assertEqual(first);
        loggedExpect(f.native.onCallbacks.length, 'ContinuationAdditional.test.ets:A0137', BUNDLE + '_ContinuationAdditional_0019').assertEqual(0);
      } finally {
        f.controller.dispose();
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0138', BUNDLE + '_ContinuationAdditional_0019').assertEqual(0);
        f.release();
      }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2000
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0020
     * @tc.desc      Verify 销毁在途快速恢复与权限请求后，全部公开入口及迟到回调均无副作用
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0020', async (): Promise<void> => {
      const f = new LearningFixture();
      try {
        seedEditor(f);
        f.controller.requestPermission();
        receiveChoosingIncoming(f, inboundWant(rawPayload('销毁前候选', 'destroyed-round', 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        f.controller.markWindowReady();
        f.controller.dispose();
        const frozen = JSON.stringify(f.controller.snapshot());
        const nativeOffCount = f.native.offCallbacks.length;
        loggedExpect(nativeOffCount, 'ContinuationAdditional.test.ets:A0139', BUNDLE + '_ContinuationAdditional_0020').assertEqual(1);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0140', BUNDLE + '_ContinuationAdditional_0020').assertEqual(0);
        loggedExpect(f.controller.snapshot().canEdit, 'ContinuationAdditional.test.ets:A0141', BUNDLE + '_ContinuationAdditional_0020').assertFalse();
        loggedExpect(f.controller.snapshot().canRegister, 'ContinuationAdditional.test.ets:A0142', BUNDLE + '_ContinuationAdditional_0020').assertFalse();
        loggedExpect(f.controller.snapshot().canUnregister, 'ContinuationAdditional.test.ets:A0143', BUNDLE + '_ContinuationAdditional_0020').assertFalse();
        loggedExpect(f.controller.snapshot().canStop, 'ContinuationAdditional.test.ets:A0144', BUNDLE + '_ContinuationAdditional_0020').assertFalse();
        let subscriberCalls: number = 0;
        const unsubscribe = f.controller.subscribe((_snapshot: LearningSnapshot): void => { subscriberCalls++; });
        unsubscribe();
        f.controller.updateText('禁止变更');
        f.controller.updateSelection(1, 1);
        f.controller.fillExample();
        f.controller.saveText();
        f.controller.clearText();
        f.controller.registerProbe();
        f.controller.unregisterProbe();
        f.controller.stopLocalWait();
        f.controller.checkEnvironment();
        f.controller.requestPermission();
        receiveChoosingIncoming(f, inboundWant(rawPayload()), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        f.controller.markWindowReady();
        f.controller.markWindowGone();
        f.controller.reportPageFailure('late page error');
        f.controller.clearRecords();
        const parameters: Record<string, Object> = {};
        parameters['sentinel'] = 'unchanged';
        loggedExpect(f.controller.buildContinuation(parameters), 'ContinuationAdditional.test.ets:A0145', BUNDLE + '_ContinuationAdditional_0020').assertEqual(AbilityConstant.OnContinueResult.REJECT);
        loggedExpect(Object.keys(parameters).length, 'ContinuationAdditional.test.ets:A0146', BUNDLE + '_ContinuationAdditional_0020').assertEqual(1);
        loggedExpect(parameters['sentinel'], 'ContinuationAdditional.test.ets:A0147', BUNDLE + '_ContinuationAdditional_0020').assertEqual('unchanged');
        f.native.deliverOn(0);
        f.native.deliverOff(0);
        f.environment.reply.reject(platformError(201, 'late permission rejection'));
        await flushPermissionMicrotasks();
        f.clock.advance(60000);
        f.controller.dispose();
        loggedExpect(JSON.stringify(f.controller.snapshot()), 'ContinuationAdditional.test.ets:A0148', BUNDLE + '_ContinuationAdditional_0020').assertEqual(frozen);
        loggedExpect(subscriberCalls, 'ContinuationAdditional.test.ets:A0149', BUNDLE + '_ContinuationAdditional_0020').assertEqual(0);
        loggedExpect(f.store.putCalls, 'ContinuationAdditional.test.ets:A0150', BUNDLE + '_ContinuationAdditional_0020').assertEqual(0);
        loggedExpect(f.environment.readCalls, 'ContinuationAdditional.test.ets:A0151', BUNDLE + '_ContinuationAdditional_0020').assertEqual(0);
        loggedExpect(f.environment.requestCalls, 'ContinuationAdditional.test.ets:A0152', BUNDLE + '_ContinuationAdditional_0020').assertEqual(1);
        loggedExpect(f.native.offCallbacks.length, 'ContinuationAdditional.test.ets:A0153', BUNDLE + '_ContinuationAdditional_0020').assertEqual(nativeOffCount);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0154', BUNDLE + '_ContinuationAdditional_0020').assertEqual(0);
      } finally { f.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2100
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0021
     * @tc.desc      Verify 多订阅者中途抛错不阻断后继通知，单独退订与重复退订互不影响
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0021', (): void => {
      checkedLearning((f: LearningFixture): void => {
        let first: number = 0;
        let bad: number = 0;
        let last: number = 0;
        const stopFirst = f.controller.subscribe((_value: LearningSnapshot): void => { first++; });
        const stopBad = f.controller.subscribe((_value: LearningSnapshot): void => {
          bad++;
          if (bad > 1) { throw new Error('fixture update subscriber failed'); }
        });
        const stopLast = f.controller.subscribe((value: LearningSnapshot): void => {
          last++;
          value.text = 'external copy';
        });
        f.controller.updateText('首轮发布');
        loggedExpect(first, 'ContinuationAdditional.test.ets:A0155', BUNDLE + '_ContinuationAdditional_0021').assertEqual(2);
        loggedExpect(bad, 'ContinuationAdditional.test.ets:A0156', BUNDLE + '_ContinuationAdditional_0021').assertEqual(2);
        loggedExpect(last, 'ContinuationAdditional.test.ets:A0157', BUNDLE + '_ContinuationAdditional_0021').assertEqual(2);
        loggedExpect(f.controller.snapshot().text, 'ContinuationAdditional.test.ets:A0158', BUNDLE + '_ContinuationAdditional_0021').assertEqual('首轮发布');
        stopBad();
        stopBad();
        stopFirst();
        f.controller.updateSelection(0, 2);
        loggedExpect(first, 'ContinuationAdditional.test.ets:A0159', BUNDLE + '_ContinuationAdditional_0021').assertEqual(2);
        loggedExpect(bad, 'ContinuationAdditional.test.ets:A0160', BUNDLE + '_ContinuationAdditional_0021').assertEqual(2);
        loggedExpect(last, 'ContinuationAdditional.test.ets:A0161', BUNDLE + '_ContinuationAdditional_0021').assertEqual(3);
        stopLast();
        f.controller.updateText('无人订阅仍可编辑');
        loggedExpect(last, 'ContinuationAdditional.test.ets:A0162', BUNDLE + '_ContinuationAdditional_0021').assertEqual(3);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2200
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0022
     * @tc.desc      Verify 原生回调错误优先于成功状态，双消息脱敏且非有限状态保持未知
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0022', (): void => {
      checkedClient((f: ClientFixture): void => {
        const seen: ContinueObservation[] = [];
        f.client.register((event: ContinueObservation): void => { seen.push(event); });
        f.native.deliverOn(0, platformError(0, 'failure at file:///private/path'),
          resultInfo(0, 'detail deviceId=abc123; marker'));
        loggedExpect(seen[0].kind, 'ContinuationAdditional.test.ets:A0163', BUNDLE + '_ContinuationAdditional_0022').assertEqual('ERROR');
        loggedExpect(seen[0].errorCode, 'ContinuationAdditional.test.ets:A0164', BUNDLE + '_ContinuationAdditional_0022').assertEqual('0');
        loggedExpect(seen[0].rawState, 'ContinuationAdditional.test.ets:A0165', BUNDLE + '_ContinuationAdditional_0022').assertEqual('0');
        loggedExpect(seen[0].detail.indexOf('file:///private/path'), 'ContinuationAdditional.test.ets:A0166', BUNDLE + '_ContinuationAdditional_0022').assertEqual(-1);
        loggedExpect(seen[0].detail.indexOf('abc123'), 'ContinuationAdditional.test.ets:A0167', BUNDLE + '_ContinuationAdditional_0022').assertEqual(-1);
        loggedExpect(seen[0].detail.indexOf('marker') >= 0, 'ContinuationAdditional.test.ets:A0168', BUNDLE + '_ContinuationAdditional_0022').assertTrue();
        f.native.deliverOn(0, undefined, resultInfo(Number.POSITIVE_INFINITY, 'independent result'));
        loggedExpect(seen[1].kind, 'ContinuationAdditional.test.ets:A0169', BUNDLE + '_ContinuationAdditional_0022').assertEqual('UNKNOWN');
        loggedExpect(seen[1].rawState, 'ContinuationAdditional.test.ets:A0170', BUNDLE + '_ContinuationAdditional_0022').assertEqual('缺失或非数字');
        loggedExpect(seen[1].errorCode, 'ContinuationAdditional.test.ets:A0171', BUNDLE + '_ContinuationAdditional_0022').assertEqual('');
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2300
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0023
     * @tc.desc      Verify on同步回调内重入注销不会遗留监听或计时器，旧on仍隔离
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0023', (): void => {
      checkedClient((f: ClientFixture): void => {
        let oldEvents: number = 0;
        let offEvents: number = 0;
        let newEvents: number = 0;
        f.native.onImmediate = true;
        f.native.offImmediate = true;
        const called = f.client.register((_event: ContinueObservation): void => {
          oldEvents++;
          loggedExpect(f.client.unregister((_off: ContinueObservation): void => { offEvents++; }).accepted, 'ContinuationAdditional.test.ets:A0172', BUNDLE + '_ContinuationAdditional_0023').assertTrue();
        });
        loggedExpect(called.accepted, 'ContinuationAdditional.test.ets:A0173', BUNDLE + '_ContinuationAdditional_0023').assertTrue();
        loggedExpect(oldEvents, 'ContinuationAdditional.test.ets:A0174', BUNDLE + '_ContinuationAdditional_0023').assertEqual(1);
        loggedExpect(offEvents, 'ContinuationAdditional.test.ets:A0175', BUNDLE + '_ContinuationAdditional_0023').assertEqual(1);
        loggedExpect(f.client.state().listening, 'ContinuationAdditional.test.ets:A0176', BUNDLE + '_ContinuationAdditional_0023').assertFalse();
        loggedExpect(f.client.state().nativeDirty, 'ContinuationAdditional.test.ets:A0177', BUNDLE + '_ContinuationAdditional_0023').assertFalse();
        loggedExpect(f.client.state().offPending, 'ContinuationAdditional.test.ets:A0178', BUNDLE + '_ContinuationAdditional_0023').assertFalse();
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0179', BUNDLE + '_ContinuationAdditional_0023').assertEqual(0);
        f.native.deliverOn(0);
        loggedExpect(oldEvents, 'ContinuationAdditional.test.ets:A0180', BUNDLE + '_ContinuationAdditional_0023').assertEqual(1);
        f.native.onImmediate = false;
        loggedExpect(f.client.register((_event: ContinueObservation): void => { newEvents++; }).accepted, 'ContinuationAdditional.test.ets:A0181', BUNDLE + '_ContinuationAdditional_0023').assertTrue();
        f.native.deliverOn(0);
        loggedExpect(newEvents, 'ContinuationAdditional.test.ets:A0182', BUNDLE + '_ContinuationAdditional_0023').assertEqual(0);
        f.native.deliverOn(1);
        loggedExpect(newEvents, 'ContinuationAdditional.test.ets:A0183', BUNDLE + '_ContinuationAdditional_0023').assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2400
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0024
     * @tc.desc      Verify off同步完成回调内重入注册后原off再抛错，不得清除新监听
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0024', (): void => {
      checkedClient((f: ClientFixture): void => {
        let offEvents: number = 0;
        let newEvents: number = 0;
        f.client.register((_event: ContinueObservation): void => {});
        f.native.offImmediate = true;
        f.native.offFailure = platformError();
        const finished = f.client.unregister((_event: ContinueObservation): void => {
          offEvents++;
          loggedExpect(f.client.register((_new: ContinueObservation): void => { newEvents++; }).accepted, 'ContinuationAdditional.test.ets:A0184', BUNDLE + '_ContinuationAdditional_0024').assertTrue();
        });
        loggedExpect(finished.accepted, 'ContinuationAdditional.test.ets:A0185', BUNDLE + '_ContinuationAdditional_0024').assertFalse();
        loggedExpect(finished.errorCode, 'ContinuationAdditional.test.ets:A0186', BUNDLE + '_ContinuationAdditional_0024').assertEqual('16300501');
        loggedExpect(offEvents, 'ContinuationAdditional.test.ets:A0187', BUNDLE + '_ContinuationAdditional_0024').assertEqual(1);
        loggedExpect(f.client.state().listening, 'ContinuationAdditional.test.ets:A0188', BUNDLE + '_ContinuationAdditional_0024').assertTrue();
        loggedExpect(f.client.state().nativeDirty, 'ContinuationAdditional.test.ets:A0189', BUNDLE + '_ContinuationAdditional_0024').assertTrue();
        loggedExpect(f.client.state().offPending, 'ContinuationAdditional.test.ets:A0190', BUNDLE + '_ContinuationAdditional_0024').assertFalse();
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0191', BUNDLE + '_ContinuationAdditional_0024').assertEqual(0);
        f.native.deliverOn(0);
        loggedExpect(newEvents, 'ContinuationAdditional.test.ets:A0192', BUNDLE + '_ContinuationAdditional_0024').assertEqual(0);
        f.native.deliverOff(0);
        loggedExpect(f.client.state().listening, 'ContinuationAdditional.test.ets:A0193', BUNDLE + '_ContinuationAdditional_0024').assertTrue();
        f.native.deliverOn(1);
        loggedExpect(newEvents, 'ContinuationAdditional.test.ets:A0194', BUNDLE + '_ContinuationAdditional_0024').assertEqual(1);
        f.native.offFailure = undefined;
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2500
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0025
     * @tc.desc      Verify initial subscription exception isolated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0025', (): void => {
      checkedLearning((f: LearningFixture): void => {
        let initialThrew: boolean = false;
        let faultyCalls: number = 0;
        let healthyCalls: number = 0;
        const cancellations: (() => void)[] = [];
        try {
          cancellations.push(f.controller.subscribe((_value: LearningSnapshot): void => {
            faultyCalls++;
            throw new Error('fixture first subscriber notification failed');
          }));
        } catch (error) {
          initialThrew = true;
        }
        // Regression: initial notification errors must not prevent returning cancellation.
        loggedExpect(initialThrew, 'ContinuationAdditional.test.ets:A0195', BUNDLE + '_ContinuationAdditional_0025').assertFalse();
        loggedExpect(cancellations.length, 'ContinuationAdditional.test.ets:A0196', BUNDLE + '_ContinuationAdditional_0025').assertEqual(1);
        const stopHealthy = f.controller.subscribe((_value: LearningSnapshot): void => { healthyCalls++; });
        loggedExpect(faultyCalls, 'ContinuationAdditional.test.ets:A0197', BUNDLE + '_ContinuationAdditional_0025').assertEqual(1);
        loggedExpect(healthyCalls, 'ContinuationAdditional.test.ets:A0198', BUNDLE + '_ContinuationAdditional_0025').assertEqual(1);
        f.controller.updateText('异常订阅不阻塞编辑');
        loggedExpect(faultyCalls, 'ContinuationAdditional.test.ets:A0199', BUNDLE + '_ContinuationAdditional_0025').assertEqual(2);
        loggedExpect(healthyCalls, 'ContinuationAdditional.test.ets:A0200', BUNDLE + '_ContinuationAdditional_0025').assertEqual(2);
        cancellations[0]();
        f.controller.updateSelection(0, 2);
        loggedExpect(faultyCalls, 'ContinuationAdditional.test.ets:A0201', BUNDLE + '_ContinuationAdditional_0025').assertEqual(2);
        loggedExpect(healthyCalls, 'ContinuationAdditional.test.ets:A0202', BUNDLE + '_ContinuationAdditional_0025').assertEqual(3);
        stopHealthy();
        f.controller.updateSelection(1, 2);
        loggedExpect(healthyCalls, 'ContinuationAdditional.test.ets:A0203', BUNDLE + '_ContinuationAdditional_0025').assertEqual(3);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2600
     * @tc.name      com.samples.appcontinuation_ContinuationAdditional_0026
     * @tc.desc      Verify off已在途时销毁只清理本地计时器，不重复原生注销或通知观察者
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationAdditional_0026', (): void => {
      checkedClient((f: ClientFixture): void => {
        let onEvents: number = 0;
        let offEvents: number = 0;
        f.client.register((_event: ContinueObservation): void => { onEvents++; });
        f.client.unregister((_event: ContinueObservation): void => { offEvents++; });
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0204', BUNDLE + '_ContinuationAdditional_0026').assertEqual(1);
        f.client.dispose();
        f.client.dispose();
        loggedExpect(f.native.offCallbacks.length, 'ContinuationAdditional.test.ets:A0205', BUNDLE + '_ContinuationAdditional_0026').assertEqual(1);
        loggedExpect(f.clock.pendingCount(), 'ContinuationAdditional.test.ets:A0206', BUNDLE + '_ContinuationAdditional_0026').assertEqual(0);
        f.native.deliverOn(0);
        f.native.deliverOff(0);
        f.clock.advance(60000);
        loggedExpect(onEvents, 'ContinuationAdditional.test.ets:A0207', BUNDLE + '_ContinuationAdditional_0026').assertEqual(0);
        loggedExpect(offEvents, 'ContinuationAdditional.test.ets:A0208', BUNDLE + '_ContinuationAdditional_0026').assertEqual(0);
        loggedExpect(f.client.register((_event: ContinueObservation): void => {}).accepted, 'ContinuationAdditional.test.ets:A0209', BUNDLE + '_ContinuationAdditional_0026').assertFalse();
        loggedExpect(f.client.unregister((_event: ContinueObservation): void => {}).accepted, 'ContinuationAdditional.test.ets:A0210', BUNDLE + '_ContinuationAdditional_0026').assertFalse();
        loggedExpect(f.native.offCallbacks.length, 'ContinuationAdditional.test.ets:A0211', BUNDLE + '_ContinuationAdditional_0026').assertEqual(1);
      });
    });
  });
}
