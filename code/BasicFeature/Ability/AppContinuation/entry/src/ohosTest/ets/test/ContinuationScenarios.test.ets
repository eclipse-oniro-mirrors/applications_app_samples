/** Ten bounded scenarios exercising the production controller/client through injected ports. */
import { describe, expect } from '@ohos/hypium';
import { AbilityConstant, Want, wantConstant } from '@kit.AbilityKit';
import {
  ContinueObservation, redactPlatformText, safeErrorCode, safeErrorMessage
} from '../../../main/ets/learning/ContinueClient';
import { platformLearningDependencies } from '../../../main/ets/learning/LearningPorts';
import {
  clearLearningController, getLearningController, publishLearningController
} from '../../../main/ets/learning/LearningContext';
import {
  emptyLearningSnapshot, EnvironmentItem, LearningSnapshot, OperationRecord, TEXT_PAYLOAD_KEY
} from '../../../main/ets/learning/LearningTypes';
import { scenario } from '../support/BoundedCase';
import {
  ClientFixture, flushPermissionMicrotasks, inboundWant, LearningFixture, payloadBag,
  platformError, rawPayload, resultInfo, withClient, withLearning
} from '../support/LearningFixtures';

interface SelectionCase {
  start: number;
  end: number;
}

interface InvalidField {
  key: string;
  value: Object;
}

function latest(fixture: LearningFixture, operation: string): OperationRecord {
  const record = fixture.controller.snapshot().records.find((item: OperationRecord) => item.operation === operation);
  if (record === undefined) {
    throw new Error(`Expected ${operation} operation record.`);
  }
  return record;
}

function environmentValue(snapshot: LearningSnapshot, key: string): EnvironmentItem {
  const item = snapshot.environment.find((value: EnvironmentItem) => value.key === key);
  if (item === undefined) {
    throw new Error(`Expected environment item ${key}.`);
  }
  return item;
}

function assertOriginal(fixture: LearningFixture): void {
  const value = fixture.controller.snapshot();
  expect(value.text).assertEqual('原文🌱');
  expect(value.selectionStart).assertEqual(0);
  expect(value.selectionEnd).assertEqual(2);
  expect(value.committed).assertFalse();
}

/** 老场景聚焦三信号/存储故障；新保护策略下显式模拟用户选择接续内容。 */
function receiveChoosingIncoming(fixture: LearningFixture, want: Want, reason: number): void {
  fixture.controller.handleLaunch(want, reason);
  fixture.controller.acceptConflict();
}

function seedOriginal(fixture: LearningFixture): void {
  fixture.controller.updateText('原文🌱');
  fixture.controller.updateSelection(0, 2);
}

