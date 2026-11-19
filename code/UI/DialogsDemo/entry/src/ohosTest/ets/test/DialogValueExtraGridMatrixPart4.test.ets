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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { formatDateValue, formatTimeValue, formatTextValue } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogValueExtraGridMatrixPart4Test(): void {
  describe('DialogValueExtraGridMatrixPart4', () => {

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_12100
     * @tc.name      testTimeExtra0121
     * @tc.desc      Verify formatTimeValue 10:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0121 begin');
      await delayTick();
      expect(formatTimeValue(10, 5)).assertEqual('10:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0121 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_12200
     * @tc.name      testTimeExtra0122
     * @tc.desc      Verify formatTimeValue 10:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0122 begin');
      await delayTick();
      expect(formatTimeValue(10, 30)).assertEqual('10:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0122 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_12300
     * @tc.name      testTimeExtra0123
     * @tc.desc      Verify formatTimeValue 12:00.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0123 begin');
      await delayTick();
      expect(formatTimeValue(12, 0)).assertEqual('12:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0123 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_12400
     * @tc.name      testTimeExtra0124
     * @tc.desc      Verify formatTimeValue 12:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0124 begin');
      await delayTick();
      expect(formatTimeValue(12, 5)).assertEqual('12:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0124 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_12500
     * @tc.name      testTimeExtra0125
     * @tc.desc      Verify formatTimeValue 12:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0125 begin');
      await delayTick();
      expect(formatTimeValue(12, 10)).assertEqual('12:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0125 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_12600
     * @tc.name      testTimeExtra0126
     * @tc.desc      Verify formatTimeValue 12:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0126 begin');
      await delayTick();
      expect(formatTimeValue(12, 30)).assertEqual('12:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0126 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_12700
     * @tc.name      testTimeExtra0127
     * @tc.desc      Verify formatTimeValue 12:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0127 begin');
      await delayTick();
      expect(formatTimeValue(12, 59)).assertEqual('12:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0127 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_12800
     * @tc.name      testTimeExtra0128
     * @tc.desc      Verify formatTimeValue 23:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0128 begin');
      await delayTick();
      expect(formatTimeValue(23, 5)).assertEqual('23:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0128 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_12900
     * @tc.name      testTimeExtra0129
     * @tc.desc      Verify formatTimeValue 23:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0129 begin');
      await delayTick();
      expect(formatTimeValue(23, 30)).assertEqual('23:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0129 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13000
     * @tc.name      testTimeExtra0130
     * @tc.desc      Verify formatTimeValue 24:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0130 begin');
      await delayTick();
      expect(formatTimeValue(24, 5)).assertEqual('24:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0130 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13100
     * @tc.name      testTimeExtra0131
     * @tc.desc      Verify formatTimeValue 24:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0131 begin');
      await delayTick();
      expect(formatTimeValue(24, 30)).assertEqual('24:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0131 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13200
     * @tc.name      testTimeExtra0132
     * @tc.desc      Verify formatTimeValue 99:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0132 begin');
      await delayTick();
      expect(formatTimeValue(99, 5)).assertEqual('99:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0132 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13300
     * @tc.name      testTimeExtra0133
     * @tc.desc      Verify formatTimeValue 99:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0133 begin');
      await delayTick();
      expect(formatTimeValue(99, 30)).assertEqual('99:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0133 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13400
     * @tc.name      testTextExtra0134
     * @tc.desc      Verify formatTextValue '' index -2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0134 begin');
      await delayTick();
      expect(formatTextValue('', -2)).assertEqual('index=-2 value=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0134 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13500
     * @tc.name      testTextExtra0135
     * @tc.desc      Verify formatTextValue '' index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0135 begin');
      await delayTick();
      expect(formatTextValue('', 3)).assertEqual('index=3 value=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0135 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13600
     * @tc.name      testTextExtra0136
     * @tc.desc      Verify formatTextValue '' index 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0136 begin');
      await delayTick();
      expect(formatTextValue('', 7)).assertEqual('index=7 value=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0136 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13700
     * @tc.name      testTextExtra0137
     * @tc.desc      Verify formatTextValue 'alpha' index -2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0137 begin');
      await delayTick();
      expect(formatTextValue('alpha', -2)).assertEqual('index=-2 value=alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0137 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13800
     * @tc.name      testTextExtra0138
     * @tc.desc      Verify formatTextValue 'alpha' index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0138 begin');
      await delayTick();
      expect(formatTextValue('alpha', 3)).assertEqual('index=3 value=alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0138 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_13900
     * @tc.name      testTextExtra0139
     * @tc.desc      Verify formatTextValue 'alpha' index 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0139 begin');
      await delayTick();
      expect(formatTextValue('alpha', 7)).assertEqual('index=7 value=alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0139 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14000
     * @tc.name      testTextExtra0140
     * @tc.desc      Verify formatTextValue 'beta' index -2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0140 begin');
      await delayTick();
      expect(formatTextValue('beta', -2)).assertEqual('index=-2 value=beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0140 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14100
     * @tc.name      testTextExtra0141
     * @tc.desc      Verify formatTextValue 'beta' index 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0141 begin');
      await delayTick();
      expect(formatTextValue('beta', 0)).assertEqual('index=0 value=beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0141 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14200
     * @tc.name      testTextExtra0142
     * @tc.desc      Verify formatTextValue 'beta' index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0142 begin');
      await delayTick();
      expect(formatTextValue('beta', 3)).assertEqual('index=3 value=beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0142 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14300
     * @tc.name      testTextExtra0143
     * @tc.desc      Verify formatTextValue 'beta' index 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0143 begin');
      await delayTick();
      expect(formatTextValue('beta', 7)).assertEqual('index=7 value=beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0143 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14400
     * @tc.name      testTextExtra0144
     * @tc.desc      Verify formatTextValue 'beta' index 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0144 begin');
      await delayTick();
      expect(formatTextValue('beta', 99)).assertEqual('index=99 value=beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0144 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14500
     * @tc.name      testTextExtra0145
     * @tc.desc      Verify formatTextValue '中文' index -2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0145 begin');
      await delayTick();
      expect(formatTextValue('中文', -2)).assertEqual('index=-2 value=中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0145 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14600
     * @tc.name      testTextExtra0146
     * @tc.desc      Verify formatTextValue '中文' index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0146 begin');
      await delayTick();
      expect(formatTextValue('中文', 3)).assertEqual('index=3 value=中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0146 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14700
     * @tc.name      testTextExtra0147
     * @tc.desc      Verify formatTextValue '中文' index 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0147 begin');
      await delayTick();
      expect(formatTextValue('中文', 7)).assertEqual('index=7 value=中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0147 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14800
     * @tc.name      testTextExtra0148
     * @tc.desc      Verify formatTextValue 'a b' index -2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0148 begin');
      await delayTick();
      expect(formatTextValue('a b', -2)).assertEqual('index=-2 value=a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0148 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_14900
     * @tc.name      testTextExtra0149
     * @tc.desc      Verify formatTextValue 'a b' index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0149 begin');
      await delayTick();
      expect(formatTextValue('a b', 3)).assertEqual('index=3 value=a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0149 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15000
     * @tc.name      testTextExtra0150
     * @tc.desc      Verify formatTextValue 'a b' index 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0150 begin');
      await delayTick();
      expect(formatTextValue('a b', 7)).assertEqual('index=7 value=a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0150 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15100
     * @tc.name      testTextExtra0151
     * @tc.desc      Verify formatTextValue '#1' index -2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0151 begin');
      await delayTick();
      expect(formatTextValue('#1', -2)).assertEqual('index=-2 value=#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0151 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15200
     * @tc.name      testTextExtra0152
     * @tc.desc      Verify formatTextValue '#1' index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0152 begin');
      await delayTick();
      expect(formatTextValue('#1', 3)).assertEqual('index=3 value=#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0152 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15300
     * @tc.name      testTextExtra0153
     * @tc.desc      Verify formatTextValue '#1' index 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0153 begin');
      await delayTick();
      expect(formatTextValue('#1', 7)).assertEqual('index=7 value=#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0153 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15400
     * @tc.name      testTextExtra0154
     * @tc.desc      Verify formatTextValue 'x-y' index -2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0154 begin');
      await delayTick();
      expect(formatTextValue('x-y', -2)).assertEqual('index=-2 value=x-y');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0154 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15500
     * @tc.name      testTextExtra0155
     * @tc.desc      Verify formatTextValue 'x-y' index 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0155 begin');
      await delayTick();
      expect(formatTextValue('x-y', 0)).assertEqual('index=0 value=x-y');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0155 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15600
     * @tc.name      testTextExtra0156
     * @tc.desc      Verify formatTextValue 'x-y' index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0156 begin');
      await delayTick();
      expect(formatTextValue('x-y', 3)).assertEqual('index=3 value=x-y');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0156 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15700
     * @tc.name      testTextExtra0157
     * @tc.desc      Verify formatTextValue 'x-y' index 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0157 begin');
      await delayTick();
      expect(formatTextValue('x-y', 7)).assertEqual('index=7 value=x-y');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0157 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15800
     * @tc.name      testTextExtra0158
     * @tc.desc      Verify formatTextValue 'x-y' index 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0158 begin');
      await delayTick();
      expect(formatTextValue('x-y', 99)).assertEqual('index=99 value=x-y');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0158 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_15900
     * @tc.name      testTextExtra0159
     * @tc.desc      Verify formatTextValue 'line1\nline2' index -2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0159 begin');
      await delayTick();
      expect(formatTextValue('line1\nline2', -2)).assertEqual('index=-2 value=line1\nline2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0159 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP4_16000
     * @tc.name      testTextExtra0160
     * @tc.desc      Verify formatTextValue 'line1\nline2' index 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextExtra0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0160 begin');
      await delayTick();
      expect(formatTextValue('line1\nline2', 3)).assertEqual('index=3 value=line1\nline2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextExtra0160 end');
    })

  })
}
