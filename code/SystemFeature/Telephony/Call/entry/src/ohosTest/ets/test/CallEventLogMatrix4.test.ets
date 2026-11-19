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
const TAG: string = 'CallEventLogMatrix4';
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

export default function callEventLogMatrix4Test(): void {
  describe('CallEventLogMatrix4', () => {
    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0268
     * @tc.name      testFirstLine0268
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0268 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0268 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0269
     * @tc.name      testLastLine0269
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0269 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#6 HOLDING unknown');
      log('testLastLine0269 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0270
     * @tc.name      testTypes0270
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0270 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0270 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0271
     * @tc.name      testSize0271
     * @tc.desc      size() after 1 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0271 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(1);
      log('testSize0271 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0272
     * @tc.name      testCountOf0272
     * @tc.desc      countOf(DIALLING) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0272 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(0);
      log('testCountOf0272 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0273
     * @tc.name      testFirstLine0273
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0273 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0273 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0274
     * @tc.name      testLastLine0274
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0274 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testLastLine0274 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0275
     * @tc.name      testTypes0275
     * @tc.desc      types() returns 1 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0275 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(1);
      log('testTypes0275 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0276
     * @tc.name      testSize0276
     * @tc.desc      size() after 2 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0276 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(2);
      log('testSize0276 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0277
     * @tc.name      testCountOf0277
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0277 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0277 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0278
     * @tc.name      testFirstLine0278
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0278 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0278 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0279
     * @tc.name      testLastLine0279
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0279 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#2 DIALLING unknown');
      log('testLastLine0279 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0280
     * @tc.name      testTypes0280
     * @tc.desc      types() returns 2 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0280 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(2);
      log('testTypes0280 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0281
     * @tc.name      testSize0281
     * @tc.desc      size() after 3 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0281 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(3);
      log('testSize0281 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0282
     * @tc.name      testCountOf0282
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0282 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0282 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0283
     * @tc.name      testFirstLine0283
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0283 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DIALLING 13800138000');
      log('testFirstLine0283 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0284
     * @tc.name      testLastLine0284
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0284 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#3 HOLDING 911');
      log('testLastLine0284 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0285
     * @tc.name      testTypes0285
     * @tc.desc      types() returns 3 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0285 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DIALLING', '13800138000');
      callEventLog.append('ACTIVE', '13900139000');
      callEventLog.append('HOLDING', '911');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(3);
      log('testTypes0285 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0286
     * @tc.name      testSize0286
     * @tc.desc      size() after 4 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0286 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(4);
      log('testSize0286 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0287
     * @tc.name      testCountOf0287
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0287 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0287 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0288
     * @tc.name      testFirstLine0288
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0288 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 ACTIVE 911');
      log('testFirstLine0288 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0289
     * @tc.name      testLastLine0289
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0289 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#4 DIALLING 13900139000');
      log('testLastLine0289 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0290
     * @tc.name      testTypes0290
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0290 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('ACTIVE', '911');
      callEventLog.append('HOLDING', 'unknown');
      callEventLog.append('DISCONNECTED', '13800138000');
      callEventLog.append('DIALLING', '13900139000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0290 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0291
     * @tc.name      testSize0291
     * @tc.desc      size() after 5 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0291 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(5);
      log('testSize0291 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0292
     * @tc.name      testCountOf0292
     * @tc.desc      countOf(DIALLING) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0292 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(1);
      log('testCountOf0292 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0293
     * @tc.name      testFirstLine0293
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0293 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 HOLDING 13800138000');
      log('testFirstLine0293 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0294
     * @tc.name      testLastLine0294
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0294 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#5 HOLDING 13800138000');
      log('testLastLine0294 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0295
     * @tc.name      testTypes0295
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0295 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('HOLDING', '13800138000');
      callEventLog.append('DISCONNECTED', '13900139000');
      callEventLog.append('DIALLING', '911');
      callEventLog.append('ACTIVE', 'unknown');
      callEventLog.append('HOLDING', '13800138000');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0295 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0296
     * @tc.name      testSize0296
     * @tc.desc      size() after 6 appends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSize0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSize0296 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.size();
      expect(actual).assertEqual(6);
      log('testSize0296 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0297
     * @tc.name      testCountOf0297
     * @tc.desc      countOf(DIALLING) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOf0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCountOf0297 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: number = callEventLog.countOf('DIALLING');
      expect(actual).assertEqual(2);
      log('testCountOf0297 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0298
     * @tc.name      testFirstLine0298
     * @tc.desc      firstLine() renders the first event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstLine0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFirstLine0298 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.firstLine();
      expect(actual).assertEqual('#1 DISCONNECTED 911');
      log('testFirstLine0298 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0299
     * @tc.name      testLastLine0299
     * @tc.desc      lastLine() renders the last event
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLastLine0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLastLine0299 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string = callEventLog.lastLine();
      expect(actual).assertEqual('#6 DIALLING unknown');
      log('testLastLine0299 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0300
     * @tc.name      testTypes0300
     * @tc.desc      types() returns 4 distinct event types
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTypes0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTypes0300 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      callEventLog.append('ACTIVE', '13800138000');
      callEventLog.append('HOLDING', '13900139000');
      callEventLog.append('DISCONNECTED', '911');
      callEventLog.append('DIALLING', 'unknown');
      const actual: string[] = callEventLog.types();
      expect(actual.length).assertEqual(4);
      log('testTypes0300 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0301
     * @tc.name      testEmptyLog0301
     * @tc.desc      an empty log has empty first and last lines
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyLog0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEmptyLog0301 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      expect(callEventLog.firstLine()).assertEqual('');
      expect(callEventLog.lastLine()).assertEqual('');
      expect(callEventLog.size()).assertEqual(0);
      log('testEmptyLog0301 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0302
     * @tc.name      testClear0302
     * @tc.desc      clear resets the log and the sequence number
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testClear0302 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      callEventLog.append('IDLE', 'none');
      callEventLog.clear();
      expect(callEventLog.size()).assertEqual(0);
      const seq: number = callEventLog.append('IDLE', 'none');
      expect(seq).assertEqual(1);
      log('testClear0302 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_EVENT_LOG_0303
     * @tc.name      testSequence0303
     * @tc.desc      append returns increasing sequence numbers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSequence0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSequence0303 begin');
      const callEventLog: CallEventLog = new CallEventLog();
      const first: number = callEventLog.append('IDLE', 'a');
      const second: number = callEventLog.append('IDLE', 'b');
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      log('testSequence0303 end');
      await yieldToMain();
    })
  })
}
