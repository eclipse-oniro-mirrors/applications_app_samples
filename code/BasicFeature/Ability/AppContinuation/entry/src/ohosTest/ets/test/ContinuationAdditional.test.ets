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
import { describe, expect } from '@ohos/hypium';
import { AbilityConstant, Want, wantConstant } from '@kit.AbilityKit';
import { ContinueObservation } from '../../../main/ets/learning/ContinueClient';
import {
  EnvironmentItem, LearningSnapshot, OperationRecord, TEXT_PAYLOAD_KEY
} from '../../../main/ets/learning/LearningTypes';
import { scenario } from '../support/BoundedCase';
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
  expect(value.text).assertEqual(text);
  expect(value.selectionStart).assertEqual(start);
  expect(value.selectionEnd).assertEqual(end);
}

function restoreCount(fixture: LearningFixture): number {
  return fixture.controller.snapshot().records.filter((row: OperationRecord): boolean =>
    row.operation === 'RESTORE').length;
}

export default function continuationAdditional(): void {
  describe('ContinuationAdditional', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0100
     * @tc.name      testContinuationAdditional0001
     * @tc.desc      Verify json序列化精确上限：有效26000接收，26001拒收且不覆盖原文
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0001', (): void => {
      const bag = payloadBag('边界正文', 'json-limit', 0, 2);
      const valid = JSON.stringify(bag);
      const padded = valid + ' '.repeat(26000 - valid.length);
      expect(padded.length).assertEqual(26000);
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(padded), 3);
        expect(f.controller.snapshot().committed).assertTrue();
        assertEditor(f, '边界正文', 0, 2);
        expect(f.store.flushCalls).assertEqual(1);
      });
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(padded + ' '), 3);
        assertEditor(f);
        expect(f.controller.snapshot().committed).assertFalse();
        expect(latest(f, 'RESTORE').stage).assertEqual('候选校验失败');
        expect(f.store.putCalls).assertEqual(0);
        expect(f.clock.pendingCount()).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0200
     * @tc.name      testContinuationAdditional0002
     * @tc.desc      Verify 控制字符与多行正文：源参数序列化和存储重开无损往返
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0002', (): void => {
      const text = '首行\n第二行\t"引号"\\路径\u0000尾部🌱';
      checkedLearning((source: LearningFixture): void => {
        source.controller.updateText(text);
        source.controller.updateSelection(0, text.length);
        const parameters: Record<string, Object> = {};
        parameters['unrelated'] = 'preserved';
        expect(source.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.AGREE);
        expect(parameters['unrelated']).assertEqual('preserved');
        const decoded = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        expect(decoded['text']).assertEqual(text);
        checkedLearning((target: LearningFixture): void => {
          target.controller.markWindowReady();
          target.controller.handleLaunch({ parameters: parameters } as Want, 3);
          assertEditor(target, text, 0, text.length);
          const stored = target.store.stored();
          checkedLearning((reopened: LearningFixture): void => {
            assertEditor(reopened, text, 0, text.length);
            expect(reopened.controller.snapshot().committed).assertFalse();
            expect(reopened.store.putCalls).assertEqual(0);
          }, stored);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0300
     * @tc.name      testContinuationAdditional0003
     * @tc.desc      Verify 缩短编辑重置旧选区，拒绝非法替换不破坏新选区或已保存文档
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0003', (): void => {
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
        expect(f.store.stored()).assertEqual(durable);
        expect(f.store.putCalls).assertEqual(1);
        f.controller.saveText();
        const saved = JSON.parse(f.store.stored() as string) as Record<string, Object>;
        expect(saved['text']).assertEqual('短');
        expect(saved['selectionStart']).assertEqual(1);
        expect(saved['selectionEnd']).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0400
     * @tc.name      testContinuationAdditional0004
     * @tc.desc      Verify 普通启动忽略携带的接续载荷，其他启动原因不终止在途普通恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0004', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(rawPayload('不应恢复', 'normal-reason', 0, 2)), 1);
        assertEditor(f);
        expect(restoreCount(f)).assertEqual(0);
        expect(f.native.onCallbacks.length).assertEqual(0);
        expect(f.store.putCalls).assertEqual(0);
        f.controller.markWindowGone();
        receiveChoosingIncoming(f, inboundWant(rawPayload('正常接续', 'ordinary-active', 0, 2)), 3);
        const id = f.controller.snapshot().sessionRecordId;
        receiveChoosingIncoming(f, {} as Want, 99);
        expect(f.controller.snapshot().sessionRecordId).assertEqual(id);
        expect(f.controller.snapshot().sessionActive).assertTrue();
        f.controller.markWindowReady();
        assertEditor(f, '正常接续', 0, 2);
        expect(f.store.flushCalls).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0500
     * @tc.name      testContinuationAdditional0005
     * @tc.desc      Verify 重复prepare和相同候选不能延长页面阶段15秒期限或替换候选
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0005', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        const raw = rawPayload('保留候选', 'fixed-deadline', 0, 2);
        receiveChoosingIncoming(f, inboundWant(raw), 10);
        f.native.deliverOn(0);
        const id = f.controller.snapshot().sessionRecordId;
        f.clock.advance(10000);
        receiveChoosingIncoming(f, inboundWant(rawPayload('不可替换', 'duplicate-prepare', 0, 2)), 10);
        receiveChoosingIncoming(f, inboundWant(raw), 3);
        f.controller.markWindowGone();
        expect(f.controller.snapshot().sessionRecordId).assertEqual(id);
        expect(f.native.onCallbacks.length).assertEqual(1);
        f.clock.advance(4999);
        expect(f.controller.snapshot().sessionActive).assertTrue();
        f.clock.advance(1);
        expect(latest(f, 'RESTORE').stage).assertEqual('页面窗口超时');
        expect(latest(f, 'RESTORE').durationMillis).assertEqual(15000);
        expect(f.store.putCalls).assertEqual(0);
        assertEditor(f);
        f.native.deliverOff(0);
        expect(f.clock.pendingCount()).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0600
     * @tc.name      testContinuationAdditional0006
     * @tc.desc      Verify 普通接续超时不注册或注销监听，旧标签拒收而新标签可独立恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0006', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        const expired = rawPayload('超时候选', 'ordinary-expired', 0, 2);
        receiveChoosingIncoming(f, inboundWant(expired), 3);
        f.clock.advance(15000);
        expect(latest(f, 'RESTORE').stage).assertEqual('页面窗口超时');
        expect(f.controller.snapshot().canEdit).assertTrue();
        expect(f.native.onCallbacks.length).assertEqual(0);
        expect(f.native.offCallbacks.length).assertEqual(0);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(expired), 3);
        expect(restoreCount(f)).assertEqual(1);
        expect(f.store.flushCalls).assertEqual(0);
        receiveChoosingIncoming(f, inboundWant(rawPayload('新轮正常', 'ordinary-fresh', 0, 2)), 3);
        assertEditor(f, '新轮正常', 0, 2);
        expect(f.controller.snapshot().committed).assertTrue();
        expect(restoreCount(f)).assertEqual(2);
        expect(f.store.flushCalls).assertEqual(1);
        expect(f.clock.pendingCount()).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0700
     * @tc.name      testContinuationAdditional0007
     * @tc.desc      Verify 快速结果到达前窗口撤回，重新就绪前不得提交，阶段期限正确重置
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0007', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(rawPayload('窗口撤回', 'withdrawn-window', 0, 2)), 10);
        f.clock.advance(5000);
        f.controller.markWindowGone();
        f.native.deliverOn(0);
        expect(f.controller.snapshot().sessionState.indexOf('页面窗口') >= 0).assertTrue();
        expect(f.store.flushCalls).assertEqual(0);
        assertEditor(f);
        f.clock.advance(14999);
        expect(f.controller.snapshot().sessionActive).assertTrue();
        f.controller.markWindowReady();
        assertEditor(f, '窗口撤回', 0, 2);
        expect(latest(f, 'RESTORE').durationMillis).assertEqual(19999);
        expect(f.store.flushCalls).assertEqual(1);
        f.controller.markWindowReady();
        expect(f.store.flushCalls).assertEqual(1);
        f.native.deliverOff(0);
        expect(f.clock.pendingCount()).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0800
     * @tc.name      testContinuationAdditional0008
     * @tc.desc      Verify 已提交后页面失败保留持久文档，后续新轮必须重新等待页面就绪
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0008', (): void => {
      checkedLearning((f: LearningFixture): void => {
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(rawPayload('首轮成功', 'before-page-error', 0, 2)), 3);
        const durable = f.store.stored();
        const firstId = f.controller.snapshot().sessionRecordId;
        f.controller.reportPageFailure('not stored as a platform detail');
        expect(f.store.stored()).assertEqual(durable);
        expect(f.controller.record(firstId)?.stage).assertEqual('已提交');
        receiveChoosingIncoming(f, inboundWant(rawPayload('重载后恢复', 'after-page-error', 0, 2)), 3);
        expect(f.controller.snapshot().committed).assertFalse();
        expect(f.controller.snapshot().sessionActive).assertTrue();
        expect(f.store.flushCalls).assertEqual(1);
        assertEditor(f, '首轮成功', 0, 2);
        f.controller.markWindowReady();
        assertEditor(f, '重载后恢复', 0, 2);
        expect(f.store.flushCalls).assertEqual(2);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_0900
     * @tc.name      testContinuationAdditional0009
     * @tc.desc      Verify prepare自带无效载荷在建立监听前失败，新有效prepare可重试
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0009', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant('{broken'), 10);
        expect(latest(f, 'RESTORE').stage).assertEqual('候选校验失败');
        expect(f.native.onCallbacks.length).assertEqual(0);
        expect(f.native.offCallbacks.length).assertEqual(0);
        expect(f.clock.pendingCount()).assertEqual(0);
        expect(f.store.putCalls).assertEqual(0);
        assertEditor(f);
        receiveChoosingIncoming(f, inboundWant(rawPayload('修正后', 'valid-retry', 0, 2)), 10);
        expect(f.native.onCallbacks.length).assertEqual(1);
        f.native.deliverOn(0);
        expect(f.controller.snapshot().committed).assertTrue();
        assertEditor(f, '修正后', 0, 2);
        f.native.deliverOff(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1000
     * @tc.name      testContinuationAdditional0010
     * @tc.desc      Verify 快速轮次on同步失败保留原文，新轮等待旧off后绑定且隔离旧on
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0010', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.controller.markWindowReady();
        f.native.onFailure = platformError(16300501, 'quick registration failed');
        receiveChoosingIncoming(f, inboundWant(rawPayload('失败候选', 'on-sync-failed', 0, 2)), 10);
        expect(latest(f, 'RESTORE').stage).assertEqual('ON 同步失败');
        expect(f.native.offCallbacks.length).assertEqual(1);
        expect(f.store.flushCalls).assertEqual(0);
        assertEditor(f);
        f.native.onFailure = undefined;
        receiveChoosingIncoming(f, inboundWant(rawPayload('新轮候选', 'after-on-failure', 0, 2)), 10);
        expect(f.native.onCallbacks.length).assertEqual(1);
        expect(f.controller.snapshot().quickResult).assertEqual('等待上一轮监听操作结束');
        f.native.deliverOn(0);
        assertEditor(f);
        f.native.deliverOff(0);
        expect(f.native.onCallbacks.length).assertEqual(2);
        f.native.deliverOn(0);
        expect(f.controller.snapshot().committed).assertFalse();
        f.native.deliverOn(1);
        assertEditor(f, '新轮候选', 0, 2);
        expect(f.store.flushCalls).assertEqual(1);
        f.native.deliverOff(1);
        expect(f.clock.pendingCount()).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1100
     * @tc.name      testContinuationAdditional0011
     * @tc.desc      Verify 候选冲突关闭原标签，未接收的冲突标签可在新普通轮次提交
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0011', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        const first = rawPayload('首个候选', 'conflict-first', 0, 2);
        const other = rawPayload('第二候选', 'conflict-other', 0, 2);
        receiveChoosingIncoming(f, inboundWant(first), 3);
        receiveChoosingIncoming(f, inboundWant(other), 3);
        expect(latest(f, 'RESTORE').stage).assertEqual('候选冲突');
        expect(f.store.putCalls).assertEqual(0);
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(first), 3);
        expect(restoreCount(f)).assertEqual(1);
        assertEditor(f);
        receiveChoosingIncoming(f, inboundWant(other), 3);
        assertEditor(f, '第二候选', 0, 2);
        expect(restoreCount(f)).assertEqual(2);
        expect(f.store.flushCalls).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1200
     * @tc.name      testContinuationAdditional0012
     * @tc.desc      Verify 已完成标签去重缓存48项fifo边界，移出的最旧标签可重新接收
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0012', (): void => {
      checkedLearning((f: LearningFixture): void => {
        f.controller.markWindowReady();
        for (let i: number = 0; i < 49; i++) {
          receiveChoosingIncoming(f, inboundWant(rawPayload(`文档-${i}`, `fifo-${i}`, 0, 1)), 3);
          expect(f.controller.snapshot().committed).assertTrue();
        }
        expect(f.store.flushCalls).assertEqual(49);
        receiveChoosingIncoming(f, inboundWant(rawPayload('文档-1', 'fifo-1', 0, 1)), 3);
        expect(f.store.flushCalls).assertEqual(49);
        assertEditor(f, '文档-48', 0, 1);
        receiveChoosingIncoming(f, inboundWant(rawPayload('文档-0', 'fifo-0', 0, 1)), 3);
        assertEditor(f, '文档-0', 0, 1);
        expect(f.store.flushCalls).assertEqual(50);
        expect(f.clock.pendingCount()).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1300
     * @tc.name      testContinuationAdditional0013
     * @tc.desc      Verify 已有持久文档时put失败用原值回滚并允许后续保存重试
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0013', (): void => {
      const durable = rawPayload('磁盘原文🌱', 'durable-original', 0, 2);
      checkedLearning((f: LearningFixture): void => {
        f.controller.updateText('待保存修改');
        f.controller.updateSelection(1, 3);
        f.store.failPutCalls = [1];
        f.controller.saveText();
        expect(f.store.putCalls).assertEqual(2);
        expect(f.store.deleteCalls).assertEqual(0);
        expect(f.store.flushCalls).assertEqual(1);
        expect(f.store.stored()).assertEqual(durable);
        assertEditor(f, '待保存修改', 1, 3);
        expect(latest(f, 'SAVE').errorCode).assertEqual('15500000');
        f.store.failPutCalls = [];
        f.controller.saveText();
        expect(latest(f, 'SAVE').level).assertEqual('INFO');
        expect(f.store.putCalls).assertEqual(3);
        const saved = JSON.parse(f.store.stored() as string) as Record<string, Object>;
        expect(saved['text']).assertEqual('待保存修改');
        expect(saved['selectionStart']).assertEqual(1);
        expect(saved['selectionEnd']).assertEqual(3);
      }, durable);
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1400
     * @tc.name      testContinuationAdditional0014
     * @tc.desc      Verify 无旧文档时回滚delete失败，保存清空和接续恢复均停止后续写入
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0014', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        f.store.failFlushCalls = [1];
        f.store.failDeleteCalls = [1];
        f.controller.saveText();
        expect(f.store.putCalls).assertEqual(1);
        expect(f.store.deleteCalls).assertEqual(1);
        expect(latest(f, 'SAVE').facts.join(';').indexOf('磁盘状态未知') >= 0).assertTrue();
        f.store.failFlushCalls = [];
        f.store.failDeleteCalls = [];
        f.controller.saveText();
        f.controller.clearText();
        f.controller.markWindowReady();
        receiveChoosingIncoming(f, inboundWant(rawPayload('不应写入', 'frozen-restore', 0, 2)), 3);
        assertEditor(f);
        expect(f.controller.snapshot().committed).assertFalse();
        expect(latest(f, 'RESTORE').stage).assertEqual('持久化失败');
        expect(f.store.putCalls).assertEqual(1);
        expect(f.store.deleteCalls).assertEqual(1);
        expect(f.store.flushCalls).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1500
     * @tc.name      testContinuationAdditional0015
     * @tc.desc      Verify 已有旧文档时回滚put失败冻结后续写入且编辑仍可保留
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0015', (): void => {
      checkedLearning((f: LearningFixture): void => {
        f.controller.updateText('未确认的新内容');
        f.store.failFlushCalls = [1];
        f.store.failPutCalls = [2];
        f.controller.saveText();
        expect(f.store.putCalls).assertEqual(2);
        expect(f.store.deleteCalls).assertEqual(0);
        expect(f.store.flushCalls).assertEqual(1);
        expect(latest(f, 'SAVE').level).assertEqual('ERROR');
        expect(f.controller.snapshot().canEdit).assertTrue();
        f.store.failFlushCalls = [];
        f.store.failPutCalls = [];
        f.controller.updateText('保留后续编辑');
        f.controller.saveText();
        f.controller.clearText();
        assertEditor(f, '保留后续编辑', 6, 6);
        expect(f.store.putCalls).assertEqual(2);
        expect(f.store.flushCalls).assertEqual(1);
        expect(latest(f, 'SAVE').facts.join(';').indexOf('停止后续写入') >= 0).assertTrue();
      }, rawPayload('原磁盘文档', 'before-put-rollback', 0, 2));
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1600
     * @tc.name      testContinuationAdditional0016
     * @tc.desc      Verify 同步flush边界仍保留旧ui，只有持久化返回后一次提交正文和选区
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0016', (): void => {
      const f = new ObservedLearningFixture(rawPayload('旧UI内容🌱', 'ordering-original', 0, 2));
      const observed: LearningSnapshot[] = [];
      let flushInspections: number = 0;
      try {
        f.store.beforeFlush = (): void => {
          flushInspections++;
          observed.push(f.controller.snapshot());
        };
        f.controller.markWindowReady();
        f.controller.handleLaunch(inboundWant(rawPayload('新UI内容🌱', 'ordering-new', 2, 4)), 3);
        expect(flushInspections).assertEqual(1);
        expect(observed.length).assertEqual(1);
        const during = observed[0];
        expect(during.text).assertEqual('旧UI内容🌱');
        expect(during.selectionStart).assertEqual(0);
        expect(during.selectionEnd).assertEqual(2);
        expect(during.committed).assertFalse();
        const after = f.controller.snapshot();
        expect(after.text).assertEqual('新UI内容🌱');
        expect(after.selectionStart).assertEqual(2);
        expect(after.selectionEnd).assertEqual(4);
        expect(after.committed).assertTrue();
        expect(f.store.flushCalls).assertEqual(1);
      } finally { f.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1700
     * @tc.name      testContinuationAdditional0017
     * @tc.desc      Verify 操作保存开始时环境，深拷贝所有记录数组不反向改动历史
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0017', (): void => {
      checkedLearning((f: LearningFixture): void => {
        f.controller.checkEnvironment();
        f.controller.registerProbe();
        const id = latest(f, 'ON').id;
        f.environment.publicInfo = { apiVersion: 99, deviceType: 'later-device', osFullName: 'later-os' };
        f.controller.checkEnvironment();
        expect(environmentValue(f.controller.snapshot().environment, 'api')).assertEqual('99');
        const record = f.controller.record(id);
        if (record === undefined) { throw new Error('Missing historic ON record'); }
        expect(environmentValue(record.environment, 'api')).assertEqual('26');
        record.explanation.push('injected explanation');
        record.limits.push('injected limit');
        record.nextSteps.push('injected step');
        record.environment[0].value = 'injected environment';
        record.events[0].phase = 'injected event';
        const again = f.controller.record(id);
        if (again === undefined) { throw new Error('Missing historic ON record after copy mutation'); }
        expect(again.explanation.indexOf('injected explanation')).assertEqual(-1);
        expect(again.limits.indexOf('injected limit')).assertEqual(-1);
        expect(again.nextSteps.indexOf('injected step')).assertEqual(-1);
        expect(environmentValue(again.environment, 'api')).assertEqual('26');
        expect(again.events[0].phase === 'injected event').assertFalse();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1800
     * @tc.name      testContinuationAdditional0018
     * @tc.desc      Verify 快速通知先于候选时，识别新正文后再次脱敏旧结果但不篡改实际正文
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0018', (): void => {
      checkedLearning((f: LearningFixture): void => {
        seedEditor(f);
        const secret = 'LATE_CANDIDATE_SEALED';
        receiveChoosingIncoming(f, inboundWant(), 10);
        const id = f.controller.snapshot().sessionRecordId;
        f.native.deliverOn(0, undefined, resultInfo(0, `received ${secret} safely`));
        receiveChoosingIncoming(f, inboundWant(rawPayload(secret, 'late-sensitive-data', 0, 4)), 3);
        const record = f.controller.record(id);
        if (record === undefined) { throw new Error('Missing restore result'); }
        expect(record.resultInfo.indexOf(secret)).assertEqual(-1);
        expect(record.resultInfo.indexOf('[正文已隐藏]') >= 0).assertTrue();
        expect(record.rawResultState).assertEqual('0');
        assertEditor(f);
        f.controller.markWindowReady();
        assertEditor(f, secret, 0, 4);
        const stored = JSON.parse(f.store.stored() as string) as Record<string, Object>;
        expect(stored['text']).assertEqual(secret);
        f.native.deliverOff(0);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_1900
     * @tc.name      testContinuationAdditional0019
     * @tc.desc      Verify 权限异步失败后可重新申请，重复点击门禁释放且旧记录不被新结果改写
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0019', async (): Promise<void> => {
      const f = new LearningFixture();
      try {
        f.controller.requestPermission();
        const firstId = latest(f, 'PERMISSION').id;
        f.environment.reply.reject(platformError(201, 'first denied'));
        await flushPermissionMicrotasks();
        const first = JSON.stringify(f.controller.record(firstId));
        expect(latest(f, 'PERMISSION').level).assertEqual('ERROR');
        f.environment.reply = new PermissionReply();
        f.controller.requestPermission();
        f.controller.requestPermission();
        expect(f.environment.requestCalls).assertEqual(2);
        const secondId = latest(f, 'PERMISSION').id;
        expect(secondId === firstId).assertFalse();
        f.environment.reply.resolve([0, -1]);
        await flushPermissionMicrotasks();
        expect(latest(f, 'PERMISSION').level).assertEqual('INFO');
        expect(latest(f, 'PERMISSION').result).assertEqual('权限已授权');
        expect(JSON.stringify(f.controller.record(firstId))).assertEqual(first);
        expect(f.native.onCallbacks.length).assertEqual(0);
      } finally {
        f.controller.dispose();
        expect(f.clock.pendingCount()).assertEqual(0);
        f.release();
      }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2000
     * @tc.name      testContinuationAdditional0020
     * @tc.desc      Verify 销毁在途快速恢复与权限请求后，全部公开入口及迟到回调均无副作用
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0020', async (): Promise<void> => {
      const f = new LearningFixture();
      try {
        seedEditor(f);
        f.controller.requestPermission();
        receiveChoosingIncoming(f, inboundWant(rawPayload('销毁前候选', 'destroyed-round', 0, 2)), 10);
        f.controller.markWindowReady();
        f.controller.dispose();
        const frozen = JSON.stringify(f.controller.snapshot());
        const nativeOffCount = f.native.offCallbacks.length;
        expect(nativeOffCount).assertEqual(1);
        expect(f.clock.pendingCount()).assertEqual(0);
        expect(f.controller.snapshot().canEdit).assertFalse();
        expect(f.controller.snapshot().canRegister).assertFalse();
        expect(f.controller.snapshot().canUnregister).assertFalse();
        expect(f.controller.snapshot().canStop).assertFalse();
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
        receiveChoosingIncoming(f, inboundWant(rawPayload()), 10);
        f.controller.markWindowReady();
        f.controller.markWindowGone();
        f.controller.reportPageFailure('late page error');
        f.controller.clearRecords();
        const parameters: Record<string, Object> = {};
        parameters['sentinel'] = 'unchanged';
        expect(f.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.REJECT);
        expect(Object.keys(parameters).length).assertEqual(1);
        expect(parameters['sentinel']).assertEqual('unchanged');
        f.native.deliverOn(0);
        f.native.deliverOff(0);
        f.environment.reply.reject(platformError(201, 'late permission rejection'));
        await flushPermissionMicrotasks();
        f.clock.advance(60000);
        f.controller.dispose();
        expect(JSON.stringify(f.controller.snapshot())).assertEqual(frozen);
        expect(subscriberCalls).assertEqual(0);
        expect(f.store.putCalls).assertEqual(0);
        expect(f.environment.readCalls).assertEqual(0);
        expect(f.environment.requestCalls).assertEqual(1);
        expect(f.native.offCallbacks.length).assertEqual(nativeOffCount);
        expect(f.clock.pendingCount()).assertEqual(0);
      } finally { f.release(); }
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2100
     * @tc.name      testContinuationAdditional0021
     * @tc.desc      Verify 多订阅者中途抛错不阻断后继通知，单独退订与重复退订互不影响
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0021', (): void => {
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
        expect(first).assertEqual(2);
        expect(bad).assertEqual(2);
        expect(last).assertEqual(2);
        expect(f.controller.snapshot().text).assertEqual('首轮发布');
        stopBad();
        stopBad();
        stopFirst();
        f.controller.updateSelection(0, 2);
        expect(first).assertEqual(2);
        expect(bad).assertEqual(2);
        expect(last).assertEqual(3);
        stopLast();
        f.controller.updateText('无人订阅仍可编辑');
        expect(last).assertEqual(3);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2200
     * @tc.name      testContinuationAdditional0022
     * @tc.desc      Verify 原生回调错误优先于成功状态，双消息脱敏且非有限状态保持未知
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0022', (): void => {
      checkedClient((f: ClientFixture): void => {
        const seen: ContinueObservation[] = [];
        f.client.register((event: ContinueObservation): void => { seen.push(event); });
        f.native.deliverOn(0, platformError(0, 'failure at file:///private/path'),
          resultInfo(0, 'detail deviceId=abc123; marker'));
        expect(seen[0].kind).assertEqual('ERROR');
        expect(seen[0].errorCode).assertEqual('0');
        expect(seen[0].rawState).assertEqual('0');
        expect(seen[0].detail.indexOf('file:///private/path')).assertEqual(-1);
        expect(seen[0].detail.indexOf('abc123')).assertEqual(-1);
        expect(seen[0].detail.indexOf('marker') >= 0).assertTrue();
        f.native.deliverOn(0, undefined, resultInfo(Number.POSITIVE_INFINITY, 'independent result'));
        expect(seen[1].kind).assertEqual('UNKNOWN');
        expect(seen[1].rawState).assertEqual('缺失或非数字');
        expect(seen[1].errorCode).assertEqual('');
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2300
     * @tc.name      testContinuationAdditional0023
     * @tc.desc      Verify on同步回调内重入注销不会遗留监听或计时器，旧on仍隔离
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0023', (): void => {
      checkedClient((f: ClientFixture): void => {
        let oldEvents: number = 0;
        let offEvents: number = 0;
        let newEvents: number = 0;
        f.native.onImmediate = true;
        f.native.offImmediate = true;
        const called = f.client.register((_event: ContinueObservation): void => {
          oldEvents++;
          expect(f.client.unregister((_off: ContinueObservation): void => { offEvents++; }).accepted).assertTrue();
        });
        expect(called.accepted).assertTrue();
        expect(oldEvents).assertEqual(1);
        expect(offEvents).assertEqual(1);
        expect(f.client.state().listening).assertFalse();
        expect(f.client.state().nativeDirty).assertFalse();
        expect(f.client.state().offPending).assertFalse();
        expect(f.clock.pendingCount()).assertEqual(0);
        f.native.deliverOn(0);
        expect(oldEvents).assertEqual(1);
        f.native.onImmediate = false;
        expect(f.client.register((_event: ContinueObservation): void => { newEvents++; }).accepted).assertTrue();
        f.native.deliverOn(0);
        expect(newEvents).assertEqual(0);
        f.native.deliverOn(1);
        expect(newEvents).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2400
     * @tc.name      testContinuationAdditional0024
     * @tc.desc      Verify off同步完成回调内重入注册后原off再抛错，不得清除新监听
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0024', (): void => {
      checkedClient((f: ClientFixture): void => {
        let offEvents: number = 0;
        let newEvents: number = 0;
        f.client.register((_event: ContinueObservation): void => {});
        f.native.offImmediate = true;
        f.native.offFailure = platformError();
        const finished = f.client.unregister((_event: ContinueObservation): void => {
          offEvents++;
          expect(f.client.register((_new: ContinueObservation): void => { newEvents++; }).accepted).assertTrue();
        });
        expect(finished.accepted).assertFalse();
        expect(finished.errorCode).assertEqual('16300501');
        expect(offEvents).assertEqual(1);
        expect(f.client.state().listening).assertTrue();
        expect(f.client.state().nativeDirty).assertTrue();
        expect(f.client.state().offPending).assertFalse();
        expect(f.clock.pendingCount()).assertEqual(0);
        f.native.deliverOn(0);
        expect(newEvents).assertEqual(0);
        f.native.deliverOff(0);
        expect(f.client.state().listening).assertTrue();
        f.native.deliverOn(1);
        expect(newEvents).assertEqual(1);
        f.native.offFailure = undefined;
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2500
     * @tc.name      testContinuationAdditional0025
     * @tc.desc      Verify initial subscription exception isolated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0025', (): void => {
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
        expect(initialThrew).assertFalse();
        expect(cancellations.length).assertEqual(1);
        const stopHealthy = f.controller.subscribe((_value: LearningSnapshot): void => { healthyCalls++; });
        expect(faultyCalls).assertEqual(1);
        expect(healthyCalls).assertEqual(1);
        f.controller.updateText('异常订阅不阻塞编辑');
        expect(faultyCalls).assertEqual(2);
        expect(healthyCalls).assertEqual(2);
        cancellations[0]();
        f.controller.updateSelection(0, 2);
        expect(faultyCalls).assertEqual(2);
        expect(healthyCalls).assertEqual(3);
        stopHealthy();
        f.controller.updateSelection(1, 2);
        expect(healthyCalls).assertEqual(3);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONADDITIONAL_2600
     * @tc.name      testContinuationAdditional0026
     * @tc.desc      Verify off已在途时销毁只清理本地计时器，不重复原生注销或通知观察者
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationAdditional0026', (): void => {
      checkedClient((f: ClientFixture): void => {
        let onEvents: number = 0;
        let offEvents: number = 0;
        f.client.register((_event: ContinueObservation): void => { onEvents++; });
        f.client.unregister((_event: ContinueObservation): void => { offEvents++; });
        expect(f.clock.pendingCount()).assertEqual(1);
        f.client.dispose();
        f.client.dispose();
        expect(f.native.offCallbacks.length).assertEqual(1);
        expect(f.clock.pendingCount()).assertEqual(0);
        f.native.deliverOn(0);
        f.native.deliverOff(0);
        f.clock.advance(60000);
        expect(onEvents).assertEqual(0);
        expect(offEvents).assertEqual(0);
        expect(f.client.register((_event: ContinueObservation): void => {}).accepted).assertFalse();
        expect(f.client.unregister((_event: ContinueObservation): void => {}).accepted).assertFalse();
        expect(f.native.offCallbacks.length).assertEqual(1);
      });
    });
  });
}
