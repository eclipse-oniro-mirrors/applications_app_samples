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

/** Ten bounded scenarios exercising the production controller/client through injected ports. */
import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
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
import { BUNDLE, scenario } from '../support/BoundedCase';
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
  loggedExpect(value.text, 'ContinuationScenarios.test.ets:A0001').assertEqual('原文🌱');
  loggedExpect(value.selectionStart, 'ContinuationScenarios.test.ets:A0002').assertEqual(0);
  loggedExpect(value.selectionEnd, 'ContinuationScenarios.test.ets:A0003').assertEqual(2);
  loggedExpect(value.committed, 'ContinuationScenarios.test.ets:A0004').assertFalse();
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
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0001
     * @tc.desc      Verify 文本与选区：空值、长度、unicode、整数边界及编辑锁
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0001', (): void => {
      const accepted: string[] = ['', '中文', 'A🌱B', 'a'.repeat(4096), '🌱'.repeat(2048)];
      accepted.forEach((text: string): void => {
        withLearning((fixture: LearningFixture): void => {
          fixture.controller.updateText(text);
          loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0005', BUNDLE + '_ContinuationScenarios_0001').assertEqual(text);
          fixture.controller.updateSelection(0, text.length);
          loggedExpect(fixture.controller.snapshot().selectionEnd, 'ContinuationScenarios.test.ets:A0006', BUNDLE + '_ContinuationScenarios_0001').assertEqual(text.length);
          fixture.controller.updateSelection(text.length, text.length);
          loggedExpect(fixture.controller.snapshot().selectionStart, 'ContinuationScenarios.test.ets:A0007', BUNDLE + '_ContinuationScenarios_0001').assertEqual(text.length);
        });
      });
      const rejected: string[] = ['a'.repeat(4097), '\uD800', '\uDC00', '\uD800x', 'x\uDC00', '\uD800\uD800'];
      rejected.forEach((text: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          fixture.controller.updateText(text);
          assertOriginal(fixture);
          loggedExpect(fixture.controller.snapshot().notice.indexOf('校验失败') >= 0, 'ContinuationScenarios.test.ets:A0008', BUNDLE + '_ContinuationScenarios_0001').assertTrue();
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
          loggedExpect(fixture.controller.snapshot().selectionStart, 'ContinuationScenarios.test.ets:A0009', BUNDLE + '_ContinuationScenarios_0001').assertEqual(1);
          loggedExpect(fixture.controller.snapshot().selectionEnd, 'ContinuationScenarios.test.ets:A0010', BUNDLE + '_ContinuationScenarios_0001').assertEqual(3);
        });
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.fillExample();
        loggedExpect(fixture.controller.snapshot().text.length > 0, 'ContinuationScenarios.test.ets:A0011', BUNDLE + '_ContinuationScenarios_0001').assertTrue();
        seedOriginal(fixture);
        receiveChoosingIncoming(fixture, inboundWant(), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        fixture.controller.updateText('被锁定的编辑');
        fixture.controller.updateSelection(1, 1);
        fixture.controller.fillExample();
        assertOriginal(fixture);
        loggedExpect(fixture.controller.snapshot().canEdit, 'ContinuationScenarios.test.ets:A0012', BUNDLE + '_ContinuationScenarios_0001').assertFalse();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0200
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0002
     * @tc.desc      Verify 载荷与源参数：格式、字段、版本、unicode及完整往返
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0002', (): void => {
      const invalidRaw: Object[] = [7, '', '{', 'null', '[]', '5', '{}', 'x'.repeat(26001)];
      invalidRaw.forEach((raw: Object): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          fixture.controller.markWindowReady();
          receiveChoosingIncoming(fixture, inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
          assertOriginal(fixture);
          loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0013', BUNDLE + '_ContinuationScenarios_0002').assertFalse();
          loggedExpect(latest(fixture, 'RESTORE').level, 'ContinuationScenarios.test.ets:A0014', BUNDLE + '_ContinuationScenarios_0002').assertEqual('ERROR');
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
          receiveChoosingIncoming(fixture, inboundWant(JSON.stringify(bag)), AbilityConstant.LaunchReason.CONTINUATION);
          fixture.controller.markWindowReady();
          assertOriginal(fixture);
          loggedExpect(fixture.store.putCalls, 'ContinuationScenarios.test.ets:A0015', BUNDLE + '_ContinuationScenarios_0002').assertEqual(0);
        });
      });
      const required: string[] = ['version', 'page', 'transferId', 'text', 'selectionStart', 'selectionEnd'];
      required.forEach((omitted: string): void => {
        withLearning((fixture: LearningFixture): void => {
          const full = payloadBag();
          const missing: Record<string, Object> = {};
          Object.keys(full).forEach((key: string): void => { if (key !== omitted) { missing[key] = full[key]; } });
          receiveChoosingIncoming(fixture, inboundWant(JSON.stringify(missing)), AbilityConstant.LaunchReason.CONTINUATION);
          loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0016', BUNDLE + '_ContinuationScenarios_0002').assertFalse();
          loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0017', BUNDLE + '_ContinuationScenarios_0002').assertFalse();
        });
      });
      withLearning((source: LearningFixture): void => {
        source.controller.updateText('A🌱B');
        source.controller.updateSelection(1, 3);
        const parameters: Record<string, Object> = {};
        loggedExpect(source.controller.buildContinuation(parameters), 'ContinuationScenarios.test.ets:A0018', BUNDLE + '_ContinuationScenarios_0002').assertEqual(AbilityConstant.OnContinueResult.AGREE);
        loggedExpect(parameters[wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY], 'ContinuationScenarios.test.ets:A0019', BUNDLE + '_ContinuationScenarios_0002').assertFalse();
        const raw = parameters[TEXT_PAYLOAD_KEY] as string;
        const decoded = JSON.parse(raw) as Record<string, Object>;
        loggedExpect(decoded['version'], 'ContinuationScenarios.test.ets:A0020', BUNDLE + '_ContinuationScenarios_0002').assertEqual(1);
        loggedExpect(decoded['page'], 'ContinuationScenarios.test.ets:A0021', BUNDLE + '_ContinuationScenarios_0002').assertEqual('text');
        loggedExpect((decoded['transferId'] as string).length > 0, 'ContinuationScenarios.test.ets:A0022', BUNDLE + '_ContinuationScenarios_0002').assertTrue();
        withLearning((target: LearningFixture): void => {
          target.controller.markWindowReady();
          target.controller.handleLaunch(inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
          loggedExpect(target.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0023', BUNDLE + '_ContinuationScenarios_0002').assertEqual('A🌱B');
          loggedExpect(target.controller.snapshot().selectionStart, 'ContinuationScenarios.test.ets:A0024', BUNDLE + '_ContinuationScenarios_0002').assertEqual(1);
          loggedExpect(target.controller.snapshot().selectionEnd, 'ContinuationScenarios.test.ets:A0025', BUNDLE + '_ContinuationScenarios_0002').assertEqual(3);
          loggedExpect(target.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0026', BUNDLE + '_ContinuationScenarios_0002').assertTrue();
        });
        source.controller.handleLaunch(inboundWant(), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        const blocked: Record<string, Object> = {};
        loggedExpect(source.controller.buildContinuation(blocked), 'ContinuationScenarios.test.ets:A0027', BUNDLE + '_ContinuationScenarios_0002').assertEqual(AbilityConstant.OnContinueResult.REJECT);
        loggedExpect(Object.keys(blocked).length, 'ContinuationScenarios.test.ets:A0028', BUNDLE + '_ContinuationScenarios_0002').assertEqual(0);
        source.controller.dispose();
        loggedExpect(source.controller.buildContinuation({}), 'ContinuationScenarios.test.ets:A0029', BUNDLE + '_ContinuationScenarios_0002').assertEqual(AbilityConstant.OnContinueResult.REJECT);
      });
      withLearning((fixture: LearningFixture): void => {
        const raw = rawPayload('🌱'.repeat(2048), 't'.repeat(96), 0, 4096);
        fixture.controller.markWindowReady();
        receiveChoosingIncoming(fixture, inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0030', BUNDLE + '_ContinuationScenarios_0002').assertTrue();
        loggedExpect(fixture.controller.snapshot().text.length, 'ContinuationScenarios.test.ets:A0031', BUNDLE + '_ContinuationScenarios_0002').assertEqual(4096);
        loggedExpect(fixture.controller.snapshot().selectionEnd, 'ContinuationScenarios.test.ets:A0032', BUNDLE + '_ContinuationScenarios_0002').assertEqual(4096);
      });
      withLearning((fixture: LearningFixture): void => {
        const bag = payloadBag('', 'empty', 0, 0);
        bag['extension'] = 'optional fixture value';
        receiveChoosingIncoming(fixture, inboundWant(JSON.stringify(bag)), AbilityConstant.LaunchReason.CONTINUATION);
        fixture.controller.markWindowReady();
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0033', BUNDLE + '_ContinuationScenarios_0002').assertTrue();
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0034', BUNDLE + '_ContinuationScenarios_0002').assertEqual('');
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0300
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0003
     * @tc.desc      Verify 注册客户端：回调分类、同步异常重试及监听代次隔离
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0003', (): void => {
      const states: number[] = [0, 1, 99, Number.NaN];
      const kinds: string[] = ['SUCCESS', 'FAILURE', 'UNKNOWN', 'UNKNOWN'];
      states.forEach((state: number, index: number): void => {
        withClient((fixture: ClientFixture): void => {
          const seen: ContinueObservation[] = [];
          loggedExpect(fixture.client.register((event: ContinueObservation) => { seen.push(event); }).accepted, 'ContinuationScenarios.test.ets:A0035', BUNDLE + '_ContinuationScenarios_0003').assertTrue();
          loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0036', BUNDLE + '_ContinuationScenarios_0003').assertEqual(1);
          loggedExpect(fixture.client.register((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0037', BUNDLE + '_ContinuationScenarios_0003').assertFalse();
          const stateCopy = fixture.client.state();
          stateCopy.listening = false;
          loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0038', BUNDLE + '_ContinuationScenarios_0003').assertTrue();
          fixture.native.deliverOn(0, undefined, resultInfo(state));
          loggedExpect(seen.length, 'ContinuationScenarios.test.ets:A0039', BUNDLE + '_ContinuationScenarios_0003').assertEqual(1);
          loggedExpect(seen[0].kind, 'ContinuationScenarios.test.ets:A0040', BUNDLE + '_ContinuationScenarios_0003').assertEqual(kinds[index]);
          loggedExpect(seen[0].phase, 'ContinuationScenarios.test.ets:A0041', BUNDLE + '_ContinuationScenarios_0003').assertEqual('ON_ASYNC');
        });
      });
      withClient((fixture: ClientFixture): void => {
        const seen: ContinueObservation[] = [];
        fixture.client.register((event: ContinueObservation) => { seen.push(event); });
        fixture.native.onCallbacks[0](undefined, undefined);
        fixture.native.deliverOn(0, null, null);
        fixture.native.deliverOn(0, platformError(), resultInfo());
        loggedExpect(seen[0].kind, 'ContinuationScenarios.test.ets:A0042', BUNDLE + '_ContinuationScenarios_0003').assertEqual('UNKNOWN');
        loggedExpect(seen[1].kind, 'ContinuationScenarios.test.ets:A0043', BUNDLE + '_ContinuationScenarios_0003').assertEqual('UNKNOWN');
        loggedExpect(seen[2].kind, 'ContinuationScenarios.test.ets:A0044', BUNDLE + '_ContinuationScenarios_0003').assertEqual('ERROR');
        loggedExpect(seen[2].errorCode, 'ContinuationScenarios.test.ets:A0045', BUNDLE + '_ContinuationScenarios_0003').assertEqual('16300501');
      });
      withClient((fixture: ClientFixture): void => {
        const seen: ContinueObservation[] = [];
        fixture.native.onImmediate = true;
        loggedExpect(fixture.client.register((event: ContinueObservation) => { seen.push(event); }).accepted, 'ContinuationScenarios.test.ets:A0046', BUNDLE + '_ContinuationScenarios_0003').assertTrue();
        loggedExpect(seen.length, 'ContinuationScenarios.test.ets:A0047', BUNDLE + '_ContinuationScenarios_0003').assertEqual(1);
        fixture.native.offImmediate = true;
        fixture.client.unregister((_event: ContinueObservation) => {});
        fixture.native.onImmediate = false;
        fixture.client.register((event: ContinueObservation) => { seen.push(event); });
        fixture.native.deliverOn(0, undefined, resultInfo(1));
        loggedExpect(seen.length, 'ContinuationScenarios.test.ets:A0048', BUNDLE + '_ContinuationScenarios_0003').assertEqual(1);
        fixture.native.deliverOn(1);
        loggedExpect(seen.length, 'ContinuationScenarios.test.ets:A0049', BUNDLE + '_ContinuationScenarios_0003').assertEqual(2);
      });
      withClient((fixture: ClientFixture): void => {
        let calls: number = 0;
        fixture.native.onFailure = platformError();
        const call = fixture.client.register((_event: ContinueObservation) => { calls++; });
        loggedExpect(call.accepted, 'ContinuationScenarios.test.ets:A0050', BUNDLE + '_ContinuationScenarios_0003').assertFalse();
        loggedExpect(call.errorCode, 'ContinuationScenarios.test.ets:A0051', BUNDLE + '_ContinuationScenarios_0003').assertEqual('16300501');
        loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0052', BUNDLE + '_ContinuationScenarios_0003').assertFalse();
        loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0053', BUNDLE + '_ContinuationScenarios_0003').assertTrue();
        fixture.native.deliverOn(0);
        loggedExpect(calls, 'ContinuationScenarios.test.ets:A0054', BUNDLE + '_ContinuationScenarios_0003').assertEqual(0);
        fixture.native.onFailure = undefined;
        loggedExpect(fixture.client.register((_event: ContinueObservation) => { calls++; }).accepted, 'ContinuationScenarios.test.ets:A0055', BUNDLE + '_ContinuationScenarios_0003').assertTrue();
        loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0056', BUNDLE + '_ContinuationScenarios_0003').assertEqual(2);
        loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0057', BUNDLE + '_ContinuationScenarios_0003').assertEqual(0);
        loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0058', BUNDLE + '_ContinuationScenarios_0003').assertTrue();
        fixture.native.deliverOn(0, undefined, resultInfo(1));
        loggedExpect(calls, 'ContinuationScenarios.test.ets:A0059', BUNDLE + '_ContinuationScenarios_0003').assertEqual(0);
        loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0060', BUNDLE + '_ContinuationScenarios_0003').assertTrue();
        fixture.native.deliverOn(1);
        loggedExpect(calls, 'ContinuationScenarios.test.ets:A0061', BUNDLE + '_ContinuationScenarios_0003').assertEqual(1);
        loggedExpect(fixture.client.register((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0062', BUNDLE + '_ContinuationScenarios_0003').assertFalse();
        loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0063', BUNDLE + '_ContinuationScenarios_0003').assertEqual(2);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0400
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0004
     * @tc.desc      Verify 注销客户端：8秒到期重试、失败重试、完成代次隔离及释放
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0004', (): void => {
      [true, false].forEach((retryRegister: boolean): void => {
        withClient((fixture: ClientFixture): void => {
          let onEvents: number = 0;
          const offEvents: ContinueObservation[] = [];
          fixture.client.register((_event: ContinueObservation) => { onEvents++; });
          loggedExpect(fixture.client.unregister((event: ContinueObservation) => {
            offEvents.push(event);
          }).accepted, 'ContinuationScenarios.test.ets:A0064', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0065', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
          fixture.native.deliverOn(0);
          loggedExpect(onEvents, 'ContinuationScenarios.test.ets:A0066', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
          fixture.clock.advance(7999);
          loggedExpect(offEvents.length, 'ContinuationScenarios.test.ets:A0067', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
          loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0068', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          loggedExpect(fixture.client.register((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0069', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
          loggedExpect(fixture.client.unregister((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0070', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
          loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0071', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
          loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0072', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
          fixture.clock.advance(1);
          loggedExpect(offEvents.length, 'ContinuationScenarios.test.ets:A0073', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
          loggedExpect(offEvents[0].kind, 'ContinuationScenarios.test.ets:A0074', BUNDLE + '_ContinuationScenarios_0004').assertEqual('UNCONFIRMED');
          loggedExpect(offEvents[0].phase, 'ContinuationScenarios.test.ets:A0075', BUNDLE + '_ContinuationScenarios_0004').assertEqual('OFF_OBSERVATION');
          loggedExpect(fixture.client.state().offObservationExpired, 'ContinuationScenarios.test.ets:A0076', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0077', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
          loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0078', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0079', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
          fixture.native.deliverOff(0);
          loggedExpect(offEvents.length, 'ContinuationScenarios.test.ets:A0080', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
          loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0081', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          loggedExpect(fixture.client.state().offObservationExpired, 'ContinuationScenarios.test.ets:A0082', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          if (retryRegister) {
            loggedExpect(fixture.client.register((_event: ContinueObservation) => { onEvents++; }).accepted, 'ContinuationScenarios.test.ets:A0083', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
            loggedExpect(fixture.client.state().offObservationExpired, 'ContinuationScenarios.test.ets:A0084', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
            fixture.native.deliverOn(0);
            fixture.native.deliverOff(0, platformError());
            fixture.native.deliverOff(0);
            loggedExpect(onEvents, 'ContinuationScenarios.test.ets:A0085', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
            loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0086', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
            loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0087', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
            fixture.native.deliverOn(1);
            loggedExpect(onEvents, 'ContinuationScenarios.test.ets:A0088', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
          }
          loggedExpect(fixture.client.unregister((event: ContinueObservation) => {
            offEvents.push(event);
          }).accepted, 'ContinuationScenarios.test.ets:A0089', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0090', BUNDLE + '_ContinuationScenarios_0004').assertEqual(2);
          fixture.native.deliverOff(0);
          loggedExpect(offEvents.length, 'ContinuationScenarios.test.ets:A0091', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
          loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0092', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0093', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          fixture.native.deliverOff(1);
          loggedExpect(offEvents.length, 'ContinuationScenarios.test.ets:A0094', BUNDLE + '_ContinuationScenarios_0004').assertEqual(2);
          loggedExpect(offEvents[1].kind, 'ContinuationScenarios.test.ets:A0095', BUNDLE + '_ContinuationScenarios_0004').assertEqual('SUCCESS');
          loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0096', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
          loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0097', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
          loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0098', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
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
            loggedExpect(offEvents.length, 'ContinuationScenarios.test.ets:A0099', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
            loggedExpect(offEvents[0].kind, 'ContinuationScenarios.test.ets:A0100', BUNDLE + '_ContinuationScenarios_0004').assertEqual(state === 1 ? 'FAILURE' : 'UNKNOWN');
            loggedExpect(offEvents[0].rawState, 'ContinuationScenarios.test.ets:A0101', BUNDLE + '_ContinuationScenarios_0004').assertEqual(`${state}`);
            loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0102', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
            loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0103', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
            loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0104', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
            if (retryRegister) {
              loggedExpect(fixture.client.register((_event: ContinueObservation) => { onEvents++; }).accepted, 'ContinuationScenarios.test.ets:A0105', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
              fixture.native.deliverOn(0);
              fixture.native.deliverOff(0);
              loggedExpect(onEvents, 'ContinuationScenarios.test.ets:A0106', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
              loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0107', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
              loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0108', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
              fixture.native.deliverOn(1);
              loggedExpect(onEvents, 'ContinuationScenarios.test.ets:A0109', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
            }
            loggedExpect(fixture.client.unregister((event: ContinueObservation) => {
              offEvents.push(event);
            }).accepted, 'ContinuationScenarios.test.ets:A0110', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
            fixture.native.deliverOff(0);
            loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0111', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
            loggedExpect(offEvents.length, 'ContinuationScenarios.test.ets:A0112', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
            fixture.native.deliverOff(1);
            loggedExpect(offEvents.length, 'ContinuationScenarios.test.ets:A0113', BUNDLE + '_ContinuationScenarios_0004').assertEqual(2);
            loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0114', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
            loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0115', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
          });
        });
      });
      withClient((fixture: ClientFixture): void => {
        loggedExpect(fixture.client.unregister((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0116', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
        loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0117', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
        const seen: ContinueObservation[] = [];
        fixture.client.register((_event: ContinueObservation) => {});
        fixture.client.unregister((event: ContinueObservation) => { seen.push(event); });
        fixture.native.deliverOff(0, platformError(201, 'fixture asynchronous off error'), resultInfo());
        loggedExpect(seen[0].kind, 'ContinuationScenarios.test.ets:A0118', BUNDLE + '_ContinuationScenarios_0004').assertEqual('ERROR');
        loggedExpect(seen[0].errorCode, 'ContinuationScenarios.test.ets:A0119', BUNDLE + '_ContinuationScenarios_0004').assertEqual('201');
        loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0120', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
        loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0121', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
        loggedExpect(fixture.client.register((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0122', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
        fixture.native.deliverOff(0);
        loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0123', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
        loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0124', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
        fixture.client.unregister((event: ContinueObservation) => { seen.push(event); });
        fixture.native.offCallbacks[1](undefined, undefined);
        loggedExpect(seen[1].kind, 'ContinuationScenarios.test.ets:A0125', BUNDLE + '_ContinuationScenarios_0004').assertEqual('UNKNOWN');
        loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0126', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
        loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0127', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
        loggedExpect(fixture.client.register((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0128', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
        loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0129', BUNDLE + '_ContinuationScenarios_0004').assertEqual(3);
        fixture.native.deliverOff(1);
        loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0130', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
        loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0131', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
      });
      [true, false].forEach((retryRegister: boolean): void => {
        withClient((fixture: ClientFixture): void => {
          let offEvents: number = 0;
          fixture.client.register((_event: ContinueObservation) => {});
          fixture.native.offFailure = platformError();
          const failed = fixture.client.unregister((_event: ContinueObservation) => { offEvents++; });
          loggedExpect(failed.accepted, 'ContinuationScenarios.test.ets:A0132', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
          loggedExpect(failed.errorCode, 'ContinuationScenarios.test.ets:A0133', BUNDLE + '_ContinuationScenarios_0004').assertEqual('16300501');
          loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0134', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0135', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
          loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0136', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
          fixture.native.offFailure = undefined;
          if (retryRegister) {
            loggedExpect(fixture.client.register((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0137', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
            fixture.native.deliverOff(0);
            loggedExpect(fixture.client.state().listening, 'ContinuationScenarios.test.ets:A0138', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
            loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0139', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          }
          loggedExpect(fixture.client.unregister((_event: ContinueObservation) => { offEvents++; }).accepted, 'ContinuationScenarios.test.ets:A0140', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          fixture.native.deliverOff(0);
          loggedExpect(offEvents, 'ContinuationScenarios.test.ets:A0141', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
          loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0142', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0143', BUNDLE + '_ContinuationScenarios_0004').assertTrue();
          fixture.native.deliverOff(1);
          loggedExpect(offEvents, 'ContinuationScenarios.test.ets:A0144', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
          loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0145', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
          loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0146', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
        });
      });
      withClient((fixture: ClientFixture): void => {
        fixture.client.register((_event: ContinueObservation) => {});
        fixture.native.offImmediate = true;
        fixture.native.offFailure = platformError();
        loggedExpect(fixture.client.unregister((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0147', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
        loggedExpect(fixture.client.state().nativeDirty, 'ContinuationScenarios.test.ets:A0148', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
        loggedExpect(fixture.client.state().offPending, 'ContinuationScenarios.test.ets:A0149', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
      });
      withClient((fixture: ClientFixture): void => {
        let events: number = 0;
        fixture.client.register((_event: ContinueObservation) => { events++; });
        fixture.client.dispose();
        fixture.client.dispose();
        loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0150', BUNDLE + '_ContinuationScenarios_0004').assertEqual(1);
        loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0151', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
        fixture.native.deliverOn(0);
        fixture.native.deliverOff(0);
        fixture.clock.advance(30000);
        loggedExpect(events, 'ContinuationScenarios.test.ets:A0152', BUNDLE + '_ContinuationScenarios_0004').assertEqual(0);
        loggedExpect(fixture.client.register((_event: ContinueObservation) => {}).accepted, 'ContinuationScenarios.test.ets:A0153', BUNDLE + '_ContinuationScenarios_0004').assertFalse();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0500
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0005
     * @tc.desc      Verify 普通接续：数据窗口汇合、重复标签、候选冲突及页面失败
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0005', (): void => {
      ['DW', 'WD'].forEach((order: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          const raw = rawPayload('A🌱B', `ordinary-${order}`, 1, 3);
          for (let i: number = 0; i < order.length; i++) {
            if (order.charAt(i) === 'D') {
              receiveChoosingIncoming(fixture, inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
            } else {
              fixture.controller.markWindowReady();
            }
            loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0154', BUNDLE + '_ContinuationScenarios_0005').assertEqual(i === order.length - 1);
          }
          loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0155', BUNDLE + '_ContinuationScenarios_0005').assertEqual(0);
          loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0156', BUNDLE + '_ContinuationScenarios_0005').assertEqual('A🌱B');
          loggedExpect(fixture.controller.snapshot().selectionStart, 'ContinuationScenarios.test.ets:A0157', BUNDLE + '_ContinuationScenarios_0005').assertEqual(1);
          loggedExpect(fixture.controller.snapshot().selectionEnd, 'ContinuationScenarios.test.ets:A0158', BUNDLE + '_ContinuationScenarios_0005').assertEqual(3);
          loggedExpect(fixture.store.flushCalls, 'ContinuationScenarios.test.ets:A0159', BUNDLE + '_ContinuationScenarios_0005').assertEqual(1);
          receiveChoosingIncoming(fixture, inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
          fixture.controller.markWindowReady();
          loggedExpect(fixture.store.flushCalls, 'ContinuationScenarios.test.ets:A0160', BUNDLE + '_ContinuationScenarios_0005').assertEqual(1);
          receiveChoosingIncoming(fixture, inboundWant(rawPayload('下一轮', 'new-round', 0, 3)), AbilityConstant.LaunchReason.CONTINUATION);
          loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0161', BUNDLE + '_ContinuationScenarios_0005').assertEqual('下一轮');
          loggedExpect(fixture.store.flushCalls, 'ContinuationScenarios.test.ets:A0162', BUNDLE + '_ContinuationScenarios_0005').assertEqual(2);
        });
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        const raw = rawPayload();
        receiveChoosingIncoming(fixture, inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
        receiveChoosingIncoming(fixture, inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
        fixture.controller.updateText('在途编辑');
        assertOriginal(fixture);
        loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0163', BUNDLE + '_ContinuationScenarios_0005').assertTrue();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('冲突内容', 'conflict', 0, 2)), AbilityConstant.LaunchReason.CONTINUATION);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
        loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0164', BUNDLE + '_ContinuationScenarios_0005').assertFalse();
        loggedExpect(latest(fixture, 'RESTORE').stage, 'ContinuationScenarios.test.ets:A0165', BUNDLE + '_ContinuationScenarios_0005').assertEqual('候选冲突');
        loggedExpect(fixture.store.putCalls, 'ContinuationScenarios.test.ets:A0166', BUNDLE + '_ContinuationScenarios_0005').assertEqual(0);
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.controller.markWindowReady();
        fixture.controller.markWindowGone();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), AbilityConstant.LaunchReason.CONTINUATION);
        assertOriginal(fixture);
        fixture.controller.reportPageFailure('private page text');
        loggedExpect(latest(fixture, 'RESTORE').stage, 'ContinuationScenarios.test.ets:A0167', BUNDLE + '_ContinuationScenarios_0005').assertEqual('页面加载失败');
        loggedExpect(fixture.controller.diagnosticSummary().indexOf('private page text'), 'ContinuationScenarios.test.ets:A0168', BUNDLE + '_ContinuationScenarios_0005').assertEqual(-1);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0600
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0006
     * @tc.desc      Verify 快速接续：六种信号顺序、回调去重、失败及旧槽交接
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0006', (): void => {
      ['RDW', 'RWD', 'DRW', 'DWR', 'WRD', 'WDR'].forEach((order: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          receiveChoosingIncoming(fixture, inboundWant(), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
          receiveChoosingIncoming(fixture, inboundWant(), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
          loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0169', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
          const raw = rawPayload('快速文本🌱', `quick-${order}`, 0, 2);
          for (let i: number = 0; i < order.length; i++) {
            const signal = order.charAt(i);
            if (signal === 'R') {
              fixture.native.deliverOn(0);
              fixture.native.deliverOn(0, undefined, resultInfo(1));
            } else if (signal === 'D') {
              receiveChoosingIncoming(fixture, inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
              receiveChoosingIncoming(fixture, inboundWant(raw), AbilityConstant.LaunchReason.CONTINUATION);
            } else {
              fixture.controller.markWindowReady();
            }
            loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0170', BUNDLE + '_ContinuationScenarios_0006').assertEqual(i === 2);
          }
          loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0171', BUNDLE + '_ContinuationScenarios_0006').assertEqual('快速文本🌱');
          loggedExpect(fixture.store.flushCalls, 'ContinuationScenarios.test.ets:A0172', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
          loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0173', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
          fixture.native.deliverOff(0);
          loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0174', BUNDLE + '_ContinuationScenarios_0006').assertTrue();
        });
      });
      [1, 22].forEach((state: number): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          receiveChoosingIncoming(fixture, inboundWant(rawPayload()), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
          fixture.controller.markWindowReady();
          fixture.native.deliverOn(0, undefined, resultInfo(state));
          assertOriginal(fixture);
          loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0175', BUNDLE + '_ContinuationScenarios_0006').assertFalse();
          loggedExpect(fixture.store.flushCalls, 'ContinuationScenarios.test.ets:A0176', BUNDLE + '_ContinuationScenarios_0006').assertEqual(0);
        });
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        receiveChoosingIncoming(fixture, inboundWant(), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        fixture.native.deliverOn(0, platformError(), resultInfo());
        loggedExpect(latest(fixture, 'RESTORE').errorCode, 'ContinuationScenarios.test.ets:A0177', BUNDLE + '_ContinuationScenarios_0006').assertEqual('16300501');
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), AbilityConstant.LaunchReason.CONTINUATION);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.native.onImmediate = true;
        fixture.native.offImmediate = true;
        fixture.controller.markWindowReady();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('同步完成', 'sync-complete', 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0178', BUNDLE + '_ContinuationScenarios_0006').assertTrue();
        loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0179', BUNDLE + '_ContinuationScenarios_0006').assertTrue();
        loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0180', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
        loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0181', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
        loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0182', BUNDLE + '_ContinuationScenarios_0006').assertEqual(0);
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.registerProbe();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('交接', 'handoff', 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0183', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
        loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0184', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
        fixture.native.deliverOn(0);
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0185', BUNDLE + '_ContinuationScenarios_0006').assertFalse();
        fixture.native.deliverOff(0);
        loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0186', BUNDLE + '_ContinuationScenarios_0006').assertEqual(2);
        fixture.controller.markWindowReady();
        fixture.native.deliverOn(1);
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0187', BUNDLE + '_ContinuationScenarios_0006').assertTrue();
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0188', BUNDLE + '_ContinuationScenarios_0006').assertEqual('交接');
      });
      ['sync', 'async', 'unknown', 'timeout'].forEach((failure: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          fixture.controller.registerProbe();
          if (failure === 'sync') {
            fixture.native.offFailure = platformError();
          }
          receiveChoosingIncoming(fixture, inboundWant(rawPayload('交接重试🌱', `retry-${failure}`, 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
          loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0189', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
          loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0190', BUNDLE + '_ContinuationScenarios_0006').assertTrue();
          loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0191', BUNDLE + '_ContinuationScenarios_0006').assertFalse();
          loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0192', BUNDLE + '_ContinuationScenarios_0006').assertFalse();
          fixture.controller.registerProbe();
          fixture.controller.unregisterProbe();
          loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0193', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
          fixture.controller.markWindowReady();
          fixture.native.deliverOn(0, undefined, resultInfo(1));
          assertOriginal(fixture);
          if (failure === 'async') {
            loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0194', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
            fixture.native.deliverOff(0, platformError(201, 'handoff off failure'));
            loggedExpect(latest(fixture, 'OFF').errorCode, 'ContinuationScenarios.test.ets:A0195', BUNDLE + '_ContinuationScenarios_0006').assertEqual('201');
          } else if (failure === 'unknown') {
            loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0196', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
            fixture.native.deliverOff(0, undefined, resultInfo(29360148));
            loggedExpect(latest(fixture, 'OFF').rawResultState, 'ContinuationScenarios.test.ets:A0197', BUNDLE + '_ContinuationScenarios_0006').assertEqual('29360148');
          } else if (failure === 'timeout') {
            fixture.clock.advance(7999);
            loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0198', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
            loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0199', BUNDLE + '_ContinuationScenarios_0006').assertTrue();
            fixture.clock.advance(1);
            loggedExpect(latest(fixture, 'OFF').level, 'ContinuationScenarios.test.ets:A0200', BUNDLE + '_ContinuationScenarios_0006').assertEqual('WARN');
          } else {
            loggedExpect(latest(fixture, 'OFF').errorCode, 'ContinuationScenarios.test.ets:A0201', BUNDLE + '_ContinuationScenarios_0006').assertEqual('16300501');
            fixture.native.offFailure = undefined;
          }
          loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0202', BUNDLE + '_ContinuationScenarios_0006').assertEqual(2);
          loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0203', BUNDLE + '_ContinuationScenarios_0006').assertTrue();
          loggedExpect(fixture.controller.snapshot().quickResult, 'ContinuationScenarios.test.ets:A0204', BUNDLE + '_ContinuationScenarios_0006').assertEqual('等待真实系统快速结果');
          const restoreId = fixture.controller.snapshot().sessionRecordId;
          const before = JSON.stringify(fixture.controller.record(restoreId));
          fixture.native.deliverOn(0);
          fixture.native.deliverOff(0);
          loggedExpect(JSON.stringify(fixture.controller.record(restoreId)), 'ContinuationScenarios.test.ets:A0205', BUNDLE + '_ContinuationScenarios_0006').assertEqual(before);
          assertOriginal(fixture);
          fixture.native.deliverOn(1);
          loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0206', BUNDLE + '_ContinuationScenarios_0006').assertTrue();
          loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0207', BUNDLE + '_ContinuationScenarios_0006').assertEqual('交接重试🌱');
          loggedExpect(fixture.store.flushCalls, 'ContinuationScenarios.test.ets:A0208', BUNDLE + '_ContinuationScenarios_0006').assertEqual(1);
          loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0209', BUNDLE + '_ContinuationScenarios_0006').assertEqual(2);
          loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0210', BUNDLE + '_ContinuationScenarios_0006').assertFalse();
          fixture.native.deliverOff(0);
          loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0211', BUNDLE + '_ContinuationScenarios_0006').assertFalse();
          fixture.native.deliverOff(1);
          loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0212', BUNDLE + '_ContinuationScenarios_0006').assertTrue();
          loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0213', BUNDLE + '_ContinuationScenarios_0006').assertFalse();
          loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0214', BUNDLE + '_ContinuationScenarios_0006').assertEqual(0);
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0700
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0007
     * @tc.desc      Verify 虚拟期限、按钮重试、停止与迟到数据栅栏
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0007', (): void => {
      const missing: string[] = ['快速结果', '业务数据', '页面窗口'];
      missing.forEach((phase: string): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          receiveChoosingIncoming(fixture, inboundWant(), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
          if (phase !== '快速结果') {
            fixture.native.deliverOn(0);
          }
          if (phase === '页面窗口') {
            receiveChoosingIncoming(fixture, inboundWant(rawPayload()), AbilityConstant.LaunchReason.CONTINUATION);
          }
          fixture.clock.advance(14999);
          loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0215', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
          fixture.clock.advance(1);
          loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0216', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
          loggedExpect(latest(fixture, 'RESTORE').stage, 'ContinuationScenarios.test.ets:A0217', BUNDLE + '_ContinuationScenarios_0007').assertEqual(`${phase}超时`);
          assertOriginal(fixture);
          loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0218', BUNDLE + '_ContinuationScenarios_0007').assertEqual(1);
          fixture.native.deliverOn(0);
          fixture.native.deliverOff(0);
          receiveChoosingIncoming(fixture, inboundWant(rawPayload()), AbilityConstant.LaunchReason.CONTINUATION);
          fixture.controller.markWindowReady();
          assertOriginal(fixture);
        });
      });
      withLearning((fixture: LearningFixture): void => {
        receiveChoosingIncoming(fixture, inboundWant(), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        fixture.clock.advance(14999);
        fixture.native.deliverOn(0);
        fixture.clock.advance(14999);
        loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0219', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), AbilityConstant.LaunchReason.CONTINUATION);
        fixture.clock.advance(14999);
        loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0220', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        fixture.controller.markWindowReady();
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0221', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        fixture.native.deliverOff(0);
        fixture.clock.advance(60000);
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0222', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0223', BUNDLE + '_ContinuationScenarios_0007').assertEqual(0);
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        receiveChoosingIncoming(fixture, inboundWant(), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        fixture.controller.stopLocalWait();
        fixture.native.deliverOn(0);
        fixture.native.deliverOff(0);
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('迟到文本', 'late', 0, 2)), AbilityConstant.LaunchReason.CONTINUATION);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
        receiveChoosingIncoming(fixture, inboundWant(rawPayload('新轮文本', 'fresh', 0, 2)), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        fixture.native.deliverOn(1);
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0224', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0225', BUNDLE + '_ContinuationScenarios_0007').assertEqual('新轮文本');
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.registerProbe();
        fixture.clock.advance(14999);
        loggedExpect(latest(fixture, 'ON').endedAt, 'ContinuationScenarios.test.ets:A0226', BUNDLE + '_ContinuationScenarios_0007').assertEqual('');
        fixture.clock.advance(1);
        loggedExpect(latest(fixture, 'ON').level, 'ContinuationScenarios.test.ets:A0227', BUNDLE + '_ContinuationScenarios_0007').assertEqual('WARN');
        loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0228', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
        loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0229', BUNDLE + '_ContinuationScenarios_0007').assertEqual(1);
        fixture.native.deliverOff(0);
        loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0230', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        fixture.controller.registerProbe();
        fixture.controller.stopLocalWait();
        loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0231', BUNDLE + '_ContinuationScenarios_0007').assertEqual(2);
        fixture.controller.dispose();
        loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0232', BUNDLE + '_ContinuationScenarios_0007').assertEqual(0);
      });
      withLearning((fixture: LearningFixture): void => {
        fixture.native.onFailure = platformError();
        fixture.controller.registerProbe();
        loggedExpect(latest(fixture, 'ON').level, 'ContinuationScenarios.test.ets:A0233', BUNDLE + '_ContinuationScenarios_0007').assertEqual('ERROR');
        loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0234', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0235', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        loggedExpect(fixture.controller.snapshot().canStop, 'ContinuationScenarios.test.ets:A0236', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
        loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0237', BUNDLE + '_ContinuationScenarios_0007').assertEqual(0);
        fixture.native.onFailure = undefined;
        fixture.controller.registerProbe();
        loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0238', BUNDLE + '_ContinuationScenarios_0007').assertEqual(2);
        loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0239', BUNDLE + '_ContinuationScenarios_0007').assertEqual(0);
        loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0240', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
        loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0241', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        const before = JSON.stringify(latest(fixture, 'ON'));
        fixture.native.deliverOn(0);
        loggedExpect(JSON.stringify(latest(fixture, 'ON')), 'ContinuationScenarios.test.ets:A0242', BUNDLE + '_ContinuationScenarios_0007').assertEqual(before);
        loggedExpect(fixture.controller.snapshot().canStop, 'ContinuationScenarios.test.ets:A0243', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        fixture.controller.stopLocalWait();
        loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0244', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
        loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0245', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
        fixture.native.deliverOff(0);
        loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0246', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
        loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0247', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
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
              loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0248', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
              loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0249', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
              fixture.controller.registerProbe();
              fixture.controller.unregisterProbe();
              loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0250', BUNDLE + '_ContinuationScenarios_0007').assertEqual(1);
              loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0251', BUNDLE + '_ContinuationScenarios_0007').assertEqual(1);
            }
            if (failure === 'async') {
              fixture.native.deliverOff(0, platformError(201, 'controller off failure'));
              loggedExpect(latest(fixture, 'OFF').errorCode, 'ContinuationScenarios.test.ets:A0252', BUNDLE + '_ContinuationScenarios_0007').assertEqual('201');
            } else if (failure === 'unknown') {
              fixture.native.deliverOff(0, undefined, resultInfo(29360148));
              loggedExpect(latest(fixture, 'OFF').rawResultState, 'ContinuationScenarios.test.ets:A0253', BUNDLE + '_ContinuationScenarios_0007').assertEqual('29360148');
              loggedExpect(latest(fixture, 'OFF').level, 'ContinuationScenarios.test.ets:A0254', BUNDLE + '_ContinuationScenarios_0007').assertEqual('WARN');
            } else if (failure === 'timeout') {
              fixture.clock.advance(7999);
              loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0255', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
              loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0256', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
              fixture.clock.advance(1);
              loggedExpect(latest(fixture, 'OFF').result, 'ContinuationScenarios.test.ets:A0257', BUNDLE + '_ContinuationScenarios_0007').assertEqual('注销等待超时（8 秒）');
              loggedExpect(latest(fixture, 'OFF').stage, 'ContinuationScenarios.test.ets:A0258', BUNDLE + '_ContinuationScenarios_0007').assertEqual('OFF 未确认');
            } else {
              loggedExpect(latest(fixture, 'OFF').errorCode, 'ContinuationScenarios.test.ets:A0259', BUNDLE + '_ContinuationScenarios_0007').assertEqual('16300501');
              fixture.native.offFailure = undefined;
            }
            loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0260', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
            loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0261', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
            loggedExpect(fixture.controller.snapshot().canEdit, 'ContinuationScenarios.test.ets:A0262', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
            loggedExpect(fixture.controller.snapshot().canStop, 'ContinuationScenarios.test.ets:A0263', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
            loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0264', BUNDLE + '_ContinuationScenarios_0007').assertEqual(0);
            const oldOff = JSON.stringify(fixture.controller.record(offId));
            if (retryRegister) {
              fixture.controller.registerProbe();
              loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0265', BUNDLE + '_ContinuationScenarios_0007').assertEqual(2);
              loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0266', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
              loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0267', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
              const before = JSON.stringify(latest(fixture, 'ON'));
              fixture.native.deliverOn(0, undefined, resultInfo(1));
              fixture.native.deliverOff(0);
              loggedExpect(JSON.stringify(latest(fixture, 'ON')), 'ContinuationScenarios.test.ets:A0268', BUNDLE + '_ContinuationScenarios_0007').assertEqual(before);
              loggedExpect(JSON.stringify(fixture.controller.record(offId)), 'ContinuationScenarios.test.ets:A0269', BUNDLE + '_ContinuationScenarios_0007').assertEqual(oldOff);
              loggedExpect(fixture.controller.snapshot().canStop, 'ContinuationScenarios.test.ets:A0270', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
              loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0271', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
            }
            fixture.controller.unregisterProbe();
            loggedExpect(fixture.native.offCallbacks.length, 'ContinuationScenarios.test.ets:A0272', BUNDLE + '_ContinuationScenarios_0007').assertEqual(2);
            loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0273', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
            loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0274', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
            fixture.native.deliverOff(0);
            loggedExpect(JSON.stringify(fixture.controller.record(offId)), 'ContinuationScenarios.test.ets:A0275', BUNDLE + '_ContinuationScenarios_0007').assertEqual(oldOff);
            loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0276', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
            loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0277', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
            fixture.native.deliverOff(1);
            loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0278', BUNDLE + '_ContinuationScenarios_0007').assertTrue();
            loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0279', BUNDLE + '_ContinuationScenarios_0007').assertFalse();
            loggedExpect(fixture.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0280', BUNDLE + '_ContinuationScenarios_0007').assertEqual(0);
            assertOriginal(fixture);
          });
        });
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0800
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0008
     * @tc.desc      Verify 内存存储：读取、保存、清空、写入回滚与不确定冻结
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0008', (): void => {
      withLearning((fixture: LearningFixture): void => {
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0281', BUNDLE + '_ContinuationScenarios_0008').assertEqual('持久文本🌱');
        loggedExpect(fixture.controller.snapshot().selectionEnd, 'ContinuationScenarios.test.ets:A0282', BUNDLE + '_ContinuationScenarios_0008').assertEqual(2);
        fixture.controller.clearText();
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0283', BUNDLE + '_ContinuationScenarios_0008').assertEqual('');
        loggedExpect(fixture.store.flushCalls, 'ContinuationScenarios.test.ets:A0284', BUNDLE + '_ContinuationScenarios_0008').assertEqual(1);
        withLearning((reopened: LearningFixture): void => {
          loggedExpect(reopened.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0285', BUNDLE + '_ContinuationScenarios_0008').assertEqual('');
          loggedExpect(reopened.controller.snapshot().selectionStart, 'ContinuationScenarios.test.ets:A0286', BUNDLE + '_ContinuationScenarios_0008').assertEqual(0);
        }, fixture.store.stored());
      }, rawPayload('持久文本🌱', 'local', 0, 2));
      [37, '{bad', JSON.stringify(payloadBag('\uD800', 'bad', 0, 0))].forEach((seed: Object): void => {
        withLearning((fixture: LearningFixture): void => {
          loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0287', BUNDLE + '_ContinuationScenarios_0008').assertEqual('');
          loggedExpect(fixture.controller.snapshot().savedTextStatus.indexOf('无效') >= 0, 'ContinuationScenarios.test.ets:A0288', BUNDLE + '_ContinuationScenarios_0008').assertTrue();
        }, seed);
      });
      [true, false].forEach((openFailure: boolean): void => {
        withLearning((fixture: LearningFixture): void => {
          seedOriginal(fixture);
          fixture.controller.saveText();
          assertOriginal(fixture);
          loggedExpect(latest(fixture, 'SAVE').level, 'ContinuationScenarios.test.ets:A0289', BUNDLE + '_ContinuationScenarios_0008').assertEqual('ERROR');
          loggedExpect(fixture.store.putCalls, 'ContinuationScenarios.test.ets:A0290', BUNDLE + '_ContinuationScenarios_0008').assertEqual(0);
        }, undefined, openFailure, !openFailure);
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.controller.saveText();
        const durable = fixture.store.stored();
        fixture.controller.updateText('待保存修改');
        fixture.store.failFlushCalls = [2];
        fixture.controller.saveText();
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0291', BUNDLE + '_ContinuationScenarios_0008').assertEqual('待保存修改');
        loggedExpect(fixture.store.stored(), 'ContinuationScenarios.test.ets:A0292', BUNDLE + '_ContinuationScenarios_0008').assertEqual(durable);
        loggedExpect(latest(fixture, 'SAVE').level, 'ContinuationScenarios.test.ets:A0293', BUNDLE + '_ContinuationScenarios_0008').assertEqual('ERROR');
        fixture.store.failFlushCalls = [4];
        fixture.controller.clearText();
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0294', BUNDLE + '_ContinuationScenarios_0008').assertEqual('待保存修改');
        loggedExpect(fixture.store.stored(), 'ContinuationScenarios.test.ets:A0295', BUNDLE + '_ContinuationScenarios_0008').assertEqual(durable);
        fixture.store.failFlushCalls = [];
        fixture.controller.saveText();
        loggedExpect(latest(fixture, 'SAVE').level, 'ContinuationScenarios.test.ets:A0296', BUNDLE + '_ContinuationScenarios_0008').assertEqual('INFO');
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.store.failPutCalls = [1];
        fixture.controller.saveText();
        loggedExpect(fixture.store.deleteCalls, 'ContinuationScenarios.test.ets:A0297', BUNDLE + '_ContinuationScenarios_0008').assertEqual(1);
        loggedExpect(fixture.store.stored(), 'ContinuationScenarios.test.ets:A0298', BUNDLE + '_ContinuationScenarios_0008').assertUndefined();
        assertOriginal(fixture);
        fixture.controller.saveText();
        loggedExpect(latest(fixture, 'SAVE').level, 'ContinuationScenarios.test.ets:A0299', BUNDLE + '_ContinuationScenarios_0008').assertEqual('INFO');
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.store.failFlushCalls = [1, 2];
        fixture.controller.saveText();
        const puts = fixture.store.putCalls;
        fixture.store.failFlushCalls = [];
        fixture.controller.saveText();
        fixture.controller.clearText();
        loggedExpect(fixture.store.putCalls, 'ContinuationScenarios.test.ets:A0300', BUNDLE + '_ContinuationScenarios_0008').assertEqual(puts);
        assertOriginal(fixture);
        loggedExpect(latest(fixture, 'SAVE').level, 'ContinuationScenarios.test.ets:A0301', BUNDLE + '_ContinuationScenarios_0008').assertEqual('ERROR');
      });
      withLearning((fixture: LearningFixture): void => {
        seedOriginal(fixture);
        fixture.store.failFlushCalls = [1];
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), AbilityConstant.LaunchReason.CONTINUATION);
        fixture.controller.markWindowReady();
        assertOriginal(fixture);
        loggedExpect(latest(fixture, 'RESTORE').stage, 'ContinuationScenarios.test.ets:A0302', BUNDLE + '_ContinuationScenarios_0008').assertEqual('持久化失败');
        loggedExpect(fixture.store.stored(), 'ContinuationScenarios.test.ets:A0303', BUNDLE + '_ContinuationScenarios_0008').assertUndefined();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_0900
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0009
     * @tc.desc      Verify 诊断：快照隔离、订阅、记录限额、在途清理与摘要脱敏
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0009', (): void => {
      const invalidErrors: (Object | undefined | null)[] = [undefined, null, 7, 'fixture primitive'];
      invalidErrors.forEach((value: Object | undefined | null): void => {
        loggedExpect(safeErrorCode(value), 'ContinuationScenarios.test.ets:A0304', BUNDLE + '_ContinuationScenarios_0009').assertEqual('未知');
        loggedExpect(safeErrorMessage(value).indexOf('可读错误消息') >= 0, 'ContinuationScenarios.test.ets:A0305', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
      });
      const missingCode: Record<string, Object> = {};
      const stringCode: Record<string, Object> = {};
      stringCode['code'] = '16300501';
      const nanCode: Record<string, Object> = {};
      nanCode['code'] = Number.NaN;
      const infiniteCode: Record<string, Object> = {};
      infiniteCode['code'] = Number.POSITIVE_INFINITY;
      [missingCode, stringCode, nanCode, infiniteCode].forEach((value: Record<string, Object>): void => {
        loggedExpect(safeErrorCode(value), 'ContinuationScenarios.test.ets:A0306', BUNDLE + '_ContinuationScenarios_0009').assertEqual('未知');
      });
      const numericMessage: Record<string, Object> = {};
      numericMessage['message'] = 123;
      const emptyMessage: Record<string, Object> = {};
      emptyMessage['message'] = '';
      [missingCode, numericMessage, emptyMessage].forEach((value: Record<string, Object>): void => {
        loggedExpect(safeErrorMessage(value).indexOf('可读错误消息') >= 0, 'ContinuationScenarios.test.ets:A0307', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
      });
      const coded = platformError(16300501, 'readable fixture failure');
      loggedExpect(safeErrorCode(coded), 'ContinuationScenarios.test.ets:A0308', BUNDLE + '_ContinuationScenarios_0009').assertEqual('16300501');
      loggedExpect(safeErrorMessage(coded).indexOf('readable fixture failure') >= 0, 'ContinuationScenarios.test.ets:A0309', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
      const sensitive: string[] = [
        'https://example.test/private?token=abc', 'file:///private/part', 'C:\\private\\doc.txt',
        '/private/data/file.txt', 'aa:bb:cc:dd:ee:ff', '123e4567-e89b-12d3-a456-426614174000',
        'abcdef0123456789abcdef0123456789', '123456789012345', '192.168.1.2', '2001:db8::1',
        'body=private-payload', '\"quoted secret\"'
      ];
      sensitive.forEach((fragment: string): void => {
        const redacted = redactPlatformText(`before ${fragment} after`);
        loggedExpect(redacted.indexOf(fragment), 'ContinuationScenarios.test.ets:A0310', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
        loggedExpect(redacted.indexOf('before') >= 0, 'ContinuationScenarios.test.ets:A0311', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
      });
      loggedExpect(redactPlatformText('line1\nline2\tline3').indexOf('\n'), 'ContinuationScenarios.test.ets:A0312', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
      loggedExpect(redactPlatformText('line1\nline2\tline3').indexOf('\t'), 'ContinuationScenarios.test.ets:A0313', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
      const truncated = redactPlatformText(`${'q'.repeat(512)}TRUNCATED_MARK`);
      loggedExpect(truncated.length, 'ContinuationScenarios.test.ets:A0314', BUNDLE + '_ContinuationScenarios_0009').assertEqual(512);
      loggedExpect(truncated.indexOf('TRUNCATED_MARK'), 'ContinuationScenarios.test.ets:A0315', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
      withLearning((fixture: LearningFixture): void => {
        fixture.controller.registerProbe();
        fixture.clock.advance(1234);
        fixture.native.deliverOn(0);
        loggedExpect(latest(fixture, 'ON').durationMillis, 'ContinuationScenarios.test.ets:A0316', BUNDLE + '_ContinuationScenarios_0009').assertEqual(1234);
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
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0317', BUNDLE + '_ContinuationScenarios_0009').assertEqual('原文🌱');
        loggedExpect(fixture.controller.snapshot().environment[0].value, 'ContinuationScenarios.test.ets:A0318', BUNDLE + '_ContinuationScenarios_0009').assertEqual('26');
        loggedExpect(fixture.controller.snapshot().records[0].facts.indexOf('external fact'), 'ContinuationScenarios.test.ets:A0319', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
        loggedExpect(fixture.controller.record(record.id)?.result === 'external result', 'ContinuationScenarios.test.ets:A0320', BUNDLE + '_ContinuationScenarios_0009').assertFalse();
        let notices: number = 0;
        const unsubscribe = fixture.controller.subscribe((value: LearningSnapshot): void => {
          notices++;
          value.text = 'subscriber mutation';
        });
        loggedExpect(notices, 'ContinuationScenarios.test.ets:A0321', BUNDLE + '_ContinuationScenarios_0009').assertEqual(1);
        fixture.controller.updateSelection(0, 1);
        loggedExpect(notices, 'ContinuationScenarios.test.ets:A0322', BUNDLE + '_ContinuationScenarios_0009').assertEqual(2);
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0323', BUNDLE + '_ContinuationScenarios_0009').assertEqual('原文🌱');
        unsubscribe();
        fixture.controller.updateSelection(0, 2);
        loggedExpect(notices, 'ContinuationScenarios.test.ets:A0324', BUNDLE + '_ContinuationScenarios_0009').assertEqual(2);
        let throws: number = 0;
        fixture.controller.subscribe((_value: LearningSnapshot): void => {
          if (++throws > 1) { throw new Error('fixture subscriber failure'); }
        });
        fixture.controller.saveText();
        loggedExpect(latest(fixture, 'SAVE').level, 'ContinuationScenarios.test.ets:A0325', BUNDLE + '_ContinuationScenarios_0009').assertEqual('INFO');
        for (let i: number = 0; i < 70; i++) { fixture.controller.checkEnvironment(); }
        const capped = fixture.controller.snapshot();
        loggedExpect(capped.records.length, 'ContinuationScenarios.test.ets:A0326', BUNDLE + '_ContinuationScenarios_0009').assertEqual(40);
        loggedExpect(capped.events.length <= 120, 'ContinuationScenarios.test.ets:A0327', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
        loggedExpect(capped.records.every((item: OperationRecord) => item.events.length <= 24), 'ContinuationScenarios.test.ets:A0328', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
        fixture.controller.clearRecords();
        loggedExpect(fixture.controller.snapshot().records.length, 'ContinuationScenarios.test.ets:A0329', BUNDLE + '_ContinuationScenarios_0009').assertEqual(0);
        loggedExpect(fixture.controller.snapshot().events.length, 'ContinuationScenarios.test.ets:A0330', BUNDLE + '_ContinuationScenarios_0009').assertEqual(0);
        loggedExpect(fixture.controller.snapshot().text, 'ContinuationScenarios.test.ets:A0331', BUNDLE + '_ContinuationScenarios_0009').assertEqual('原文🌱');
        loggedExpect(fixture.controller.record('missing'), 'ContinuationScenarios.test.ets:A0332', BUNDLE + '_ContinuationScenarios_0009').assertUndefined();
      });
      withLearning((fixture: LearningFixture): void => {
        receiveChoosingIncoming(fixture, inboundWant(rawPayload()), AbilityConstant.LaunchReason.PREPARE_CONTINUATION);
        for (let i: number = 0; i < 30; i++) {
          receiveChoosingIncoming(fixture, inboundWant(rawPayload()), AbilityConstant.LaunchReason.CONTINUATION);
        }
        const id = fixture.controller.snapshot().sessionRecordId;
        loggedExpect(latest(fixture, 'RESTORE').events.length <= 24, 'ContinuationScenarios.test.ets:A0333', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
        fixture.controller.clearRecords();
        loggedExpect(fixture.controller.record(id)?.endedAt, 'ContinuationScenarios.test.ets:A0334', BUNDLE + '_ContinuationScenarios_0009').assertEqual('');
        fixture.controller.markWindowReady();
        fixture.native.deliverOn(0);
        loggedExpect(fixture.controller.snapshot().committed, 'ContinuationScenarios.test.ets:A0335', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
        const offId = latest(fixture, 'OFF').id;
        fixture.clock.advance(8000);
        loggedExpect(fixture.controller.record(offId)?.result, 'ContinuationScenarios.test.ets:A0336', BUNDLE + '_ContinuationScenarios_0009').assertEqual('注销等待超时（8 秒）');
        loggedExpect(fixture.controller.record(offId)?.level, 'ContinuationScenarios.test.ets:A0337', BUNDLE + '_ContinuationScenarios_0009').assertEqual('WARN');
        loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0338', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
        loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0339', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
        fixture.controller.clearRecords();
        loggedExpect(fixture.controller.record(offId), 'ContinuationScenarios.test.ets:A0340', BUNDLE + '_ContinuationScenarios_0009').assertUndefined();
        fixture.native.deliverOff(0);
        loggedExpect(fixture.controller.record(offId), 'ContinuationScenarios.test.ets:A0341', BUNDLE + '_ContinuationScenarios_0009').assertUndefined();
        loggedExpect(fixture.controller.snapshot().canRegister, 'ContinuationScenarios.test.ets:A0342', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
        loggedExpect(fixture.controller.snapshot().canUnregister, 'ContinuationScenarios.test.ets:A0343', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
      });
      withLearning((fixture: LearningFixture): void => {
        const secret = 'SENSITIVE_BODY_123';
        fixture.controller.updateText(secret);
        fixture.native.onFailure = platformError(16300501,
          `${secret}; deviceId=abcdef1234567890; file:///private/secret; 192.168.1.2`);
        fixture.controller.registerProbe();
        const record = latest(fixture, 'ON');
        loggedExpect(record.errorCode, 'ContinuationScenarios.test.ets:A0344', BUNDLE + '_ContinuationScenarios_0009').assertEqual('16300501');
        loggedExpect(record.rawMessage.indexOf(secret), 'ContinuationScenarios.test.ets:A0345', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
        loggedExpect(record.rawMessage.indexOf('abcdef1234567890'), 'ContinuationScenarios.test.ets:A0346', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
        loggedExpect(record.rawMessage.indexOf('192.168.1.2'), 'ContinuationScenarios.test.ets:A0347', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
        const summary = fixture.controller.diagnosticSummary(record.id);
        loggedExpect(summary.indexOf('16300501') >= 0, 'ContinuationScenarios.test.ets:A0348', BUNDLE + '_ContinuationScenarios_0009').assertTrue();
        loggedExpect(summary.indexOf(secret), 'ContinuationScenarios.test.ets:A0349', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
        loggedExpect(summary.indexOf('private/secret'), 'ContinuationScenarios.test.ets:A0350', BUNDLE + '_ContinuationScenarios_0009').assertEqual(-1);
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_CONTINUATIONSCENARIOS_1000
     * @tc.name      com.samples.appcontinuation_ContinuationScenarios_0010
     * @tc.desc      Verify 环境权限：默认状态、查询异常、异步授权及上下文发布
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario(BUNDLE + '_ContinuationScenarios_0010', async (): Promise<void> => {
      const empty = emptyLearningSnapshot();
      loggedExpect(empty.canRegister, 'ContinuationScenarios.test.ets:A0351', BUNDLE + '_ContinuationScenarios_0010').assertFalse();
      loggedExpect(empty.canEdit, 'ContinuationScenarios.test.ets:A0352', BUNDLE + '_ContinuationScenarios_0010').assertFalse();
      loggedExpect(empty.records.length, 'ContinuationScenarios.test.ets:A0353', BUNDLE + '_ContinuationScenarios_0010').assertEqual(0);
      loggedExpect(empty.sessionRecordId, 'ContinuationScenarios.test.ets:A0354', BUNDLE + '_ContinuationScenarios_0010').assertEqual('');
      let contextRequired: boolean = false;
      try { platformLearningDependencies(undefined); } catch (error) { contextRequired = true; }
      loggedExpect(contextRequired, 'ContinuationScenarios.test.ets:A0355', BUNDLE + '_ContinuationScenarios_0010').assertTrue();
      withLearning((fixture: LearningFixture): void => {
        loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0356', BUNDLE + '_ContinuationScenarios_0010').assertEqual(0);
        loggedExpect(fixture.environment.requestCalls, 'ContinuationScenarios.test.ets:A0357', BUNDLE + '_ContinuationScenarios_0010').assertEqual(0);
        receiveChoosingIncoming(fixture, inboundWant(), 0);
        loggedExpect(fixture.controller.snapshot().sessionActive, 'ContinuationScenarios.test.ets:A0358', BUNDLE + '_ContinuationScenarios_0010').assertFalse();
        fixture.environment.mission = false;
        fixture.environment.permission = -1;
        fixture.controller.checkEnvironment();
        const value = fixture.controller.snapshot();
        loggedExpect(environmentValue(value, 'api').value, 'ContinuationScenarios.test.ets:A0359', BUNDLE + '_ContinuationScenarios_0010').assertEqual('26');
        loggedExpect(environmentValue(value, 'type').value, 'ContinuationScenarios.test.ets:A0360', BUNDLE + '_ContinuationScenarios_0010').assertEqual('fixture-board');
        loggedExpect(environmentValue(value, 'syscap').value, 'ContinuationScenarios.test.ets:A0361', BUNDLE + '_ContinuationScenarios_0010').assertEqual('未声明支持');
        loggedExpect(environmentValue(value, 'permission').value, 'ContinuationScenarios.test.ets:A0362', BUNDLE + '_ContinuationScenarios_0010').assertEqual('未授权');
        loggedExpect(environmentValue(value, 'peer').value, 'ContinuationScenarios.test.ets:A0363', BUNDLE + '_ContinuationScenarios_0010').assertEqual('未知');
        loggedExpect(fixture.native.onCallbacks.length, 'ContinuationScenarios.test.ets:A0364', BUNDLE + '_ContinuationScenarios_0010').assertEqual(0);
        const previous = getLearningController();
        try {
          clearLearningController();
          loggedExpect(getLearningController(), 'ContinuationScenarios.test.ets:A0365', BUNDLE + '_ContinuationScenarios_0010').assertUndefined();
          publishLearningController(fixture.controller);
          loggedExpect(getLearningController() === fixture.controller, 'ContinuationScenarios.test.ets:A0366', BUNDLE + '_ContinuationScenarios_0010').assertTrue();
          clearLearningController();
          loggedExpect(getLearningController(), 'ContinuationScenarios.test.ets:A0367', BUNDLE + '_ContinuationScenarios_0010').assertUndefined();
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
        loggedExpect(environmentValue(value, 'public').status, 'ContinuationScenarios.test.ets:A0368', BUNDLE + '_ContinuationScenarios_0010').assertEqual('读取失败');
        loggedExpect(environmentValue(value, 'syscap').value, 'ContinuationScenarios.test.ets:A0369', BUNDLE + '_ContinuationScenarios_0010').assertEqual('未知');
        loggedExpect(environmentValue(value, 'permission').value, 'ContinuationScenarios.test.ets:A0370', BUNDLE + '_ContinuationScenarios_0010').assertEqual('未知');
      });
      const replies: number[][] = [[0], [-1], []];
      for (let i: number = 0; i < replies.length; i++) {
        const fixture = new LearningFixture();
        try {
          fixture.controller.requestPermission();
          fixture.controller.requestPermission();
          loggedExpect(fixture.environment.requestCalls, 'ContinuationScenarios.test.ets:A0371', BUNDLE + '_ContinuationScenarios_0010').assertEqual(1);
          loggedExpect(latest(fixture, 'PERMISSION').endedAt, 'ContinuationScenarios.test.ets:A0372', BUNDLE + '_ContinuationScenarios_0010').assertEqual('');
          fixture.controller.clearRecords();
          loggedExpect(fixture.controller.snapshot().records.length, 'ContinuationScenarios.test.ets:A0373', BUNDLE + '_ContinuationScenarios_0010').assertEqual(1);
          fixture.environment.reply.resolve(replies[i]);
          await flushPermissionMicrotasks();
          const record = latest(fixture, 'PERMISSION');
          loggedExpect(record.endedAt.length > 0, 'ContinuationScenarios.test.ets:A0374', BUNDLE + '_ContinuationScenarios_0010').assertTrue();
          loggedExpect(record.level, 'ContinuationScenarios.test.ets:A0375', BUNDLE + '_ContinuationScenarios_0010').assertEqual(i === 0 ? 'INFO' : 'WARN');
        } finally { fixture.release(); }
      }
      const rejected = new LearningFixture();
      try {
        rejected.controller.requestPermission();
        rejected.environment.reply.reject(platformError(201, 'permission denied'));
        await flushPermissionMicrotasks();
        loggedExpect(latest(rejected, 'PERMISSION').level, 'ContinuationScenarios.test.ets:A0376', BUNDLE + '_ContinuationScenarios_0010').assertEqual('ERROR');
        loggedExpect(latest(rejected, 'PERMISSION').errorCode, 'ContinuationScenarios.test.ets:A0377', BUNDLE + '_ContinuationScenarios_0010').assertEqual('201');
      } finally { rejected.release(); }
      withLearning((fixture: LearningFixture): void => {
        fixture.environment.requestFailure = true;
        fixture.controller.requestPermission();
        loggedExpect(latest(fixture, 'PERMISSION').level, 'ContinuationScenarios.test.ets:A0378', BUNDLE + '_ContinuationScenarios_0010').assertEqual('ERROR');
      });
      const disposed = new LearningFixture();
      try {
        disposed.controller.requestPermission();
        const before = JSON.stringify(disposed.controller.snapshot().records);
        disposed.controller.dispose();
        disposed.environment.reply.resolve([0]);
        await flushPermissionMicrotasks();
        loggedExpect(JSON.stringify(disposed.controller.snapshot().records), 'ContinuationScenarios.test.ets:A0379', BUNDLE + '_ContinuationScenarios_0010').assertEqual(before);
        loggedExpect(disposed.clock.pendingCount(), 'ContinuationScenarios.test.ets:A0380', BUNDLE + '_ContinuationScenarios_0010').assertEqual(0);
      } finally { disposed.release(); }
    });
  });
}
