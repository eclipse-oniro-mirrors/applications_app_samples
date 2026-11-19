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
const TAG: string = 'CallNumberFormatMatrixA2';
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

export default function callNumberFormatMatrixA2Test(): void {
  describe('CallNumberFormatMatrixA2', () => {
    /**
     * @tc.number    SUB_CALL_NUMFMTA_0115
     * @tc.name      testFormatDashes0115
     * @tc.desc      formatDashes(13810002055) -> 138-1000-2055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0115 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810002055');
      expect(actual).assertEqual('138-1000-2055');
      log('testFormatDashes0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0116
     * @tc.name      testFormatDashes0116
     * @tc.desc      formatDashes(13810002192) -> 138-1000-2192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0116 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810002192');
      expect(actual).assertEqual('138-1000-2192');
      log('testFormatDashes0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0117
     * @tc.name      testFormatDashes0117
     * @tc.desc      formatDashes(13810002329) -> 138-1000-2329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0117 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810002329');
      expect(actual).assertEqual('138-1000-2329');
      log('testFormatDashes0117 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0118
     * @tc.name      testFormatDashes0118
     * @tc.desc      formatDashes(13810002466) -> 138-1000-2466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0118 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810002466');
      expect(actual).assertEqual('138-1000-2466');
      log('testFormatDashes0118 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0119
     * @tc.name      testFormatDashes0119
     * @tc.desc      formatDashes(13810002603) -> 138-1000-2603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0119 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810002603');
      expect(actual).assertEqual('138-1000-2603');
      log('testFormatDashes0119 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0120
     * @tc.name      testFormatDashes0120
     * @tc.desc      formatDashes(13810002740) -> 138-1000-2740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0120 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810002740');
      expect(actual).assertEqual('138-1000-2740');
      log('testFormatDashes0120 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0121
     * @tc.name      testFormatDashes0121
     * @tc.desc      formatDashes(13810002877) -> 138-1000-2877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0121 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810002877');
      expect(actual).assertEqual('138-1000-2877');
      log('testFormatDashes0121 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0122
     * @tc.name      testFormatDashes0122
     * @tc.desc      formatDashes(13810003014) -> 138-1000-3014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0122 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810003014');
      expect(actual).assertEqual('138-1000-3014');
      log('testFormatDashes0122 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0123
     * @tc.name      testFormatDashes0123
     * @tc.desc      formatDashes(13810003151) -> 138-1000-3151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0123 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810003151');
      expect(actual).assertEqual('138-1000-3151');
      log('testFormatDashes0123 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0124
     * @tc.name      testFormatDashes0124
     * @tc.desc      formatDashes(13810003288) -> 138-1000-3288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0124 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810003288');
      expect(actual).assertEqual('138-1000-3288');
      log('testFormatDashes0124 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0125
     * @tc.name      testFormatDashes0125
     * @tc.desc      formatDashes(13810003425) -> 138-1000-3425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0125 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810003425');
      expect(actual).assertEqual('138-1000-3425');
      log('testFormatDashes0125 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0126
     * @tc.name      testFormatDashes0126
     * @tc.desc      formatDashes(13810003562) -> 138-1000-3562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0126 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810003562');
      expect(actual).assertEqual('138-1000-3562');
      log('testFormatDashes0126 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0127
     * @tc.name      testFormatDashes0127
     * @tc.desc      formatDashes(13810003699) -> 138-1000-3699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0127 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810003699');
      expect(actual).assertEqual('138-1000-3699');
      log('testFormatDashes0127 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0128
     * @tc.name      testFormatDashes0128
     * @tc.desc      formatDashes(13810003836) -> 138-1000-3836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0128 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810003836');
      expect(actual).assertEqual('138-1000-3836');
      log('testFormatDashes0128 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0129
     * @tc.name      testFormatDashes0129
     * @tc.desc      formatDashes(13810003973) -> 138-1000-3973
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0129 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810003973');
      expect(actual).assertEqual('138-1000-3973');
      log('testFormatDashes0129 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0130
     * @tc.name      testFormatDashes0130
     * @tc.desc      formatDashes(13810004110) -> 138-1000-4110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0130 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810004110');
      expect(actual).assertEqual('138-1000-4110');
      log('testFormatDashes0130 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0131
     * @tc.name      testFormatDashes0131
     * @tc.desc      formatDashes(13810004247) -> 138-1000-4247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0131 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810004247');
      expect(actual).assertEqual('138-1000-4247');
      log('testFormatDashes0131 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0132
     * @tc.name      testFormatDashes0132
     * @tc.desc      formatDashes(13810004384) -> 138-1000-4384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0132 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810004384');
      expect(actual).assertEqual('138-1000-4384');
      log('testFormatDashes0132 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0133
     * @tc.name      testFormatDashes0133
     * @tc.desc      formatDashes(13810004521) -> 138-1000-4521
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0133 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810004521');
      expect(actual).assertEqual('138-1000-4521');
      log('testFormatDashes0133 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0134
     * @tc.name      testFormatDashes0134
     * @tc.desc      formatDashes(15920000000) -> 159-2000-0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0134 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920000000');
      expect(actual).assertEqual('159-2000-0000');
      log('testFormatDashes0134 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0135
     * @tc.name      testFormatDashes0135
     * @tc.desc      formatDashes(15920000731) -> 159-2000-0731
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0135 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920000731');
      expect(actual).assertEqual('159-2000-0731');
      log('testFormatDashes0135 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0136
     * @tc.name      testFormatDashes0136
     * @tc.desc      formatDashes(15920001462) -> 159-2000-1462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0136 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920001462');
      expect(actual).assertEqual('159-2000-1462');
      log('testFormatDashes0136 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0137
     * @tc.name      testFormatDashes0137
     * @tc.desc      formatDashes(15920002193) -> 159-2000-2193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0137 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920002193');
      expect(actual).assertEqual('159-2000-2193');
      log('testFormatDashes0137 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0138
     * @tc.name      testFormatDashes0138
     * @tc.desc      formatDashes(15920002924) -> 159-2000-2924
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0138 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920002924');
      expect(actual).assertEqual('159-2000-2924');
      log('testFormatDashes0138 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0139
     * @tc.name      testFormatDashes0139
     * @tc.desc      formatDashes(15920003655) -> 159-2000-3655
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0139 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920003655');
      expect(actual).assertEqual('159-2000-3655');
      log('testFormatDashes0139 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0140
     * @tc.name      testFormatDashes0140
     * @tc.desc      formatDashes(15920004386) -> 159-2000-4386
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0140 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920004386');
      expect(actual).assertEqual('159-2000-4386');
      log('testFormatDashes0140 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0141
     * @tc.name      testFormatDashes0141
     * @tc.desc      formatDashes(15920005117) -> 159-2000-5117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0141 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920005117');
      expect(actual).assertEqual('159-2000-5117');
      log('testFormatDashes0141 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0142
     * @tc.name      testFormatDashes0142
     * @tc.desc      formatDashes(15920005848) -> 159-2000-5848
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0142 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920005848');
      expect(actual).assertEqual('159-2000-5848');
      log('testFormatDashes0142 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0143
     * @tc.name      testFormatDashes0143
     * @tc.desc      formatDashes(15920006579) -> 159-2000-6579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0143 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920006579');
      expect(actual).assertEqual('159-2000-6579');
      log('testFormatDashes0143 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0144
     * @tc.name      testFormatDashes0144
     * @tc.desc      formatDashes(15920007310) -> 159-2000-7310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0144 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920007310');
      expect(actual).assertEqual('159-2000-7310');
      log('testFormatDashes0144 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0145
     * @tc.name      testFormatDashes0145
     * @tc.desc      formatDashes(15920008041) -> 159-2000-8041
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0145 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920008041');
      expect(actual).assertEqual('159-2000-8041');
      log('testFormatDashes0145 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0146
     * @tc.name      testFormatDashes0146
     * @tc.desc      formatDashes(15920008772) -> 159-2000-8772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0146 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920008772');
      expect(actual).assertEqual('159-2000-8772');
      log('testFormatDashes0146 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0147
     * @tc.name      testFormatDashes0147
     * @tc.desc      formatDashes(15920009503) -> 159-2000-9503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0147 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920009503');
      expect(actual).assertEqual('159-2000-9503');
      log('testFormatDashes0147 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0148
     * @tc.name      testFormatDashes0148
     * @tc.desc      formatDashes(15920010234) -> 159-2001-0234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0148 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920010234');
      expect(actual).assertEqual('159-2001-0234');
      log('testFormatDashes0148 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0149
     * @tc.name      testFormatDashes0149
     * @tc.desc      formatDashes(15920010965) -> 159-2001-0965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0149 begin');
      const actual: string = CallNumberFormatter.formatDashes('15920010965');
      expect(actual).assertEqual('159-2001-0965');
      log('testFormatDashes0149 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0150
     * @tc.name      testFormatDashes0150
     * @tc.desc      formatDashes(1000000000) -> 100-000-0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0150 begin');
      const actual: string = CallNumberFormatter.formatDashes('1000000000');
      expect(actual).assertEqual('100-000-0000');
      log('testFormatDashes0150 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0151
     * @tc.name      testFormatDashes0151
     * @tc.desc      formatDashes(1001234567) -> 100-123-4567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0151 begin');
      const actual: string = CallNumberFormatter.formatDashes('1001234567');
      expect(actual).assertEqual('100-123-4567');
      log('testFormatDashes0151 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0152
     * @tc.name      testFormatDashes0152
     * @tc.desc      formatDashes(1002469134) -> 100-246-9134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0152 begin');
      const actual: string = CallNumberFormatter.formatDashes('1002469134');
      expect(actual).assertEqual('100-246-9134');
      log('testFormatDashes0152 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0153
     * @tc.name      testFormatDashes0153
     * @tc.desc      formatDashes(1003703701) -> 100-370-3701
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0153 begin');
      const actual: string = CallNumberFormatter.formatDashes('1003703701');
      expect(actual).assertEqual('100-370-3701');
      log('testFormatDashes0153 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0154
     * @tc.name      testFormatDashes0154
     * @tc.desc      formatDashes(1004938268) -> 100-493-8268
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0154 begin');
      const actual: string = CallNumberFormatter.formatDashes('1004938268');
      expect(actual).assertEqual('100-493-8268');
      log('testFormatDashes0154 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0155
     * @tc.name      testFormatDashes0155
     * @tc.desc      formatDashes(1006172835) -> 100-617-2835
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0155 begin');
      const actual: string = CallNumberFormatter.formatDashes('1006172835');
      expect(actual).assertEqual('100-617-2835');
      log('testFormatDashes0155 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0156
     * @tc.name      testFormatDashes0156
     * @tc.desc      formatDashes(1007407402) -> 100-740-7402
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0156 begin');
      const actual: string = CallNumberFormatter.formatDashes('1007407402');
      expect(actual).assertEqual('100-740-7402');
      log('testFormatDashes0156 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0157
     * @tc.name      testFormatDashes0157
     * @tc.desc      formatDashes(1008641969) -> 100-864-1969
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0157 begin');
      const actual: string = CallNumberFormatter.formatDashes('1008641969');
      expect(actual).assertEqual('100-864-1969');
      log('testFormatDashes0157 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0158
     * @tc.name      testFormatDashes0158
     * @tc.desc      formatDashes(1009876536) -> 100-987-6536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0158 begin');
      const actual: string = CallNumberFormatter.formatDashes('1009876536');
      expect(actual).assertEqual('100-987-6536');
      log('testFormatDashes0158 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0159
     * @tc.name      testFormatDashes0159
     * @tc.desc      formatDashes(1011111103) -> 101-111-1103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0159 begin');
      const actual: string = CallNumberFormatter.formatDashes('1011111103');
      expect(actual).assertEqual('101-111-1103');
      log('testFormatDashes0159 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0160
     * @tc.name      testFormatDashes0160
     * @tc.desc      formatDashes(1012345670) -> 101-234-5670
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0160 begin');
      const actual: string = CallNumberFormatter.formatDashes('1012345670');
      expect(actual).assertEqual('101-234-5670');
      log('testFormatDashes0160 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0161
     * @tc.name      testFormatDashes0161
     * @tc.desc      formatDashes(1013580237) -> 101-358-0237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0161 begin');
      const actual: string = CallNumberFormatter.formatDashes('1013580237');
      expect(actual).assertEqual('101-358-0237');
      log('testFormatDashes0161 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0162
     * @tc.name      testFormatDashes0162
     * @tc.desc      formatDashes(1014814804) -> 101-481-4804
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0162 begin');
      const actual: string = CallNumberFormatter.formatDashes('1014814804');
      expect(actual).assertEqual('101-481-4804');
      log('testFormatDashes0162 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0163
     * @tc.name      testFormatDashes0163
     * @tc.desc      formatDashes(1016049371) -> 101-604-9371
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0163 begin');
      const actual: string = CallNumberFormatter.formatDashes('1016049371');
      expect(actual).assertEqual('101-604-9371');
      log('testFormatDashes0163 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0164
     * @tc.name      testFormatDashes0164
     * @tc.desc      formatDashes(1017283938) -> 101-728-3938
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0164 begin');
      const actual: string = CallNumberFormatter.formatDashes('1017283938');
      expect(actual).assertEqual('101-728-3938');
      log('testFormatDashes0164 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0165
     * @tc.name      testFormatDashes0165
     * @tc.desc      formatDashes(1018518505) -> 101-851-8505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0165 begin');
      const actual: string = CallNumberFormatter.formatDashes('1018518505');
      expect(actual).assertEqual('101-851-8505');
      log('testFormatDashes0165 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0166
     * @tc.name      testFormatDashes0166
     * @tc.desc      formatDashes(1019753072) -> 101-975-3072
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0166 begin');
      const actual: string = CallNumberFormatter.formatDashes('1019753072');
      expect(actual).assertEqual('101-975-3072');
      log('testFormatDashes0166 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0167
     * @tc.name      testFormatDashes0167
     * @tc.desc      formatDashes(1020987639) -> 102-098-7639
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0167 begin');
      const actual: string = CallNumberFormatter.formatDashes('1020987639');
      expect(actual).assertEqual('102-098-7639');
      log('testFormatDashes0167 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0168
     * @tc.name      testFormatDashes0168
     * @tc.desc      formatDashes(1022222206) -> 102-222-2206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0168 begin');
      const actual: string = CallNumberFormatter.formatDashes('1022222206');
      expect(actual).assertEqual('102-222-2206');
      log('testFormatDashes0168 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0169
     * @tc.name      testFormatDashes0169
     * @tc.desc      formatDashes(1023456773) -> 102-345-6773
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0169 begin');
      const actual: string = CallNumberFormatter.formatDashes('1023456773');
      expect(actual).assertEqual('102-345-6773');
      log('testFormatDashes0169 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0170
     * @tc.name      testFormatDashes0170
     * @tc.desc      formatDashes(1024691340) -> 102-469-1340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0170 begin');
      const actual: string = CallNumberFormatter.formatDashes('1024691340');
      expect(actual).assertEqual('102-469-1340');
      log('testFormatDashes0170 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0171
     * @tc.name      testFormatDashes0171
     * @tc.desc      formatDashes(1025925907) -> 102-592-5907
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0171 begin');
      const actual: string = CallNumberFormatter.formatDashes('1025925907');
      expect(actual).assertEqual('102-592-5907');
      log('testFormatDashes0171 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0172
     * @tc.name      testFormatDashes0172
     * @tc.desc      formatDashes(1234567) -> 1234567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0172 begin');
      const actual: string = CallNumberFormatter.formatDashes('1234567');
      expect(actual).assertEqual('1234567');
      log('testFormatDashes0172 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0173
     * @tc.name      testFormatDashes0173
     * @tc.desc      formatDashes(123456789) -> 123456789
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0173 begin');
      const actual: string = CallNumberFormatter.formatDashes('123456789');
      expect(actual).assertEqual('123456789');
      log('testFormatDashes0173 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0174
     * @tc.name      testFormatDashes0174
     * @tc.desc      formatDashes(123456789012) -> 123456789012
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0174 begin');
      const actual: string = CallNumberFormatter.formatDashes('123456789012');
      expect(actual).assertEqual('123456789012');
      log('testFormatDashes0174 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0175
     * @tc.name      testFormatDashes0175
     * @tc.desc      formatDashes(123) -> 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0175 begin');
      const actual: string = CallNumberFormatter.formatDashes('123');
      expect(actual).assertEqual('123');
      log('testFormatDashes0175 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0176
     * @tc.name      testFormatDashes0176
     * @tc.desc      formatDashes(12345) -> 12345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0176 begin');
      const actual: string = CallNumberFormatter.formatDashes('12345');
      expect(actual).assertEqual('12345');
      log('testFormatDashes0176 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0177
     * @tc.name      testFormatDashes0177
     * @tc.desc      formatDashes(1) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0177 begin');
      const actual: string = CallNumberFormatter.formatDashes('1');
      expect(actual).assertEqual('1');
      log('testFormatDashes0177 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0178
     * @tc.name      testFormatDots0178
     * @tc.desc      formatDots(13810000000) -> 138.1000.0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0178 begin');
      const actual: string = CallNumberFormatter.formatDots('13810000000');
      expect(actual).assertEqual('138.1000.0000');
      log('testFormatDots0178 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0179
     * @tc.name      testFormatDots0179
     * @tc.desc      formatDots(13810000137) -> 138.1000.0137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0179 begin');
      const actual: string = CallNumberFormatter.formatDots('13810000137');
      expect(actual).assertEqual('138.1000.0137');
      log('testFormatDots0179 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0180
     * @tc.name      testFormatDots0180
     * @tc.desc      formatDots(13810000274) -> 138.1000.0274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0180 begin');
      const actual: string = CallNumberFormatter.formatDots('13810000274');
      expect(actual).assertEqual('138.1000.0274');
      log('testFormatDots0180 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0181
     * @tc.name      testFormatDots0181
     * @tc.desc      formatDots(13810000411) -> 138.1000.0411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0181 begin');
      const actual: string = CallNumberFormatter.formatDots('13810000411');
      expect(actual).assertEqual('138.1000.0411');
      log('testFormatDots0181 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0182
     * @tc.name      testFormatDots0182
     * @tc.desc      formatDots(13810000548) -> 138.1000.0548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0182 begin');
      const actual: string = CallNumberFormatter.formatDots('13810000548');
      expect(actual).assertEqual('138.1000.0548');
      log('testFormatDots0182 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0183
     * @tc.name      testFormatDots0183
     * @tc.desc      formatDots(13810000685) -> 138.1000.0685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0183 begin');
      const actual: string = CallNumberFormatter.formatDots('13810000685');
      expect(actual).assertEqual('138.1000.0685');
      log('testFormatDots0183 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0184
     * @tc.name      testFormatDots0184
     * @tc.desc      formatDots(13810000822) -> 138.1000.0822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0184 begin');
      const actual: string = CallNumberFormatter.formatDots('13810000822');
      expect(actual).assertEqual('138.1000.0822');
      log('testFormatDots0184 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0185
     * @tc.name      testFormatDots0185
     * @tc.desc      formatDots(13810000959) -> 138.1000.0959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0185 begin');
      const actual: string = CallNumberFormatter.formatDots('13810000959');
      expect(actual).assertEqual('138.1000.0959');
      log('testFormatDots0185 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0186
     * @tc.name      testFormatDots0186
     * @tc.desc      formatDots(13810001096) -> 138.1000.1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0186 begin');
      const actual: string = CallNumberFormatter.formatDots('13810001096');
      expect(actual).assertEqual('138.1000.1096');
      log('testFormatDots0186 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0187
     * @tc.name      testFormatDots0187
     * @tc.desc      formatDots(13810001233) -> 138.1000.1233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0187 begin');
      const actual: string = CallNumberFormatter.formatDots('13810001233');
      expect(actual).assertEqual('138.1000.1233');
      log('testFormatDots0187 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0188
     * @tc.name      testFormatDots0188
     * @tc.desc      formatDots(13810001370) -> 138.1000.1370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0188 begin');
      const actual: string = CallNumberFormatter.formatDots('13810001370');
      expect(actual).assertEqual('138.1000.1370');
      log('testFormatDots0188 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0189
     * @tc.name      testFormatDots0189
     * @tc.desc      formatDots(13810001507) -> 138.1000.1507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0189 begin');
      const actual: string = CallNumberFormatter.formatDots('13810001507');
      expect(actual).assertEqual('138.1000.1507');
      log('testFormatDots0189 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0190
     * @tc.name      testFormatDots0190
     * @tc.desc      formatDots(13810001644) -> 138.1000.1644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0190 begin');
      const actual: string = CallNumberFormatter.formatDots('13810001644');
      expect(actual).assertEqual('138.1000.1644');
      log('testFormatDots0190 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0191
     * @tc.name      testFormatDots0191
     * @tc.desc      formatDots(13810001781) -> 138.1000.1781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0191 begin');
      const actual: string = CallNumberFormatter.formatDots('13810001781');
      expect(actual).assertEqual('138.1000.1781');
      log('testFormatDots0191 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0192
     * @tc.name      testFormatDots0192
     * @tc.desc      formatDots(13810001918) -> 138.1000.1918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0192 begin');
      const actual: string = CallNumberFormatter.formatDots('13810001918');
      expect(actual).assertEqual('138.1000.1918');
      log('testFormatDots0192 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0193
     * @tc.name      testFormatDots0193
     * @tc.desc      formatDots(13810002055) -> 138.1000.2055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0193 begin');
      const actual: string = CallNumberFormatter.formatDots('13810002055');
      expect(actual).assertEqual('138.1000.2055');
      log('testFormatDots0193 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0194
     * @tc.name      testFormatDots0194
     * @tc.desc      formatDots(13810002192) -> 138.1000.2192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0194 begin');
      const actual: string = CallNumberFormatter.formatDots('13810002192');
      expect(actual).assertEqual('138.1000.2192');
      log('testFormatDots0194 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0195
     * @tc.name      testFormatDots0195
     * @tc.desc      formatDots(13810002329) -> 138.1000.2329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0195 begin');
      const actual: string = CallNumberFormatter.formatDots('13810002329');
      expect(actual).assertEqual('138.1000.2329');
      log('testFormatDots0195 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0196
     * @tc.name      testFormatDots0196
     * @tc.desc      formatDots(13810002466) -> 138.1000.2466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0196 begin');
      const actual: string = CallNumberFormatter.formatDots('13810002466');
      expect(actual).assertEqual('138.1000.2466');
      log('testFormatDots0196 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0197
     * @tc.name      testFormatDots0197
     * @tc.desc      formatDots(13810002603) -> 138.1000.2603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0197 begin');
      const actual: string = CallNumberFormatter.formatDots('13810002603');
      expect(actual).assertEqual('138.1000.2603');
      log('testFormatDots0197 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0198
     * @tc.name      testFormatDots0198
     * @tc.desc      formatDots(1000000000) -> 100.000.0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0198 begin');
      const actual: string = CallNumberFormatter.formatDots('1000000000');
      expect(actual).assertEqual('100.000.0000');
      log('testFormatDots0198 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0199
     * @tc.name      testFormatDots0199
     * @tc.desc      formatDots(1001234567) -> 100.123.4567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0199 begin');
      const actual: string = CallNumberFormatter.formatDots('1001234567');
      expect(actual).assertEqual('100.123.4567');
      log('testFormatDots0199 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0200
     * @tc.name      testFormatDots0200
     * @tc.desc      formatDots(1002469134) -> 100.246.9134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0200 begin');
      const actual: string = CallNumberFormatter.formatDots('1002469134');
      expect(actual).assertEqual('100.246.9134');
      log('testFormatDots0200 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0201
     * @tc.name      testFormatDots0201
     * @tc.desc      formatDots(1003703701) -> 100.370.3701
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0201 begin');
      const actual: string = CallNumberFormatter.formatDots('1003703701');
      expect(actual).assertEqual('100.370.3701');
      log('testFormatDots0201 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0202
     * @tc.name      testFormatDots0202
     * @tc.desc      formatDots(1004938268) -> 100.493.8268
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0202 begin');
      const actual: string = CallNumberFormatter.formatDots('1004938268');
      expect(actual).assertEqual('100.493.8268');
      log('testFormatDots0202 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0203
     * @tc.name      testFormatDots0203
     * @tc.desc      formatDots(1006172835) -> 100.617.2835
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0203 begin');
      const actual: string = CallNumberFormatter.formatDots('1006172835');
      expect(actual).assertEqual('100.617.2835');
      log('testFormatDots0203 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0204
     * @tc.name      testFormatDots0204
     * @tc.desc      formatDots(1007407402) -> 100.740.7402
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0204 begin');
      const actual: string = CallNumberFormatter.formatDots('1007407402');
      expect(actual).assertEqual('100.740.7402');
      log('testFormatDots0204 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0205
     * @tc.name      testFormatDots0205
     * @tc.desc      formatDots(1008641969) -> 100.864.1969
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0205 begin');
      const actual: string = CallNumberFormatter.formatDots('1008641969');
      expect(actual).assertEqual('100.864.1969');
      log('testFormatDots0205 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0206
     * @tc.name      testFormatDots0206
     * @tc.desc      formatDots(1009876536) -> 100.987.6536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0206 begin');
      const actual: string = CallNumberFormatter.formatDots('1009876536');
      expect(actual).assertEqual('100.987.6536');
      log('testFormatDots0206 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0207
     * @tc.name      testFormatDots0207
     * @tc.desc      formatDots(1011111103) -> 101.111.1103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0207 begin');
      const actual: string = CallNumberFormatter.formatDots('1011111103');
      expect(actual).assertEqual('101.111.1103');
      log('testFormatDots0207 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0208
     * @tc.name      testFormatDots0208
     * @tc.desc      formatDots(1012345670) -> 101.234.5670
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0208 begin');
      const actual: string = CallNumberFormatter.formatDots('1012345670');
      expect(actual).assertEqual('101.234.5670');
      log('testFormatDots0208 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0209
     * @tc.name      testFormatDots0209
     * @tc.desc      formatDots(1013580237) -> 101.358.0237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0209 begin');
      const actual: string = CallNumberFormatter.formatDots('1013580237');
      expect(actual).assertEqual('101.358.0237');
      log('testFormatDots0209 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0210
     * @tc.name      testFormatDots0210
     * @tc.desc      formatDots(1234567) -> 1234567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0210 begin');
      const actual: string = CallNumberFormatter.formatDots('1234567');
      expect(actual).assertEqual('1234567');
      log('testFormatDots0210 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0211
     * @tc.name      testFormatDots0211
     * @tc.desc      formatDots(123456789) -> 123456789
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0211 begin');
      const actual: string = CallNumberFormatter.formatDots('123456789');
      expect(actual).assertEqual('123456789');
      log('testFormatDots0211 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0212
     * @tc.name      testFormatDots0212
     * @tc.desc      formatDots(123456789012) -> 123456789012
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0212 begin');
      const actual: string = CallNumberFormatter.formatDots('123456789012');
      expect(actual).assertEqual('123456789012');
      log('testFormatDots0212 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0213
     * @tc.name      testFormatDots0213
     * @tc.desc      formatDots(123) -> 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0213 begin');
      const actual: string = CallNumberFormatter.formatDots('123');
      expect(actual).assertEqual('123');
      log('testFormatDots0213 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0214
     * @tc.name      testFormatDots0214
     * @tc.desc      formatDots(12345) -> 12345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0214 begin');
      const actual: string = CallNumberFormatter.formatDots('12345');
      expect(actual).assertEqual('12345');
      log('testFormatDots0214 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0215
     * @tc.name      testFormatDots0215
     * @tc.desc      formatDots(1) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDots0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDots0215 begin');
      const actual: string = CallNumberFormatter.formatDots('1');
      expect(actual).assertEqual('1');
      log('testFormatDots0215 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0216
     * @tc.name      testMaskMiddle0216
     * @tc.desc      maskMiddle(13810000000,3,4) -> 138****0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0216 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 3, 4);
      expect(actual).assertEqual('138****0000');
      log('testMaskMiddle0216 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0217
     * @tc.name      testMaskMiddle0217
     * @tc.desc      maskMiddle(13810000000,4,4) -> 1381***0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0217 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 4, 4);
      expect(actual).assertEqual('1381***0000');
      log('testMaskMiddle0217 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0218
     * @tc.name      testMaskMiddle0218
     * @tc.desc      maskMiddle(13810000000,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0218 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0218 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0219
     * @tc.name      testMaskMiddle0219
     * @tc.desc      maskMiddle(13810000000,0,4) -> *******0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0219 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 0, 4);
      expect(actual).assertEqual('*******0000');
      log('testMaskMiddle0219 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0220
     * @tc.name      testMaskMiddle0220
     * @tc.desc      maskMiddle(13810000000,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0220 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0220 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0221
     * @tc.name      testMaskMiddle0221
     * @tc.desc      maskMiddle(13810000000,11,0) -> 13810000000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0221 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 11, 0);
      expect(actual).assertEqual('13810000000');
      log('testMaskMiddle0221 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0222
     * @tc.name      testMaskMiddle0222
     * @tc.desc      maskMiddle(13810000000,12,0) -> 13810000000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0222 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 12, 0);
      expect(actual).assertEqual('13810000000');
      log('testMaskMiddle0222 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0223
     * @tc.name      testMaskMiddle0223
     * @tc.desc      maskMiddle(13810000000,6,6) -> 13810000000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0223 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 6, 6);
      expect(actual).assertEqual('13810000000');
      log('testMaskMiddle0223 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0224
     * @tc.name      testMaskMiddle0224
     * @tc.desc      maskMiddle(13810000000,2,3) -> 13******000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0224 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 2, 3);
      expect(actual).assertEqual('13******000');
      log('testMaskMiddle0224 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0225
     * @tc.name      testMaskMiddle0225
     * @tc.desc      maskMiddle(13810000000,5,5) -> 13810*00000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0225 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000000', 5, 5);
      expect(actual).assertEqual('13810*00000');
      log('testMaskMiddle0225 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0226
     * @tc.name      testMaskMiddle0226
     * @tc.desc      maskMiddle(13810000137,3,4) -> 138****0137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0226 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 3, 4);
      expect(actual).assertEqual('138****0137');
      log('testMaskMiddle0226 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0227
     * @tc.name      testMaskMiddle0227
     * @tc.desc      maskMiddle(13810000137,4,4) -> 1381***0137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0227 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 4, 4);
      expect(actual).assertEqual('1381***0137');
      log('testMaskMiddle0227 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0228
     * @tc.name      testMaskMiddle0228
     * @tc.desc      maskMiddle(13810000137,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0228 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000137', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0228 end');
      await yieldToMain();
    })
  })
}
