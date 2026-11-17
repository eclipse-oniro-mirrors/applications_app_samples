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
const TAG: string = 'CallNumberFormatMatrixC2';
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

export default function callNumberFormatMatrixC2Test(): void {
  describe('CallNumberFormatMatrixC2', () => {
    /**
     * @tc.number    SUB_CALL_NUMFMTC_0115
     * @tc.name      testMaskMiddle0115
     * @tc.desc      maskMiddle(15920008041,5,5) -> 15920*08041
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0115 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008041', 5, 5);
      expect(actual).assertEqual('15920*08041');
      log('testMaskMiddle0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0116
     * @tc.name      testMaskMiddle0116
     * @tc.desc      maskMiddle(15920008772,3,4) -> 159****8772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0116 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 3, 4);
      expect(actual).assertEqual('159****8772');
      log('testMaskMiddle0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0117
     * @tc.name      testMaskMiddle0117
     * @tc.desc      maskMiddle(15920008772,4,4) -> 1592***8772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0117 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 4, 4);
      expect(actual).assertEqual('1592***8772');
      log('testMaskMiddle0117 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0118
     * @tc.name      testMaskMiddle0118
     * @tc.desc      maskMiddle(15920008772,3,0) -> 159********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0118 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 3, 0);
      expect(actual).assertEqual('159********');
      log('testMaskMiddle0118 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0119
     * @tc.name      testMaskMiddle0119
     * @tc.desc      maskMiddle(15920008772,0,4) -> *******8772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0119 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 0, 4);
      expect(actual).assertEqual('*******8772');
      log('testMaskMiddle0119 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0120
     * @tc.name      testMaskMiddle0120
     * @tc.desc      maskMiddle(15920008772,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0120 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0120 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0121
     * @tc.name      testMaskMiddle0121
     * @tc.desc      maskMiddle(15920008772,11,0) -> 15920008772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0121 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 11, 0);
      expect(actual).assertEqual('15920008772');
      log('testMaskMiddle0121 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0122
     * @tc.name      testMaskMiddle0122
     * @tc.desc      maskMiddle(15920008772,12,0) -> 15920008772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0122 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 12, 0);
      expect(actual).assertEqual('15920008772');
      log('testMaskMiddle0122 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0123
     * @tc.name      testMaskMiddle0123
     * @tc.desc      maskMiddle(15920008772,6,6) -> 15920008772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0123 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 6, 6);
      expect(actual).assertEqual('15920008772');
      log('testMaskMiddle0123 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0124
     * @tc.name      testMaskMiddle0124
     * @tc.desc      maskMiddle(15920008772,2,3) -> 15******772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0124 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 2, 3);
      expect(actual).assertEqual('15******772');
      log('testMaskMiddle0124 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0125
     * @tc.name      testMaskMiddle0125
     * @tc.desc      maskMiddle(15920008772,5,5) -> 15920*08772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0125 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920008772', 5, 5);
      expect(actual).assertEqual('15920*08772');
      log('testMaskMiddle0125 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0126
     * @tc.name      testMaskMiddle0126
     * @tc.desc      maskMiddle(15920009503,3,4) -> 159****9503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0126 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 3, 4);
      expect(actual).assertEqual('159****9503');
      log('testMaskMiddle0126 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0127
     * @tc.name      testMaskMiddle0127
     * @tc.desc      maskMiddle(15920009503,4,4) -> 1592***9503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0127 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 4, 4);
      expect(actual).assertEqual('1592***9503');
      log('testMaskMiddle0127 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0128
     * @tc.name      testMaskMiddle0128
     * @tc.desc      maskMiddle(15920009503,3,0) -> 159********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0128 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 3, 0);
      expect(actual).assertEqual('159********');
      log('testMaskMiddle0128 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0129
     * @tc.name      testMaskMiddle0129
     * @tc.desc      maskMiddle(15920009503,0,4) -> *******9503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0129 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 0, 4);
      expect(actual).assertEqual('*******9503');
      log('testMaskMiddle0129 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0130
     * @tc.name      testMaskMiddle0130
     * @tc.desc      maskMiddle(15920009503,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0130 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0130 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0131
     * @tc.name      testMaskMiddle0131
     * @tc.desc      maskMiddle(15920009503,11,0) -> 15920009503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0131 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 11, 0);
      expect(actual).assertEqual('15920009503');
      log('testMaskMiddle0131 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0132
     * @tc.name      testMaskMiddle0132
     * @tc.desc      maskMiddle(15920009503,12,0) -> 15920009503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0132 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 12, 0);
      expect(actual).assertEqual('15920009503');
      log('testMaskMiddle0132 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0133
     * @tc.name      testMaskMiddle0133
     * @tc.desc      maskMiddle(15920009503,6,6) -> 15920009503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0133 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 6, 6);
      expect(actual).assertEqual('15920009503');
      log('testMaskMiddle0133 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0134
     * @tc.name      testMaskMiddle0134
     * @tc.desc      maskMiddle(15920009503,2,3) -> 15******503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0134 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 2, 3);
      expect(actual).assertEqual('15******503');
      log('testMaskMiddle0134 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0135
     * @tc.name      testMaskMiddle0135
     * @tc.desc      maskMiddle(15920009503,5,5) -> 15920*09503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0135 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920009503', 5, 5);
      expect(actual).assertEqual('15920*09503');
      log('testMaskMiddle0135 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0136
     * @tc.name      testMaskMiddle0136
     * @tc.desc      maskMiddle(15920010234,3,4) -> 159****0234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0136 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 3, 4);
      expect(actual).assertEqual('159****0234');
      log('testMaskMiddle0136 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0137
     * @tc.name      testMaskMiddle0137
     * @tc.desc      maskMiddle(15920010234,4,4) -> 1592***0234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0137 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 4, 4);
      expect(actual).assertEqual('1592***0234');
      log('testMaskMiddle0137 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0138
     * @tc.name      testMaskMiddle0138
     * @tc.desc      maskMiddle(15920010234,3,0) -> 159********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0138 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 3, 0);
      expect(actual).assertEqual('159********');
      log('testMaskMiddle0138 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0139
     * @tc.name      testMaskMiddle0139
     * @tc.desc      maskMiddle(15920010234,0,4) -> *******0234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0139 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 0, 4);
      expect(actual).assertEqual('*******0234');
      log('testMaskMiddle0139 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0140
     * @tc.name      testMaskMiddle0140
     * @tc.desc      maskMiddle(15920010234,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0140 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0140 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0141
     * @tc.name      testMaskMiddle0141
     * @tc.desc      maskMiddle(15920010234,11,0) -> 15920010234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0141 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 11, 0);
      expect(actual).assertEqual('15920010234');
      log('testMaskMiddle0141 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0142
     * @tc.name      testMaskMiddle0142
     * @tc.desc      maskMiddle(15920010234,12,0) -> 15920010234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0142 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 12, 0);
      expect(actual).assertEqual('15920010234');
      log('testMaskMiddle0142 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0143
     * @tc.name      testMaskMiddle0143
     * @tc.desc      maskMiddle(15920010234,6,6) -> 15920010234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0143 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 6, 6);
      expect(actual).assertEqual('15920010234');
      log('testMaskMiddle0143 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0144
     * @tc.name      testMaskMiddle0144
     * @tc.desc      maskMiddle(15920010234,2,3) -> 15******234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0144 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 2, 3);
      expect(actual).assertEqual('15******234');
      log('testMaskMiddle0144 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0145
     * @tc.name      testMaskMiddle0145
     * @tc.desc      maskMiddle(15920010234,5,5) -> 15920*10234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0145 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010234', 5, 5);
      expect(actual).assertEqual('15920*10234');
      log('testMaskMiddle0145 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0146
     * @tc.name      testMaskMiddle0146
     * @tc.desc      maskMiddle(15920010965,3,4) -> 159****0965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0146 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 3, 4);
      expect(actual).assertEqual('159****0965');
      log('testMaskMiddle0146 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0147
     * @tc.name      testMaskMiddle0147
     * @tc.desc      maskMiddle(15920010965,4,4) -> 1592***0965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0147 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 4, 4);
      expect(actual).assertEqual('1592***0965');
      log('testMaskMiddle0147 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0148
     * @tc.name      testMaskMiddle0148
     * @tc.desc      maskMiddle(15920010965,3,0) -> 159********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0148 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 3, 0);
      expect(actual).assertEqual('159********');
      log('testMaskMiddle0148 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0149
     * @tc.name      testMaskMiddle0149
     * @tc.desc      maskMiddle(15920010965,0,4) -> *******0965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0149 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 0, 4);
      expect(actual).assertEqual('*******0965');
      log('testMaskMiddle0149 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0150
     * @tc.name      testMaskMiddle0150
     * @tc.desc      maskMiddle(15920010965,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0150 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0150 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0151
     * @tc.name      testMaskMiddle0151
     * @tc.desc      maskMiddle(15920010965,11,0) -> 15920010965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0151 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 11, 0);
      expect(actual).assertEqual('15920010965');
      log('testMaskMiddle0151 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0152
     * @tc.name      testMaskMiddle0152
     * @tc.desc      maskMiddle(15920010965,12,0) -> 15920010965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0152 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 12, 0);
      expect(actual).assertEqual('15920010965');
      log('testMaskMiddle0152 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0153
     * @tc.name      testMaskMiddle0153
     * @tc.desc      maskMiddle(15920010965,6,6) -> 15920010965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0153 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 6, 6);
      expect(actual).assertEqual('15920010965');
      log('testMaskMiddle0153 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0154
     * @tc.name      testMaskMiddle0154
     * @tc.desc      maskMiddle(15920010965,2,3) -> 15******965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0154 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 2, 3);
      expect(actual).assertEqual('15******965');
      log('testMaskMiddle0154 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0155
     * @tc.name      testMaskMiddle0155
     * @tc.desc      maskMiddle(15920010965,5,5) -> 15920*10965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0155 begin');
      const actual: string = CallNumberFormatter.maskMiddle('15920010965', 5, 5);
      expect(actual).assertEqual('15920*10965');
      log('testMaskMiddle0155 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0156
     * @tc.name      testCompact0156
     * @tc.desc      compact(138 0013 8000) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0156 begin');
      const actual: string = CallNumberFormatter.compact('138 0013 8000');
      expect(actual).assertEqual('13800138000');
      log('testCompact0156 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0157
     * @tc.name      testCompact0157
     * @tc.desc      compact(138-0013-8000) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0157 begin');
      const actual: string = CallNumberFormatter.compact('138-0013-8000');
      expect(actual).assertEqual('13800138000');
      log('testCompact0157 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0158
     * @tc.name      testCompact0158
     * @tc.desc      compact(138.0013.8000) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0158 begin');
      const actual: string = CallNumberFormatter.compact('138.0013.8000');
      expect(actual).assertEqual('13800138000');
      log('testCompact0158 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0159
     * @tc.name      testCompact0159
     * @tc.desc      compact((138)0013-8000) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0159 begin');
      const actual: string = CallNumberFormatter.compact('(138)0013-8000');
      expect(actual).assertEqual('13800138000');
      log('testCompact0159 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0160
     * @tc.name      testCompact0160
     * @tc.desc      compact( +86 138 0013 8000 ) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0160 begin');
      const actual: string = CallNumberFormatter.compact(' +86 138 0013 8000 ');
      expect(actual).assertEqual('+8613800138000');
      log('testCompact0160 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0161
     * @tc.name      testCompact0161
     * @tc.desc      compact(+8613800138000) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0161 begin');
      const actual: string = CallNumberFormatter.compact('+8613800138000');
      expect(actual).assertEqual('+8613800138000');
      log('testCompact0161 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0162
     * @tc.name      testCompact0162
     * @tc.desc      compact(+8613912345678) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0162 begin');
      const actual: string = CallNumberFormatter.compact('+8613912345678');
      expect(actual).assertEqual('+8613912345678');
      log('testCompact0162 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0163
     * @tc.name      testCompact0163
     * @tc.desc      compact(+14155550123) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0163 begin');
      const actual: string = CallNumberFormatter.compact('+14155550123');
      expect(actual).assertEqual('+14155550123');
      log('testCompact0163 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0164
     * @tc.name      testCompact0164
     * @tc.desc      compact(+442071838750) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0164 begin');
      const actual: string = CallNumberFormatter.compact('+442071838750');
      expect(actual).assertEqual('+442071838750');
      log('testCompact0164 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0165
     * @tc.name      testCompact0165
     * @tc.desc      compact(1234567) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0165 begin');
      const actual: string = CallNumberFormatter.compact('1234567');
      expect(actual).assertEqual('1234567');
      log('testCompact0165 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0166
     * @tc.name      testCompact0166
     * @tc.desc      compact(123456789) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0166 begin');
      const actual: string = CallNumberFormatter.compact('123456789');
      expect(actual).assertEqual('123456789');
      log('testCompact0166 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0167
     * @tc.name      testCompact0167
     * @tc.desc      compact(123456789012) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0167 begin');
      const actual: string = CallNumberFormatter.compact('123456789012');
      expect(actual).assertEqual('123456789012');
      log('testCompact0167 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0168
     * @tc.name      testCompact0168
     * @tc.desc      compact(123) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0168 begin');
      const actual: string = CallNumberFormatter.compact('123');
      expect(actual).assertEqual('123');
      log('testCompact0168 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0169
     * @tc.name      testCompact0169
     * @tc.desc      compact(12345) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0169 begin');
      const actual: string = CallNumberFormatter.compact('12345');
      expect(actual).assertEqual('12345');
      log('testCompact0169 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0170
     * @tc.name      testCompact0170
     * @tc.desc      compact(1) removes separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCompact0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCompact0170 begin');
      const actual: string = CallNumberFormatter.compact('1');
      expect(actual).assertEqual('1');
      log('testCompact0170 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0171
     * @tc.name      testDigitCount0171
     * @tc.desc      digitCount(13810000000) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0171 begin');
      const actual: number = CallNumberFormatter.digitCount('13810000000');
      expect(actual).assertEqual(11);
      log('testDigitCount0171 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0172
     * @tc.name      testDigitCount0172
     * @tc.desc      digitCount(13810000137) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0172 begin');
      const actual: number = CallNumberFormatter.digitCount('13810000137');
      expect(actual).assertEqual(11);
      log('testDigitCount0172 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0173
     * @tc.name      testDigitCount0173
     * @tc.desc      digitCount(13810000274) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0173 begin');
      const actual: number = CallNumberFormatter.digitCount('13810000274');
      expect(actual).assertEqual(11);
      log('testDigitCount0173 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0174
     * @tc.name      testDigitCount0174
     * @tc.desc      digitCount(13810000411) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0174 begin');
      const actual: number = CallNumberFormatter.digitCount('13810000411');
      expect(actual).assertEqual(11);
      log('testDigitCount0174 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0175
     * @tc.name      testDigitCount0175
     * @tc.desc      digitCount(13810000548) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0175 begin');
      const actual: number = CallNumberFormatter.digitCount('13810000548');
      expect(actual).assertEqual(11);
      log('testDigitCount0175 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0176
     * @tc.name      testDigitCount0176
     * @tc.desc      digitCount(13810000685) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0176 begin');
      const actual: number = CallNumberFormatter.digitCount('13810000685');
      expect(actual).assertEqual(11);
      log('testDigitCount0176 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0177
     * @tc.name      testDigitCount0177
     * @tc.desc      digitCount(13810000822) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0177 begin');
      const actual: number = CallNumberFormatter.digitCount('13810000822');
      expect(actual).assertEqual(11);
      log('testDigitCount0177 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0178
     * @tc.name      testDigitCount0178
     * @tc.desc      digitCount(13810000959) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0178 begin');
      const actual: number = CallNumberFormatter.digitCount('13810000959');
      expect(actual).assertEqual(11);
      log('testDigitCount0178 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0179
     * @tc.name      testDigitCount0179
     * @tc.desc      digitCount(13810001096) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0179 begin');
      const actual: number = CallNumberFormatter.digitCount('13810001096');
      expect(actual).assertEqual(11);
      log('testDigitCount0179 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0180
     * @tc.name      testDigitCount0180
     * @tc.desc      digitCount(13810001233) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0180 begin');
      const actual: number = CallNumberFormatter.digitCount('13810001233');
      expect(actual).assertEqual(11);
      log('testDigitCount0180 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0181
     * @tc.name      testDigitCount0181
     * @tc.desc      digitCount(13810001370) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0181 begin');
      const actual: number = CallNumberFormatter.digitCount('13810001370');
      expect(actual).assertEqual(11);
      log('testDigitCount0181 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0182
     * @tc.name      testDigitCount0182
     * @tc.desc      digitCount(13810001507) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0182 begin');
      const actual: number = CallNumberFormatter.digitCount('13810001507');
      expect(actual).assertEqual(11);
      log('testDigitCount0182 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0183
     * @tc.name      testDigitCount0183
     * @tc.desc      digitCount(13810001644) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0183 begin');
      const actual: number = CallNumberFormatter.digitCount('13810001644');
      expect(actual).assertEqual(11);
      log('testDigitCount0183 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0184
     * @tc.name      testDigitCount0184
     * @tc.desc      digitCount(13810001781) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0184 begin');
      const actual: number = CallNumberFormatter.digitCount('13810001781');
      expect(actual).assertEqual(11);
      log('testDigitCount0184 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0185
     * @tc.name      testDigitCount0185
     * @tc.desc      digitCount(13810001918) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0185 begin');
      const actual: number = CallNumberFormatter.digitCount('13810001918');
      expect(actual).assertEqual(11);
      log('testDigitCount0185 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0186
     * @tc.name      testDigitCount0186
     * @tc.desc      digitCount(13810002055) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0186 begin');
      const actual: number = CallNumberFormatter.digitCount('13810002055');
      expect(actual).assertEqual(11);
      log('testDigitCount0186 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0187
     * @tc.name      testDigitCount0187
     * @tc.desc      digitCount(13810002192) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0187 begin');
      const actual: number = CallNumberFormatter.digitCount('13810002192');
      expect(actual).assertEqual(11);
      log('testDigitCount0187 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0188
     * @tc.name      testDigitCount0188
     * @tc.desc      digitCount(13810002329) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0188 begin');
      const actual: number = CallNumberFormatter.digitCount('13810002329');
      expect(actual).assertEqual(11);
      log('testDigitCount0188 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0189
     * @tc.name      testDigitCount0189
     * @tc.desc      digitCount(13810002466) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0189 begin');
      const actual: number = CallNumberFormatter.digitCount('13810002466');
      expect(actual).assertEqual(11);
      log('testDigitCount0189 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0190
     * @tc.name      testDigitCount0190
     * @tc.desc      digitCount(13810002603) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0190 begin');
      const actual: number = CallNumberFormatter.digitCount('13810002603');
      expect(actual).assertEqual(11);
      log('testDigitCount0190 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0191
     * @tc.name      testDigitCount0191
     * @tc.desc      digitCount(13810002740) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0191 begin');
      const actual: number = CallNumberFormatter.digitCount('13810002740');
      expect(actual).assertEqual(11);
      log('testDigitCount0191 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0192
     * @tc.name      testDigitCount0192
     * @tc.desc      digitCount(13810002877) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0192 begin');
      const actual: number = CallNumberFormatter.digitCount('13810002877');
      expect(actual).assertEqual(11);
      log('testDigitCount0192 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0193
     * @tc.name      testDigitCount0193
     * @tc.desc      digitCount(13810003014) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0193 begin');
      const actual: number = CallNumberFormatter.digitCount('13810003014');
      expect(actual).assertEqual(11);
      log('testDigitCount0193 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0194
     * @tc.name      testDigitCount0194
     * @tc.desc      digitCount(13810003151) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0194 begin');
      const actual: number = CallNumberFormatter.digitCount('13810003151');
      expect(actual).assertEqual(11);
      log('testDigitCount0194 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0195
     * @tc.name      testDigitCount0195
     * @tc.desc      digitCount(13810003288) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0195 begin');
      const actual: number = CallNumberFormatter.digitCount('13810003288');
      expect(actual).assertEqual(11);
      log('testDigitCount0195 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0196
     * @tc.name      testDigitCount0196
     * @tc.desc      digitCount(13810003425) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0196 begin');
      const actual: number = CallNumberFormatter.digitCount('13810003425');
      expect(actual).assertEqual(11);
      log('testDigitCount0196 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0197
     * @tc.name      testDigitCount0197
     * @tc.desc      digitCount(13810003562) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0197 begin');
      const actual: number = CallNumberFormatter.digitCount('13810003562');
      expect(actual).assertEqual(11);
      log('testDigitCount0197 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0198
     * @tc.name      testDigitCount0198
     * @tc.desc      digitCount(13810003699) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0198 begin');
      const actual: number = CallNumberFormatter.digitCount('13810003699');
      expect(actual).assertEqual(11);
      log('testDigitCount0198 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0199
     * @tc.name      testDigitCount0199
     * @tc.desc      digitCount(13810003836) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0199 begin');
      const actual: number = CallNumberFormatter.digitCount('13810003836');
      expect(actual).assertEqual(11);
      log('testDigitCount0199 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0200
     * @tc.name      testDigitCount0200
     * @tc.desc      digitCount(13810003973) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0200 begin');
      const actual: number = CallNumberFormatter.digitCount('13810003973');
      expect(actual).assertEqual(11);
      log('testDigitCount0200 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0201
     * @tc.name      testDigitCount0201
     * @tc.desc      digitCount(13810004110) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0201 begin');
      const actual: number = CallNumberFormatter.digitCount('13810004110');
      expect(actual).assertEqual(11);
      log('testDigitCount0201 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0202
     * @tc.name      testDigitCount0202
     * @tc.desc      digitCount(13810004247) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0202 begin');
      const actual: number = CallNumberFormatter.digitCount('13810004247');
      expect(actual).assertEqual(11);
      log('testDigitCount0202 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0203
     * @tc.name      testDigitCount0203
     * @tc.desc      digitCount(13810004384) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0203 begin');
      const actual: number = CallNumberFormatter.digitCount('13810004384');
      expect(actual).assertEqual(11);
      log('testDigitCount0203 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0204
     * @tc.name      testDigitCount0204
     * @tc.desc      digitCount(13810004521) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0204 begin');
      const actual: number = CallNumberFormatter.digitCount('13810004521');
      expect(actual).assertEqual(11);
      log('testDigitCount0204 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0205
     * @tc.name      testDigitCount0205
     * @tc.desc      digitCount(15920000000) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0205 begin');
      const actual: number = CallNumberFormatter.digitCount('15920000000');
      expect(actual).assertEqual(11);
      log('testDigitCount0205 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0206
     * @tc.name      testDigitCount0206
     * @tc.desc      digitCount(15920000731) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0206 begin');
      const actual: number = CallNumberFormatter.digitCount('15920000731');
      expect(actual).assertEqual(11);
      log('testDigitCount0206 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0207
     * @tc.name      testDigitCount0207
     * @tc.desc      digitCount(15920001462) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0207 begin');
      const actual: number = CallNumberFormatter.digitCount('15920001462');
      expect(actual).assertEqual(11);
      log('testDigitCount0207 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0208
     * @tc.name      testDigitCount0208
     * @tc.desc      digitCount(15920002193) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0208 begin');
      const actual: number = CallNumberFormatter.digitCount('15920002193');
      expect(actual).assertEqual(11);
      log('testDigitCount0208 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0209
     * @tc.name      testDigitCount0209
     * @tc.desc      digitCount(15920002924) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0209 begin');
      const actual: number = CallNumberFormatter.digitCount('15920002924');
      expect(actual).assertEqual(11);
      log('testDigitCount0209 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0210
     * @tc.name      testDigitCount0210
     * @tc.desc      digitCount(15920003655) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0210 begin');
      const actual: number = CallNumberFormatter.digitCount('15920003655');
      expect(actual).assertEqual(11);
      log('testDigitCount0210 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0211
     * @tc.name      testDigitCount0211
     * @tc.desc      digitCount(15920004386) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0211 begin');
      const actual: number = CallNumberFormatter.digitCount('15920004386');
      expect(actual).assertEqual(11);
      log('testDigitCount0211 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0212
     * @tc.name      testDigitCount0212
     * @tc.desc      digitCount(15920005117) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0212 begin');
      const actual: number = CallNumberFormatter.digitCount('15920005117');
      expect(actual).assertEqual(11);
      log('testDigitCount0212 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0213
     * @tc.name      testDigitCount0213
     * @tc.desc      digitCount(15920005848) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0213 begin');
      const actual: number = CallNumberFormatter.digitCount('15920005848');
      expect(actual).assertEqual(11);
      log('testDigitCount0213 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0214
     * @tc.name      testDigitCount0214
     * @tc.desc      digitCount(15920006579) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0214 begin');
      const actual: number = CallNumberFormatter.digitCount('15920006579');
      expect(actual).assertEqual(11);
      log('testDigitCount0214 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0215
     * @tc.name      testDigitCount0215
     * @tc.desc      digitCount(15920007310) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0215 begin');
      const actual: number = CallNumberFormatter.digitCount('15920007310');
      expect(actual).assertEqual(11);
      log('testDigitCount0215 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0216
     * @tc.name      testDigitCount0216
     * @tc.desc      digitCount(15920008041) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0216 begin');
      const actual: number = CallNumberFormatter.digitCount('15920008041');
      expect(actual).assertEqual(11);
      log('testDigitCount0216 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0217
     * @tc.name      testDigitCount0217
     * @tc.desc      digitCount(15920008772) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0217 begin');
      const actual: number = CallNumberFormatter.digitCount('15920008772');
      expect(actual).assertEqual(11);
      log('testDigitCount0217 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0218
     * @tc.name      testDigitCount0218
     * @tc.desc      digitCount(15920009503) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0218 begin');
      const actual: number = CallNumberFormatter.digitCount('15920009503');
      expect(actual).assertEqual(11);
      log('testDigitCount0218 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0219
     * @tc.name      testDigitCount0219
     * @tc.desc      digitCount(15920010234) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0219 begin');
      const actual: number = CallNumberFormatter.digitCount('15920010234');
      expect(actual).assertEqual(11);
      log('testDigitCount0219 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0220
     * @tc.name      testDigitCount0220
     * @tc.desc      digitCount(15920010965) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0220 begin');
      const actual: number = CallNumberFormatter.digitCount('15920010965');
      expect(actual).assertEqual(11);
      log('testDigitCount0220 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0221
     * @tc.name      testDigitCount0221
     * @tc.desc      digitCount(1000000000) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0221 begin');
      const actual: number = CallNumberFormatter.digitCount('1000000000');
      expect(actual).assertEqual(10);
      log('testDigitCount0221 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0222
     * @tc.name      testDigitCount0222
     * @tc.desc      digitCount(1001234567) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0222 begin');
      const actual: number = CallNumberFormatter.digitCount('1001234567');
      expect(actual).assertEqual(10);
      log('testDigitCount0222 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0223
     * @tc.name      testDigitCount0223
     * @tc.desc      digitCount(1002469134) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0223 begin');
      const actual: number = CallNumberFormatter.digitCount('1002469134');
      expect(actual).assertEqual(10);
      log('testDigitCount0223 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0224
     * @tc.name      testDigitCount0224
     * @tc.desc      digitCount(1003703701) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0224 begin');
      const actual: number = CallNumberFormatter.digitCount('1003703701');
      expect(actual).assertEqual(10);
      log('testDigitCount0224 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0225
     * @tc.name      testDigitCount0225
     * @tc.desc      digitCount(1004938268) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0225 begin');
      const actual: number = CallNumberFormatter.digitCount('1004938268');
      expect(actual).assertEqual(10);
      log('testDigitCount0225 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0226
     * @tc.name      testDigitCount0226
     * @tc.desc      digitCount(1006172835) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0226 begin');
      const actual: number = CallNumberFormatter.digitCount('1006172835');
      expect(actual).assertEqual(10);
      log('testDigitCount0226 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0227
     * @tc.name      testDigitCount0227
     * @tc.desc      digitCount(1007407402) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0227 begin');
      const actual: number = CallNumberFormatter.digitCount('1007407402');
      expect(actual).assertEqual(10);
      log('testDigitCount0227 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTC_0228
     * @tc.name      testDigitCount0228
     * @tc.desc      digitCount(1008641969) counts digits only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDigitCount0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDigitCount0228 begin');
      const actual: number = CallNumberFormatter.digitCount('1008641969');
      expect(actual).assertEqual(10);
      log('testDigitCount0228 end');
      await yieldToMain();
    })
  })
}
