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
import { CallDurationFormatter } from '../../../main/ets/model/CallDurationFormatter';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallDurationMatrix3';
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

export default function callDurationMatrix3Test(): void {
  describe('CallDurationMatrix3', () => {
    /**
     * @tc.number    SUB_CALL_DURATION_0229
     * @tc.name      testFormatWords0229
     * @tc.desc      formatWords(92 seconds) -> 1 min 32 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0229 begin');
      const actual: string = CallDurationFormatter.formatWords(92);
      expect(actual).assertEqual('1 min 32 sec');
      log('testFormatWords0229 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0230
     * @tc.name      testFormatWords0230
     * @tc.desc      formatWords(93 seconds) -> 1 min 33 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0230 begin');
      const actual: string = CallDurationFormatter.formatWords(93);
      expect(actual).assertEqual('1 min 33 sec');
      log('testFormatWords0230 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0231
     * @tc.name      testFormatWords0231
     * @tc.desc      formatWords(94 seconds) -> 1 min 34 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0231 begin');
      const actual: string = CallDurationFormatter.formatWords(94);
      expect(actual).assertEqual('1 min 34 sec');
      log('testFormatWords0231 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0232
     * @tc.name      testFormatWords0232
     * @tc.desc      formatWords(95 seconds) -> 1 min 35 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0232 begin');
      const actual: string = CallDurationFormatter.formatWords(95);
      expect(actual).assertEqual('1 min 35 sec');
      log('testFormatWords0232 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0233
     * @tc.name      testFormatWords0233
     * @tc.desc      formatWords(96 seconds) -> 1 min 36 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0233 begin');
      const actual: string = CallDurationFormatter.formatWords(96);
      expect(actual).assertEqual('1 min 36 sec');
      log('testFormatWords0233 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0234
     * @tc.name      testFormatWords0234
     * @tc.desc      formatWords(97 seconds) -> 1 min 37 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0234 begin');
      const actual: string = CallDurationFormatter.formatWords(97);
      expect(actual).assertEqual('1 min 37 sec');
      log('testFormatWords0234 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0235
     * @tc.name      testFormatWords0235
     * @tc.desc      formatWords(98 seconds) -> 1 min 38 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0235 begin');
      const actual: string = CallDurationFormatter.formatWords(98);
      expect(actual).assertEqual('1 min 38 sec');
      log('testFormatWords0235 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0236
     * @tc.name      testFormatWords0236
     * @tc.desc      formatWords(99 seconds) -> 1 min 39 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0236 begin');
      const actual: string = CallDurationFormatter.formatWords(99);
      expect(actual).assertEqual('1 min 39 sec');
      log('testFormatWords0236 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0237
     * @tc.name      testFormatWords0237
     * @tc.desc      formatWords(100 seconds) -> 1 min 40 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0237 begin');
      const actual: string = CallDurationFormatter.formatWords(100);
      expect(actual).assertEqual('1 min 40 sec');
      log('testFormatWords0237 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0238
     * @tc.name      testFormatWords0238
     * @tc.desc      formatWords(101 seconds) -> 1 min 41 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0238 begin');
      const actual: string = CallDurationFormatter.formatWords(101);
      expect(actual).assertEqual('1 min 41 sec');
      log('testFormatWords0238 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0239
     * @tc.name      testFormatWords0239
     * @tc.desc      formatWords(102 seconds) -> 1 min 42 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0239 begin');
      const actual: string = CallDurationFormatter.formatWords(102);
      expect(actual).assertEqual('1 min 42 sec');
      log('testFormatWords0239 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0240
     * @tc.name      testFormatWords0240
     * @tc.desc      formatWords(103 seconds) -> 1 min 43 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0240 begin');
      const actual: string = CallDurationFormatter.formatWords(103);
      expect(actual).assertEqual('1 min 43 sec');
      log('testFormatWords0240 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0241
     * @tc.name      testFormatWords0241
     * @tc.desc      formatWords(104 seconds) -> 1 min 44 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0241 begin');
      const actual: string = CallDurationFormatter.formatWords(104);
      expect(actual).assertEqual('1 min 44 sec');
      log('testFormatWords0241 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0242
     * @tc.name      testFormatWords0242
     * @tc.desc      formatWords(105 seconds) -> 1 min 45 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0242 begin');
      const actual: string = CallDurationFormatter.formatWords(105);
      expect(actual).assertEqual('1 min 45 sec');
      log('testFormatWords0242 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0243
     * @tc.name      testFormatWords0243
     * @tc.desc      formatWords(106 seconds) -> 1 min 46 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0243 begin');
      const actual: string = CallDurationFormatter.formatWords(106);
      expect(actual).assertEqual('1 min 46 sec');
      log('testFormatWords0243 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0244
     * @tc.name      testFormatWords0244
     * @tc.desc      formatWords(107 seconds) -> 1 min 47 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0244 begin');
      const actual: string = CallDurationFormatter.formatWords(107);
      expect(actual).assertEqual('1 min 47 sec');
      log('testFormatWords0244 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0245
     * @tc.name      testFormatWords0245
     * @tc.desc      formatWords(108 seconds) -> 1 min 48 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0245 begin');
      const actual: string = CallDurationFormatter.formatWords(108);
      expect(actual).assertEqual('1 min 48 sec');
      log('testFormatWords0245 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0246
     * @tc.name      testFormatWords0246
     * @tc.desc      formatWords(109 seconds) -> 1 min 49 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0246 begin');
      const actual: string = CallDurationFormatter.formatWords(109);
      expect(actual).assertEqual('1 min 49 sec');
      log('testFormatWords0246 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0247
     * @tc.name      testFormatWords0247
     * @tc.desc      formatWords(110 seconds) -> 1 min 50 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0247 begin');
      const actual: string = CallDurationFormatter.formatWords(110);
      expect(actual).assertEqual('1 min 50 sec');
      log('testFormatWords0247 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0248
     * @tc.name      testFormatWords0248
     * @tc.desc      formatWords(111 seconds) -> 1 min 51 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0248 begin');
      const actual: string = CallDurationFormatter.formatWords(111);
      expect(actual).assertEqual('1 min 51 sec');
      log('testFormatWords0248 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0249
     * @tc.name      testFormatWords0249
     * @tc.desc      formatWords(112 seconds) -> 1 min 52 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0249 begin');
      const actual: string = CallDurationFormatter.formatWords(112);
      expect(actual).assertEqual('1 min 52 sec');
      log('testFormatWords0249 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0250
     * @tc.name      testFormatWords0250
     * @tc.desc      formatWords(113 seconds) -> 1 min 53 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0250 begin');
      const actual: string = CallDurationFormatter.formatWords(113);
      expect(actual).assertEqual('1 min 53 sec');
      log('testFormatWords0250 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0251
     * @tc.name      testFormatWords0251
     * @tc.desc      formatWords(114 seconds) -> 1 min 54 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0251 begin');
      const actual: string = CallDurationFormatter.formatWords(114);
      expect(actual).assertEqual('1 min 54 sec');
      log('testFormatWords0251 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0252
     * @tc.name      testFormatWords0252
     * @tc.desc      formatWords(115 seconds) -> 1 min 55 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0252 begin');
      const actual: string = CallDurationFormatter.formatWords(115);
      expect(actual).assertEqual('1 min 55 sec');
      log('testFormatWords0252 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0253
     * @tc.name      testFormatWords0253
     * @tc.desc      formatWords(116 seconds) -> 1 min 56 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0253 begin');
      const actual: string = CallDurationFormatter.formatWords(116);
      expect(actual).assertEqual('1 min 56 sec');
      log('testFormatWords0253 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0254
     * @tc.name      testFormatWords0254
     * @tc.desc      formatWords(117 seconds) -> 1 min 57 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0254 begin');
      const actual: string = CallDurationFormatter.formatWords(117);
      expect(actual).assertEqual('1 min 57 sec');
      log('testFormatWords0254 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0255
     * @tc.name      testFormatWords0255
     * @tc.desc      formatWords(118 seconds) -> 1 min 58 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0255 begin');
      const actual: string = CallDurationFormatter.formatWords(118);
      expect(actual).assertEqual('1 min 58 sec');
      log('testFormatWords0255 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0256
     * @tc.name      testFormatWords0256
     * @tc.desc      formatWords(119 seconds) -> 1 min 59 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0256 begin');
      const actual: string = CallDurationFormatter.formatWords(119);
      expect(actual).assertEqual('1 min 59 sec');
      log('testFormatWords0256 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0257
     * @tc.name      testFormatWords0257
     * @tc.desc      formatWords(120 seconds) -> 2 min
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0257 begin');
      const actual: string = CallDurationFormatter.formatWords(120);
      expect(actual).assertEqual('2 min');
      log('testFormatWords0257 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0258
     * @tc.name      testFormatWords0258
     * @tc.desc      formatWords(179 seconds) -> 2 min 59 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0258 begin');
      const actual: string = CallDurationFormatter.formatWords(179);
      expect(actual).assertEqual('2 min 59 sec');
      log('testFormatWords0258 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0259
     * @tc.name      testFormatWords0259
     * @tc.desc      formatWords(180 seconds) -> 3 min
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0259 begin');
      const actual: string = CallDurationFormatter.formatWords(180);
      expect(actual).assertEqual('3 min');
      log('testFormatWords0259 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0260
     * @tc.name      testFormatWords0260
     * @tc.desc      formatWords(181 seconds) -> 3 min 1 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0260 begin');
      const actual: string = CallDurationFormatter.formatWords(181);
      expect(actual).assertEqual('3 min 1 sec');
      log('testFormatWords0260 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0261
     * @tc.name      testFormatWords0261
     * @tc.desc      formatWords(359 seconds) -> 5 min 59 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0261 begin');
      const actual: string = CallDurationFormatter.formatWords(359);
      expect(actual).assertEqual('5 min 59 sec');
      log('testFormatWords0261 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0262
     * @tc.name      testFormatWords0262
     * @tc.desc      formatWords(3599 seconds) -> 59 min 59 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0262 begin');
      const actual: string = CallDurationFormatter.formatWords(3599);
      expect(actual).assertEqual('59 min 59 sec');
      log('testFormatWords0262 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0263
     * @tc.name      testFormatWords0263
     * @tc.desc      formatWords(3600 seconds) -> 1 h
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0263 begin');
      const actual: string = CallDurationFormatter.formatWords(3600);
      expect(actual).assertEqual('1 h');
      log('testFormatWords0263 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0264
     * @tc.name      testFormatWords0264
     * @tc.desc      formatWords(3601 seconds) -> 1 h 1 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0264 begin');
      const actual: string = CallDurationFormatter.formatWords(3601);
      expect(actual).assertEqual('1 h 1 sec');
      log('testFormatWords0264 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0265
     * @tc.name      testFormatWords0265
     * @tc.desc      formatWords(7199 seconds) -> 1 h 59 min 59 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0265 begin');
      const actual: string = CallDurationFormatter.formatWords(7199);
      expect(actual).assertEqual('1 h 59 min 59 sec');
      log('testFormatWords0265 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0266
     * @tc.name      testFormatWords0266
     * @tc.desc      formatWords(7200 seconds) -> 2 h
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0266 begin');
      const actual: string = CallDurationFormatter.formatWords(7200);
      expect(actual).assertEqual('2 h');
      log('testFormatWords0266 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0267
     * @tc.name      testFormatWords0267
     * @tc.desc      formatWords(86399 seconds) -> 23 h 59 min 59 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0267 begin');
      const actual: string = CallDurationFormatter.formatWords(86399);
      expect(actual).assertEqual('23 h 59 min 59 sec');
      log('testFormatWords0267 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0268
     * @tc.name      testFormatWords0268
     * @tc.desc      formatWords(86400 seconds) -> 24 h
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0268 begin');
      const actual: string = CallDurationFormatter.formatWords(86400);
      expect(actual).assertEqual('24 h');
      log('testFormatWords0268 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0269
     * @tc.name      testFormatWords0269
     * @tc.desc      formatWords(90061 seconds) -> 25 h 1 min 1 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0269 begin');
      const actual: string = CallDurationFormatter.formatWords(90061);
      expect(actual).assertEqual('25 h 1 min 1 sec');
      log('testFormatWords0269 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0270
     * @tc.name      testFormatWords0270
     * @tc.desc      formatWords(99999 seconds) -> 27 h 46 min 39 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0270 begin');
      const actual: string = CallDurationFormatter.formatWords(99999);
      expect(actual).assertEqual('27 h 46 min 39 sec');
      log('testFormatWords0270 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0271
     * @tc.name      testFormatWords0271
     * @tc.desc      formatWords(-1 seconds) -> 0 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0271 begin');
      const actual: string = CallDurationFormatter.formatWords(-1);
      expect(actual).assertEqual('0 sec');
      log('testFormatWords0271 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0272
     * @tc.name      testFormatWords0272
     * @tc.desc      formatWords(-60 seconds) -> 0 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0272 begin');
      const actual: string = CallDurationFormatter.formatWords(-60);
      expect(actual).assertEqual('0 sec');
      log('testFormatWords0272 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0273
     * @tc.name      testBillableMinutes0273
     * @tc.desc      billableMinutes(0) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0273 begin');
      const actual: number = CallDurationFormatter.billableMinutes(0);
      expect(actual).assertEqual(0);
      log('testBillableMinutes0273 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0274
     * @tc.name      testBillableMinutes0274
     * @tc.desc      billableMinutes(1) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0274 begin');
      const actual: number = CallDurationFormatter.billableMinutes(1);
      expect(actual).assertEqual(1);
      log('testBillableMinutes0274 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0275
     * @tc.name      testBillableMinutes0275
     * @tc.desc      billableMinutes(30) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0275 begin');
      const actual: number = CallDurationFormatter.billableMinutes(30);
      expect(actual).assertEqual(1);
      log('testBillableMinutes0275 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0276
     * @tc.name      testBillableMinutes0276
     * @tc.desc      billableMinutes(59) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0276 begin');
      const actual: number = CallDurationFormatter.billableMinutes(59);
      expect(actual).assertEqual(1);
      log('testBillableMinutes0276 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0277
     * @tc.name      testBillableMinutes0277
     * @tc.desc      billableMinutes(60) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0277 begin');
      const actual: number = CallDurationFormatter.billableMinutes(60);
      expect(actual).assertEqual(1);
      log('testBillableMinutes0277 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0278
     * @tc.name      testBillableMinutes0278
     * @tc.desc      billableMinutes(61) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0278 begin');
      const actual: number = CallDurationFormatter.billableMinutes(61);
      expect(actual).assertEqual(2);
      log('testBillableMinutes0278 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0279
     * @tc.name      testBillableMinutes0279
     * @tc.desc      billableMinutes(90) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0279 begin');
      const actual: number = CallDurationFormatter.billableMinutes(90);
      expect(actual).assertEqual(2);
      log('testBillableMinutes0279 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0280
     * @tc.name      testBillableMinutes0280
     * @tc.desc      billableMinutes(119) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0280 begin');
      const actual: number = CallDurationFormatter.billableMinutes(119);
      expect(actual).assertEqual(2);
      log('testBillableMinutes0280 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0281
     * @tc.name      testBillableMinutes0281
     * @tc.desc      billableMinutes(120) -> 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0281 begin');
      const actual: number = CallDurationFormatter.billableMinutes(120);
      expect(actual).assertEqual(2);
      log('testBillableMinutes0281 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0282
     * @tc.name      testBillableMinutes0282
     * @tc.desc      billableMinutes(121) -> 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0282 begin');
      const actual: number = CallDurationFormatter.billableMinutes(121);
      expect(actual).assertEqual(3);
      log('testBillableMinutes0282 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0283
     * @tc.name      testBillableMinutes0283
     * @tc.desc      billableMinutes(180) -> 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0283 begin');
      const actual: number = CallDurationFormatter.billableMinutes(180);
      expect(actual).assertEqual(3);
      log('testBillableMinutes0283 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0284
     * @tc.name      testBillableMinutes0284
     * @tc.desc      billableMinutes(359) -> 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0284 begin');
      const actual: number = CallDurationFormatter.billableMinutes(359);
      expect(actual).assertEqual(6);
      log('testBillableMinutes0284 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0285
     * @tc.name      testBillableMinutes0285
     * @tc.desc      billableMinutes(360) -> 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0285 begin');
      const actual: number = CallDurationFormatter.billableMinutes(360);
      expect(actual).assertEqual(6);
      log('testBillableMinutes0285 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0286
     * @tc.name      testBillableMinutes0286
     * @tc.desc      billableMinutes(600) -> 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0286 begin');
      const actual: number = CallDurationFormatter.billableMinutes(600);
      expect(actual).assertEqual(10);
      log('testBillableMinutes0286 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0287
     * @tc.name      testBillableMinutes0287
     * @tc.desc      billableMinutes(3599) -> 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0287 begin');
      const actual: number = CallDurationFormatter.billableMinutes(3599);
      expect(actual).assertEqual(60);
      log('testBillableMinutes0287 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0288
     * @tc.name      testBillableMinutes0288
     * @tc.desc      billableMinutes(3600) -> 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0288 begin');
      const actual: number = CallDurationFormatter.billableMinutes(3600);
      expect(actual).assertEqual(60);
      log('testBillableMinutes0288 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0289
     * @tc.name      testBillableMinutes0289
     * @tc.desc      billableMinutes(3601) -> 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0289 begin');
      const actual: number = CallDurationFormatter.billableMinutes(3601);
      expect(actual).assertEqual(61);
      log('testBillableMinutes0289 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0290
     * @tc.name      testBillableMinutes0290
     * @tc.desc      billableMinutes(7200) -> 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0290 begin');
      const actual: number = CallDurationFormatter.billableMinutes(7200);
      expect(actual).assertEqual(120);
      log('testBillableMinutes0290 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0291
     * @tc.name      testBillableMinutes0291
     * @tc.desc      billableMinutes(-5) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBillableMinutes0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBillableMinutes0291 begin');
      const actual: number = CallDurationFormatter.billableMinutes(-5);
      expect(actual).assertEqual(0);
      log('testBillableMinutes0291 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0292
     * @tc.name      testPercentOfHour0292
     * @tc.desc      percentOfHour(0) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0292 begin');
      const actual: number = CallDurationFormatter.percentOfHour(0);
      expect(actual).assertEqual(0);
      log('testPercentOfHour0292 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0293
     * @tc.name      testPercentOfHour0293
     * @tc.desc      percentOfHour(1) -> 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0293 begin');
      const actual: number = CallDurationFormatter.percentOfHour(1);
      expect(actual).assertEqual(0.03);
      log('testPercentOfHour0293 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0294
     * @tc.name      testPercentOfHour0294
     * @tc.desc      percentOfHour(18) -> 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0294 begin');
      const actual: number = CallDurationFormatter.percentOfHour(18);
      expect(actual).assertEqual(0.5);
      log('testPercentOfHour0294 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0295
     * @tc.name      testPercentOfHour0295
     * @tc.desc      percentOfHour(36) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0295 begin');
      const actual: number = CallDurationFormatter.percentOfHour(36);
      expect(actual).assertEqual(1);
      log('testPercentOfHour0295 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0296
     * @tc.name      testPercentOfHour0296
     * @tc.desc      percentOfHour(60) -> 1.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0296 begin');
      const actual: number = CallDurationFormatter.percentOfHour(60);
      expect(actual).assertEqual(1.67);
      log('testPercentOfHour0296 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0297
     * @tc.name      testPercentOfHour0297
     * @tc.desc      percentOfHour(90) -> 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0297 begin');
      const actual: number = CallDurationFormatter.percentOfHour(90);
      expect(actual).assertEqual(2.5);
      log('testPercentOfHour0297 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0298
     * @tc.name      testPercentOfHour0298
     * @tc.desc      percentOfHour(180) -> 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0298 begin');
      const actual: number = CallDurationFormatter.percentOfHour(180);
      expect(actual).assertEqual(5);
      log('testPercentOfHour0298 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0299
     * @tc.name      testPercentOfHour0299
     * @tc.desc      percentOfHour(360) -> 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0299 begin');
      const actual: number = CallDurationFormatter.percentOfHour(360);
      expect(actual).assertEqual(10);
      log('testPercentOfHour0299 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0300
     * @tc.name      testPercentOfHour0300
     * @tc.desc      percentOfHour(600) -> 16.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0300 begin');
      const actual: number = CallDurationFormatter.percentOfHour(600);
      expect(actual).assertEqual(16.67);
      log('testPercentOfHour0300 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0301
     * @tc.name      testPercentOfHour0301
     * @tc.desc      percentOfHour(900) -> 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0301 begin');
      const actual: number = CallDurationFormatter.percentOfHour(900);
      expect(actual).assertEqual(25);
      log('testPercentOfHour0301 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0302
     * @tc.name      testPercentOfHour0302
     * @tc.desc      percentOfHour(1200) -> 33.33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0302 begin');
      const actual: number = CallDurationFormatter.percentOfHour(1200);
      expect(actual).assertEqual(33.33);
      log('testPercentOfHour0302 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0303
     * @tc.name      testPercentOfHour0303
     * @tc.desc      percentOfHour(1800) -> 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0303 begin');
      const actual: number = CallDurationFormatter.percentOfHour(1800);
      expect(actual).assertEqual(50);
      log('testPercentOfHour0303 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0304
     * @tc.name      testPercentOfHour0304
     * @tc.desc      percentOfHour(2400) -> 66.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0304 begin');
      const actual: number = CallDurationFormatter.percentOfHour(2400);
      expect(actual).assertEqual(66.67);
      log('testPercentOfHour0304 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0305
     * @tc.name      testPercentOfHour0305
     * @tc.desc      percentOfHour(3000) -> 83.33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0305 begin');
      const actual: number = CallDurationFormatter.percentOfHour(3000);
      expect(actual).assertEqual(83.33);
      log('testPercentOfHour0305 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0306
     * @tc.name      testPercentOfHour0306
     * @tc.desc      percentOfHour(3599) -> 99.97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0306 begin');
      const actual: number = CallDurationFormatter.percentOfHour(3599);
      expect(actual).assertEqual(99.97);
      log('testPercentOfHour0306 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0307
     * @tc.name      testPercentOfHour0307
     * @tc.desc      percentOfHour(3600) -> 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0307 begin');
      const actual: number = CallDurationFormatter.percentOfHour(3600);
      expect(actual).assertEqual(100);
      log('testPercentOfHour0307 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0308
     * @tc.name      testPercentOfHour0308
     * @tc.desc      percentOfHour(5400) -> 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0308 begin');
      const actual: number = CallDurationFormatter.percentOfHour(5400);
      expect(actual).assertEqual(150);
      log('testPercentOfHour0308 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0309
     * @tc.name      testPercentOfHour0309
     * @tc.desc      percentOfHour(7200) -> 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0309 begin');
      const actual: number = CallDurationFormatter.percentOfHour(7200);
      expect(actual).assertEqual(200);
      log('testPercentOfHour0309 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0310
     * @tc.name      testPercentOfHour0310
     * @tc.desc      percentOfHour(-10) -> 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOfHour0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testPercentOfHour0310 begin');
      const actual: number = CallDurationFormatter.percentOfHour(-10);
      expect(actual).assertEqual(0);
      log('testPercentOfHour0310 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0311
     * @tc.name      testSummary0311
     * @tc.desc      summary(0) combines both formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSummary0311 begin');
      const actual: string = CallDurationFormatter.summary(0);
      expect(actual).assertEqual('00:00 (0 sec)');
      log('testSummary0311 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0312
     * @tc.name      testSummary0312
     * @tc.desc      summary(5) combines both formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSummary0312 begin');
      const actual: string = CallDurationFormatter.summary(5);
      expect(actual).assertEqual('00:05 (5 sec)');
      log('testSummary0312 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0313
     * @tc.name      testSummary0313
     * @tc.desc      summary(65) combines both formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSummary0313 begin');
      const actual: string = CallDurationFormatter.summary(65);
      expect(actual).assertEqual('01:05 (1 min 5 sec)');
      log('testSummary0313 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0314
     * @tc.name      testSummary0314
     * @tc.desc      summary(125) combines both formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSummary0314 begin');
      const actual: string = CallDurationFormatter.summary(125);
      expect(actual).assertEqual('02:05 (2 min 5 sec)');
      log('testSummary0314 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0315
     * @tc.name      testSummary0315
     * @tc.desc      summary(3599) combines both formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSummary0315 begin');
      const actual: string = CallDurationFormatter.summary(3599);
      expect(actual).assertEqual('59:59 (59 min 59 sec)');
      log('testSummary0315 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0316
     * @tc.name      testSummary0316
     * @tc.desc      summary(3600) combines both formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSummary0316 begin');
      const actual: string = CallDurationFormatter.summary(3600);
      expect(actual).assertEqual('1:00:00 (1 h)');
      log('testSummary0316 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0317
     * @tc.name      testSummary0317
     * @tc.desc      summary(3661) combines both formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSummary0317 begin');
      const actual: string = CallDurationFormatter.summary(3661);
      expect(actual).assertEqual('1:01:01 (1 h 1 min 1 sec)');
      log('testSummary0317 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0318
     * @tc.name      testSummary0318
     * @tc.desc      summary(7325) combines both formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSummary0318 begin');
      const actual: string = CallDurationFormatter.summary(7325);
      expect(actual).assertEqual('2:02:05 (2 h 2 min 5 sec)');
      log('testSummary0318 end');
      await yieldToMain();
    })
  })
}
