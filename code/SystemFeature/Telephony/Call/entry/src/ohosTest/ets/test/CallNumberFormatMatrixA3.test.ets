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
const TAG: string = 'CallNumberFormatMatrixA3';
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

export default function callNumberFormatMatrixA3Test(): void {
  describe('CallNumberFormatMatrixA3', () => {
    /**
     * @tc.number    SUB_CALL_NUMFMTA_0229
     * @tc.name      testMaskMiddle0229
     * @tc.desc      maskMiddle(13810000137,0,4) -> *******0137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0229 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 0, 4);
      expect(actual).assertEqual('*******0137');
      log('testMaskMiddle0229 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0230
     * @tc.name      testMaskMiddle0230
     * @tc.desc      maskMiddle(13810000137,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0230 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0230 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0231
     * @tc.name      testMaskMiddle0231
     * @tc.desc      maskMiddle(13810000137,11,0) -> 13810000137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0231 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 11, 0);
      expect(actual).assertEqual('13810000137');
      log('testMaskMiddle0231 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0232
     * @tc.name      testMaskMiddle0232
     * @tc.desc      maskMiddle(13810000137,12,0) -> 13810000137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0232 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 12, 0);
      expect(actual).assertEqual('13810000137');
      log('testMaskMiddle0232 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0233
     * @tc.name      testMaskMiddle0233
     * @tc.desc      maskMiddle(13810000137,6,6) -> 13810000137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0233 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 6, 6);
      expect(actual).assertEqual('13810000137');
      log('testMaskMiddle0233 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0234
     * @tc.name      testMaskMiddle0234
     * @tc.desc      maskMiddle(13810000137,2,3) -> 13******137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0234 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 2, 3);
      expect(actual).assertEqual('13******137');
      log('testMaskMiddle0234 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0235
     * @tc.name      testMaskMiddle0235
     * @tc.desc      maskMiddle(13810000137,5,5) -> 13810*00137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0235 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 5, 5);
      expect(actual).assertEqual('13810*00137');
      log('testMaskMiddle0235 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0236
     * @tc.name      testMaskMiddle0236
     * @tc.desc      maskMiddle(13810000274,3,4) -> 138****0274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0236 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 3, 4);
      expect(actual).assertEqual('138****0274');
      log('testMaskMiddle0236 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0237
     * @tc.name      testMaskMiddle0237
     * @tc.desc      maskMiddle(13810000274,4,4) -> 1381***0274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0237 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 4, 4);
      expect(actual).assertEqual('1381***0274');
      log('testMaskMiddle0237 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0238
     * @tc.name      testMaskMiddle0238
     * @tc.desc      maskMiddle(13810000274,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0238 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0238 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0239
     * @tc.name      testMaskMiddle0239
     * @tc.desc      maskMiddle(13810000274,0,4) -> *******0274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0239 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 0, 4);
      expect(actual).assertEqual('*******0274');
      log('testMaskMiddle0239 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0240
     * @tc.name      testMaskMiddle0240
     * @tc.desc      maskMiddle(13810000274,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0240 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0240 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0241
     * @tc.name      testMaskMiddle0241
     * @tc.desc      maskMiddle(13810000274,11,0) -> 13810000274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0241 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 11, 0);
      expect(actual).assertEqual('13810000274');
      log('testMaskMiddle0241 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0242
     * @tc.name      testMaskMiddle0242
     * @tc.desc      maskMiddle(13810000274,12,0) -> 13810000274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0242 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 12, 0);
      expect(actual).assertEqual('13810000274');
      log('testMaskMiddle0242 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0243
     * @tc.name      testMaskMiddle0243
     * @tc.desc      maskMiddle(13810000274,6,6) -> 13810000274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0243 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 6, 6);
      expect(actual).assertEqual('13810000274');
      log('testMaskMiddle0243 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0244
     * @tc.name      testMaskMiddle0244
     * @tc.desc      maskMiddle(13810000274,2,3) -> 13******274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0244 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 2, 3);
      expect(actual).assertEqual('13******274');
      log('testMaskMiddle0244 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0245
     * @tc.name      testMaskMiddle0245
     * @tc.desc      maskMiddle(13810000274,5,5) -> 13810*00274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0245 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000274', 5, 5);
      expect(actual).assertEqual('13810*00274');
      log('testMaskMiddle0245 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0246
     * @tc.name      testMaskMiddle0246
     * @tc.desc      maskMiddle(13810000411,3,4) -> 138****0411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0246 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 3, 4);
      expect(actual).assertEqual('138****0411');
      log('testMaskMiddle0246 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0247
     * @tc.name      testMaskMiddle0247
     * @tc.desc      maskMiddle(13810000411,4,4) -> 1381***0411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0247 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 4, 4);
      expect(actual).assertEqual('1381***0411');
      log('testMaskMiddle0247 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0248
     * @tc.name      testMaskMiddle0248
     * @tc.desc      maskMiddle(13810000411,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0248 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0248 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0249
     * @tc.name      testMaskMiddle0249
     * @tc.desc      maskMiddle(13810000411,0,4) -> *******0411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0249 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 0, 4);
      expect(actual).assertEqual('*******0411');
      log('testMaskMiddle0249 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0250
     * @tc.name      testMaskMiddle0250
     * @tc.desc      maskMiddle(13810000411,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0250 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0250 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0251
     * @tc.name      testMaskMiddle0251
     * @tc.desc      maskMiddle(13810000411,11,0) -> 13810000411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0251 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 11, 0);
      expect(actual).assertEqual('13810000411');
      log('testMaskMiddle0251 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0252
     * @tc.name      testMaskMiddle0252
     * @tc.desc      maskMiddle(13810000411,12,0) -> 13810000411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0252 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 12, 0);
      expect(actual).assertEqual('13810000411');
      log('testMaskMiddle0252 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0253
     * @tc.name      testMaskMiddle0253
     * @tc.desc      maskMiddle(13810000411,6,6) -> 13810000411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0253 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 6, 6);
      expect(actual).assertEqual('13810000411');
      log('testMaskMiddle0253 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0254
     * @tc.name      testMaskMiddle0254
     * @tc.desc      maskMiddle(13810000411,2,3) -> 13******411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0254 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 2, 3);
      expect(actual).assertEqual('13******411');
      log('testMaskMiddle0254 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0255
     * @tc.name      testMaskMiddle0255
     * @tc.desc      maskMiddle(13810000411,5,5) -> 13810*00411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0255 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000411', 5, 5);
      expect(actual).assertEqual('13810*00411');
      log('testMaskMiddle0255 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0256
     * @tc.name      testMaskMiddle0256
     * @tc.desc      maskMiddle(13810000548,3,4) -> 138****0548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0256 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 3, 4);
      expect(actual).assertEqual('138****0548');
      log('testMaskMiddle0256 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0257
     * @tc.name      testMaskMiddle0257
     * @tc.desc      maskMiddle(13810000548,4,4) -> 1381***0548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0257 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 4, 4);
      expect(actual).assertEqual('1381***0548');
      log('testMaskMiddle0257 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0258
     * @tc.name      testMaskMiddle0258
     * @tc.desc      maskMiddle(13810000548,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0258 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0258 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0259
     * @tc.name      testMaskMiddle0259
     * @tc.desc      maskMiddle(13810000548,0,4) -> *******0548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0259 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 0, 4);
      expect(actual).assertEqual('*******0548');
      log('testMaskMiddle0259 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0260
     * @tc.name      testMaskMiddle0260
     * @tc.desc      maskMiddle(13810000548,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0260 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0260 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0261
     * @tc.name      testMaskMiddle0261
     * @tc.desc      maskMiddle(13810000548,11,0) -> 13810000548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0261 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 11, 0);
      expect(actual).assertEqual('13810000548');
      log('testMaskMiddle0261 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0262
     * @tc.name      testMaskMiddle0262
     * @tc.desc      maskMiddle(13810000548,12,0) -> 13810000548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0262 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 12, 0);
      expect(actual).assertEqual('13810000548');
      log('testMaskMiddle0262 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0263
     * @tc.name      testMaskMiddle0263
     * @tc.desc      maskMiddle(13810000548,6,6) -> 13810000548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0263 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 6, 6);
      expect(actual).assertEqual('13810000548');
      log('testMaskMiddle0263 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0264
     * @tc.name      testMaskMiddle0264
     * @tc.desc      maskMiddle(13810000548,2,3) -> 13******548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0264 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 2, 3);
      expect(actual).assertEqual('13******548');
      log('testMaskMiddle0264 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0265
     * @tc.name      testMaskMiddle0265
     * @tc.desc      maskMiddle(13810000548,5,5) -> 13810*00548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0265 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000548', 5, 5);
      expect(actual).assertEqual('13810*00548');
      log('testMaskMiddle0265 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0266
     * @tc.name      testMaskMiddle0266
     * @tc.desc      maskMiddle(13810000685,3,4) -> 138****0685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0266 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 3, 4);
      expect(actual).assertEqual('138****0685');
      log('testMaskMiddle0266 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0267
     * @tc.name      testMaskMiddle0267
     * @tc.desc      maskMiddle(13810000685,4,4) -> 1381***0685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0267 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 4, 4);
      expect(actual).assertEqual('1381***0685');
      log('testMaskMiddle0267 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0268
     * @tc.name      testMaskMiddle0268
     * @tc.desc      maskMiddle(13810000685,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0268 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0268 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0269
     * @tc.name      testMaskMiddle0269
     * @tc.desc      maskMiddle(13810000685,0,4) -> *******0685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0269 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 0, 4);
      expect(actual).assertEqual('*******0685');
      log('testMaskMiddle0269 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0270
     * @tc.name      testMaskMiddle0270
     * @tc.desc      maskMiddle(13810000685,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0270 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0270 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0271
     * @tc.name      testMaskMiddle0271
     * @tc.desc      maskMiddle(13810000685,11,0) -> 13810000685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0271 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 11, 0);
      expect(actual).assertEqual('13810000685');
      log('testMaskMiddle0271 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0272
     * @tc.name      testMaskMiddle0272
     * @tc.desc      maskMiddle(13810000685,12,0) -> 13810000685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0272 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 12, 0);
      expect(actual).assertEqual('13810000685');
      log('testMaskMiddle0272 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0273
     * @tc.name      testMaskMiddle0273
     * @tc.desc      maskMiddle(13810000685,6,6) -> 13810000685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0273 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 6, 6);
      expect(actual).assertEqual('13810000685');
      log('testMaskMiddle0273 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0274
     * @tc.name      testMaskMiddle0274
     * @tc.desc      maskMiddle(13810000685,2,3) -> 13******685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0274 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 2, 3);
      expect(actual).assertEqual('13******685');
      log('testMaskMiddle0274 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0275
     * @tc.name      testMaskMiddle0275
     * @tc.desc      maskMiddle(13810000685,5,5) -> 13810*00685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0275 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000685', 5, 5);
      expect(actual).assertEqual('13810*00685');
      log('testMaskMiddle0275 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0276
     * @tc.name      testMaskMiddle0276
     * @tc.desc      maskMiddle(13810000822,3,4) -> 138****0822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0276 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 3, 4);
      expect(actual).assertEqual('138****0822');
      log('testMaskMiddle0276 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0277
     * @tc.name      testMaskMiddle0277
     * @tc.desc      maskMiddle(13810000822,4,4) -> 1381***0822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0277 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 4, 4);
      expect(actual).assertEqual('1381***0822');
      log('testMaskMiddle0277 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0278
     * @tc.name      testMaskMiddle0278
     * @tc.desc      maskMiddle(13810000822,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0278 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0278 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0279
     * @tc.name      testMaskMiddle0279
     * @tc.desc      maskMiddle(13810000822,0,4) -> *******0822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0279 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 0, 4);
      expect(actual).assertEqual('*******0822');
      log('testMaskMiddle0279 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0280
     * @tc.name      testMaskMiddle0280
     * @tc.desc      maskMiddle(13810000822,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0280 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0280 end');
      await yieldToMain();
    })
  })
}