export default function continuationScenarios(): void {
  describe('ContinuationScenarios', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0100
     * @tc.name      testContinuationScenarios0001
     * @tc.desc      Verify 文本与选区：空值、长度、unicode、整数边界及编辑锁
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0001', (): void => {
      const accepted: string[] = ['', '中文', 'A🌱B', 'a'.repeat(4096), '🌱'.repeat(2048)];
      accepted.forEach((text: string): void => {
        withLearning((fixture: LearningFixture): void => {
          fixture.controller.updateText(text);
          expect(fixture.controller.snapshot().text).assertEqual(text);
          fixture.controller.updateSelection(0, text.length);
          expect(fixture.controller.snapshot().selectionEnd).assertEqual(text.length);
          fixture.controller.updateSelection(text.length, text.length);
          expect(fixture.controller.snapshot().selectionStart).assertEqual(text.length);
        });
      });
      const rejected: string[] = ['a'.repeat(4097), '\uD800', '\uDC00', '\uD800x', 'x\uDC00', '\uD800\uD800'];
      rejected.forEach((text: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          fixture.controller.updateText(text);
          assertOriginal(fixture);
          expect(fixture.controller.snapshot().notice.indexOf('校验失败') >= 0).assertTrue();
        });
      });
      const invalid: SelectionCase[] = [
        { start: -1, end: 1 }, { start: 0, end: 5 }, { start: 3, end: 1 },
        { start: 0.5, end: 3 }, { start: 0, end: 3.5 },
        { start: 0, end: Number.NaN }, { start: Number.POSITIVE_INFINITY, end: 4 },
        { start: 2, end: 3 }, { start: 1, end: 2 }
      ];
      invalid.forEach((range: SelectionCase): void => {
        withLearning((fixture: LearningFixture): void => {
          fixture.controller.updateText('A🌱B');
          fixture.controller.updateSelection(1, 3);
          fixture.controller.updateSelection(range.start, range.end);
          expect(fixture.controller.snapshot().selectionStart).assertEqual(1);
          expect(fixture.controller.snapshot().selectionEnd).assertEqual(3);
        });
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.fillExample();
        expect(fixture.controller.snapshot().text.length > 0).assertTrue();
        seedOriginal(fixture);
        receiveChoosingIncoming(fixture, inboundWant(), 10);
        fixture.controller.updateText('被锁定的编辑');
        fixture.controller.updateSelection(1, 1);
        fixture.controller.fillExample();
        assertOriginal(fixture);
        expect(fixture.controller.snapshot().canEdit).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0200
     * @tc.name      testContinuationScenarios0002
     * @tc.desc      Verify 载荷与源参数：格式、字段、版本、unicode及完整往返
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0002', (): void => {
      const invalidRaw: Object[] = [7, '', '{', 'null', '[]', '5', '{}', 'x'.repeat(26001)];
      invalidRaw.forEach((raw: Object): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          fixture.controller.markWindowReady();
          receiveChoosingIncoming(fixture, inboundWant(raw), 3);
          assertOriginal(fixture);
          expect(fixture.controller.snapshot().sessionActive).assertFalse();
          expect(latest(fixture, 'RESTORE').level).assertEqual('ERROR');
        });
      });
      const invalidFields: InvalidField[] = [
        { key: 'version', value: 3 }, { key: 'version', value: '1' },
        { key: 'page', value: 'other' }, { key: 'transferId', value: '' },
        { key: 'transferId', value: 'id with spaces' }, { key: 'transferId', value: 't'.repeat(97) },
        { key: 'text', value: 123 }, { key: 'text', value: 'a'.repeat(4097) },
        { key: 'text', value: '\uD800' }, { key: 'selectionStart', value: '0' },
        { key: 'selectionStart', value: -1 }, { key: 'selectionEnd', value: 999 },
        { key: 'selectionStart', value: 1.5 }, { key: 'selectionStart', value: 3 },
        { key: 'selectionStart', value: 2 }
      ];
      invalidFields.forEach((entry: InvalidField): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          const bag = payloadBag('A🌱B', 'test-tag', 0, 1);
          bag[entry.key] = entry.value;
          receiveChoosingIncoming(fixture, inboundWant(JSON.stringify(bag)), 3);
          fixture.controller.markWindowReady();
          assertOriginal(fixture);
          expect(fixture.store.putCalls).assertEqual(0);
        });
      });
      const required: string[] = ['version', 'page', 'transferId', 'text', 'selectionStart', 'selectionEnd'];
      required.forEach((omitted: string): void => {
        withLearning((fixture: LearningFixture): void => {
          const full = payloadBag();
          const missing: Record<string, Object> = {};
          Object.keys(full).forEach((key: string): void => { if (key !== omitted) { missing[key] = full[key]; } });
          receiveChoosingIncoming(fixture, inboundWant(JSON.stringify(missing)), 3);
          expect(fixture.controller.snapshot().sessionActive).assertFalse();
          expect(fixture.controller.snapshot().committed).assertFalse();
        });
      });
      withLearning((source: LearningFixture): void => {
        source.controller.updateText('A🌱B');
        source.controller.updateSelection(1, 3);
        const parameters: Record<string, Object> = {};
        expect(source.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.AGREE);
        expect(parameters[wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY]).assertFalse();
        const raw = parameters[TEXT_PAYLOAD_KEY] as string;
        const decoded = JSON.parse(raw) as Record<string, Object>;
        expect(decoded['version']).assertEqual(1);
        expect(decoded['page']).assertEqual('text');
        expect((decoded['transferId'] as string).length > 0).assertTrue();
        withLearning((target: LearningFixture): void => {
          target.controller.markWindowReady();
          target.controller.handleLaunch(inboundWant(raw), 3);
          expect(target.controller.snapshot().text).assertEqual('A🌱B');
          expect(target.controller.snapshot().selectionStart).assertEqual(1);
          expect(target.controller.snapshot().selectionEnd).assertEqual(3);
          expect(target.controller.snapshot().committed).assertTrue();
        });
        source.controller.handleLaunch(inboundWant(), 10);
        const blocked: Record<string, Object> = {};
        expect(source.controller.buildContinuation(blocked)).assertEqual(AbilityConstant.OnContinueResult.REJECT);
        expect(Object.keys(blocked).length).assertEqual(0);
        source.controller.dispose();
        expect(source.controller.buildContinuation({})).assertEqual(AbilityConstant.OnContinueResult.REJECT);
      });
      withLearning((fixture: LearningFixture): void => {
        const raw = rawPayload('🌱'.repeat(2048), 't'.repeat(96), 0, 4096);
        fixture.controller.markWindowReady();
        receiveChoosingIncoming(fixture, inboundWant(raw), 3);
        expect(fixture.controller.snapshot().committed).assertTrue();
        expect(fixture.controller.snapshot().text.length).assertEqual(4096);
        expect(fixture.controller.snapshot().selectionEnd).assertEqual(4096);
      });
      withLearning((fixture: LearningFixture): void => {
        const bag = payloadBag('', 'empty', 0, 0);
        bag['extension'] = 'optional fixture value';
        receiveChoosingIncoming(fixture, inboundWant(JSON.stringify(bag)), 3);
        fixture.controller.markWindowReady();
        expect(fixture.controller.snapshot().committed).assertTrue();
        expect(fixture.controller.snapshot().text).assertEqual('');
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0300
     * @tc.name      testContinuationScenarios0003
     * @tc.desc      Verify 注册客户端：回调分类、同步异常重试及监听代次隔离
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0003', (): void => {
      const states: number[] = [0, 1, 99, Number.NaN];
      const kinds: string[] = ['SUCCESS', 'FAILURE', 'UNKNOWN', 'UNKNOWN'];
      states.forEach((state: number, index: number): void => {
        withClient((fixture: ClientFixture): void => {
          const seen: ContinueObservation[] = [];
          expect(fixture.client.register((event: ContinueObservation) => { seen.push(event); }).accepted).assertTrue();
          expect(fixture.native.onCallbacks.length).assertEqual(1);
          expect(fixture.client.register((_event: ContinueObservation) => {}).accepted).assertFalse();
          const stateCopy = fixture.client.state();
          stateCopy.listening = false;
          expect(fixture.client.state().listening).assertTrue();
          fixture.native.deliverOn(0, undefined, resultInfo(state));
          expect(seen.length).assertEqual(1);
          expect(seen[0].kind).assertEqual(kinds[index]);
          expect(seen[0].phase).assertEqual('ON_ASYNC');
        });
      });
      withClient((fixture: ClientFixture): void => {
        const seen: ContinueObservation[] = [];
        fixture.client.register((event: ContinueObservation) => { seen.push(event); });
        fixture.native.onCallbacks[0](undefined, undefined);
        fixture.native.deliverOn(0, null, null);
        fixture.native.deliverOn(0, platformError(), resultInfo());
        expect(seen[0].kind).assertEqual('UNKNOWN');
        expect(seen[1].kind).assertEqual('UNKNOWN');
        expect(seen[2].kind).assertEqual('ERROR');
        expect(seen[2].errorCode).assertEqual('16300501');
      });
      withClient((fixture: ClientFixture): void => {
        const seen: ContinueObservation[] = [];
        fixture.native.onImmediate = true;
        expect(fixture.client.register((event: ContinueObservation) => { seen.push(event); }).accepted).assertTrue();
        expect(seen.length).assertEqual(1);
        fixture.native.offImmediate = true;
        fixture.client.unregister((_event: ContinueObservation) => {});
        fixture.native.onImmediate = false;
        fixture.client.register((event: ContinueObservation) => { seen.push(event); });
        fixture.native.deliverOn(0, undefined, resultInfo(1));
        expect(seen.length).assertEqual(1);
        fixture.native.deliverOn(1);
        expect(seen.length).assertEqual(2);
      });
      withClient((fixture: ClientFixture): void => {
        let calls: number = 0;
        fixture.native.onFailure = platformError();
        const call = fixture.client.register((_event: ContinueObservation) => { calls++; });
        expect(call.accepted).assertFalse();
        expect(call.errorCode).assertEqual('16300501');
        expect(fixture.client.state().listening).assertFalse();
        expect(fixture.client.state().nativeDirty).assertTrue();
        fixture.native.deliverOn(0);
        expect(calls).assertEqual(0);
        fixture.native.onFailure = undefined;
        expect(fixture.client.register((_event: ContinueObservation) => { calls++; }).accepted).assertTrue();
        expect(fixture.native.onCallbacks.length).assertEqual(2);
        expect(fixture.native.offCallbacks.length).assertEqual(0);
        expect(fixture.client.state().listening).assertTrue();
        fixture.native.deliverOn(0, undefined, resultInfo(1));
        expect(calls).assertEqual(0);
        expect(fixture.client.state().listening).assertTrue();
        fixture.native.deliverOn(1);
        expect(calls).assertEqual(1);
        expect(fixture.client.register((_event: ContinueObservation) => {}).accepted).assertFalse();
        expect(fixture.native.onCallbacks.length).assertEqual(2);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0400
     * @tc.name      testContinuationScenarios0004
     * @tc.desc      Verify 注销客户端：8秒到期重试、失败重试、完成代次隔离及释放
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0004', (): void => {
      [true, false].forEach((retryRegister: boolean): void => {
        withClient((fixture: ClientFixture): void => {
          let onEvents: number = 0;
          const offEvents: ContinueObservation[] = [];
          fixture.client.register((_event: ContinueObservation) => { onEvents++; });
          expect(fixture.client.unregister((event: ContinueObservation) => { offEvents.push(event); }).accepted).assertTrue();
          expect(fixture.client.state().listening).assertFalse();
          fixture.native.deliverOn(0);
          expect(onEvents).assertEqual(0);
          fixture.clock.advance(7999);
          expect(offEvents.length).assertEqual(0);
          expect(fixture.client.state().offPending).assertTrue();
          expect(fixture.client.register((_event: ContinueObservation) => {}).accepted).assertFalse();
          expect(fixture.client.unregister((_event: ContinueObservation) => {}).accepted).assertFalse();
          expect(fixture.native.onCallbacks.length).assertEqual(1);
          expect(fixture.native.offCallbacks.length).assertEqual(1);
          fixture.clock.advance(1);
          expect(offEvents.length).assertEqual(1);
          expect(offEvents[0].kind).assertEqual('UNCONFIRMED');
          expect(offEvents[0].phase).assertEqual('OFF_OBSERVATION');
          expect(fixture.client.state().offObservationExpired).assertTrue();
          expect(fixture.client.state().offPending).assertFalse();
          expect(fixture.client.state().nativeDirty).assertTrue();
          expect(fixture.clock.pendingCount()).assertEqual(0);
          fixture.native.deliverOff(0);
          expect(offEvents.length).assertEqual(1);
          expect(fixture.client.state().nativeDirty).assertTrue();
          expect(fixture.client.state().offObservationExpired).assertTrue();
          if (retryRegister) {
            expect(fixture.client.register((_event: ContinueObservation) => { onEvents++; }).accepted).assertTrue();
            expect(fixture.client.state().offObservationExpired).assertFalse();
            fixture.native.deliverOn(0);
            fixture.native.deliverOff(0, platformError());
            fixture.native.deliverOff(0);
            expect(onEvents).assertEqual(0);
            expect(fixture.client.state().listening).assertTrue();
            expect(fixture.client.state().nativeDirty).assertTrue();
            fixture.native.deliverOn(1);
            expect(onEvents).assertEqual(1);
          }
          expect(fixture.client.unregister((event: ContinueObservation) => { offEvents.push(event); }).accepted).assertTrue();
          expect(fixture.native.offCallbacks.length).assertEqual(2);
          fixture.native.deliverOff(0);
          expect(offEvents.length).assertEqual(1);
          expect(fixture.client.state().offPending).assertTrue();
          expect(fixture.client.state().nativeDirty).assertTrue();
          fixture.native.deliverOff(1);
          expect(offEvents.length).assertEqual(2);
          expect(offEvents[1].kind).assertEqual('SUCCESS');
          expect(fixture.client.state().nativeDirty).assertFalse();
          expect(fixture.client.state().offPending).assertFalse();
          expect(fixture.clock.pendingCount()).assertEqual(0);
        });
      });
      const failedStates: number[] = [1, 98, 29360148];
      failedStates.forEach((state: number): void => {
        [true, false].forEach((retryRegister: boolean): void => {
          withClient((fixture: ClientFixture): void => {
            let onEvents: number = 0;
            const offEvents: ContinueObservation[] = [];
            fixture.client.register((_event: ContinueObservation) => { onEvents++; });
            fixture.client.unregister((event: ContinueObservation) => { offEvents.push(event); });
            fixture.native.deliverOff(0, undefined, resultInfo(state));
            expect(offEvents.length).assertEqual(1);
            expect(offEvents[0].kind).assertEqual(state === 1 ? 'FAILURE' : 'UNKNOWN');
            expect(offEvents[0].rawState).assertEqual(`${state}`);
            expect(fixture.client.state().nativeDirty).assertTrue();
            expect(fixture.client.state().offPending).assertFalse();
            expect(fixture.clock.pendingCount()).assertEqual(0);
            if (retryRegister) {
              expect(fixture.client.register((_event: ContinueObservation) => { onEvents++; }).accepted).assertTrue();
              fixture.native.deliverOn(0);
              fixture.native.deliverOff(0);
              expect(onEvents).assertEqual(0);
              expect(fixture.client.state().listening).assertTrue();
              expect(fixture.client.state().nativeDirty).assertTrue();
              fixture.native.deliverOn(1);
              expect(onEvents).assertEqual(1);
            }
            expect(fixture.client.unregister((event: ContinueObservation) => { offEvents.push(event); }).accepted).assertTrue();
            fixture.native.deliverOff(0);
            expect(fixture.client.state().offPending).assertTrue();
            expect(offEvents.length).assertEqual(1);
            fixture.native.deliverOff(1);
            expect(offEvents.length).assertEqual(2);
            expect(fixture.client.state().nativeDirty).assertFalse();
            expect(fixture.clock.pendingCount()).assertEqual(0);
          });
        });
      });
      withClient((fixture: ClientFixture): void => {
        expect(fixture.client.unregister((_event: ContinueObservation) => {}).accepted).assertFalse();
        expect(fixture.native.offCallbacks.length).assertEqual(0);
        const seen: ContinueObservation[] = [];
        fixture.client.register((_event: ContinueObservation) => {});
        fixture.client.unregister((event: ContinueObservation) => { seen.push(event); });
        fixture.native.deliverOff(0, platformError(201, 'fixture asynchronous off error'), resultInfo());
        expect(seen[0].kind).assertEqual('ERROR');
        expect(seen[0].errorCode).assertEqual('201');
        expect(fixture.client.state().nativeDirty).assertTrue();
        expect(fixture.client.state().offPending).assertFalse();
        expect(fixture.client.register((_event: ContinueObservation) => {}).accepted).assertTrue();
        fixture.native.deliverOff(0);
        expect(fixture.client.state().listening).assertTrue();
        expect(fixture.client.state().nativeDirty).assertTrue();
        fixture.client.unregister((event: ContinueObservation) => { seen.push(event); });
        fixture.native.offCallbacks[1](undefined, undefined);
        expect(seen[1].kind).assertEqual('UNKNOWN');
        expect(fixture.client.state().offPending).assertFalse();
        expect(fixture.client.state().nativeDirty).assertTrue();
        expect(fixture.client.register((_event: ContinueObservation) => {}).accepted).assertTrue();
        expect(fixture.native.onCallbacks.length).assertEqual(3);
        fixture.native.deliverOff(1);
        expect(fixture.client.state().listening).assertTrue();
        expect(fixture.client.state().nativeDirty).assertTrue();
      });
      [true, false].forEach((retryRegister: boolean): void => {
        withClient((fixture: ClientFixture): void => {
          let offEvents: number = 0;
          fixture.client.register((_event: ContinueObservation) => {});
          fixture.native.offFailure = platformError();
          const failed = fixture.client.unregister((_event: ContinueObservation) => { offEvents++; });
          expect(failed.accepted).assertFalse();
          expect(failed.errorCode).assertEqual('16300501');
          expect(fixture.client.state().nativeDirty).assertTrue();
          expect(fixture.client.state().offPending).assertFalse();
          expect(fixture.clock.pendingCount()).assertEqual(0);
          fixture.native.offFailure = undefined;
          if (retryRegister) {
            expect(fixture.client.register((_event: ContinueObservation) => {}).accepted).assertTrue();
            fixture.native.deliverOff(0);
            expect(fixture.client.state().listening).assertTrue();
            expect(fixture.client.state().nativeDirty).assertTrue();
          }
          expect(fixture.client.unregister((_event: ContinueObservation) => { offEvents++; }).accepted).assertTrue();
          fixture.native.deliverOff(0);
          expect(offEvents).assertEqual(0);
          expect(fixture.client.state().offPending).assertTrue();
          expect(fixture.client.state().nativeDirty).assertTrue();
          fixture.native.deliverOff(1);
          expect(offEvents).assertEqual(1);
          expect(fixture.client.state().nativeDirty).assertFalse();
          expect(fixture.clock.pendingCount()).assertEqual(0);
        });
      });
      withClient((fixture: ClientFixture): void => {
        fixture.client.register((_event: ContinueObservation) => {});
        fixture.native.offImmediate = true;
        fixture.native.offFailure = platformError();
        expect(fixture.client.unregister((_event: ContinueObservation) => {}).accepted).assertFalse();
        expect(fixture.client.state().nativeDirty).assertFalse();
        expect(fixture.client.state().offPending).assertFalse();
      });
      withClient((fixture: ClientFixture): void => {
        let events: number = 0;
        fixture.client.register((_event: ContinueObservation) => { events++; });
        fixture.client.dispose();
        fixture.client.dispose();
        expect(fixture.native.offCallbacks.length).assertEqual(1);
        expect(fixture.clock.pendingCount()).assertEqual(0);
        fixture.native.deliverOn(0);
        fixture.native.deliverOff(0);
        fixture.clock.advance(30000);
        expect(events).assertEqual(0);
        expect(fixture.client.register((_event: ContinueObservation) => {}).accepted).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0500
     * @tc.name      testContinuationScenarios0005
     * @tc.desc      Verify 普通接续：数据窗口汇合、重复标签、候选冲突及页面失败
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0005', (): void => {
      ['DW', 'WD'].forEach((order: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          const raw = rawPayload('A🌱B', `ordinary-${order}`, 1, 3);
          for (let i: number = 0; i < order.length; i++) {
            if (order.charAt(i) === 'D') {
              receiveChoosingIncoming(fixture, inboundWant(raw), 3);
            } else {
              fixture.controller.markWindowReady();
            }
            expect(fixture.controller.snapshot().committed).assertEqual(i === order.length - 1);
          }
          expect(fixture.native.onCallbacks.length).assertEqual(0);
          expect(fixture.controller.snapshot().text).assertEqual('A🌱B');
          expect(fixture.controller.snapshot().selectionStart).assertEqual(1);
          expect(fixture.controller.snapshot().selectionEnd).assertEqual(3);
          expect(fixture.store.flushCalls).assertEqual(1);
          receiveChoosingIncoming(fixture, inboundWant(raw), 3);
          fixture.controller.markWindowReady();
          expect(fixture.store.flushCalls).assertEqual(1);
          receiveChoosingIncoming(fixture, inboundWant(rawPayload('下一轮', 'new-round', 0, 3)), 3);
          expect(fixture.controller.snapshot().text).assertEqual('下一轮');
          expect(fixture.store.flushCalls).assertEqual(2);
        });
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        const raw = rawPayload();
        receiveChoosingIncoming(fixture, inboundWant(raw), 3);
        receiveChoosingIncoming(fixture, inboundWant(raw), 3);
        fixture.controller.updateText('在途编辑');
        assertOriginal(fixture);
        expect(fixture.controller.snapshot().sessionActive).assertTrue();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('冲突内容', 'conflict', 0, 2)), 3);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
        expect(fixture.controller.snapshot().sessionActive).assertFalse();
        expect(latest(fixture, 'RESTORE').stage).assertEqual('候选冲突');
        expect(fixture.store.putCalls).assertEqual(0);
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.controller.markWindowReady();
        fixture.controller.markWindowGone();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), 3);
        assertOriginal(fixture);
        fixture.controller.reportPageFailure('private page text');
        expect(latest(fixture, 'RESTORE').stage).assertEqual('页面加载失败');
        expect(fixture.controller.diagnosticSummary().indexOf('private page text')).assertEqual(-1);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0600
     * @tc.name      testContinuationScenarios0006
     * @tc.desc      Verify 快速接续：六种信号顺序、回调去重、失败及旧槽交接
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0006', (): void => {
      ['RDW', 'RWD', 'DRW', 'DWR', 'WRD', 'WDR'].forEach((order: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          receiveChoosingIncoming(fixture, inboundWant(), 10);
          receiveChoosingIncoming(fixture, inboundWant(), 10);
          expect(fixture.native.onCallbacks.length).assertEqual(1);
          const raw = rawPayload('快速文本🌱', `quick-${order}`, 0, 2);
          for (let i: number = 0; i < order.length; i++) {
            const signal = order.charAt(i);
            if (signal === 'R') {
              fixture.native.deliverOn(0);
              fixture.native.deliverOn(0, undefined, resultInfo(1));
            } else if (signal === 'D') {
              receiveChoosingIncoming(fixture, inboundWant(raw), 3);
              receiveChoosingIncoming(fixture, inboundWant(raw), 3);
            } else {
              fixture.controller.markWindowReady();
            }
            expect(fixture.controller.snapshot().committed).assertEqual(i === 2);
          }
          expect(fixture.controller.snapshot().text).assertEqual('快速文本🌱');
          expect(fixture.store.flushCalls).assertEqual(1);
          expect(fixture.native.offCallbacks.length).assertEqual(1);
          fixture.native.deliverOff(0);
          expect(fixture.controller.snapshot().canRegister).assertTrue();
        });
      });
      [1, 22].forEach((state: number): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          receiveChoosingIncoming(fixture, inboundWant(rawPayload()), 10);
          fixture.controller.markWindowReady();
          fixture.native.deliverOn(0, undefined, resultInfo(state));
          assertOriginal(fixture);
          expect(fixture.controller.snapshot().sessionActive).assertFalse();
          expect(fixture.store.flushCalls).assertEqual(0);
        });
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        receiveChoosingIncoming(fixture, inboundWant(), 10);
        fixture.native.deliverOn(0, platformError(), resultInfo());
        expect(latest(fixture, 'RESTORE').errorCode).assertEqual('16300501');
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), 3);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.native.onImmediate = true;
        fixture.native.offImmediate = true;
        fixture.controller.markWindowReady();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('同步完成', 'sync-complete', 0, 2)), 10);
        expect(fixture.controller.snapshot().committed).assertTrue();
        expect(fixture.controller.snapshot().canRegister).assertTrue();
        expect(fixture.native.onCallbacks.length).assertEqual(1);
        expect(fixture.native.offCallbacks.length).assertEqual(1);
        expect(fixture.clock.pendingCount()).assertEqual(0);
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.registerProbe();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('交接', 'handoff', 0, 2)), 10);
        expect(fixture.native.onCallbacks.length).assertEqual(1);
        expect(fixture.native.offCallbacks.length).assertEqual(1);
        fixture.native.deliverOn(0);
        expect(fixture.controller.snapshot().committed).assertFalse();
        fixture.native.deliverOff(0);
        expect(fixture.native.onCallbacks.length).assertEqual(2);
        fixture.controller.markWindowReady();
        fixture.native.deliverOn(1);
        expect(fixture.controller.snapshot().committed).assertTrue();
        expect(fixture.controller.snapshot().text).assertEqual('交接');
      });
      ['sync', 'async', 'unknown', 'timeout'].forEach((failure: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          fixture.controller.registerProbe();
          if (failure === 'sync') {
            fixture.native.offFailure = platformError();
          }
          receiveChoosingIncoming(fixture, inboundWant(rawPayload('交接重试🌱', `retry-${failure}`, 0, 2)), 10);
          expect(fixture.native.offCallbacks.length).assertEqual(1);
          expect(fixture.controller.snapshot().sessionActive).assertTrue();
          expect(fixture.controller.snapshot().canRegister).assertFalse();
          expect(fixture.controller.snapshot().canUnregister).assertFalse();
          fixture.controller.registerProbe();
          fixture.controller.unregisterProbe();
          expect(fixture.native.offCallbacks.length).assertEqual(1);
          fixture.controller.markWindowReady();
          fixture.native.deliverOn(0, undefined, resultInfo(1));
          assertOriginal(fixture);
          if (failure === 'async') {
            expect(fixture.native.onCallbacks.length).assertEqual(1);
            fixture.native.deliverOff(0, platformError(201, 'handoff off failure'));
            expect(latest(fixture, 'OFF').errorCode).assertEqual('201');
          } else if (failure === 'unknown') {
            expect(fixture.native.onCallbacks.length).assertEqual(1);
            fixture.native.deliverOff(0, undefined, resultInfo(29360148));
            expect(latest(fixture, 'OFF').rawResultState).assertEqual('29360148');
          } else if (failure === 'timeout') {
            fixture.clock.advance(7999);
            expect(fixture.native.onCallbacks.length).assertEqual(1);
            expect(fixture.controller.snapshot().sessionActive).assertTrue();
            fixture.clock.advance(1);
            expect(latest(fixture, 'OFF').level).assertEqual('WARN');
          } else {
            expect(latest(fixture, 'OFF').errorCode).assertEqual('16300501');
            fixture.native.offFailure = undefined;
          }
          expect(fixture.native.onCallbacks.length).assertEqual(2);
          expect(fixture.controller.snapshot().sessionActive).assertTrue();
          expect(fixture.controller.snapshot().quickResult).assertEqual('等待真实系统快速结果');
          const restoreId = fixture.controller.snapshot().sessionRecordId;
          const before = JSON.stringify(fixture.controller.record(restoreId));
          fixture.native.deliverOn(0);
          fixture.native.deliverOff(0);
          expect(JSON.stringify(fixture.controller.record(restoreId))).assertEqual(before);
          assertOriginal(fixture);
          fixture.native.deliverOn(1);
          expect(fixture.controller.snapshot().committed).assertTrue();
          expect(fixture.controller.snapshot().text).assertEqual('交接重试🌱');
          expect(fixture.store.flushCalls).assertEqual(1);
          expect(fixture.native.offCallbacks.length).assertEqual(2);
          expect(fixture.controller.snapshot().canRegister).assertFalse();
          fixture.native.deliverOff(0);
          expect(fixture.controller.snapshot().canRegister).assertFalse();
          fixture.native.deliverOff(1);
          expect(fixture.controller.snapshot().canRegister).assertTrue();
          expect(fixture.controller.snapshot().canUnregister).assertFalse();
          expect(fixture.clock.pendingCount()).assertEqual(0);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0700
     * @tc.name      testContinuationScenarios0007
     * @tc.desc      Verify 虚拟期限、按钮重试、停止与迟到数据栅栏
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0007', (): void => {
      const missing: string[] = ['快速结果', '业务数据', '页面窗口'];
      missing.forEach((phase: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          receiveChoosingIncoming(fixture, inboundWant(), 10);
          if (phase !== '快速结果') {
            fixture.native.deliverOn(0);
          }
          if (phase === '页面窗口') {
            receiveChoosingIncoming(fixture, inboundWant(rawPayload()), 3);
          }
          fixture.clock.advance(14999);
          expect(fixture.controller.snapshot().sessionActive).assertTrue();
          fixture.clock.advance(1);
          expect(fixture.controller.snapshot().sessionActive).assertFalse();
          expect(latest(fixture, 'RESTORE').stage).assertEqual(`${phase}超时`);
          assertOriginal(fixture);
          expect(fixture.native.offCallbacks.length).assertEqual(1);
          fixture.native.deliverOn(0);
          fixture.native.deliverOff(0);
          receiveChoosingIncoming(fixture, inboundWant(rawPayload()), 3);
          fixture.controller.markWindowReady();
          assertOriginal(fixture);
        });
      });
      withLearning((fixture: LearningFixture): void => {
        receiveChoosingIncoming(fixture, inboundWant(), 10);
        fixture.clock.advance(14999);
        fixture.native.deliverOn(0);
        fixture.clock.advance(14999);
        expect(fixture.controller.snapshot().sessionActive).assertTrue();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), 3);
        fixture.clock.advance(14999);
        expect(fixture.controller.snapshot().sessionActive).assertTrue();
        fixture.controller.markWindowReady();
        expect(fixture.controller.snapshot().committed).assertTrue();
        fixture.native.deliverOff(0);
        fixture.clock.advance(60000);
        expect(fixture.controller.snapshot().committed).assertTrue();
        expect(fixture.clock.pendingCount()).assertEqual(0);
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        receiveChoosingIncoming(fixture, inboundWant(), 10);
        fixture.controller.stopLocalWait();
        fixture.native.deliverOn(0);
        fixture.native.deliverOff(0);
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('迟到文本', 'late', 0, 2)), 3);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('新轮文本', 'fresh', 0, 2)), 10);
        fixture.native.deliverOn(1);
        expect(fixture.controller.snapshot().committed).assertTrue();
        expect(fixture.controller.snapshot().text).assertEqual('新轮文本');
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.registerProbe();
        fixture.clock.advance(14999);
        expect(latest(fixture, 'ON').endedAt).assertEqual('');
        fixture.clock.advance(1);
        expect(latest(fixture, 'ON').level).assertEqual('WARN');
        expect(fixture.controller.snapshot().canRegister).assertFalse();
        expect(fixture.native.offCallbacks.length).assertEqual(1);
        fixture.native.deliverOff(0);
        expect(fixture.controller.snapshot().canRegister).assertTrue();
        fixture.controller.registerProbe();
        fixture.controller.stopLocalWait();
        expect(fixture.native.offCallbacks.length).assertEqual(2);
        fixture.controller.dispose();
        expect(fixture.clock.pendingCount()).assertEqual(0);
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.native.onFailure = platformError();
        fixture.controller.registerProbe();
        expect(latest(fixture, 'ON').level).assertEqual('ERROR');
        expect(fixture.controller.snapshot().canRegister).assertTrue();
        expect(fixture.controller.snapshot().canUnregister).assertTrue();
        expect(fixture.controller.snapshot().canStop).assertFalse();
        expect(fixture.clock.pendingCount()).assertEqual(0);
        fixture.native.onFailure = undefined;
        fixture.controller.registerProbe();
        expect(fixture.native.onCallbacks.length).assertEqual(2);
        expect(fixture.native.offCallbacks.length).assertEqual(0);
        expect(fixture.controller.snapshot().canRegister).assertFalse();
        expect(fixture.controller.snapshot().canUnregister).assertTrue();
        const before = JSON.stringify(latest(fixture, 'ON'));
        fixture.native.deliverOn(0);
        expect(JSON.stringify(latest(fixture, 'ON'))).assertEqual(before);
        expect(fixture.controller.snapshot().canStop).assertTrue();
        fixture.controller.stopLocalWait();
        expect(fixture.controller.snapshot().canRegister).assertFalse();
        expect(fixture.controller.snapshot().canUnregister).assertFalse();
        fixture.native.deliverOff(0);
        expect(fixture.controller.snapshot().canRegister).assertTrue();
        expect(fixture.controller.snapshot().canUnregister).assertFalse();
      });
      ['sync', 'async', 'unknown', 'timeout'].forEach((failure: string): void => {
        [true, false].forEach((retryRegister: boolean): void => {
          withLearning((fixture: LearningFixture): void => {
            seedOriginal(fixture);
            fixture.controller.registerProbe();
            if (failure === 'sync') {
              fixture.native.offFailure = platformError();
            }
            fixture.controller.unregisterProbe();
            const offId = latest(fixture, 'OFF').id;
            if (failure !== 'sync') {
              expect(fixture.controller.snapshot().canRegister).assertFalse();
              expect(fixture.controller.snapshot().canUnregister).assertFalse();
              fixture.controller.registerProbe();
              fixture.controller.unregisterProbe();
              expect(fixture.native.onCallbacks.length).assertEqual(1);
              expect(fixture.native.offCallbacks.length).assertEqual(1);
            }
            if (failure === 'async') {
              fixture.native.deliverOff(0, platformError(201, 'controller off failure'));
              expect(latest(fixture, 'OFF').errorCode).assertEqual('201');
            } else if (failure === 'unknown') {
              fixture.native.deliverOff(0, undefined, resultInfo(29360148));
              expect(latest(fixture, 'OFF').rawResultState).assertEqual('29360148');
              expect(latest(fixture, 'OFF').level).assertEqual('WARN');
            } else if (failure === 'timeout') {
              fixture.clock.advance(7999);
              expect(fixture.controller.snapshot().canRegister).assertFalse();
              expect(fixture.controller.snapshot().canUnregister).assertFalse();
              fixture.clock.advance(1);
              expect(latest(fixture, 'OFF').result).assertEqual('注销等待超时（8 秒）');
              expect(latest(fixture, 'OFF').stage).assertEqual('OFF 未确认');
            } else {
              expect(latest(fixture, 'OFF').errorCode).assertEqual('16300501');
              fixture.native.offFailure = undefined;
            }
            expect(fixture.controller.snapshot().canRegister).assertTrue();
            expect(fixture.controller.snapshot().canUnregister).assertTrue();
            expect(fixture.controller.snapshot().canEdit).assertTrue();
            expect(fixture.controller.snapshot().canStop).assertFalse();
            expect(fixture.clock.pendingCount()).assertEqual(0);
            const oldOff = JSON.stringify(fixture.controller.record(offId));
            if (retryRegister) {
              fixture.controller.registerProbe();
              expect(fixture.native.onCallbacks.length).assertEqual(2);
              expect(fixture.controller.snapshot().canRegister).assertFalse();
              expect(fixture.controller.snapshot().canUnregister).assertTrue();
              const before = JSON.stringify(latest(fixture, 'ON'));
              fixture.native.deliverOn(0, undefined, resultInfo(1));
              fixture.native.deliverOff(0);
              expect(JSON.stringify(latest(fixture, 'ON'))).assertEqual(before);
              expect(JSON.stringify(fixture.controller.record(offId))).assertEqual(oldOff);
              expect(fixture.controller.snapshot().canStop).assertTrue();
              expect(fixture.controller.snapshot().canUnregister).assertTrue();
            }
            fixture.controller.unregisterProbe();
            expect(fixture.native.offCallbacks.length).assertEqual(2);
            expect(fixture.controller.snapshot().canRegister).assertFalse();
            expect(fixture.controller.snapshot().canUnregister).assertFalse();
            fixture.native.deliverOff(0);
            expect(JSON.stringify(fixture.controller.record(offId))).assertEqual(oldOff);
            expect(fixture.controller.snapshot().canRegister).assertFalse();
            expect(fixture.controller.snapshot().canUnregister).assertFalse();
            fixture.native.deliverOff(1);
            expect(fixture.controller.snapshot().canRegister).assertTrue();
            expect(fixture.controller.snapshot().canUnregister).assertFalse();
            expect(fixture.clock.pendingCount()).assertEqual(0);
            assertOriginal(fixture);
          });
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0800
     * @tc.name      testContinuationScenarios0008
     * @tc.desc      Verify 内存存储：读取、保存、清空、写入回滚与不确定冻结
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0008', (): void => {
      withLearning((fixture: LearningFixture): void => {
        expect(fixture.controller.snapshot().text).assertEqual('持久文本🌱');
        expect(fixture.controller.snapshot().selectionEnd).assertEqual(2);
        fixture.controller.clearText();
        expect(fixture.controller.snapshot().text).assertEqual('');
        expect(fixture.store.flushCalls).assertEqual(1);
        withLearning((reopened: LearningFixture): void => {
          expect(reopened.controller.snapshot().text).assertEqual('');
          expect(reopened.controller.snapshot().selectionStart).assertEqual(0);
        }, fixture.store.stored());
      }, rawPayload('持久文本🌱', 'local', 0, 2));
      [37, '{bad', JSON.stringify(payloadBag('\uD800', 'bad', 0, 0))].forEach((seed: Object): void => {
        withLearning((fixture: LearningFixture): void => {
          expect(fixture.controller.snapshot().text).assertEqual('');
          expect(fixture.controller.snapshot().savedTextStatus.indexOf('无效') >= 0).assertTrue();
        }, seed);
      });
      [true, false].forEach((openFailure: boolean): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          fixture.controller.saveText();
          assertOriginal(fixture);
          expect(latest(fixture, 'SAVE').level).assertEqual('ERROR');
          expect(fixture.store.putCalls).assertEqual(0);
        }, undefined, openFailure, !openFailure);
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.controller.saveText();
        const durable = fixture.store.stored();
        fixture.controller.updateText('待保存修改');
        fixture.store.failFlushCalls = [2];
        fixture.controller.saveText();
        expect(fixture.controller.snapshot().text).assertEqual('待保存修改');
        expect(fixture.store.stored()).assertEqual(durable);
        expect(latest(fixture, 'SAVE').level).assertEqual('ERROR');
        fixture.store.failFlushCalls = [4];
        fixture.controller.clearText();
        expect(fixture.controller.snapshot().text).assertEqual('待保存修改');
        expect(fixture.store.stored()).assertEqual(durable);
        fixture.store.failFlushCalls = [];
        fixture.controller.saveText();
        expect(latest(fixture, 'SAVE').level).assertEqual('INFO');
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.store.failPutCalls = [1];
        fixture.controller.saveText();
        expect(fixture.store.deleteCalls).assertEqual(1);
        expect(fixture.store.stored()).assertUndefined();
        assertOriginal(fixture);
        fixture.controller.saveText();
        expect(latest(fixture, 'SAVE').level).assertEqual('INFO');
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.store.failFlushCalls = [1, 2];
        fixture.controller.saveText();
        const puts = fixture.store.putCalls;
        fixture.store.failFlushCalls = [];
        fixture.controller.saveText();
        fixture.controller.clearText();
        expect(fixture.store.putCalls).assertEqual(puts);
        assertOriginal(fixture);
        expect(latest(fixture, 'SAVE').level).assertEqual('ERROR');
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.store.failFlushCalls = [1];
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), 3);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
        expect(latest(fixture, 'RESTORE').stage).assertEqual('持久化失败');
        expect(fixture.store.stored()).assertUndefined();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0900
     * @tc.name      testContinuationScenarios0009
     * @tc.desc      Verify 诊断：快照隔离、订阅、记录限额、在途清理与摘要脱敏
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0009', (): void => {
      const invalidErrors: (Object | undefined | null)[] = [undefined, null, 7, 'fixture primitive'];
      invalidErrors.forEach((value: Object | undefined | null): void => {
        expect(safeErrorCode(value)).assertEqual('未知');
        expect(safeErrorMessage(value).indexOf('可读错误消息') >= 0).assertTrue();
      });
      const missingCode: Record<string, Object> = {};
      const stringCode: Record<string, Object> = {};
      stringCode['code'] = '16300501';
      const nanCode: Record<string, Object> = {};
      nanCode['code'] = Number.NaN;
      const infiniteCode: Record<string, Object> = {};
      infiniteCode['code'] = Number.POSITIVE_INFINITY;
      [missingCode, stringCode, nanCode, infiniteCode].forEach((value: Record<string, Object>): void => {
        expect(safeErrorCode(value)).assertEqual('未知');
      });
      const numericMessage: Record<string, Object> = {};
      numericMessage['message'] = 123;
      const emptyMessage: Record<string, Object> = {};
      emptyMessage['message'] = '';
      [missingCode, numericMessage, emptyMessage].forEach((value: Record<string, Object>): void => {
        expect(safeErrorMessage(value).indexOf('可读错误消息') >= 0).assertTrue();
      });
      const coded = platformError(16300501, 'readable fixture failure');
      expect(safeErrorCode(coded)).assertEqual('16300501');
      expect(safeErrorMessage(coded).indexOf('readable fixture failure') >= 0).assertTrue();
      const sensitive: string[] = [
        'https://example.test/private?token=abc', 'file:///private/part', 'C:\\private\\doc.txt',
        '/private/data/file.txt', 'aa:bb:cc:dd:ee:ff', '123e4567-e89b-12d3-a456-426614174000',
        'abcdef0123456789abcdef0123456789', '123456789012345', '192.168.1.2', '2001:db8::1',
        'body=private-payload', '\"quoted secret\"'
      ];
      sensitive.forEach((fragment: string): void => {
        const redacted = redactPlatformText(`before ${fragment} after`);
        expect(redacted.indexOf(fragment)).assertEqual(-1);
        expect(redacted.indexOf('before') >= 0).assertTrue();
      });
      expect(redactPlatformText('line1\nline2\tline3').indexOf('\n')).assertEqual(-1);
      expect(redactPlatformText('line1\nline2\tline3').indexOf('\t')).assertEqual(-1);
      const truncated = redactPlatformText(`${'q'.repeat(512)}TRUNCATED_MARK`);
      expect(truncated.length).assertEqual(512);
      expect(truncated.indexOf('TRUNCATED_MARK')).assertEqual(-1);
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.registerProbe();
        fixture.clock.advance(1234);
        fixture.native.deliverOn(0);
        expect(latest(fixture, 'ON').durationMillis).assertEqual(1234);
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.controller.checkEnvironment();
        const snapshot = fixture.controller.snapshot();
        snapshot.text = 'external mutation';
        snapshot.environment[0].value = 'external environment';
        snapshot.records[0].facts.push('external fact');
        snapshot.events[0].message = 'external event';
        const record = fixture.controller.record(snapshot.records[0].id);
        if (record === undefined) { throw new Error('Missing copied record.'); }
        record.result = 'external result';
        expect(fixture.controller.snapshot().text).assertEqual('原文🌱');
        expect(fixture.controller.snapshot().environment[0].value).assertEqual('26');
        expect(fixture.controller.snapshot().records[0].facts.indexOf('external fact')).assertEqual(-1);
        expect(fixture.controller.record(record.id)?.result === 'external result').assertFalse();
        let notices: number = 0;
        const unsubscribe = fixture.controller.subscribe((value: LearningSnapshot): void => {
          notices++;
          value.text = 'subscriber mutation';
        });
        expect(notices).assertEqual(1);
        fixture.controller.updateSelection(0, 1);
        expect(notices).assertEqual(2);
        expect(fixture.controller.snapshot().text).assertEqual('原文🌱');
        unsubscribe();
        fixture.controller.updateSelection(0, 2);
        expect(notices).assertEqual(2);
        let throws: number = 0;
        fixture.controller.subscribe((_value: LearningSnapshot): void => {
          if (++throws > 1) { throw new Error('fixture subscriber failure'); }
        });
        fixture.controller.saveText();
        expect(latest(fixture, 'SAVE').level).assertEqual('INFO');
        for (let i: number = 0; i < 70; i++) { fixture.controller.checkEnvironment(); }
        const capped = fixture.controller.snapshot();
        expect(capped.records.length).assertEqual(40);
        expect(capped.events.length <= 120).assertTrue();
        expect(capped.records.every((item: OperationRecord) => item.events.length <= 24)).assertTrue();
        fixture.controller.clearRecords();
        expect(fixture.controller.snapshot().records.length).assertEqual(0);
        expect(fixture.controller.snapshot().events.length).assertEqual(0);
        expect(fixture.controller.snapshot().text).assertEqual('原文🌱');
        expect(fixture.controller.record('missing')).assertUndefined();
      });
      withLearning((fixture: LearningFixture): void => {
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), 10);
        for (let i: number = 0; i < 30; i++) {
          receiveChoosingIncoming(fixture, inboundWant(rawPayload()), 3);
        }
        const id = fixture.controller.snapshot().sessionRecordId;
        expect(latest(fixture, 'RESTORE').events.length <= 24).assertTrue();
        fixture.controller.clearRecords();
        expect(fixture.controller.record(id)?.endedAt).assertEqual('');
        fixture.controller.markWindowReady();
        fixture.native.deliverOn(0);
        expect(fixture.controller.snapshot().committed).assertTrue();
        const offId = latest(fixture, 'OFF').id;
        fixture.clock.advance(8000);
        expect(fixture.controller.record(offId)?.result).assertEqual('注销等待超时（8 秒）');
        expect(fixture.controller.record(offId)?.level).assertEqual('WARN');
        expect(fixture.controller.snapshot().canRegister).assertTrue();
        expect(fixture.controller.snapshot().canUnregister).assertTrue();
        fixture.controller.clearRecords();
        expect(fixture.controller.record(offId)).assertUndefined();
        fixture.native.deliverOff(0);
        expect(fixture.controller.record(offId)).assertUndefined();
        expect(fixture.controller.snapshot().canRegister).assertTrue();
        expect(fixture.controller.snapshot().canUnregister).assertTrue();
      });
      withLearning((fixture: LearningFixture): void => {
        const secret = 'SENSITIVE_BODY_123';
        fixture.controller.updateText(secret);
        fixture.native.onFailure = platformError(16300501,
          `${secret}; deviceId=abcdef1234567890; file:///private/secret; 192.168.1.2`);
        fixture.controller.registerProbe();
        const record = latest(fixture, 'ON');
        expect(record.errorCode).assertEqual('16300501');
        expect(record.rawMessage.indexOf(secret)).assertEqual(-1);
        expect(record.rawMessage.indexOf('abcdef1234567890')).assertEqual(-1);
        expect(record.rawMessage.indexOf('192.168.1.2')).assertEqual(-1);
        const summary = fixture.controller.diagnosticSummary(record.id);
        expect(summary.indexOf('16300501') >= 0).assertTrue();
        expect(summary.indexOf(secret)).assertEqual(-1);
        expect(summary.indexOf('private/secret')).assertEqual(-1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_1000
     * @tc.name      testContinuationScenarios0010
     * @tc.desc      Verify 环境权限：默认状态、查询异常、异步授权及上下文发布
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testContinuationScenarios0010', async (): Promise<void> => {
      const empty = emptyLearningSnapshot();
      expect(empty.canRegister).assertFalse();
      expect(empty.canEdit).assertFalse();
      expect(empty.records.length).assertEqual(0);
      expect(empty.sessionRecordId).assertEqual('');
      let contextRequired: boolean = false;
      try { platformLearningDependencies(undefined); } catch (error) { contextRequired = true; }
      expect(contextRequired).assertTrue();
      withLearning((fixture: LearningFixture): void => {
        expect(fixture.native.onCallbacks.length).assertEqual(0);
        expect(fixture.environment.requestCalls).assertEqual(0);
        receiveChoosingIncoming(fixture, inboundWant(), 0);
        expect(fixture.controller.snapshot().sessionActive).assertFalse();
        fixture.environment.mission = false;
        fixture.environment.permission = -1;
        fixture.controller.checkEnvironment();
        const value = fixture.controller.snapshot();
        expect(environmentValue(value, 'api').value).assertEqual('26');
        expect(environmentValue(value, 'type').value).assertEqual('fixture-board');
        expect(environmentValue(value, 'syscap').value).assertEqual('未声明支持');
        expect(environmentValue(value, 'permission').value).assertEqual('未授权');
        expect(environmentValue(value, 'peer').value).assertEqual('未知');
        expect(fixture.native.onCallbacks.length).assertEqual(0);
        const previous = getLearningController();
        try {
          clearLearningController();
          expect(getLearningController()).assertUndefined();
          publishLearningController(fixture.controller);
          expect(getLearningController() === fixture.controller).assertTrue();
          clearLearningController();
          expect(getLearningController()).assertUndefined();
        } finally {
          if (previous !== undefined) { publishLearningController(previous); } else { clearLearningController(); }
        }
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.environment.readFailure = true;
        fixture.environment.missionFailure = true;
        fixture.environment.permissionFailure = true;
        fixture.controller.checkEnvironment();
        const value = fixture.controller.snapshot();
        expect(environmentValue(value, 'public').status).assertEqual('读取失败');
        expect(environmentValue(value, 'syscap').value).assertEqual('未知');
        expect(environmentValue(value, 'permission').value).assertEqual('未知');
      });
      const replies: number[][] = [[0], [-1], []];
      for (let i: number = 0; i < replies.length; i++) {
        const fixture = new LearningFixture();
        try {
          fixture.controller.requestPermission();
          fixture.controller.requestPermission();
          expect(fixture.environment.requestCalls).assertEqual(1);
          expect(latest(fixture, 'PERMISSION').endedAt).assertEqual('');
          fixture.controller.clearRecords();
          expect(fixture.controller.snapshot().records.length).assertEqual(1);
          fixture.environment.reply.resolve(replies[i]);
          await flushPermissionMicrotasks();
          const record = latest(fixture, 'PERMISSION');
          expect(record.endedAt.length > 0).assertTrue();
          expect(record.level).assertEqual(i === 0 ? 'INFO' : 'WARN');
        } finally { fixture.release(); }
      }
      const rejected = new LearningFixture();
      try {
        rejected.controller.requestPermission();
        rejected.environment.reply.reject(platformError(201, 'permission denied'));
        await flushPermissionMicrotasks();
        expect(latest(rejected, 'PERMISSION').level).assertEqual('ERROR');
        expect(latest(rejected, 'PERMISSION').errorCode).assertEqual('201');
      } finally { rejected.release(); }
      withLearning((fixture: LearningFixture): void => {
        fixture.environment.requestFailure = true;
        fixture.controller.requestPermission();
        expect(latest(fixture, 'PERMISSION').level).assertEqual('ERROR');
      });
      const disposed = new LearningFixture();
      try {
        disposed.controller.requestPermission();
        const before = JSON.stringify(disposed.controller.snapshot().records);
        disposed.controller.dispose();
        disposed.environment.reply.resolve([0]);
        await flushPermissionMicrotasks();
        expect(JSON.stringify(disposed.controller.snapshot().records)).assertEqual(before);
        expect(disposed.clock.pendingCount()).assertEqual(0);
      } finally { disposed.release(); }
    });
  });
}
