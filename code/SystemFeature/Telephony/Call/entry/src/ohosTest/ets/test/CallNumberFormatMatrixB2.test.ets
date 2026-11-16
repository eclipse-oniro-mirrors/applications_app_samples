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
const TAG: string = 'CallNumberFormatMatrixB2';
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

export default function callNumberFormatMatrixB2Test(): void {
  describe('CallNumberFormatMatrixB2', () => {
    /**
     * @tc.number    SUB_CALL_NUMFMTB_0115
     * @tc.name      testMaskMiddle0115
     * @tc.desc      maskMiddle(13810002329,5,5) -> 13810*02329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0115 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 5, 5);
      expect(actual).assertEqual('13810*02329');
      log('testMaskMiddle0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0116
     * @tc.name      testMaskMiddle0116
     * @tc.desc      maskMiddle(13810002466,3,4) -> 138****2466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0116 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 3, 4);
      expect(actual).assertEqual('138****2466');
      log('testMaskMiddle0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0117
     * @tc.name      testMaskMiddle0117
     * @tc.desc      maskMiddle(13810002466,4,4) -> 1381***2466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0117 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 4, 4);
      expect(actual).assertEqual('1381***2466');
      log('testMaskMiddle0117 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0118
     * @tc.name      testMaskMiddle0118
     * @tc.desc      maskMiddle(13810002466,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0118 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0118 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0119
     * @tc.name      testMaskMiddle0119
     * @tc.desc      maskMiddle(13810002466,0,4) -> *******2466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0119 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 0, 4);
      expect(actual).assertEqual('*******2466');
      log('testMaskMiddle0119 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0120
     * @tc.name      testMaskMiddle0120
     * @tc.desc      maskMiddle(13810002466,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0120 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0120 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0121
     * @tc.name      testMaskMiddle0121
     * @tc.desc      maskMiddle(13810002466,11,0) -> 13810002466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0121 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 11, 0);
      expect(actual).assertEqual('13810002466');
      log('testMaskMiddle0121 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0122
     * @tc.name      testMaskMiddle0122
     * @tc.desc      maskMiddle(13810002466,12,0) -> 13810002466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0122 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 12, 0);
      expect(actual).assertEqual('13810002466');
      log('testMaskMiddle0122 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0123
     * @tc.name      testMaskMiddle0123
     * @tc.desc      maskMiddle(13810002466,6,6) -> 13810002466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0123 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 6, 6);
      expect(actual).assertEqual('13810002466');
      log('testMaskMiddle0123 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0124
     * @tc.name      testMaskMiddle0124
     * @tc.desc      maskMiddle(13810002466,2,3) -> 13******466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0124 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 2, 3);
      expect(actual).assertEqual('13******466');
      log('testMaskMiddle0124 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0125
     * @tc.name      testMaskMiddle0125
     * @tc.desc      maskMiddle(13810002466,5,5) -> 13810*02466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0125 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002466', 5, 5);
      expect(actual).assertEqual('13810*02466');
      log('testMaskMiddle0125 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0126
     * @tc.name      testMaskMiddle0126
     * @tc.desc      maskMiddle(13810002603,3,4) -> 138****2603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0126 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 3, 4);
      expect(actual).assertEqual('138****2603');
      log('testMaskMiddle0126 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0127
     * @tc.name      testMaskMiddle0127
     * @tc.desc      maskMiddle(13810002603,4,4) -> 1381***2603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0127 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 4, 4);
      expect(actual).assertEqual('1381***2603');
      log('testMaskMiddle0127 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0128
     * @tc.name      testMaskMiddle0128
     * @tc.desc      maskMiddle(13810002603,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0128 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0128 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0129
     * @tc.name      testMaskMiddle0129
     * @tc.desc      maskMiddle(13810002603,0,4) -> *******2603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0129 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 0, 4);
      expect(actual).assertEqual('*******2603');
      log('testMaskMiddle0129 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0130
     * @tc.name      testMaskMiddle0130
     * @tc.desc      maskMiddle(13810002603,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0130 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0130 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0131
     * @tc.name      testMaskMiddle0131
     * @tc.desc      maskMiddle(13810002603,11,0) -> 13810002603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0131 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 11, 0);
      expect(actual).assertEqual('13810002603');
      log('testMaskMiddle0131 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0132
     * @tc.name      testMaskMiddle0132
     * @tc.desc      maskMiddle(13810002603,12,0) -> 13810002603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0132 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 12, 0);
      expect(actual).assertEqual('13810002603');
      log('testMaskMiddle0132 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0133
     * @tc.name      testMaskMiddle0133
     * @tc.desc      maskMiddle(13810002603,6,6) -> 13810002603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0133 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 6, 6);
      expect(actual).assertEqual('13810002603');
      log('testMaskMiddle0133 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0134
     * @tc.name      testMaskMiddle0134
     * @tc.desc      maskMiddle(13810002603,2,3) -> 13******603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0134 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 2, 3);
      expect(actual).assertEqual('13******603');
      log('testMaskMiddle0134 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0135
     * @tc.name      testMaskMiddle0135
     * @tc.desc      maskMiddle(13810002603,5,5) -> 13810*02603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0135 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002603', 5, 5);
      expect(actual).assertEqual('13810*02603');
      log('testMaskMiddle0135 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0136
     * @tc.name      testMaskMiddle0136
     * @tc.desc      maskMiddle(13810002740,3,4) -> 138****2740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0136 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 3, 4);
      expect(actual).assertEqual('138****2740');
      log('testMaskMiddle0136 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0137
     * @tc.name      testMaskMiddle0137
     * @tc.desc      maskMiddle(13810002740,4,4) -> 1381***2740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0137 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 4, 4);
      expect(actual).assertEqual('1381***2740');
      log('testMaskMiddle0137 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0138
     * @tc.name      testMaskMiddle0138
     * @tc.desc      maskMiddle(13810002740,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0138 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0138 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0139
     * @tc.name      testMaskMiddle0139
     * @tc.desc      maskMiddle(13810002740,0,4) -> *******2740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0139 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 0, 4);
      expect(actual).assertEqual('*******2740');
      log('testMaskMiddle0139 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0140
     * @tc.name      testMaskMiddle0140
     * @tc.desc      maskMiddle(13810002740,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0140 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0140 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0141
     * @tc.name      testMaskMiddle0141
     * @tc.desc      maskMiddle(13810002740,11,0) -> 13810002740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0141 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 11, 0);
      expect(actual).assertEqual('13810002740');
      log('testMaskMiddle0141 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0142
     * @tc.name      testMaskMiddle0142
     * @tc.desc      maskMiddle(13810002740,12,0) -> 13810002740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0142 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 12, 0);
      expect(actual).assertEqual('13810002740');
      log('testMaskMiddle0142 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0143
     * @tc.name      testMaskMiddle0143
     * @tc.desc      maskMiddle(13810002740,6,6) -> 13810002740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0143 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 6, 6);
      expect(actual).assertEqual('13810002740');
      log('testMaskMiddle0143 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0144
     * @tc.name      testMaskMiddle0144
     * @tc.desc      maskMiddle(13810002740,2,3) -> 13******740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0144 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 2, 3);
      expect(actual).assertEqual('13******740');
      log('testMaskMiddle0144 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0145
     * @tc.name      testMaskMiddle0145
     * @tc.desc      maskMiddle(13810002740,5,5) -> 13810*02740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0145 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002740', 5, 5);
      expect(actual).assertEqual('13810*02740');
      log('testMaskMiddle0145 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0146
     * @tc.name      testMaskMiddle0146
     * @tc.desc      maskMiddle(13810002877,3,4) -> 138****2877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0146 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 3, 4);
      expect(actual).assertEqual('138****2877');
      log('testMaskMiddle0146 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0147
     * @tc.name      testMaskMiddle0147
     * @tc.desc      maskMiddle(13810002877,4,4) -> 1381***2877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0147 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 4, 4);
      expect(actual).assertEqual('1381***2877');
      log('testMaskMiddle0147 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0148
     * @tc.name      testMaskMiddle0148
     * @tc.desc      maskMiddle(13810002877,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0148 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0148 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0149
     * @tc.name      testMaskMiddle0149
     * @tc.desc      maskMiddle(13810002877,0,4) -> *******2877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0149 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 0, 4);
      expect(actual).assertEqual('*******2877');
      log('testMaskMiddle0149 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0150
     * @tc.name      testMaskMiddle0150
     * @tc.desc      maskMiddle(13810002877,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0150 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0150 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0151
     * @tc.name      testMaskMiddle0151
     * @tc.desc      maskMiddle(13810002877,11,0) -> 13810002877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0151 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 11, 0);
      expect(actual).assertEqual('13810002877');
      log('testMaskMiddle0151 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0152
     * @tc.name      testMaskMiddle0152
     * @tc.desc      maskMiddle(13810002877,12,0) -> 13810002877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0152 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 12, 0);
      expect(actual).assertEqual('13810002877');
      log('testMaskMiddle0152 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0153
     * @tc.name      testMaskMiddle0153
     * @tc.desc      maskMiddle(13810002877,6,6) -> 13810002877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0153 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 6, 6);
      expect(actual).assertEqual('13810002877');
      log('testMaskMiddle0153 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0154
     * @tc.name      testMaskMiddle0154
     * @tc.desc      maskMiddle(13810002877,2,3) -> 13******877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0154 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 2, 3);
      expect(actual).assertEqual('13******877');
      log('testMaskMiddle0154 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0155
     * @tc.name      testMaskMiddle0155
     * @tc.desc      maskMiddle(13810002877,5,5) -> 13810*02877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0155 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002877', 5, 5);
      expect(actual).assertEqual('13810*02877');
      log('testMaskMiddle0155 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0156
     * @tc.name      testMaskMiddle0156
     * @tc.desc      maskMiddle(13810003014,3,4) -> 138****3014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0156 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 3, 4);
      expect(actual).assertEqual('138****3014');
      log('testMaskMiddle0156 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0157
     * @tc.name      testMaskMiddle0157
     * @tc.desc      maskMiddle(13810003014,4,4) -> 1381***3014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0157 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 4, 4);
      expect(actual).assertEqual('1381***3014');
      log('testMaskMiddle0157 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0158
     * @tc.name      testMaskMiddle0158
     * @tc.desc      maskMiddle(13810003014,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0158 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0158 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0159
     * @tc.name      testMaskMiddle0159
     * @tc.desc      maskMiddle(13810003014,0,4) -> *******3014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0159 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 0, 4);
      expect(actual).assertEqual('*******3014');
      log('testMaskMiddle0159 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0160
     * @tc.name      testMaskMiddle0160
     * @tc.desc      maskMiddle(13810003014,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0160 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0160 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0161
     * @tc.name      testMaskMiddle0161
     * @tc.desc      maskMiddle(13810003014,11,0) -> 13810003014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0161 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 11, 0);
      expect(actual).assertEqual('13810003014');
      log('testMaskMiddle0161 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0162
     * @tc.name      testMaskMiddle0162
     * @tc.desc      maskMiddle(13810003014,12,0) -> 13810003014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0162 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 12, 0);
      expect(actual).assertEqual('13810003014');
      log('testMaskMiddle0162 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0163
     * @tc.name      testMaskMiddle0163
     * @tc.desc      maskMiddle(13810003014,6,6) -> 13810003014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0163 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 6, 6);
      expect(actual).assertEqual('13810003014');
      log('testMaskMiddle0163 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0164
     * @tc.name      testMaskMiddle0164
     * @tc.desc      maskMiddle(13810003014,2,3) -> 13******014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0164 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 2, 3);
      expect(actual).assertEqual('13******014');
      log('testMaskMiddle0164 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0165
     * @tc.name      testMaskMiddle0165
     * @tc.desc      maskMiddle(13810003014,5,5) -> 13810*03014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0165 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003014', 5, 5);
      expect(actual).assertEqual('13810*03014');
      log('testMaskMiddle0165 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0166
     * @tc.name      testMaskMiddle0166
     * @tc.desc      maskMiddle(13810003151,3,4) -> 138****3151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0166 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 3, 4);
      expect(actual).assertEqual('138****3151');
      log('testMaskMiddle0166 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0167
     * @tc.name      testMaskMiddle0167
     * @tc.desc      maskMiddle(13810003151,4,4) -> 1381***3151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0167 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 4, 4);
      expect(actual).assertEqual('1381***3151');
      log('testMaskMiddle0167 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0168
     * @tc.name      testMaskMiddle0168
     * @tc.desc      maskMiddle(13810003151,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0168 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0168 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0169
     * @tc.name      testMaskMiddle0169
     * @tc.desc      maskMiddle(13810003151,0,4) -> *******3151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0169 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 0, 4);
      expect(actual).assertEqual('*******3151');
      log('testMaskMiddle0169 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0170
     * @tc.name      testMaskMiddle0170
     * @tc.desc      maskMiddle(13810003151,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0170 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0170 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0171
     * @tc.name      testMaskMiddle0171
     * @tc.desc      maskMiddle(13810003151,11,0) -> 13810003151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0171 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 11, 0);
      expect(actual).assertEqual('13810003151');
      log('testMaskMiddle0171 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0172
     * @tc.name      testMaskMiddle0172
     * @tc.desc      maskMiddle(13810003151,12,0) -> 13810003151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0172 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 12, 0);
      expect(actual).assertEqual('13810003151');
      log('testMaskMiddle0172 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0173
     * @tc.name      testMaskMiddle0173
     * @tc.desc      maskMiddle(13810003151,6,6) -> 13810003151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0173 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 6, 6);
      expect(actual).assertEqual('13810003151');
      log('testMaskMiddle0173 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0174
     * @tc.name      testMaskMiddle0174
     * @tc.desc      maskMiddle(13810003151,2,3) -> 13******151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0174 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 2, 3);
      expect(actual).assertEqual('13******151');
      log('testMaskMiddle0174 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0175
     * @tc.name      testMaskMiddle0175
     * @tc.desc      maskMiddle(13810003151,5,5) -> 13810*03151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0175 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003151', 5, 5);
      expect(actual).assertEqual('13810*03151');
      log('testMaskMiddle0175 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0176
     * @tc.name      testMaskMiddle0176
     * @tc.desc      maskMiddle(13810003288,3,4) -> 138****3288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0176 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 3, 4);
      expect(actual).assertEqual('138****3288');
      log('testMaskMiddle0176 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0177
     * @tc.name      testMaskMiddle0177
     * @tc.desc      maskMiddle(13810003288,4,4) -> 1381***3288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0177 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 4, 4);
      expect(actual).assertEqual('1381***3288');
      log('testMaskMiddle0177 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0178
     * @tc.name      testMaskMiddle0178
     * @tc.desc      maskMiddle(13810003288,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0178 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0178 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0179
     * @tc.name      testMaskMiddle0179
     * @tc.desc      maskMiddle(13810003288,0,4) -> *******3288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0179 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 0, 4);
      expect(actual).assertEqual('*******3288');
      log('testMaskMiddle0179 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0180
     * @tc.name      testMaskMiddle0180
     * @tc.desc      maskMiddle(13810003288,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0180 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0180 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0181
     * @tc.name      testMaskMiddle0181
     * @tc.desc      maskMiddle(13810003288,11,0) -> 13810003288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0181 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 11, 0);
      expect(actual).assertEqual('13810003288');
      log('testMaskMiddle0181 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0182
     * @tc.name      testMaskMiddle0182
     * @tc.desc      maskMiddle(13810003288,12,0) -> 13810003288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0182 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 12, 0);
      expect(actual).assertEqual('13810003288');
      log('testMaskMiddle0182 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0183
     * @tc.name      testMaskMiddle0183
     * @tc.desc      maskMiddle(13810003288,6,6) -> 13810003288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0183 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 6, 6);
      expect(actual).assertEqual('13810003288');
      log('testMaskMiddle0183 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0184
     * @tc.name      testMaskMiddle0184
     * @tc.desc      maskMiddle(13810003288,2,3) -> 13******288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0184 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 2, 3);
      expect(actual).assertEqual('13******288');
      log('testMaskMiddle0184 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0185
     * @tc.name      testMaskMiddle0185
     * @tc.desc      maskMiddle(13810003288,5,5) -> 13810*03288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0185 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003288', 5, 5);
      expect(actual).assertEqual('13810*03288');
      log('testMaskMiddle0185 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0186
     * @tc.name      testMaskMiddle0186
     * @tc.desc      maskMiddle(13810003425,3,4) -> 138****3425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0186 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 3, 4);
      expect(actual).assertEqual('138****3425');
      log('testMaskMiddle0186 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0187
     * @tc.name      testMaskMiddle0187
     * @tc.desc      maskMiddle(13810003425,4,4) -> 1381***3425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0187 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 4, 4);
      expect(actual).assertEqual('1381***3425');
      log('testMaskMiddle0187 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0188
     * @tc.name      testMaskMiddle0188
     * @tc.desc      maskMiddle(13810003425,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0188 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0188 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0189
     * @tc.name      testMaskMiddle0189
     * @tc.desc      maskMiddle(13810003425,0,4) -> *******3425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0189 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 0, 4);
      expect(actual).assertEqual('*******3425');
      log('testMaskMiddle0189 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0190
     * @tc.name      testMaskMiddle0190
     * @tc.desc      maskMiddle(13810003425,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0190 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0190 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0191
     * @tc.name      testMaskMiddle0191
     * @tc.desc      maskMiddle(13810003425,11,0) -> 13810003425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0191 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 11, 0);
      expect(actual).assertEqual('13810003425');
      log('testMaskMiddle0191 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0192
     * @tc.name      testMaskMiddle0192
     * @tc.desc      maskMiddle(13810003425,12,0) -> 13810003425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0192 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 12, 0);
      expect(actual).assertEqual('13810003425');
      log('testMaskMiddle0192 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0193
     * @tc.name      testMaskMiddle0193
     * @tc.desc      maskMiddle(13810003425,6,6) -> 13810003425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0193 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 6, 6);
      expect(actual).assertEqual('13810003425');
      log('testMaskMiddle0193 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0194
     * @tc.name      testMaskMiddle0194
     * @tc.desc      maskMiddle(13810003425,2,3) -> 13******425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0194 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 2, 3);
      expect(actual).assertEqual('13******425');
      log('testMaskMiddle0194 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0195
     * @tc.name      testMaskMiddle0195
     * @tc.desc      maskMiddle(13810003425,5,5) -> 13810*03425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0195 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003425', 5, 5);
      expect(actual).assertEqual('13810*03425');
      log('testMaskMiddle0195 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0196
     * @tc.name      testMaskMiddle0196
     * @tc.desc      maskMiddle(13810003562,3,4) -> 138****3562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0196 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 3, 4);
      expect(actual).assertEqual('138****3562');
      log('testMaskMiddle0196 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0197
     * @tc.name      testMaskMiddle0197
     * @tc.desc      maskMiddle(13810003562,4,4) -> 1381***3562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0197 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 4, 4);
      expect(actual).assertEqual('1381***3562');
      log('testMaskMiddle0197 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0198
     * @tc.name      testMaskMiddle0198
     * @tc.desc      maskMiddle(13810003562,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0198 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0198 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0199
     * @tc.name      testMaskMiddle0199
     * @tc.desc      maskMiddle(13810003562,0,4) -> *******3562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0199 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 0, 4);
      expect(actual).assertEqual('*******3562');
      log('testMaskMiddle0199 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0200
     * @tc.name      testMaskMiddle0200
     * @tc.desc      maskMiddle(13810003562,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0200 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0200 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0201
     * @tc.name      testMaskMiddle0201
     * @tc.desc      maskMiddle(13810003562,11,0) -> 13810003562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0201 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 11, 0);
      expect(actual).assertEqual('13810003562');
      log('testMaskMiddle0201 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0202
     * @tc.name      testMaskMiddle0202
     * @tc.desc      maskMiddle(13810003562,12,0) -> 13810003562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0202 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 12, 0);
      expect(actual).assertEqual('13810003562');
      log('testMaskMiddle0202 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0203
     * @tc.name      testMaskMiddle0203
     * @tc.desc      maskMiddle(13810003562,6,6) -> 13810003562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0203 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 6, 6);
      expect(actual).assertEqual('13810003562');
      log('testMaskMiddle0203 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0204
     * @tc.name      testMaskMiddle0204
     * @tc.desc      maskMiddle(13810003562,2,3) -> 13******562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0204 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 2, 3);
      expect(actual).assertEqual('13******562');
      log('testMaskMiddle0204 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0205
     * @tc.name      testMaskMiddle0205
     * @tc.desc      maskMiddle(13810003562,5,5) -> 13810*03562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0205 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003562', 5, 5);
      expect(actual).assertEqual('13810*03562');
      log('testMaskMiddle0205 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0206
     * @tc.name      testMaskMiddle0206
     * @tc.desc      maskMiddle(13810003699,3,4) -> 138****3699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0206 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 3, 4);
      expect(actual).assertEqual('138****3699');
      log('testMaskMiddle0206 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0207
     * @tc.name      testMaskMiddle0207
     * @tc.desc      maskMiddle(13810003699,4,4) -> 1381***3699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0207 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 4, 4);
      expect(actual).assertEqual('1381***3699');
      log('testMaskMiddle0207 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0208
     * @tc.name      testMaskMiddle0208
     * @tc.desc      maskMiddle(13810003699,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0208 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0208 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0209
     * @tc.name      testMaskMiddle0209
     * @tc.desc      maskMiddle(13810003699,0,4) -> *******3699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0209 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 0, 4);
      expect(actual).assertEqual('*******3699');
      log('testMaskMiddle0209 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0210
     * @tc.name      testMaskMiddle0210
     * @tc.desc      maskMiddle(13810003699,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0210 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0210 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0211
     * @tc.name      testMaskMiddle0211
     * @tc.desc      maskMiddle(13810003699,11,0) -> 13810003699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0211 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 11, 0);
      expect(actual).assertEqual('13810003699');
      log('testMaskMiddle0211 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0212
     * @tc.name      testMaskMiddle0212
     * @tc.desc      maskMiddle(13810003699,12,0) -> 13810003699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0212 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 12, 0);
      expect(actual).assertEqual('13810003699');
      log('testMaskMiddle0212 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0213
     * @tc.name      testMaskMiddle0213
     * @tc.desc      maskMiddle(13810003699,6,6) -> 13810003699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0213 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 6, 6);
      expect(actual).assertEqual('13810003699');
      log('testMaskMiddle0213 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0214
     * @tc.name      testMaskMiddle0214
     * @tc.desc      maskMiddle(13810003699,2,3) -> 13******699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0214 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 2, 3);
      expect(actual).assertEqual('13******699');
      log('testMaskMiddle0214 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0215
     * @tc.name      testMaskMiddle0215
     * @tc.desc      maskMiddle(13810003699,5,5) -> 13810*03699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0215 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003699', 5, 5);
      expect(actual).assertEqual('13810*03699');
      log('testMaskMiddle0215 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0216
     * @tc.name      testMaskMiddle0216
     * @tc.desc      maskMiddle(13810003836,3,4) -> 138****3836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0216 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 3, 4);
      expect(actual).assertEqual('138****3836');
      log('testMaskMiddle0216 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0217
     * @tc.name      testMaskMiddle0217
     * @tc.desc      maskMiddle(13810003836,4,4) -> 1381***3836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0217 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 4, 4);
      expect(actual).assertEqual('1381***3836');
      log('testMaskMiddle0217 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0218
     * @tc.name      testMaskMiddle0218
     * @tc.desc      maskMiddle(13810003836,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0218 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0218 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0219
     * @tc.name      testMaskMiddle0219
     * @tc.desc      maskMiddle(13810003836,0,4) -> *******3836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0219 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 0, 4);
      expect(actual).assertEqual('*******3836');
      log('testMaskMiddle0219 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0220
     * @tc.name      testMaskMiddle0220
     * @tc.desc      maskMiddle(13810003836,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0220 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0220 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0221
     * @tc.name      testMaskMiddle0221
     * @tc.desc      maskMiddle(13810003836,11,0) -> 13810003836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0221 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 11, 0);
      expect(actual).assertEqual('13810003836');
      log('testMaskMiddle0221 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0222
     * @tc.name      testMaskMiddle0222
     * @tc.desc      maskMiddle(13810003836,12,0) -> 13810003836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0222 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 12, 0);
      expect(actual).assertEqual('13810003836');
      log('testMaskMiddle0222 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0223
     * @tc.name      testMaskMiddle0223
     * @tc.desc      maskMiddle(13810003836,6,6) -> 13810003836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0223 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 6, 6);
      expect(actual).assertEqual('13810003836');
      log('testMaskMiddle0223 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0224
     * @tc.name      testMaskMiddle0224
     * @tc.desc      maskMiddle(13810003836,2,3) -> 13******836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0224 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 2, 3);
      expect(actual).assertEqual('13******836');
      log('testMaskMiddle0224 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0225
     * @tc.name      testMaskMiddle0225
     * @tc.desc      maskMiddle(13810003836,5,5) -> 13810*03836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0225 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003836', 5, 5);
      expect(actual).assertEqual('13810*03836');
      log('testMaskMiddle0225 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0226
     * @tc.name      testMaskMiddle0226
     * @tc.desc      maskMiddle(13810003973,3,4) -> 138****3973
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0226 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003973', 3, 4);
      expect(actual).assertEqual('138****3973');
      log('testMaskMiddle0226 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0227
     * @tc.name      testMaskMiddle0227
     * @tc.desc      maskMiddle(13810003973,4,4) -> 1381***3973
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0227 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003973', 4, 4);
      expect(actual).assertEqual('1381***3973');
      log('testMaskMiddle0227 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0228
     * @tc.name      testMaskMiddle0228
     * @tc.desc      maskMiddle(13810003973,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0228 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810003973', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0228 end');
      await yieldToMain();
    })
  })
}
