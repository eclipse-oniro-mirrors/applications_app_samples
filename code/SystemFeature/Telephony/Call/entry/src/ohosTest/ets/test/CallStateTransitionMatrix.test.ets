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
import { CallStateMachine } from '../../../main/ets/model/CallStateMachine';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallStateTransitionMatrix';
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

export default function callStateTransitionMatrixTest(): void {
  describe('CallStateTransitionMatrix', () => {
    /**
     * @tc.number    SUB_CALL_STATE_0001
     * @tc.name      testNext0001
     * @tc.desc      next(IDLE,DIAL) -> DIALLING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0001 begin');
      const actual: string = CallStateMachine.next('IDLE', 'DIAL');
      expect(actual).assertEqual('DIALLING');
      log('testNext0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0002
     * @tc.name      testNext0002
     * @tc.desc      next(IDLE,INCOMING) -> RINGING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0002 begin');
      const actual: string = CallStateMachine.next('IDLE', 'INCOMING');
      expect(actual).assertEqual('RINGING');
      log('testNext0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0003
     * @tc.name      testNext0003
     * @tc.desc      next(IDLE,CONNECTED) -> IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0003 begin');
      const actual: string = CallStateMachine.next('IDLE', 'CONNECTED');
      expect(actual).assertEqual('IDLE');
      log('testNext0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0004
     * @tc.name      testNext0004
     * @tc.desc      next(IDLE,ANSWER) -> IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0004 begin');
      const actual: string = CallStateMachine.next('IDLE', 'ANSWER');
      expect(actual).assertEqual('IDLE');
      log('testNext0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0005
     * @tc.name      testNext0005
     * @tc.desc      next(IDLE,HOLD) -> IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0005 begin');
      const actual: string = CallStateMachine.next('IDLE', 'HOLD');
      expect(actual).assertEqual('IDLE');
      log('testNext0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0006
     * @tc.name      testNext0006
     * @tc.desc      next(IDLE,UNHOLD) -> IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0006 begin');
      const actual: string = CallStateMachine.next('IDLE', 'UNHOLD');
      expect(actual).assertEqual('IDLE');
      log('testNext0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0007
     * @tc.name      testNext0007
     * @tc.desc      next(IDLE,HANGUP) -> IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0007 begin');
      const actual: string = CallStateMachine.next('IDLE', 'HANGUP');
      expect(actual).assertEqual('IDLE');
      log('testNext0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0008
     * @tc.name      testNext0008
     * @tc.desc      next(IDLE,REJECT) -> IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0008 begin');
      const actual: string = CallStateMachine.next('IDLE', 'REJECT');
      expect(actual).assertEqual('IDLE');
      log('testNext0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0009
     * @tc.name      testNext0009
     * @tc.desc      next(IDLE,RESET) -> IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0009 begin');
      const actual: string = CallStateMachine.next('IDLE', 'RESET');
      expect(actual).assertEqual('IDLE');
      log('testNext0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0010
     * @tc.name      testNext0010
     * @tc.desc      next(DIALLING,DIAL) -> DIALLING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0010 begin');
      const actual: string = CallStateMachine.next('DIALLING', 'DIAL');
      expect(actual).assertEqual('DIALLING');
      log('testNext0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0011
     * @tc.name      testNext0011
     * @tc.desc      next(DIALLING,INCOMING) -> DIALLING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0011 begin');
      const actual: string = CallStateMachine.next('DIALLING', 'INCOMING');
      expect(actual).assertEqual('DIALLING');
      log('testNext0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0012
     * @tc.name      testNext0012
     * @tc.desc      next(DIALLING,CONNECTED) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0012 begin');
      const actual: string = CallStateMachine.next('DIALLING', 'CONNECTED');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0013
     * @tc.name      testNext0013
     * @tc.desc      next(DIALLING,ANSWER) -> DIALLING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0013 begin');
      const actual: string = CallStateMachine.next('DIALLING', 'ANSWER');
      expect(actual).assertEqual('DIALLING');
      log('testNext0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0014
     * @tc.name      testNext0014
     * @tc.desc      next(DIALLING,HOLD) -> DIALLING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0014 begin');
      const actual: string = CallStateMachine.next('DIALLING', 'HOLD');
      expect(actual).assertEqual('DIALLING');
      log('testNext0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0015
     * @tc.name      testNext0015
     * @tc.desc      next(DIALLING,UNHOLD) -> DIALLING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0015 begin');
      const actual: string = CallStateMachine.next('DIALLING', 'UNHOLD');
      expect(actual).assertEqual('DIALLING');
      log('testNext0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0016
     * @tc.name      testNext0016
     * @tc.desc      next(DIALLING,HANGUP) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0016 begin');
      const actual: string = CallStateMachine.next('DIALLING', 'HANGUP');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0017
     * @tc.name      testNext0017
     * @tc.desc      next(DIALLING,REJECT) -> DIALLING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0017 begin');
      const actual: string = CallStateMachine.next('DIALLING', 'REJECT');
      expect(actual).assertEqual('DIALLING');
      log('testNext0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0018
     * @tc.name      testNext0018
     * @tc.desc      next(DIALLING,RESET) -> DIALLING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0018 begin');
      const actual: string = CallStateMachine.next('DIALLING', 'RESET');
      expect(actual).assertEqual('DIALLING');
      log('testNext0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0019
     * @tc.name      testNext0019
     * @tc.desc      next(RINGING,DIAL) -> RINGING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0019 begin');
      const actual: string = CallStateMachine.next('RINGING', 'DIAL');
      expect(actual).assertEqual('RINGING');
      log('testNext0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0020
     * @tc.name      testNext0020
     * @tc.desc      next(RINGING,INCOMING) -> RINGING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0020 begin');
      const actual: string = CallStateMachine.next('RINGING', 'INCOMING');
      expect(actual).assertEqual('RINGING');
      log('testNext0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0021
     * @tc.name      testNext0021
     * @tc.desc      next(RINGING,CONNECTED) -> RINGING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0021 begin');
      const actual: string = CallStateMachine.next('RINGING', 'CONNECTED');
      expect(actual).assertEqual('RINGING');
      log('testNext0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0022
     * @tc.name      testNext0022
     * @tc.desc      next(RINGING,ANSWER) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0022 begin');
      const actual: string = CallStateMachine.next('RINGING', 'ANSWER');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0023
     * @tc.name      testNext0023
     * @tc.desc      next(RINGING,HOLD) -> RINGING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0023 begin');
      const actual: string = CallStateMachine.next('RINGING', 'HOLD');
      expect(actual).assertEqual('RINGING');
      log('testNext0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0024
     * @tc.name      testNext0024
     * @tc.desc      next(RINGING,UNHOLD) -> RINGING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0024 begin');
      const actual: string = CallStateMachine.next('RINGING', 'UNHOLD');
      expect(actual).assertEqual('RINGING');
      log('testNext0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0025
     * @tc.name      testNext0025
     * @tc.desc      next(RINGING,HANGUP) -> RINGING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0025 begin');
      const actual: string = CallStateMachine.next('RINGING', 'HANGUP');
      expect(actual).assertEqual('RINGING');
      log('testNext0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0026
     * @tc.name      testNext0026
     * @tc.desc      next(RINGING,REJECT) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0026 begin');
      const actual: string = CallStateMachine.next('RINGING', 'REJECT');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0027
     * @tc.name      testNext0027
     * @tc.desc      next(RINGING,RESET) -> RINGING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0027 begin');
      const actual: string = CallStateMachine.next('RINGING', 'RESET');
      expect(actual).assertEqual('RINGING');
      log('testNext0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0028
     * @tc.name      testNext0028
     * @tc.desc      next(ACTIVE,DIAL) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0028 begin');
      const actual: string = CallStateMachine.next('ACTIVE', 'DIAL');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0029
     * @tc.name      testNext0029
     * @tc.desc      next(ACTIVE,INCOMING) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0029 begin');
      const actual: string = CallStateMachine.next('ACTIVE', 'INCOMING');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0030
     * @tc.name      testNext0030
     * @tc.desc      next(ACTIVE,CONNECTED) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0030 begin');
      const actual: string = CallStateMachine.next('ACTIVE', 'CONNECTED');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0031
     * @tc.name      testNext0031
     * @tc.desc      next(ACTIVE,ANSWER) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0031 begin');
      const actual: string = CallStateMachine.next('ACTIVE', 'ANSWER');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0032
     * @tc.name      testNext0032
     * @tc.desc      next(ACTIVE,HOLD) -> HOLDING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0032 begin');
      const actual: string = CallStateMachine.next('ACTIVE', 'HOLD');
      expect(actual).assertEqual('HOLDING');
      log('testNext0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0033
     * @tc.name      testNext0033
     * @tc.desc      next(ACTIVE,UNHOLD) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0033 begin');
      const actual: string = CallStateMachine.next('ACTIVE', 'UNHOLD');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0034
     * @tc.name      testNext0034
     * @tc.desc      next(ACTIVE,HANGUP) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0034 begin');
      const actual: string = CallStateMachine.next('ACTIVE', 'HANGUP');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0035
     * @tc.name      testNext0035
     * @tc.desc      next(ACTIVE,REJECT) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0035 begin');
      const actual: string = CallStateMachine.next('ACTIVE', 'REJECT');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0036
     * @tc.name      testNext0036
     * @tc.desc      next(ACTIVE,RESET) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0036 begin');
      const actual: string = CallStateMachine.next('ACTIVE', 'RESET');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0037
     * @tc.name      testNext0037
     * @tc.desc      next(HOLDING,DIAL) -> HOLDING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0037 begin');
      const actual: string = CallStateMachine.next('HOLDING', 'DIAL');
      expect(actual).assertEqual('HOLDING');
      log('testNext0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0038
     * @tc.name      testNext0038
     * @tc.desc      next(HOLDING,INCOMING) -> HOLDING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0038 begin');
      const actual: string = CallStateMachine.next('HOLDING', 'INCOMING');
      expect(actual).assertEqual('HOLDING');
      log('testNext0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0039
     * @tc.name      testNext0039
     * @tc.desc      next(HOLDING,CONNECTED) -> HOLDING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0039 begin');
      const actual: string = CallStateMachine.next('HOLDING', 'CONNECTED');
      expect(actual).assertEqual('HOLDING');
      log('testNext0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0040
     * @tc.name      testNext0040
     * @tc.desc      next(HOLDING,ANSWER) -> HOLDING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0040 begin');
      const actual: string = CallStateMachine.next('HOLDING', 'ANSWER');
      expect(actual).assertEqual('HOLDING');
      log('testNext0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0041
     * @tc.name      testNext0041
     * @tc.desc      next(HOLDING,HOLD) -> HOLDING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0041 begin');
      const actual: string = CallStateMachine.next('HOLDING', 'HOLD');
      expect(actual).assertEqual('HOLDING');
      log('testNext0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0042
     * @tc.name      testNext0042
     * @tc.desc      next(HOLDING,UNHOLD) -> ACTIVE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0042 begin');
      const actual: string = CallStateMachine.next('HOLDING', 'UNHOLD');
      expect(actual).assertEqual('ACTIVE');
      log('testNext0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0043
     * @tc.name      testNext0043
     * @tc.desc      next(HOLDING,HANGUP) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0043 begin');
      const actual: string = CallStateMachine.next('HOLDING', 'HANGUP');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0044
     * @tc.name      testNext0044
     * @tc.desc      next(HOLDING,REJECT) -> HOLDING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0044 begin');
      const actual: string = CallStateMachine.next('HOLDING', 'REJECT');
      expect(actual).assertEqual('HOLDING');
      log('testNext0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0045
     * @tc.name      testNext0045
     * @tc.desc      next(HOLDING,RESET) -> HOLDING
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0045 begin');
      const actual: string = CallStateMachine.next('HOLDING', 'RESET');
      expect(actual).assertEqual('HOLDING');
      log('testNext0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0046
     * @tc.name      testNext0046
     * @tc.desc      next(DISCONNECTED,DIAL) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0046 begin');
      const actual: string = CallStateMachine.next('DISCONNECTED', 'DIAL');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0047
     * @tc.name      testNext0047
     * @tc.desc      next(DISCONNECTED,INCOMING) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0047 begin');
      const actual: string = CallStateMachine.next('DISCONNECTED', 'INCOMING');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0048
     * @tc.name      testNext0048
     * @tc.desc      next(DISCONNECTED,CONNECTED) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0048 begin');
      const actual: string = CallStateMachine.next('DISCONNECTED', 'CONNECTED');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0049
     * @tc.name      testNext0049
     * @tc.desc      next(DISCONNECTED,ANSWER) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0049 begin');
      const actual: string = CallStateMachine.next('DISCONNECTED', 'ANSWER');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0050
     * @tc.name      testNext0050
     * @tc.desc      next(DISCONNECTED,HOLD) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0050 begin');
      const actual: string = CallStateMachine.next('DISCONNECTED', 'HOLD');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0051
     * @tc.name      testNext0051
     * @tc.desc      next(DISCONNECTED,UNHOLD) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0051 begin');
      const actual: string = CallStateMachine.next('DISCONNECTED', 'UNHOLD');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0052
     * @tc.name      testNext0052
     * @tc.desc      next(DISCONNECTED,HANGUP) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0052 begin');
      const actual: string = CallStateMachine.next('DISCONNECTED', 'HANGUP');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0053
     * @tc.name      testNext0053
     * @tc.desc      next(DISCONNECTED,REJECT) -> DISCONNECTED
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0053 begin');
      const actual: string = CallStateMachine.next('DISCONNECTED', 'REJECT');
      expect(actual).assertEqual('DISCONNECTED');
      log('testNext0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0054
     * @tc.name      testNext0054
     * @tc.desc      next(DISCONNECTED,RESET) -> IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNext0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testNext0054 begin');
      const actual: string = CallStateMachine.next('DISCONNECTED', 'RESET');
      expect(actual).assertEqual('IDLE');
      log('testNext0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0055
     * @tc.name      testCanTransition0055
     * @tc.desc      canTransition(IDLE,IDLE) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0055 begin');
      const actual: boolean = CallStateMachine.canTransition('IDLE', 'IDLE');
      expect(actual).assertEqual(true);
      log('testCanTransition0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0056
     * @tc.name      testCanTransition0056
     * @tc.desc      canTransition(IDLE,DIALLING) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0056 begin');
      const actual: boolean = CallStateMachine.canTransition('IDLE', 'DIALLING');
      expect(actual).assertEqual(true);
      log('testCanTransition0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0057
     * @tc.name      testCanTransition0057
     * @tc.desc      canTransition(IDLE,RINGING) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0057 begin');
      const actual: boolean = CallStateMachine.canTransition('IDLE', 'RINGING');
      expect(actual).assertEqual(true);
      log('testCanTransition0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0058
     * @tc.name      testCanTransition0058
     * @tc.desc      canTransition(IDLE,ACTIVE) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0058 begin');
      const actual: boolean = CallStateMachine.canTransition('IDLE', 'ACTIVE');
      expect(actual).assertEqual(false);
      log('testCanTransition0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0059
     * @tc.name      testCanTransition0059
     * @tc.desc      canTransition(IDLE,HOLDING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0059 begin');
      const actual: boolean = CallStateMachine.canTransition('IDLE', 'HOLDING');
      expect(actual).assertEqual(false);
      log('testCanTransition0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0060
     * @tc.name      testCanTransition0060
     * @tc.desc      canTransition(IDLE,DISCONNECTED) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0060 begin');
      const actual: boolean = CallStateMachine.canTransition('IDLE', 'DISCONNECTED');
      expect(actual).assertEqual(false);
      log('testCanTransition0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0061
     * @tc.name      testCanTransition0061
     * @tc.desc      canTransition(DIALLING,IDLE) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0061 begin');
      const actual: boolean = CallStateMachine.canTransition('DIALLING', 'IDLE');
      expect(actual).assertEqual(false);
      log('testCanTransition0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0062
     * @tc.name      testCanTransition0062
     * @tc.desc      canTransition(DIALLING,DIALLING) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0062 begin');
      const actual: boolean = CallStateMachine.canTransition('DIALLING', 'DIALLING');
      expect(actual).assertEqual(true);
      log('testCanTransition0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0063
     * @tc.name      testCanTransition0063
     * @tc.desc      canTransition(DIALLING,RINGING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0063 begin');
      const actual: boolean = CallStateMachine.canTransition('DIALLING', 'RINGING');
      expect(actual).assertEqual(false);
      log('testCanTransition0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0064
     * @tc.name      testCanTransition0064
     * @tc.desc      canTransition(DIALLING,ACTIVE) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0064 begin');
      const actual: boolean = CallStateMachine.canTransition('DIALLING', 'ACTIVE');
      expect(actual).assertEqual(true);
      log('testCanTransition0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0065
     * @tc.name      testCanTransition0065
     * @tc.desc      canTransition(DIALLING,HOLDING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0065 begin');
      const actual: boolean = CallStateMachine.canTransition('DIALLING', 'HOLDING');
      expect(actual).assertEqual(false);
      log('testCanTransition0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0066
     * @tc.name      testCanTransition0066
     * @tc.desc      canTransition(DIALLING,DISCONNECTED) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0066 begin');
      const actual: boolean = CallStateMachine.canTransition('DIALLING', 'DISCONNECTED');
      expect(actual).assertEqual(true);
      log('testCanTransition0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0067
     * @tc.name      testCanTransition0067
     * @tc.desc      canTransition(RINGING,IDLE) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0067 begin');
      const actual: boolean = CallStateMachine.canTransition('RINGING', 'IDLE');
      expect(actual).assertEqual(false);
      log('testCanTransition0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0068
     * @tc.name      testCanTransition0068
     * @tc.desc      canTransition(RINGING,DIALLING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0068 begin');
      const actual: boolean = CallStateMachine.canTransition('RINGING', 'DIALLING');
      expect(actual).assertEqual(false);
      log('testCanTransition0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0069
     * @tc.name      testCanTransition0069
     * @tc.desc      canTransition(RINGING,RINGING) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0069 begin');
      const actual: boolean = CallStateMachine.canTransition('RINGING', 'RINGING');
      expect(actual).assertEqual(true);
      log('testCanTransition0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0070
     * @tc.name      testCanTransition0070
     * @tc.desc      canTransition(RINGING,ACTIVE) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0070 begin');
      const actual: boolean = CallStateMachine.canTransition('RINGING', 'ACTIVE');
      expect(actual).assertEqual(true);
      log('testCanTransition0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0071
     * @tc.name      testCanTransition0071
     * @tc.desc      canTransition(RINGING,HOLDING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0071 begin');
      const actual: boolean = CallStateMachine.canTransition('RINGING', 'HOLDING');
      expect(actual).assertEqual(false);
      log('testCanTransition0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0072
     * @tc.name      testCanTransition0072
     * @tc.desc      canTransition(RINGING,DISCONNECTED) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0072 begin');
      const actual: boolean = CallStateMachine.canTransition('RINGING', 'DISCONNECTED');
      expect(actual).assertEqual(true);
      log('testCanTransition0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0073
     * @tc.name      testCanTransition0073
     * @tc.desc      canTransition(ACTIVE,IDLE) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0073 begin');
      const actual: boolean = CallStateMachine.canTransition('ACTIVE', 'IDLE');
      expect(actual).assertEqual(false);
      log('testCanTransition0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0074
     * @tc.name      testCanTransition0074
     * @tc.desc      canTransition(ACTIVE,DIALLING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0074 begin');
      const actual: boolean = CallStateMachine.canTransition('ACTIVE', 'DIALLING');
      expect(actual).assertEqual(false);
      log('testCanTransition0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0075
     * @tc.name      testCanTransition0075
     * @tc.desc      canTransition(ACTIVE,RINGING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0075 begin');
      const actual: boolean = CallStateMachine.canTransition('ACTIVE', 'RINGING');
      expect(actual).assertEqual(false);
      log('testCanTransition0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0076
     * @tc.name      testCanTransition0076
     * @tc.desc      canTransition(ACTIVE,ACTIVE) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0076 begin');
      const actual: boolean = CallStateMachine.canTransition('ACTIVE', 'ACTIVE');
      expect(actual).assertEqual(true);
      log('testCanTransition0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0077
     * @tc.name      testCanTransition0077
     * @tc.desc      canTransition(ACTIVE,HOLDING) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0077 begin');
      const actual: boolean = CallStateMachine.canTransition('ACTIVE', 'HOLDING');
      expect(actual).assertEqual(true);
      log('testCanTransition0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0078
     * @tc.name      testCanTransition0078
     * @tc.desc      canTransition(ACTIVE,DISCONNECTED) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0078 begin');
      const actual: boolean = CallStateMachine.canTransition('ACTIVE', 'DISCONNECTED');
      expect(actual).assertEqual(true);
      log('testCanTransition0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0079
     * @tc.name      testCanTransition0079
     * @tc.desc      canTransition(HOLDING,IDLE) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0079 begin');
      const actual: boolean = CallStateMachine.canTransition('HOLDING', 'IDLE');
      expect(actual).assertEqual(false);
      log('testCanTransition0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0080
     * @tc.name      testCanTransition0080
     * @tc.desc      canTransition(HOLDING,DIALLING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0080 begin');
      const actual: boolean = CallStateMachine.canTransition('HOLDING', 'DIALLING');
      expect(actual).assertEqual(false);
      log('testCanTransition0080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0081
     * @tc.name      testCanTransition0081
     * @tc.desc      canTransition(HOLDING,RINGING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0081 begin');
      const actual: boolean = CallStateMachine.canTransition('HOLDING', 'RINGING');
      expect(actual).assertEqual(false);
      log('testCanTransition0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0082
     * @tc.name      testCanTransition0082
     * @tc.desc      canTransition(HOLDING,ACTIVE) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0082 begin');
      const actual: boolean = CallStateMachine.canTransition('HOLDING', 'ACTIVE');
      expect(actual).assertEqual(true);
      log('testCanTransition0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0083
     * @tc.name      testCanTransition0083
     * @tc.desc      canTransition(HOLDING,HOLDING) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0083 begin');
      const actual: boolean = CallStateMachine.canTransition('HOLDING', 'HOLDING');
      expect(actual).assertEqual(true);
      log('testCanTransition0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0084
     * @tc.name      testCanTransition0084
     * @tc.desc      canTransition(HOLDING,DISCONNECTED) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0084 begin');
      const actual: boolean = CallStateMachine.canTransition('HOLDING', 'DISCONNECTED');
      expect(actual).assertEqual(true);
      log('testCanTransition0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0085
     * @tc.name      testCanTransition0085
     * @tc.desc      canTransition(DISCONNECTED,IDLE) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0085 begin');
      const actual: boolean = CallStateMachine.canTransition('DISCONNECTED', 'IDLE');
      expect(actual).assertEqual(true);
      log('testCanTransition0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0086
     * @tc.name      testCanTransition0086
     * @tc.desc      canTransition(DISCONNECTED,DIALLING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0086 begin');
      const actual: boolean = CallStateMachine.canTransition('DISCONNECTED', 'DIALLING');
      expect(actual).assertEqual(false);
      log('testCanTransition0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0087
     * @tc.name      testCanTransition0087
     * @tc.desc      canTransition(DISCONNECTED,RINGING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0087 begin');
      const actual: boolean = CallStateMachine.canTransition('DISCONNECTED', 'RINGING');
      expect(actual).assertEqual(false);
      log('testCanTransition0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0088
     * @tc.name      testCanTransition0088
     * @tc.desc      canTransition(DISCONNECTED,ACTIVE) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0088 begin');
      const actual: boolean = CallStateMachine.canTransition('DISCONNECTED', 'ACTIVE');
      expect(actual).assertEqual(false);
      log('testCanTransition0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0089
     * @tc.name      testCanTransition0089
     * @tc.desc      canTransition(DISCONNECTED,HOLDING) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0089 begin');
      const actual: boolean = CallStateMachine.canTransition('DISCONNECTED', 'HOLDING');
      expect(actual).assertEqual(false);
      log('testCanTransition0089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0090
     * @tc.name      testCanTransition0090
     * @tc.desc      canTransition(DISCONNECTED,DISCONNECTED) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanTransition0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanTransition0090 begin');
      const actual: boolean = CallStateMachine.canTransition('DISCONNECTED', 'DISCONNECTED');
      expect(actual).assertEqual(true);
      log('testCanTransition0090 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0091
     * @tc.name      testLabel0091
     * @tc.desc      label(IDLE) -> idle
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabel0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLabel0091 begin');
      const actual: string = CallStateMachine.label('IDLE');
      expect(actual).assertEqual('idle');
      log('testLabel0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0092
     * @tc.name      testIsActive0092
     * @tc.desc      isActive(IDLE) checks call occupation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsActive0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsActive0092 begin');
      const actual: boolean = CallStateMachine.isActive('IDLE');
      expect(actual).assertEqual(false);
      log('testIsActive0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0093
     * @tc.name      testIsTerminal0093
     * @tc.desc      isTerminal(IDLE) checks the terminal state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsTerminal0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsTerminal0093 begin');
      const actual: boolean = CallStateMachine.isTerminal('IDLE');
      expect(actual).assertEqual(false);
      log('testIsTerminal0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0094
     * @tc.name      testLabel0094
     * @tc.desc      label(DIALLING) -> dialling
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabel0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLabel0094 begin');
      const actual: string = CallStateMachine.label('DIALLING');
      expect(actual).assertEqual('dialling');
      log('testLabel0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0095
     * @tc.name      testIsActive0095
     * @tc.desc      isActive(DIALLING) checks call occupation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsActive0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsActive0095 begin');
      const actual: boolean = CallStateMachine.isActive('DIALLING');
      expect(actual).assertEqual(false);
      log('testIsActive0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0096
     * @tc.name      testIsTerminal0096
     * @tc.desc      isTerminal(DIALLING) checks the terminal state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsTerminal0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsTerminal0096 begin');
      const actual: boolean = CallStateMachine.isTerminal('DIALLING');
      expect(actual).assertEqual(false);
      log('testIsTerminal0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0097
     * @tc.name      testLabel0097
     * @tc.desc      label(RINGING) -> ringing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabel0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLabel0097 begin');
      const actual: string = CallStateMachine.label('RINGING');
      expect(actual).assertEqual('ringing');
      log('testLabel0097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0098
     * @tc.name      testIsActive0098
     * @tc.desc      isActive(RINGING) checks call occupation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsActive0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsActive0098 begin');
      const actual: boolean = CallStateMachine.isActive('RINGING');
      expect(actual).assertEqual(false);
      log('testIsActive0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0099
     * @tc.name      testIsTerminal0099
     * @tc.desc      isTerminal(RINGING) checks the terminal state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsTerminal0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsTerminal0099 begin');
      const actual: boolean = CallStateMachine.isTerminal('RINGING');
      expect(actual).assertEqual(false);
      log('testIsTerminal0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0100
     * @tc.name      testLabel0100
     * @tc.desc      label(ACTIVE) -> active
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabel0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLabel0100 begin');
      const actual: string = CallStateMachine.label('ACTIVE');
      expect(actual).assertEqual('active');
      log('testLabel0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0101
     * @tc.name      testIsActive0101
     * @tc.desc      isActive(ACTIVE) checks call occupation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsActive0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsActive0101 begin');
      const actual: boolean = CallStateMachine.isActive('ACTIVE');
      expect(actual).assertEqual(true);
      log('testIsActive0101 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0102
     * @tc.name      testIsTerminal0102
     * @tc.desc      isTerminal(ACTIVE) checks the terminal state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsTerminal0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsTerminal0102 begin');
      const actual: boolean = CallStateMachine.isTerminal('ACTIVE');
      expect(actual).assertEqual(false);
      log('testIsTerminal0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0103
     * @tc.name      testLabel0103
     * @tc.desc      label(HOLDING) -> on hold
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabel0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLabel0103 begin');
      const actual: string = CallStateMachine.label('HOLDING');
      expect(actual).assertEqual('on hold');
      log('testLabel0103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0104
     * @tc.name      testIsActive0104
     * @tc.desc      isActive(HOLDING) checks call occupation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsActive0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsActive0104 begin');
      const actual: boolean = CallStateMachine.isActive('HOLDING');
      expect(actual).assertEqual(true);
      log('testIsActive0104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0105
     * @tc.name      testIsTerminal0105
     * @tc.desc      isTerminal(HOLDING) checks the terminal state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsTerminal0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsTerminal0105 begin');
      const actual: boolean = CallStateMachine.isTerminal('HOLDING');
      expect(actual).assertEqual(false);
      log('testIsTerminal0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0106
     * @tc.name      testLabel0106
     * @tc.desc      label(DISCONNECTED) -> disconnected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabel0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLabel0106 begin');
      const actual: string = CallStateMachine.label('DISCONNECTED');
      expect(actual).assertEqual('disconnected');
      log('testLabel0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0107
     * @tc.name      testIsActive0107
     * @tc.desc      isActive(DISCONNECTED) checks call occupation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsActive0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsActive0107 begin');
      const actual: boolean = CallStateMachine.isActive('DISCONNECTED');
      expect(actual).assertEqual(false);
      log('testIsActive0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0108
     * @tc.name      testIsTerminal0108
     * @tc.desc      isTerminal(DISCONNECTED) checks the terminal state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsTerminal0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIsTerminal0108 begin');
      const actual: boolean = CallStateMachine.isTerminal('DISCONNECTED');
      expect(actual).assertEqual(true);
      log('testIsTerminal0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0109
     * @tc.name      testChain0109
     * @tc.desc      state chain from IDLE via DIAL+CONNECTED+HOLD+UNHOLD+HANGUP+RESET ends at IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChain0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChain0109 begin');
      let current: string = 'IDLE';
      current = CallStateMachine.next(current, 'DIAL');
      current = CallStateMachine.next(current, 'CONNECTED');
      current = CallStateMachine.next(current, 'HOLD');
      current = CallStateMachine.next(current, 'UNHOLD');
      current = CallStateMachine.next(current, 'HANGUP');
      current = CallStateMachine.next(current, 'RESET');
      expect(current).assertEqual('IDLE');
      log('testChain0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0110
     * @tc.name      testChain0110
     * @tc.desc      state chain from IDLE via INCOMING+ANSWER+HANGUP+RESET ends at IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChain0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChain0110 begin');
      let current: string = 'IDLE';
      current = CallStateMachine.next(current, 'INCOMING');
      current = CallStateMachine.next(current, 'ANSWER');
      current = CallStateMachine.next(current, 'HANGUP');
      current = CallStateMachine.next(current, 'RESET');
      expect(current).assertEqual('IDLE');
      log('testChain0110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0111
     * @tc.name      testChain0111
     * @tc.desc      state chain from IDLE via INCOMING+REJECT+RESET ends at IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChain0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChain0111 begin');
      let current: string = 'IDLE';
      current = CallStateMachine.next(current, 'INCOMING');
      current = CallStateMachine.next(current, 'REJECT');
      current = CallStateMachine.next(current, 'RESET');
      expect(current).assertEqual('IDLE');
      log('testChain0111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0112
     * @tc.name      testChain0112
     * @tc.desc      state chain from IDLE via DIAL+HANGUP+RESET ends at IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChain0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChain0112 begin');
      let current: string = 'IDLE';
      current = CallStateMachine.next(current, 'DIAL');
      current = CallStateMachine.next(current, 'HANGUP');
      current = CallStateMachine.next(current, 'RESET');
      expect(current).assertEqual('IDLE');
      log('testChain0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0113
     * @tc.name      testChain0113
     * @tc.desc      state chain from IDLE via DIAL+CONNECTED+HANGUP+RESET ends at IDLE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChain0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChain0113 begin');
      let current: string = 'IDLE';
      current = CallStateMachine.next(current, 'DIAL');
      current = CallStateMachine.next(current, 'CONNECTED');
      current = CallStateMachine.next(current, 'HANGUP');
      current = CallStateMachine.next(current, 'RESET');
      expect(current).assertEqual('IDLE');
      log('testChain0113 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_STATE_0114
     * @tc.name      testAllStates0114
     * @tc.desc      allStates returns the six defined states
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAllStates0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAllStates0114 begin');
      const actual: string[] = CallStateMachine.allStates();
      expect(actual.length).assertEqual(6);
      expect(actual[5]).assertEqual('DISCONNECTED');
      log('testAllStates0114 end');
      await yieldToMain();
    })

  })
}
