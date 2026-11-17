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
const TAG: string = 'CallEventLogMatrix2';
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

export default function callEventLogMatrix2Test(): void {
  describe('CallEventLogMatrix2', () => {
    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0090
     * @tc.name      testTypes0090
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0090 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0090 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0091
     * @tc.name      testSize0091
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0091 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0092
     * @tc.name      testCountOf0092
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0092 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0093
     * @tc.name      testFirstLine0093
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0093 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0094
     * @tc.name      testLastLine0094
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0094 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testLastLine0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0095
     * @tc.name      testTypes0095
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0095 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0096
     * @tc.name      testSize0096
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0096 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0097
     * @tc.name      testCountOf0097
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0097 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0098
     * @tc.name      testFirstLine0098
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0098 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0099
     * @tc.name      testLastLine0099
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0099 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#2 DIALLING unknown');
      log('testLastLine0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0100
     * @tc.name      testTypes0100
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0100 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0101
     * @tc.name      testSize0101
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0101 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0101 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0102
     * @tc.name      testCountOf0102
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0102 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0103
     * @tc.name      testFirstLine0103
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0103 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0104
     * @tc.name      testLastLine0104
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0104 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#3 HOLDING 911');
      log('testLastLine0104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0105
     * @tc.name      testTypes0105
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0105 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0106
     * @tc.name      testSize0106
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0106 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0107
     * @tc.name      testCountOf0107
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0107 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0108
     * @tc.name      testFirstLine0108
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0108 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0109
     * @tc.name      testLastLine0109
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0109 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#4 DIALLING 13900139000');
      log('testLastLine0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0110
     * @tc.name      testTypes0110
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0110 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0111
     * @tc.name      testSize0111
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0111 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0112
     * @tc.name      testCountOf0112
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0112 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0113
     * @tc.name      testFirstLine0113
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0113 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0113 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0114
     * @tc.name      testLastLine0114
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0114 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#5 HOLDING 13800138000');
      log('testLastLine0114 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0115
     * @tc.name      testTypes0115
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0115 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0116
     * @tc.name      testSize0116
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0116 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0117
     * @tc.name      testCountOf0117
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0117 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0117 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0118
     * @tc.name      testFirstLine0118
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0118 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0118 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0119
     * @tc.name      testLastLine0119
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0119 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#6 DIALLING unknown');
      log('testLastLine0119 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0120
     * @tc.name      testTypes0120
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0120 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0120 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0121
     * @tc.name      testSize0121
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0121 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0121 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0122
     * @tc.name      testCountOf0122
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0122 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0122 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0123
     * @tc.name      testFirstLine0123
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0123 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0123 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0124
     * @tc.name      testLastLine0124
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0124 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testLastLine0124 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0125
     * @tc.name      testTypes0125
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0125 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0125 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0126
     * @tc.name      testSize0126
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0126 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0126 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0127
     * @tc.name      testCountOf0127
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0127 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0127 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0128
     * @tc.name      testFirstLine0128
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0128 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0128 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0129
     * @tc.name      testLastLine0129
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0129 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#2 HOLDING unknown');
      log('testLastLine0129 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0130
     * @tc.name      testTypes0130
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0130 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0130 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0131
     * @tc.name      testSize0131
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0131 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0131 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0132
     * @tc.name      testCountOf0132
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0132 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0132 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0133
     * @tc.name      testFirstLine0133
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0133 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0133 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0134
     * @tc.name      testLastLine0134
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0134 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#3 DIALLING 911');
      log('testLastLine0134 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0135
     * @tc.name      testTypes0135
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0135 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0135 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0136
     * @tc.name      testSize0136
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0136 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0136 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0137
     * @tc.name      testCountOf0137
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0137 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0137 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0138
     * @tc.name      testFirstLine0138
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0138 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0138 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0139
     * @tc.name      testLastLine0139
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0139 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#4 HOLDING 13900139000');
      log('testLastLine0139 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0140
     * @tc.name      testTypes0140
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0140 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0140 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0141
     * @tc.name      testSize0141
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0141 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0141 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0142
     * @tc.name      testCountOf0142
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0142 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0142 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0143
     * @tc.name      testFirstLine0143
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0143 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0143 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0144
     * @tc.name      testLastLine0144
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0144 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#5 DIALLING 13800138000');
      log('testLastLine0144 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0145
     * @tc.name      testTypes0145
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0145 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      callEventLog.append('DISCONNECTED', 'unknown');
      callEventLog.append('DIALLING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0145 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0146
     * @tc.name      testSize0146
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0146 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0146 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0147
     * @tc.name      testCountOf0147
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0147 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0147 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0148
     * @tc.name      testFirstLine0148
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0148 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0148 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0149
     * @tc.name      testLastLine0149
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0149 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#6 HOLDING unknown');
      log('testLastLine0149 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0150
     * @tc.name      testTypes0150
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0150 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0150 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0151
     * @tc.name      testSize0151
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0151 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0151 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0152
     * @tc.name      testCountOf0152
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0152 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0152 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0153
     * @tc.name      testFirstLine0153
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0153 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0153 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0154
     * @tc.name      testLastLine0154
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0154 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testLastLine0154 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0155
     * @tc.name      testTypes0155
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0155 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0155 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0156
     * @tc.name      testSize0156
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0156 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0156 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0157
     * @tc.name      testCountOf0157
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0157 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0157 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0158
     * @tc.name      testFirstLine0158
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0158 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0158 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0159
     * @tc.name      testLastLine0159
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0159 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#2 DIALLING unknown');
      log('testLastLine0159 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0160
     * @tc.name      testTypes0160
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0160 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0160 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0161
     * @tc.name      testSize0161
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0161 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0161 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0162
     * @tc.name      testCountOf0162
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0162 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0162 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0163
     * @tc.name      testFirstLine0163
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0163 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0163 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0164
     * @tc.name      testLastLine0164
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0164 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#3 HOLDING 911');
      log('testLastLine0164 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0165
     * @tc.name      testTypes0165
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0165 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0165 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0166
     * @tc.name      testSize0166
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0166 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0166 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0167
     * @tc.name      testCountOf0167
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0167 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0167 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0168
     * @tc.name      testFirstLine0168
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0168 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0168 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0169
     * @tc.name      testLastLine0169
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0169 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#4 DIALLING 13900139000');
      log('testLastLine0169 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0170
     * @tc.name      testTypes0170
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0170 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0170 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0171
     * @tc.name      testSize0171
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0171 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0171 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0172
     * @tc.name      testCountOf0172
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0172 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0172 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0173
     * @tc.name      testFirstLine0173
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0173 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0173 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0174
     * @tc.name      testLastLine0174
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0174 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#5 HOLDING 13800138000');
      log('testLastLine0174 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0175
     * @tc.name      testTypes0175
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0175 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0175 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0176
     * @tc.name      testSize0176
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0176 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0176 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0177
     * @tc.name      testCountOf0177
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0177 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0177 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0178
     * @tc.name      testFirstLine0178
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0178 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0178 end');
      await yieldToMain();
    })
  })
}
