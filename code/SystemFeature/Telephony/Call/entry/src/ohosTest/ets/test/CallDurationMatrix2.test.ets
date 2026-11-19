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
const TAG: string = 'CallDurationMatrix2';
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

export default function callDurationMatrix2Test(): void {
  describe('CallDurationMatrix2', () => {
    /**
     * @tc.number    SUB_CALL_DURATION_0115
     * @tc.name      testFormat0115
     * @tc.desc      format(114 seconds) -> 01:54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0115 begin');
      const actual: string = CallDurationFormatter.format(114);
      expect(actual).assertEqual('01:54');
      log('testFormat0115 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0116
     * @tc.name      testFormat0116
     * @tc.desc      format(115 seconds) -> 01:55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0116 begin');
      const actual: string = CallDurationFormatter.format(115);
      expect(actual).assertEqual('01:55');
      log('testFormat0116 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0117
     * @tc.name      testFormat0117
     * @tc.desc      format(116 seconds) -> 01:56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0117 begin');
      const actual: string = CallDurationFormatter.format(116);
      expect(actual).assertEqual('01:56');
      log('testFormat0117 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0118
     * @tc.name      testFormat0118
     * @tc.desc      format(117 seconds) -> 01:57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0118 begin');
      const actual: string = CallDurationFormatter.format(117);
      expect(actual).assertEqual('01:57');
      log('testFormat0118 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0119
     * @tc.name      testFormat0119
     * @tc.desc      format(118 seconds) -> 01:58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0119 begin');
      const actual: string = CallDurationFormatter.format(118);
      expect(actual).assertEqual('01:58');
      log('testFormat0119 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0120
     * @tc.name      testFormat0120
     * @tc.desc      format(119 seconds) -> 01:59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0120 begin');
      const actual: string = CallDurationFormatter.format(119);
      expect(actual).assertEqual('01:59');
      log('testFormat0120 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0121
     * @tc.name      testFormat0121
     * @tc.desc      format(120 seconds) -> 02:00
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0121 begin');
      const actual: string = CallDurationFormatter.format(120);
      expect(actual).assertEqual('02:00');
      log('testFormat0121 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0122
     * @tc.name      testFormat0122
     * @tc.desc      format(179 seconds) -> 02:59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0122 begin');
      const actual: string = CallDurationFormatter.format(179);
      expect(actual).assertEqual('02:59');
      log('testFormat0122 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0123
     * @tc.name      testFormat0123
     * @tc.desc      format(180 seconds) -> 03:00
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0123 begin');
      const actual: string = CallDurationFormatter.format(180);
      expect(actual).assertEqual('03:00');
      log('testFormat0123 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0124
     * @tc.name      testFormat0124
     * @tc.desc      format(181 seconds) -> 03:01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0124 begin');
      const actual: string = CallDurationFormatter.format(181);
      expect(actual).assertEqual('03:01');
      log('testFormat0124 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0125
     * @tc.name      testFormat0125
     * @tc.desc      format(359 seconds) -> 05:59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0125 begin');
      const actual: string = CallDurationFormatter.format(359);
      expect(actual).assertEqual('05:59');
      log('testFormat0125 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0126
     * @tc.name      testFormat0126
     * @tc.desc      format(3599 seconds) -> 59:59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0126 begin');
      const actual: string = CallDurationFormatter.format(3599);
      expect(actual).assertEqual('59:59');
      log('testFormat0126 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0127
     * @tc.name      testFormat0127
     * @tc.desc      format(3600 seconds) -> 1:00:00
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0127 begin');
      const actual: string = CallDurationFormatter.format(3600);
      expect(actual).assertEqual('1:00:00');
      log('testFormat0127 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0128
     * @tc.name      testFormat0128
     * @tc.desc      format(3601 seconds) -> 1:00:01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0128 begin');
      const actual: string = CallDurationFormatter.format(3601);
      expect(actual).assertEqual('1:00:01');
      log('testFormat0128 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0129
     * @tc.name      testFormat0129
     * @tc.desc      format(7199 seconds) -> 1:59:59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0129 begin');
      const actual: string = CallDurationFormatter.format(7199);
      expect(actual).assertEqual('1:59:59');
      log('testFormat0129 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0130
     * @tc.name      testFormat0130
     * @tc.desc      format(7200 seconds) -> 2:00:00
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0130 begin');
      const actual: string = CallDurationFormatter.format(7200);
      expect(actual).assertEqual('2:00:00');
      log('testFormat0130 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0131
     * @tc.name      testFormat0131
     * @tc.desc      format(86399 seconds) -> 23:59:59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0131 begin');
      const actual: string = CallDurationFormatter.format(86399);
      expect(actual).assertEqual('23:59:59');
      log('testFormat0131 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0132
     * @tc.name      testFormat0132
     * @tc.desc      format(86400 seconds) -> 24:00:00
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0132 begin');
      const actual: string = CallDurationFormatter.format(86400);
      expect(actual).assertEqual('24:00:00');
      log('testFormat0132 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0133
     * @tc.name      testFormat0133
     * @tc.desc      format(90061 seconds) -> 25:01:01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0133 begin');
      const actual: string = CallDurationFormatter.format(90061);
      expect(actual).assertEqual('25:01:01');
      log('testFormat0133 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0134
     * @tc.name      testFormat0134
     * @tc.desc      format(99999 seconds) -> 27:46:39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0134 begin');
      const actual: string = CallDurationFormatter.format(99999);
      expect(actual).assertEqual('27:46:39');
      log('testFormat0134 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0135
     * @tc.name      testFormat0135
     * @tc.desc      format(-1 seconds) -> 00:00
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0135 begin');
      const actual: string = CallDurationFormatter.format(-1);
      expect(actual).assertEqual('00:00');
      log('testFormat0135 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0136
     * @tc.name      testFormat0136
     * @tc.desc      format(-60 seconds) -> 00:00
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0136 begin');
      const actual: string = CallDurationFormatter.format(-60);
      expect(actual).assertEqual('00:00');
      log('testFormat0136 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0137
     * @tc.name      testFormatWords0137
     * @tc.desc      formatWords(0 seconds) -> 0 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0137 begin');
      const actual: string = CallDurationFormatter.formatWords(0);
      expect(actual).assertEqual('0 sec');
      log('testFormatWords0137 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0138
     * @tc.name      testFormatWords0138
     * @tc.desc      formatWords(1 seconds) -> 1 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0138 begin');
      const actual: string = CallDurationFormatter.formatWords(1);
      expect(actual).assertEqual('1 sec');
      log('testFormatWords0138 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0139
     * @tc.name      testFormatWords0139
     * @tc.desc      formatWords(2 seconds) -> 2 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0139 begin');
      const actual: string = CallDurationFormatter.formatWords(2);
      expect(actual).assertEqual('2 sec');
      log('testFormatWords0139 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0140
     * @tc.name      testFormatWords0140
     * @tc.desc      formatWords(3 seconds) -> 3 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0140 begin');
      const actual: string = CallDurationFormatter.formatWords(3);
      expect(actual).assertEqual('3 sec');
      log('testFormatWords0140 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0141
     * @tc.name      testFormatWords0141
     * @tc.desc      formatWords(4 seconds) -> 4 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0141 begin');
      const actual: string = CallDurationFormatter.formatWords(4);
      expect(actual).assertEqual('4 sec');
      log('testFormatWords0141 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0142
     * @tc.name      testFormatWords0142
     * @tc.desc      formatWords(5 seconds) -> 5 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0142 begin');
      const actual: string = CallDurationFormatter.formatWords(5);
      expect(actual).assertEqual('5 sec');
      log('testFormatWords0142 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0143
     * @tc.name      testFormatWords0143
     * @tc.desc      formatWords(6 seconds) -> 6 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0143 begin');
      const actual: string = CallDurationFormatter.formatWords(6);
      expect(actual).assertEqual('6 sec');
      log('testFormatWords0143 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0144
     * @tc.name      testFormatWords0144
     * @tc.desc      formatWords(7 seconds) -> 7 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0144 begin');
      const actual: string = CallDurationFormatter.formatWords(7);
      expect(actual).assertEqual('7 sec');
      log('testFormatWords0144 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0145
     * @tc.name      testFormatWords0145
     * @tc.desc      formatWords(8 seconds) -> 8 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0145 begin');
      const actual: string = CallDurationFormatter.formatWords(8);
      expect(actual).assertEqual('8 sec');
      log('testFormatWords0145 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0146
     * @tc.name      testFormatWords0146
     * @tc.desc      formatWords(9 seconds) -> 9 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0146 begin');
      const actual: string = CallDurationFormatter.formatWords(9);
      expect(actual).assertEqual('9 sec');
      log('testFormatWords0146 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0147
     * @tc.name      testFormatWords0147
     * @tc.desc      formatWords(10 seconds) -> 10 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0147 begin');
      const actual: string = CallDurationFormatter.formatWords(10);
      expect(actual).assertEqual('10 sec');
      log('testFormatWords0147 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0148
     * @tc.name      testFormatWords0148
     * @tc.desc      formatWords(11 seconds) -> 11 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0148 begin');
      const actual: string = CallDurationFormatter.formatWords(11);
      expect(actual).assertEqual('11 sec');
      log('testFormatWords0148 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0149
     * @tc.name      testFormatWords0149
     * @tc.desc      formatWords(12 seconds) -> 12 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0149 begin');
      const actual: string = CallDurationFormatter.formatWords(12);
      expect(actual).assertEqual('12 sec');
      log('testFormatWords0149 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0150
     * @tc.name      testFormatWords0150
     * @tc.desc      formatWords(13 seconds) -> 13 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0150 begin');
      const actual: string = CallDurationFormatter.formatWords(13);
      expect(actual).assertEqual('13 sec');
      log('testFormatWords0150 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0151
     * @tc.name      testFormatWords0151
     * @tc.desc      formatWords(14 seconds) -> 14 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0151 begin');
      const actual: string = CallDurationFormatter.formatWords(14);
      expect(actual).assertEqual('14 sec');
      log('testFormatWords0151 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0152
     * @tc.name      testFormatWords0152
     * @tc.desc      formatWords(15 seconds) -> 15 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0152 begin');
      const actual: string = CallDurationFormatter.formatWords(15);
      expect(actual).assertEqual('15 sec');
      log('testFormatWords0152 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0153
     * @tc.name      testFormatWords0153
     * @tc.desc      formatWords(16 seconds) -> 16 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0153 begin');
      const actual: string = CallDurationFormatter.formatWords(16);
      expect(actual).assertEqual('16 sec');
      log('testFormatWords0153 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0154
     * @tc.name      testFormatWords0154
     * @tc.desc      formatWords(17 seconds) -> 17 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0154 begin');
      const actual: string = CallDurationFormatter.formatWords(17);
      expect(actual).assertEqual('17 sec');
      log('testFormatWords0154 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0155
     * @tc.name      testFormatWords0155
     * @tc.desc      formatWords(18 seconds) -> 18 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0155 begin');
      const actual: string = CallDurationFormatter.formatWords(18);
      expect(actual).assertEqual('18 sec');
      log('testFormatWords0155 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0156
     * @tc.name      testFormatWords0156
     * @tc.desc      formatWords(19 seconds) -> 19 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0156 begin');
      const actual: string = CallDurationFormatter.formatWords(19);
      expect(actual).assertEqual('19 sec');
      log('testFormatWords0156 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0157
     * @tc.name      testFormatWords0157
     * @tc.desc      formatWords(20 seconds) -> 20 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0157 begin');
      const actual: string = CallDurationFormatter.formatWords(20);
      expect(actual).assertEqual('20 sec');
      log('testFormatWords0157 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0158
     * @tc.name      testFormatWords0158
     * @tc.desc      formatWords(21 seconds) -> 21 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0158 begin');
      const actual: string = CallDurationFormatter.formatWords(21);
      expect(actual).assertEqual('21 sec');
      log('testFormatWords0158 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0159
     * @tc.name      testFormatWords0159
     * @tc.desc      formatWords(22 seconds) -> 22 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0159 begin');
      const actual: string = CallDurationFormatter.formatWords(22);
      expect(actual).assertEqual('22 sec');
      log('testFormatWords0159 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0160
     * @tc.name      testFormatWords0160
     * @tc.desc      formatWords(23 seconds) -> 23 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0160 begin');
      const actual: string = CallDurationFormatter.formatWords(23);
      expect(actual).assertEqual('23 sec');
      log('testFormatWords0160 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0161
     * @tc.name      testFormatWords0161
     * @tc.desc      formatWords(24 seconds) -> 24 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0161 begin');
      const actual: string = CallDurationFormatter.formatWords(24);
      expect(actual).assertEqual('24 sec');
      log('testFormatWords0161 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0162
     * @tc.name      testFormatWords0162
     * @tc.desc      formatWords(25 seconds) -> 25 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0162 begin');
      const actual: string = CallDurationFormatter.formatWords(25);
      expect(actual).assertEqual('25 sec');
      log('testFormatWords0162 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0163
     * @tc.name      testFormatWords0163
     * @tc.desc      formatWords(26 seconds) -> 26 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0163 begin');
      const actual: string = CallDurationFormatter.formatWords(26);
      expect(actual).assertEqual('26 sec');
      log('testFormatWords0163 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0164
     * @tc.name      testFormatWords0164
     * @tc.desc      formatWords(27 seconds) -> 27 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0164 begin');
      const actual: string = CallDurationFormatter.formatWords(27);
      expect(actual).assertEqual('27 sec');
      log('testFormatWords0164 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0165
     * @tc.name      testFormatWords0165
     * @tc.desc      formatWords(28 seconds) -> 28 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0165 begin');
      const actual: string = CallDurationFormatter.formatWords(28);
      expect(actual).assertEqual('28 sec');
      log('testFormatWords0165 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0166
     * @tc.name      testFormatWords0166
     * @tc.desc      formatWords(29 seconds) -> 29 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0166 begin');
      const actual: string = CallDurationFormatter.formatWords(29);
      expect(actual).assertEqual('29 sec');
      log('testFormatWords0166 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0167
     * @tc.name      testFormatWords0167
     * @tc.desc      formatWords(30 seconds) -> 30 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0167 begin');
      const actual: string = CallDurationFormatter.formatWords(30);
      expect(actual).assertEqual('30 sec');
      log('testFormatWords0167 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0168
     * @tc.name      testFormatWords0168
     * @tc.desc      formatWords(31 seconds) -> 31 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0168 begin');
      const actual: string = CallDurationFormatter.formatWords(31);
      expect(actual).assertEqual('31 sec');
      log('testFormatWords0168 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0169
     * @tc.name      testFormatWords0169
     * @tc.desc      formatWords(32 seconds) -> 32 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0169 begin');
      const actual: string = CallDurationFormatter.formatWords(32);
      expect(actual).assertEqual('32 sec');
      log('testFormatWords0169 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0170
     * @tc.name      testFormatWords0170
     * @tc.desc      formatWords(33 seconds) -> 33 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0170 begin');
      const actual: string = CallDurationFormatter.formatWords(33);
      expect(actual).assertEqual('33 sec');
      log('testFormatWords0170 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0171
     * @tc.name      testFormatWords0171
     * @tc.desc      formatWords(34 seconds) -> 34 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0171 begin');
      const actual: string = CallDurationFormatter.formatWords(34);
      expect(actual).assertEqual('34 sec');
      log('testFormatWords0171 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0172
     * @tc.name      testFormatWords0172
     * @tc.desc      formatWords(35 seconds) -> 35 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0172 begin');
      const actual: string = CallDurationFormatter.formatWords(35);
      expect(actual).assertEqual('35 sec');
      log('testFormatWords0172 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0173
     * @tc.name      testFormatWords0173
     * @tc.desc      formatWords(36 seconds) -> 36 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0173 begin');
      const actual: string = CallDurationFormatter.formatWords(36);
      expect(actual).assertEqual('36 sec');
      log('testFormatWords0173 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0174
     * @tc.name      testFormatWords0174
     * @tc.desc      formatWords(37 seconds) -> 37 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0174 begin');
      const actual: string = CallDurationFormatter.formatWords(37);
      expect(actual).assertEqual('37 sec');
      log('testFormatWords0174 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0175
     * @tc.name      testFormatWords0175
     * @tc.desc      formatWords(38 seconds) -> 38 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0175 begin');
      const actual: string = CallDurationFormatter.formatWords(38);
      expect(actual).assertEqual('38 sec');
      log('testFormatWords0175 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0176
     * @tc.name      testFormatWords0176
     * @tc.desc      formatWords(39 seconds) -> 39 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0176 begin');
      const actual: string = CallDurationFormatter.formatWords(39);
      expect(actual).assertEqual('39 sec');
      log('testFormatWords0176 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0177
     * @tc.name      testFormatWords0177
     * @tc.desc      formatWords(40 seconds) -> 40 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0177 begin');
      const actual: string = CallDurationFormatter.formatWords(40);
      expect(actual).assertEqual('40 sec');
      log('testFormatWords0177 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0178
     * @tc.name      testFormatWords0178
     * @tc.desc      formatWords(41 seconds) -> 41 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0178 begin');
      const actual: string = CallDurationFormatter.formatWords(41);
      expect(actual).assertEqual('41 sec');
      log('testFormatWords0178 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0179
     * @tc.name      testFormatWords0179
     * @tc.desc      formatWords(42 seconds) -> 42 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0179 begin');
      const actual: string = CallDurationFormatter.formatWords(42);
      expect(actual).assertEqual('42 sec');
      log('testFormatWords0179 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0180
     * @tc.name      testFormatWords0180
     * @tc.desc      formatWords(43 seconds) -> 43 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0180 begin');
      const actual: string = CallDurationFormatter.formatWords(43);
      expect(actual).assertEqual('43 sec');
      log('testFormatWords0180 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0181
     * @tc.name      testFormatWords0181
     * @tc.desc      formatWords(44 seconds) -> 44 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0181 begin');
      const actual: string = CallDurationFormatter.formatWords(44);
      expect(actual).assertEqual('44 sec');
      log('testFormatWords0181 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0182
     * @tc.name      testFormatWords0182
     * @tc.desc      formatWords(45 seconds) -> 45 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0182 begin');
      const actual: string = CallDurationFormatter.formatWords(45);
      expect(actual).assertEqual('45 sec');
      log('testFormatWords0182 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0183
     * @tc.name      testFormatWords0183
     * @tc.desc      formatWords(46 seconds) -> 46 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0183 begin');
      const actual: string = CallDurationFormatter.formatWords(46);
      expect(actual).assertEqual('46 sec');
      log('testFormatWords0183 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0184
     * @tc.name      testFormatWords0184
     * @tc.desc      formatWords(47 seconds) -> 47 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0184 begin');
      const actual: string = CallDurationFormatter.formatWords(47);
      expect(actual).assertEqual('47 sec');
      log('testFormatWords0184 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0185
     * @tc.name      testFormatWords0185
     * @tc.desc      formatWords(48 seconds) -> 48 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0185 begin');
      const actual: string = CallDurationFormatter.formatWords(48);
      expect(actual).assertEqual('48 sec');
      log('testFormatWords0185 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0186
     * @tc.name      testFormatWords0186
     * @tc.desc      formatWords(49 seconds) -> 49 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0186 begin');
      const actual: string = CallDurationFormatter.formatWords(49);
      expect(actual).assertEqual('49 sec');
      log('testFormatWords0186 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0187
     * @tc.name      testFormatWords0187
     * @tc.desc      formatWords(50 seconds) -> 50 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0187 begin');
      const actual: string = CallDurationFormatter.formatWords(50);
      expect(actual).assertEqual('50 sec');
      log('testFormatWords0187 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0188
     * @tc.name      testFormatWords0188
     * @tc.desc      formatWords(51 seconds) -> 51 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0188 begin');
      const actual: string = CallDurationFormatter.formatWords(51);
      expect(actual).assertEqual('51 sec');
      log('testFormatWords0188 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0189
     * @tc.name      testFormatWords0189
     * @tc.desc      formatWords(52 seconds) -> 52 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0189 begin');
      const actual: string = CallDurationFormatter.formatWords(52);
      expect(actual).assertEqual('52 sec');
      log('testFormatWords0189 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0190
     * @tc.name      testFormatWords0190
     * @tc.desc      formatWords(53 seconds) -> 53 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0190 begin');
      const actual: string = CallDurationFormatter.formatWords(53);
      expect(actual).assertEqual('53 sec');
      log('testFormatWords0190 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0191
     * @tc.name      testFormatWords0191
     * @tc.desc      formatWords(54 seconds) -> 54 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0191 begin');
      const actual: string = CallDurationFormatter.formatWords(54);
      expect(actual).assertEqual('54 sec');
      log('testFormatWords0191 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0192
     * @tc.name      testFormatWords0192
     * @tc.desc      formatWords(55 seconds) -> 55 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0192 begin');
      const actual: string = CallDurationFormatter.formatWords(55);
      expect(actual).assertEqual('55 sec');
      log('testFormatWords0192 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0193
     * @tc.name      testFormatWords0193
     * @tc.desc      formatWords(56 seconds) -> 56 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0193 begin');
      const actual: string = CallDurationFormatter.formatWords(56);
      expect(actual).assertEqual('56 sec');
      log('testFormatWords0193 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0194
     * @tc.name      testFormatWords0194
     * @tc.desc      formatWords(57 seconds) -> 57 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0194 begin');
      const actual: string = CallDurationFormatter.formatWords(57);
      expect(actual).assertEqual('57 sec');
      log('testFormatWords0194 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0195
     * @tc.name      testFormatWords0195
     * @tc.desc      formatWords(58 seconds) -> 58 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0195 begin');
      const actual: string = CallDurationFormatter.formatWords(58);
      expect(actual).assertEqual('58 sec');
      log('testFormatWords0195 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0196
     * @tc.name      testFormatWords0196
     * @tc.desc      formatWords(59 seconds) -> 59 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0196 begin');
      const actual: string = CallDurationFormatter.formatWords(59);
      expect(actual).assertEqual('59 sec');
      log('testFormatWords0196 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0197
     * @tc.name      testFormatWords0197
     * @tc.desc      formatWords(60 seconds) -> 1 min
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0197 begin');
      const actual: string = CallDurationFormatter.formatWords(60);
      expect(actual).assertEqual('1 min');
      log('testFormatWords0197 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0198
     * @tc.name      testFormatWords0198
     * @tc.desc      formatWords(61 seconds) -> 1 min 1 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0198 begin');
      const actual: string = CallDurationFormatter.formatWords(61);
      expect(actual).assertEqual('1 min 1 sec');
      log('testFormatWords0198 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0199
     * @tc.name      testFormatWords0199
     * @tc.desc      formatWords(62 seconds) -> 1 min 2 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0199 begin');
      const actual: string = CallDurationFormatter.formatWords(62);
      expect(actual).assertEqual('1 min 2 sec');
      log('testFormatWords0199 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0200
     * @tc.name      testFormatWords0200
     * @tc.desc      formatWords(63 seconds) -> 1 min 3 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0200 begin');
      const actual: string = CallDurationFormatter.formatWords(63);
      expect(actual).assertEqual('1 min 3 sec');
      log('testFormatWords0200 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0201
     * @tc.name      testFormatWords0201
     * @tc.desc      formatWords(64 seconds) -> 1 min 4 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0201 begin');
      const actual: string = CallDurationFormatter.formatWords(64);
      expect(actual).assertEqual('1 min 4 sec');
      log('testFormatWords0201 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0202
     * @tc.name      testFormatWords0202
     * @tc.desc      formatWords(65 seconds) -> 1 min 5 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0202 begin');
      const actual: string = CallDurationFormatter.formatWords(65);
      expect(actual).assertEqual('1 min 5 sec');
      log('testFormatWords0202 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0203
     * @tc.name      testFormatWords0203
     * @tc.desc      formatWords(66 seconds) -> 1 min 6 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0203 begin');
      const actual: string = CallDurationFormatter.formatWords(66);
      expect(actual).assertEqual('1 min 6 sec');
      log('testFormatWords0203 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0204
     * @tc.name      testFormatWords0204
     * @tc.desc      formatWords(67 seconds) -> 1 min 7 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0204 begin');
      const actual: string = CallDurationFormatter.formatWords(67);
      expect(actual).assertEqual('1 min 7 sec');
      log('testFormatWords0204 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0205
     * @tc.name      testFormatWords0205
     * @tc.desc      formatWords(68 seconds) -> 1 min 8 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0205 begin');
      const actual: string = CallDurationFormatter.formatWords(68);
      expect(actual).assertEqual('1 min 8 sec');
      log('testFormatWords0205 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0206
     * @tc.name      testFormatWords0206
     * @tc.desc      formatWords(69 seconds) -> 1 min 9 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0206 begin');
      const actual: string = CallDurationFormatter.formatWords(69);
      expect(actual).assertEqual('1 min 9 sec');
      log('testFormatWords0206 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0207
     * @tc.name      testFormatWords0207
     * @tc.desc      formatWords(70 seconds) -> 1 min 10 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0207 begin');
      const actual: string = CallDurationFormatter.formatWords(70);
      expect(actual).assertEqual('1 min 10 sec');
      log('testFormatWords0207 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0208
     * @tc.name      testFormatWords0208
     * @tc.desc      formatWords(71 seconds) -> 1 min 11 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0208 begin');
      const actual: string = CallDurationFormatter.formatWords(71);
      expect(actual).assertEqual('1 min 11 sec');
      log('testFormatWords0208 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0209
     * @tc.name      testFormatWords0209
     * @tc.desc      formatWords(72 seconds) -> 1 min 12 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0209 begin');
      const actual: string = CallDurationFormatter.formatWords(72);
      expect(actual).assertEqual('1 min 12 sec');
      log('testFormatWords0209 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0210
     * @tc.name      testFormatWords0210
     * @tc.desc      formatWords(73 seconds) -> 1 min 13 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0210 begin');
      const actual: string = CallDurationFormatter.formatWords(73);
      expect(actual).assertEqual('1 min 13 sec');
      log('testFormatWords0210 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0211
     * @tc.name      testFormatWords0211
     * @tc.desc      formatWords(74 seconds) -> 1 min 14 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0211 begin');
      const actual: string = CallDurationFormatter.formatWords(74);
      expect(actual).assertEqual('1 min 14 sec');
      log('testFormatWords0211 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0212
     * @tc.name      testFormatWords0212
     * @tc.desc      formatWords(75 seconds) -> 1 min 15 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0212 begin');
      const actual: string = CallDurationFormatter.formatWords(75);
      expect(actual).assertEqual('1 min 15 sec');
      log('testFormatWords0212 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0213
     * @tc.name      testFormatWords0213
     * @tc.desc      formatWords(76 seconds) -> 1 min 16 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0213 begin');
      const actual: string = CallDurationFormatter.formatWords(76);
      expect(actual).assertEqual('1 min 16 sec');
      log('testFormatWords0213 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0214
     * @tc.name      testFormatWords0214
     * @tc.desc      formatWords(77 seconds) -> 1 min 17 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0214 begin');
      const actual: string = CallDurationFormatter.formatWords(77);
      expect(actual).assertEqual('1 min 17 sec');
      log('testFormatWords0214 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0215
     * @tc.name      testFormatWords0215
     * @tc.desc      formatWords(78 seconds) -> 1 min 18 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0215 begin');
      const actual: string = CallDurationFormatter.formatWords(78);
      expect(actual).assertEqual('1 min 18 sec');
      log('testFormatWords0215 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0216
     * @tc.name      testFormatWords0216
     * @tc.desc      formatWords(79 seconds) -> 1 min 19 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0216 begin');
      const actual: string = CallDurationFormatter.formatWords(79);
      expect(actual).assertEqual('1 min 19 sec');
      log('testFormatWords0216 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0217
     * @tc.name      testFormatWords0217
     * @tc.desc      formatWords(80 seconds) -> 1 min 20 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0217 begin');
      const actual: string = CallDurationFormatter.formatWords(80);
      expect(actual).assertEqual('1 min 20 sec');
      log('testFormatWords0217 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0218
     * @tc.name      testFormatWords0218
     * @tc.desc      formatWords(81 seconds) -> 1 min 21 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0218 begin');
      const actual: string = CallDurationFormatter.formatWords(81);
      expect(actual).assertEqual('1 min 21 sec');
      log('testFormatWords0218 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0219
     * @tc.name      testFormatWords0219
     * @tc.desc      formatWords(82 seconds) -> 1 min 22 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0219 begin');
      const actual: string = CallDurationFormatter.formatWords(82);
      expect(actual).assertEqual('1 min 22 sec');
      log('testFormatWords0219 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0220
     * @tc.name      testFormatWords0220
     * @tc.desc      formatWords(83 seconds) -> 1 min 23 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0220 begin');
      const actual: string = CallDurationFormatter.formatWords(83);
      expect(actual).assertEqual('1 min 23 sec');
      log('testFormatWords0220 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0221
     * @tc.name      testFormatWords0221
     * @tc.desc      formatWords(84 seconds) -> 1 min 24 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0221 begin');
      const actual: string = CallDurationFormatter.formatWords(84);
      expect(actual).assertEqual('1 min 24 sec');
      log('testFormatWords0221 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0222
     * @tc.name      testFormatWords0222
     * @tc.desc      formatWords(85 seconds) -> 1 min 25 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0222 begin');
      const actual: string = CallDurationFormatter.formatWords(85);
      expect(actual).assertEqual('1 min 25 sec');
      log('testFormatWords0222 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0223
     * @tc.name      testFormatWords0223
     * @tc.desc      formatWords(86 seconds) -> 1 min 26 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0223 begin');
      const actual: string = CallDurationFormatter.formatWords(86);
      expect(actual).assertEqual('1 min 26 sec');
      log('testFormatWords0223 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0224
     * @tc.name      testFormatWords0224
     * @tc.desc      formatWords(87 seconds) -> 1 min 27 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0224 begin');
      const actual: string = CallDurationFormatter.formatWords(87);
      expect(actual).assertEqual('1 min 27 sec');
      log('testFormatWords0224 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0225
     * @tc.name      testFormatWords0225
     * @tc.desc      formatWords(88 seconds) -> 1 min 28 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0225 begin');
      const actual: string = CallDurationFormatter.formatWords(88);
      expect(actual).assertEqual('1 min 28 sec');
      log('testFormatWords0225 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0226
     * @tc.name      testFormatWords0226
     * @tc.desc      formatWords(89 seconds) -> 1 min 29 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0226 begin');
      const actual: string = CallDurationFormatter.formatWords(89);
      expect(actual).assertEqual('1 min 29 sec');
      log('testFormatWords0226 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0227
     * @tc.name      testFormatWords0227
     * @tc.desc      formatWords(90 seconds) -> 1 min 30 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0227 begin');
      const actual: string = CallDurationFormatter.formatWords(90);
      expect(actual).assertEqual('1 min 30 sec');
      log('testFormatWords0227 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0228
     * @tc.name      testFormatWords0228
     * @tc.desc      formatWords(91 seconds) -> 1 min 31 sec
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatWords0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatWords0228 begin');
      const actual: string = CallDurationFormatter.formatWords(91);
      expect(actual).assertEqual('1 min 31 sec');
      log('testFormatWords0228 end');
      await yieldToMain();
    })
  })
}
