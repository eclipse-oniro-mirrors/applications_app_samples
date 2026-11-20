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
import { CallNumberFormatter } from '../../../main/ets/model/CallNumberFormatter';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallNumberFormatMatrixC3';
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

export default function callNumberFormatMatrixC3Test(): void {
  describe('CallNumberFormatMatrixC3', () => {
    /**
     * @tc.number    SUB_CALL_NUMFMTC_0229
     * @tc.name      testDigitCount0229
     * @tc.desc      digitCount(1009876536) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0229 begin');
      const actual: number = CallNumberFormatter.digitCount('1009876536');
      expect(actual).assertEqual(10);
      log('testDigitCount0229 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0230
     * @tc.name      testDigitCount0230
     * @tc.desc      digitCount(1011111103) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0230 begin');
      const actual: number = CallNumberFormatter.digitCount('1011111103');
      expect(actual).assertEqual(10);
      log('testDigitCount0230 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0231
     * @tc.name      testDigitCount0231
     * @tc.desc      digitCount(1012345670) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0231 begin');
      const actual: number = CallNumberFormatter.digitCount('1012345670');
      expect(actual).assertEqual(10);
      log('testDigitCount0231 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0232
     * @tc.name      testDigitCount0232
     * @tc.desc      digitCount(1013580237) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0232 begin');
      const actual: number = CallNumberFormatter.digitCount('1013580237');
      expect(actual).assertEqual(10);
      log('testDigitCount0232 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0233
     * @tc.name      testDigitCount0233
     * @tc.desc      digitCount(1014814804) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0233 begin');
      const actual: number = CallNumberFormatter.digitCount('1014814804');
      expect(actual).assertEqual(10);
      log('testDigitCount0233 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0234
     * @tc.name      testDigitCount0234
     * @tc.desc      digitCount(1016049371) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0234 begin');
      const actual: number = CallNumberFormatter.digitCount('1016049371');
      expect(actual).assertEqual(10);
      log('testDigitCount0234 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0235
     * @tc.name      testDigitCount0235
     * @tc.desc      digitCount(1017283938) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0235 begin');
      const actual: number = CallNumberFormatter.digitCount('1017283938');
      expect(actual).assertEqual(10);
      log('testDigitCount0235 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0236
     * @tc.name      testDigitCount0236
     * @tc.desc      digitCount(1018518505) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0236 begin');
      const actual: number = CallNumberFormatter.digitCount('1018518505');
      expect(actual).assertEqual(10);
      log('testDigitCount0236 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0237
     * @tc.name      testDigitCount0237
     * @tc.desc      digitCount(1019753072) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0237 begin');
      const actual: number = CallNumberFormatter.digitCount('1019753072');
      expect(actual).assertEqual(10);
      log('testDigitCount0237 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0238
     * @tc.name      testDigitCount0238
     * @tc.desc      digitCount(1020987639) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0238 begin');
      const actual: number = CallNumberFormatter.digitCount('1020987639');
      expect(actual).assertEqual(10);
      log('testDigitCount0238 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0239
     * @tc.name      testDigitCount0239
     * @tc.desc      digitCount(1022222206) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0239 begin');
      const actual: number = CallNumberFormatter.digitCount('1022222206');
      expect(actual).assertEqual(10);
      log('testDigitCount0239 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0240
     * @tc.name      testDigitCount0240
     * @tc.desc      digitCount(1023456773) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0240 begin');
      const actual: number = CallNumberFormatter.digitCount('1023456773');
      expect(actual).assertEqual(10);
      log('testDigitCount0240 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0241
     * @tc.name      testDigitCount0241
     * @tc.desc      digitCount(1024691340) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0241 begin');
      const actual: number = CallNumberFormatter.digitCount('1024691340');
      expect(actual).assertEqual(10);
      log('testDigitCount0241 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0242
     * @tc.name      testDigitCount0242
     * @tc.desc      digitCount(1025925907) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0242 begin');
      const actual: number = CallNumberFormatter.digitCount('1025925907');
      expect(actual).assertEqual(10);
      log('testDigitCount0242 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0243
     * @tc.name      testDigitCount0243
     * @tc.desc      digitCount(+8613800138000) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0243 begin');
      const actual: number = CallNumberFormatter.digitCount('+8613800138000');
      expect(actual).assertEqual(13);
      log('testDigitCount0243 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0244
     * @tc.name      testDigitCount0244
     * @tc.desc      digitCount(+8613912345678) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0244 begin');
      const actual: number = CallNumberFormatter.digitCount('+8613912345678');
      expect(actual).assertEqual(13);
      log('testDigitCount0244 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0245
     * @tc.name      testDigitCount0245
     * @tc.desc      digitCount(+14155550123) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0245 begin');
      const actual: number = CallNumberFormatter.digitCount('+14155550123');
      expect(actual).assertEqual(11);
      log('testDigitCount0245 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0246
     * @tc.name      testDigitCount0246
     * @tc.desc      digitCount(+442071838750) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0246 begin');
      const actual: number = CallNumberFormatter.digitCount('+442071838750');
      expect(actual).assertEqual(12);
      log('testDigitCount0246 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0247
     * @tc.name      testDigitCount0247
     * @tc.desc      digitCount(1234567) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0247 begin');
      const actual: number = CallNumberFormatter.digitCount('1234567');
      expect(actual).assertEqual(7);
      log('testDigitCount0247 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0248
     * @tc.name      testDigitCount0248
     * @tc.desc      digitCount(123456789) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0248 begin');
      const actual: number = CallNumberFormatter.digitCount('123456789');
      expect(actual).assertEqual(9);
      log('testDigitCount0248 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0249
     * @tc.name      testDigitCount0249
     * @tc.desc      digitCount(123456789012) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0249 begin');
      const actual: number = CallNumberFormatter.digitCount('123456789012');
      expect(actual).assertEqual(12);
      log('testDigitCount0249 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0250
     * @tc.name      testDigitCount0250
     * @tc.desc      digitCount(123) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0250 begin');
      const actual: number = CallNumberFormatter.digitCount('123');
      expect(actual).assertEqual(3);
      log('testDigitCount0250 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0251
     * @tc.name      testDigitCount0251
     * @tc.desc      digitCount(12345) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0251 begin');
      const actual: number = CallNumberFormatter.digitCount('12345');
      expect(actual).assertEqual(5);
      log('testDigitCount0251 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0252
     * @tc.name      testDigitCount0252
     * @tc.desc      digitCount(1) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0252 begin');
      const actual: number = CallNumberFormatter.digitCount('1');
      expect(actual).assertEqual(1);
      log('testDigitCount0252 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0253
     * @tc.name      testSameNumber0253
     * @tc.desc      sameNumber(13800138000,138 0013 8000) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSameNumber0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSameNumber0253 begin');
      const actual: boolean = CallNumberFormatter.sameNumber('13800138000', '138 0013 8000');
      expect(actual).assertEqual(true);
      log('testSameNumber0253 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0254
     * @tc.name      testSameNumber0254
     * @tc.desc      sameNumber(13800138000,138-0013-8000) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSameNumber0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSameNumber0254 begin');
      const actual: boolean = CallNumberFormatter.sameNumber('13800138000', '138-0013-8000');
      expect(actual).assertEqual(true);
      log('testSameNumber0254 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0255
     * @tc.name      testSameNumber0255
     * @tc.desc      sameNumber(+8613800138000,+86 138 0013 8000) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSameNumber0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSameNumber0255 begin');
      const actual: boolean = CallNumberFormatter.sameNumber('+8613800138000', '+86 138 0013 8000');
      expect(actual).assertEqual(true);
      log('testSameNumber0255 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0256
     * @tc.name      testSameNumber0256
     * @tc.desc      sameNumber(13800138000,13900139000) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSameNumber0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSameNumber0256 begin');
      const actual: boolean = CallNumberFormatter.sameNumber('13800138000', '13900139000');
      expect(actual).assertEqual(false);
      log('testSameNumber0256 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0257
     * @tc.name      testSameNumber0257
     * @tc.desc      sameNumber(,) -> true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSameNumber0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSameNumber0257 begin');
      const actual: boolean = CallNumberFormatter.sameNumber('', '');
      expect(actual).assertEqual(true);
      log('testSameNumber0257 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0258
     * @tc.name      testSameNumber0258
     * @tc.desc      sameNumber(123,1234) -> false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSameNumber0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSameNumber0258 begin');
      const actual: boolean = CallNumberFormatter.sameNumber('123', '1234');
      expect(actual).assertEqual(false);
      log('testSameNumber0258 end');
      await yieldToMain();
    })
  })
}
