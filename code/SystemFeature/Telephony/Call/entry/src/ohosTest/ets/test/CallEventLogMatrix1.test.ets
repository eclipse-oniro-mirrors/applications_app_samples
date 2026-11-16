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
const TAG: string = 'CallEventLogMatrix1';
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

export default function callEventLogMatrix1Test(): void {
  describe('CallEventLogMatrix1', () => {
    /**
     * @tc.number    SUB_CALL_EVENTLOG_0001
     * @tc.name      testSize0001
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0001 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0002
     * @tc.name      testCountOf0002
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0002 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0003
     * @tc.name      testFirstLine0003
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0003 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0004
     * @tc.name      testLastLine0004
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0004 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testLastLine0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0005
     * @tc.name      testTypes0005
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0005 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0006
     * @tc.name      testSize0006
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0006 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0007
     * @tc.name      testCountOf0007
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0007 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0008
     * @tc.name      testFirstLine0008
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0008 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0009
     * @tc.name      testLastLine0009
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0009 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#2 HOLDING unknown');
      log('testLastLine0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0010
     * @tc.name      testTypes0010
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0010 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0011
     * @tc.name      testSize0011
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0011 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0012
     * @tc.name      testCountOf0012
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0012 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0013
     * @tc.name      testFirstLine0013
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0013 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0014
     * @tc.name      testLastLine0014
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0014 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#3 DIALLING 911');
      log('testLastLine0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0015
     * @tc.name      testTypes0015
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0015 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0016
     * @tc.name      testSize0016
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0016 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0017
     * @tc.name      testCountOf0017
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0017 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0018
     * @tc.name      testFirstLine0018
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0018 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0019
     * @tc.name      testLastLine0019
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0019 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#4 HOLDING 13900139000');
      log('testLastLine0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0020
     * @tc.name      testTypes0020
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0020 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0021
     * @tc.name      testSize0021
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0021 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0022
     * @tc.name      testCountOf0022
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0022 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0023
     * @tc.name      testFirstLine0023
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0023 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0024
     * @tc.name      testLastLine0024
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0024 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#5 DIALLING 13800138000');
      log('testLastLine0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0025
     * @tc.name      testTypes0025
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0025 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0026
     * @tc.name      testSize0026
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0026 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0027
     * @tc.name      testCountOf0027
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0027 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0028
     * @tc.name      testFirstLine0028
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0028 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0029
     * @tc.name      testLastLine0029
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0029 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#6 HOLDING unknown');
      log('testLastLine0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0030
     * @tc.name      testTypes0030
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0030 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0031
     * @tc.name      testSize0031
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0031 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0032
     * @tc.name      testCountOf0032
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0032 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0033
     * @tc.name      testFirstLine0033
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0033 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0034
     * @tc.name      testLastLine0034
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0034 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testLastLine0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0035
     * @tc.name      testTypes0035
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0035 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0036
     * @tc.name      testSize0036
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0036 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0037
     * @tc.name      testCountOf0037
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0037 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0038
     * @tc.name      testFirstLine0038
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0038 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0039
     * @tc.name      testLastLine0039
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0039 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#2 DIALLING unknown');
      log('testLastLine0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0040
     * @tc.name      testTypes0040
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0040 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0041
     * @tc.name      testSize0041
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0041 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0042
     * @tc.name      testCountOf0042
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0042 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0043
     * @tc.name      testFirstLine0043
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0043 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0044
     * @tc.name      testLastLine0044
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0044 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#3 HOLDING 911');
      log('testLastLine0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0045
     * @tc.name      testTypes0045
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0045 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0046
     * @tc.name      testSize0046
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0046 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0047
     * @tc.name      testCountOf0047
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0047 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0048
     * @tc.name      testFirstLine0048
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0048 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0049
     * @tc.name      testLastLine0049
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0049 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#4 DIALLING 13900139000');
      log('testLastLine0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0050
     * @tc.name      testTypes0050
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0050 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0051
     * @tc.name      testSize0051
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0051 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      eventLog.append('ACTIVE', 'unknown');
      eventLog.append('HOLDING', '13800138000');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0052
     * @tc.name      testCountOf0052
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0052 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      eventLog.append('ACTIVE', 'unknown');
      eventLog.append('HOLDING', '13800138000');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0053
     * @tc.name      testFirstLine0053
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0053 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      eventLog.append('ACTIVE', 'unknown');
      eventLog.append('HOLDING', '13800138000');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0054
     * @tc.name      testLastLine0054
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0054 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      eventLog.append('ACTIVE', 'unknown');
      eventLog.append('HOLDING', '13800138000');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#5 HOLDING 13800138000');
      log('testLastLine0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0055
     * @tc.name      testTypes0055
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0055 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      eventLog.append('ACTIVE', 'unknown');
      eventLog.append('HOLDING', '13800138000');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0056
     * @tc.name      testSize0056
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0056 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0057
     * @tc.name      testCountOf0057
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0057 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0058
     * @tc.name      testFirstLine0058
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0058 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0059
     * @tc.name      testLastLine0059
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0059 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#6 DIALLING unknown');
      log('testLastLine0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0060
     * @tc.name      testTypes0060
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0060 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0061
     * @tc.name      testSize0061
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0061 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0062
     * @tc.name      testCountOf0062
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0062 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0063
     * @tc.name      testFirstLine0063
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0063 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0064
     * @tc.name      testLastLine0064
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0064 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testLastLine0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0065
     * @tc.name      testTypes0065
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0065 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0066
     * @tc.name      testSize0066
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0066 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0067
     * @tc.name      testCountOf0067
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0067 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0068
     * @tc.name      testFirstLine0068
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0068 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0069
     * @tc.name      testLastLine0069
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0069 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#2 HOLDING unknown');
      log('testLastLine0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0070
     * @tc.name      testTypes0070
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0070 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0071
     * @tc.name      testSize0071
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0071 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0072
     * @tc.name      testCountOf0072
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0072 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0073
     * @tc.name      testFirstLine0073
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0073 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0074
     * @tc.name      testLastLine0074
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0074 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#3 DIALLING 911');
      log('testLastLine0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0075
     * @tc.name      testTypes0075
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0075 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('HOLDING', '13800138000');
      eventLog.append('DISCONNECTED', '13900139000');
      eventLog.append('DIALLING', '911');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0076
     * @tc.name      testSize0076
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0076 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0077
     * @tc.name      testCountOf0077
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0077 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0078
     * @tc.name      testFirstLine0078
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0078 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0079
     * @tc.name      testLastLine0079
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0079 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#4 HOLDING 13900139000');
      log('testLastLine0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0080
     * @tc.name      testTypes0080
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0080 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DISCONNECTED', '911');
      eventLog.append('DIALLING', 'unknown');
      eventLog.append('ACTIVE', '13800138000');
      eventLog.append('HOLDING', '13900139000');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0081
     * @tc.name      testSize0081
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0081 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0082
     * @tc.name      testCountOf0082
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0082 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0083
     * @tc.name      testFirstLine0083
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0083 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0084
     * @tc.name      testLastLine0084
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0084 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#5 DIALLING 13800138000');
      log('testLastLine0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0085
     * @tc.name      testTypes0085
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0085 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('DIALLING', '13800138000');
      eventLog.append('ACTIVE', '13900139000');
      eventLog.append('HOLDING', '911');
      eventLog.append('DISCONNECTED', 'unknown');
      eventLog.append('DIALLING', '13800138000');
      const actual: string[] = eventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0086
     * @tc.name      testSize0086
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0086 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: number = eventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0087
     * @tc.name      testCountOf0087
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0087 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: number = eventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0088
     * @tc.name      testFirstLine0088
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0088 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string = eventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENTLOG_0089
     * @tc.name      testLastLine0089
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0089 begin');
      const eventLog: CallEventLog = new CallEventLog();
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      eventLog.append('DISCONNECTED', '13800138000');
      eventLog.append('DIALLING', '13900139000');
      eventLog.append('ACTIVE', '911');
      eventLog.append('HOLDING', 'unknown');
      const actual: string = eventLog.lastLine();
      expect(actual).assertEqual('#6 HOLDING unknown');
      log('testLastLine0089 end');
      await yieldToMain();
    })
  })
}
