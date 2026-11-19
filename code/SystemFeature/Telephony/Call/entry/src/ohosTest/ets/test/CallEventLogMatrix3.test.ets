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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { CallEventLog } from '../../../main/ets/model/CallEventLog';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallEventLogMatrix3';
const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

let caseCounter: number = 0;

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// Breaking the JS micro-task chain every 20 cases: Hypium runs all `it` callbacks as
// promise continuations inside one native task, so a real async call is required to
// hand the main thread back to the EventHandler before THREAD_BLOCK_3S/6S fires.
async function yieldToMain(): Promise<void> {
  caseCounter++;
  if (caseCounter % 20 === 0) {
    try {
      await delegator.getCurrentTopAbility();
    } catch (error) {
      log('yield point failed');
    }
  }
}

export default function callEventLogMatrix3Test(): void {
  describe('CallEventLogMatrix3', () => {
    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0179
     * @tc.name      testLastLine0179
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0179 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#6 DIALLING unknown');
      log('testLastLine0179 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0180
     * @tc.name      testTypes0180
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0180 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0180 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0181
     * @tc.name      testSize0181
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0181 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0181 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0182
     * @tc.name      testCountOf0182
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0182 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0182 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0183
     * @tc.name      testFirstLine0183
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0183 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0183 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0184
     * @tc.name      testLastLine0184
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0184 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testLastLine0184 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0185
     * @tc.name      testTypes0185
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0185 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0185 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0186
     * @tc.name      testSize0186
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0186 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0186 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0187
     * @tc.name      testCountOf0187
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0187 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0187 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0188
     * @tc.name      testFirstLine0188
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0188 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0188 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0189
     * @tc.name      testLastLine0189
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0189 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#2 HOLDING unknown');
      log('testLastLine0189 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0190
     * @tc.name      testTypes0190
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0190 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0190 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0191
     * @tc.name      testSize0191
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0191 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0191 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0192
     * @tc.name      testCountOf0192
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0192 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0192 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0193
     * @tc.name      testFirstLine0193
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0193 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0193 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0194
     * @tc.name      testLastLine0194
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0194 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#3 DIALLING 911');
      log('testLastLine0194 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0195
     * @tc.name      testTypes0195
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0195 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0195 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0196
     * @tc.name      testSize0196
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0196 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0196 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0197
     * @tc.name      testCountOf0197
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0197 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0197 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0198
     * @tc.name      testFirstLine0198
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0198 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0198 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0199
     * @tc.name      testLastLine0199
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0199 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#4 HOLDING 13900139000');
      log('testLastLine0199 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0200
     * @tc.name      testTypes0200
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0200 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0200 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0201
     * @tc.name      testSize0201
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0201 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0201 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0202
     * @tc.name      testCountOf0202
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0202 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0202 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0203
     * @tc.name      testFirstLine0203
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0203 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0203 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0204
     * @tc.name      testLastLine0204
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0204 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#5 DIALLING 13800138000');
      log('testLastLine0204 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0205
     * @tc.name      testTypes0205
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0205 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0205 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0206
     * @tc.name      testSize0206
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0206 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0206 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0207
     * @tc.name      testCountOf0207
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0207 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0207 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0208
     * @tc.name      testFirstLine0208
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0208 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0208 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0209
     * @tc.name      testLastLine0209
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0209 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#6 HOLDING unknown');
      log('testLastLine0209 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0210
     * @tc.name      testTypes0210
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0210 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0210 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0211
     * @tc.name      testSize0211
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0211 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0211 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0212
     * @tc.name      testCountOf0212
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0212 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0212 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0213
     * @tc.name      testFirstLine0213
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0213 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0213 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0214
     * @tc.name      testLastLine0214
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0214 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testLastLine0214 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0215
     * @tc.name      testTypes0215
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0215 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0215 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0216
     * @tc.name      testSize0216
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0216 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0216 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0217
     * @tc.name      testCountOf0217
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0217 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0217 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0218
     * @tc.name      testFirstLine0218
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0218 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0218 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0219
     * @tc.name      testLastLine0219
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0219 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#2 DIALLING unknown');
      log('testLastLine0219 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0220
     * @tc.name      testTypes0220
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0220 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0220 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0221
     * @tc.name      testSize0221
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0221 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0221 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0222
     * @tc.name      testCountOf0222
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0222 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0222 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0223
     * @tc.name      testFirstLine0223
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0223 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0223 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0224
     * @tc.name      testLastLine0224
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0224 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#3 HOLDING 911');
      log('testLastLine0224 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0225
     * @tc.name      testTypes0225
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0225 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0225 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0226
     * @tc.name      testSize0226
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0226 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0226 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0227
     * @tc.name      testCountOf0227
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0227 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0227 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0228
     * @tc.name      testFirstLine0228
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0228 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0228 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0229
     * @tc.name      testLastLine0229
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0229 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#4 DIALLING 13900139000');
      log('testLastLine0229 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0230
     * @tc.name      testTypes0230
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0230 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0230 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0231
     * @tc.name      testSize0231
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0231 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0231 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0232
     * @tc.name      testCountOf0232
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0232 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0232 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0233
     * @tc.name      testFirstLine0233
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0233 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0233 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0234
     * @tc.name      testLastLine0234
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0234 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#5 HOLDING 13800138000');
      log('testLastLine0234 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0235
     * @tc.name      testTypes0235
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0235 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0235 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0236
     * @tc.name      testSize0236
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0236 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0236 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0237
     * @tc.name      testCountOf0237
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0237 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0237 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0238
     * @tc.name      testFirstLine0238
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0238 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0238 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0239
     * @tc.name      testLastLine0239
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0239 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#6 DIALLING unknown');
      log('testLastLine0239 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0240
     * @tc.name      testTypes0240
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0240 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0240 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0241
     * @tc.name      testSize0241
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0241 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0241 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0242
     * @tc.name      testCountOf0242
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0242 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0242 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0243
     * @tc.name      testFirstLine0243
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0243 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0243 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0244
     * @tc.name      testLastLine0244
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0244 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testLastLine0244 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0245
     * @tc.name      testTypes0245
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0245 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0245 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0246
     * @tc.name      testSize0246
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0246 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0246 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0247
     * @tc.name      testCountOf0247
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0247 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0247 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0248
     * @tc.name      testFirstLine0248
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0248 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0248 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0249
     * @tc.name      testLastLine0249
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0249 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#2 HOLDING unknown');
      log('testLastLine0249 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0250
     * @tc.name      testTypes0250
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0250 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0250 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0251
     * @tc.name      testSize0251
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0251 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0251 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0252
     * @tc.name      testCountOf0252
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0252 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0252 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0253
     * @tc.name      testFirstLine0253
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0253 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0253 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0254
     * @tc.name      testLastLine0254
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0254 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#3 DIALLING 911');
      log('testLastLine0254 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0255
     * @tc.name      testTypes0255
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0255 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0255 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0256
     * @tc.name      testSize0256
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0256 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0256 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0257
     * @tc.name      testCountOf0257
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0257 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0257 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0258
     * @tc.name      testFirstLine0258
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0258 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0258 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0259
     * @tc.name      testLastLine0259
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0259 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#4 HOLDING 13900139000');
      log('testLastLine0259 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0260
     * @tc.name      testTypes0260
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0260 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0260 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0261
     * @tc.name      testSize0261
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0261 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0261 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0262
     * @tc.name      testCountOf0262
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0262 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0262 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0263
     * @tc.name      testFirstLine0263
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0263 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0263 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0264
     * @tc.name      testLastLine0264
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0264 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#5 DIALLING 13800138000');
      log('testLastLine0264 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0265
     * @tc.name      testTypes0265
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0265 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0265 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0266
     * @tc.name      testSize0266
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0266 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0266 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0267
     * @tc.name      testCountOf0267
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0267 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0267 end');
      await yieldToMain();
    })
  })
}
