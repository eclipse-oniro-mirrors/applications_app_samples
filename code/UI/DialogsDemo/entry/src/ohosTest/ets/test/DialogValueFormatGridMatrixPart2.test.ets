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

export default function DialogValueFormatGridMatrixPart2Test(): void {
  describe('DialogValueFormatGridMatrixPart2', () => {

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_4100
     * @tc.name      testDateGrid0041
     * @tc.desc      Verify formatDateValue(2024-10-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0041 begin');
      await delayTick();
      const d: Date = new Date(2024, 9, 28);
      expect(formatDateValue(d)).assertEqual('2024-10-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0041 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_4200
     * @tc.name      testDateGrid0042
     * @tc.desc      Verify formatDateValue(2024-11-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0042 begin');
      await delayTick();
      const d: Date = new Date(2024, 10, 1);
      expect(formatDateValue(d)).assertEqual('2024-11-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0042 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_4300
     * @tc.name      testDateGrid0043
     * @tc.desc      Verify formatDateValue(2024-11-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0043 begin');
      await delayTick();
      const d: Date = new Date(2024, 10, 15);
      expect(formatDateValue(d)).assertEqual('2024-11-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0043 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_4400
     * @tc.name      testDateGrid0044
     * @tc.desc      Verify formatDateValue(2024-11-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0044 begin');
      await delayTick();
      const d: Date = new Date(2024, 10, 28);
      expect(formatDateValue(d)).assertEqual('2024-11-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0044 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_4500
     * @tc.name      testDateGrid0045
     * @tc.desc      Verify formatDateValue(2024-12-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0045 begin');
      await delayTick();
      const d: Date = new Date(2024, 11, 1);
      expect(formatDateValue(d)).assertEqual('2024-12-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0045 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_4600
     * @tc.name      testDateGrid0046
     * @tc.desc      Verify formatDateValue(2024-12-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0046 begin');
      await delayTick();
      const d: Date = new Date(2024, 11, 15);
      expect(formatDateValue(d)).assertEqual('2024-12-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0046 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_4700
     * @tc.name      testDateGrid0047
     * @tc.desc      Verify formatDateValue(2024-12-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0047 begin');
      await delayTick();
      const d: Date = new Date(2024, 11, 28);
      expect(formatDateValue(d)).assertEqual('2024-12-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0047 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_4800
     * @tc.name      testTimeGrid0048
     * @tc.desc      Verify formatTimeValue(-1, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0048 begin');
      await delayTick();
      expect(formatTimeValue(-1, 0)).assertEqual('0-1:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0048 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_4900
     * @tc.name      testTimeGrid0049
     * @tc.desc      Verify formatTimeValue(-1, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0049 begin');
      await delayTick();
      expect(formatTimeValue(-1, 1)).assertEqual('0-1:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0049 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5000
     * @tc.name      testTimeGrid0050
     * @tc.desc      Verify formatTimeValue(-1, 9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0050 begin');
      await delayTick();
      expect(formatTimeValue(-1, 9)).assertEqual('0-1:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0050 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5100
     * @tc.name      testTimeGrid0051
     * @tc.desc      Verify formatTimeValue(-1, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0051 begin');
      await delayTick();
      expect(formatTimeValue(-1, 10)).assertEqual('0-1:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0051 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5200
     * @tc.name      testTimeGrid0052
     * @tc.desc      Verify formatTimeValue(-1, 59).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0052 begin');
      await delayTick();
      expect(formatTimeValue(-1, 59)).assertEqual('0-1:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0052 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5300
     * @tc.name      testTimeGrid0053
     * @tc.desc      Verify formatTimeValue(0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0053 begin');
      await delayTick();
      expect(formatTimeValue(0, 0)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0053 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5400
     * @tc.name      testTimeGrid0054
     * @tc.desc      Verify formatTimeValue(0, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0054 begin');
      await delayTick();
      expect(formatTimeValue(0, 1)).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0054 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5500
     * @tc.name      testTimeGrid0055
     * @tc.desc      Verify formatTimeValue(0, 9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0055 begin');
      await delayTick();
      expect(formatTimeValue(0, 9)).assertEqual('00:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0055 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5600
     * @tc.name      testTimeGrid0056
     * @tc.desc      Verify formatTimeValue(0, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0056 begin');
      await delayTick();
      expect(formatTimeValue(0, 10)).assertEqual('00:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0056 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5700
     * @tc.name      testTimeGrid0057
     * @tc.desc      Verify formatTimeValue(0, 59).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0057 begin');
      await delayTick();
      expect(formatTimeValue(0, 59)).assertEqual('00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0057 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5800
     * @tc.name      testTimeGrid0058
     * @tc.desc      Verify formatTimeValue(1, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0058 begin');
      await delayTick();
      expect(formatTimeValue(1, 0)).assertEqual('01:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0058 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_5900
     * @tc.name      testTimeGrid0059
     * @tc.desc      Verify formatTimeValue(1, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0059 begin');
      await delayTick();
      expect(formatTimeValue(1, 1)).assertEqual('01:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0059 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6000
     * @tc.name      testTimeGrid0060
     * @tc.desc      Verify formatTimeValue(1, 9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0060 begin');
      await delayTick();
      expect(formatTimeValue(1, 9)).assertEqual('01:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0060 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6100
     * @tc.name      testTimeGrid0061
     * @tc.desc      Verify formatTimeValue(1, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0061 begin');
      await delayTick();
      expect(formatTimeValue(1, 10)).assertEqual('01:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0061 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6200
     * @tc.name      testTimeGrid0062
     * @tc.desc      Verify formatTimeValue(1, 59).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0062 begin');
      await delayTick();
      expect(formatTimeValue(1, 59)).assertEqual('01:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0062 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6300
     * @tc.name      testTimeGrid0063
     * @tc.desc      Verify formatTimeValue(9, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0063 begin');
      await delayTick();
      expect(formatTimeValue(9, 0)).assertEqual('09:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0063 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6400
     * @tc.name      testTimeGrid0064
     * @tc.desc      Verify formatTimeValue(9, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0064 begin');
      await delayTick();
      expect(formatTimeValue(9, 1)).assertEqual('09:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0064 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6500
     * @tc.name      testTimeGrid0065
     * @tc.desc      Verify formatTimeValue(9, 9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0065 begin');
      await delayTick();
      expect(formatTimeValue(9, 9)).assertEqual('09:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0065 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6600
     * @tc.name      testTimeGrid0066
     * @tc.desc      Verify formatTimeValue(9, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0066 begin');
      await delayTick();
      expect(formatTimeValue(9, 10)).assertEqual('09:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0066 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6700
     * @tc.name      testTimeGrid0067
     * @tc.desc      Verify formatTimeValue(9, 59).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0067 begin');
      await delayTick();
      expect(formatTimeValue(9, 59)).assertEqual('09:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0067 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6800
     * @tc.name      testTimeGrid0068
     * @tc.desc      Verify formatTimeValue(10, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0068 begin');
      await delayTick();
      expect(formatTimeValue(10, 0)).assertEqual('10:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0068 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_6900
     * @tc.name      testTimeGrid0069
     * @tc.desc      Verify formatTimeValue(10, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0069 begin');
      await delayTick();
      expect(formatTimeValue(10, 1)).assertEqual('10:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0069 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7000
     * @tc.name      testTimeGrid0070
     * @tc.desc      Verify formatTimeValue(10, 9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0070 begin');
      await delayTick();
      expect(formatTimeValue(10, 9)).assertEqual('10:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0070 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7100
     * @tc.name      testTimeGrid0071
     * @tc.desc      Verify formatTimeValue(10, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0071 begin');
      await delayTick();
      expect(formatTimeValue(10, 10)).assertEqual('10:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0071 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7200
     * @tc.name      testTimeGrid0072
     * @tc.desc      Verify formatTimeValue(10, 59).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0072 begin');
      await delayTick();
      expect(formatTimeValue(10, 59)).assertEqual('10:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0072 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7300
     * @tc.name      testTimeGrid0073
     * @tc.desc      Verify formatTimeValue(23, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0073 begin');
      await delayTick();
      expect(formatTimeValue(23, 0)).assertEqual('23:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0073 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7400
     * @tc.name      testTimeGrid0074
     * @tc.desc      Verify formatTimeValue(23, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0074 begin');
      await delayTick();
      expect(formatTimeValue(23, 1)).assertEqual('23:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0074 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7500
     * @tc.name      testTimeGrid0075
     * @tc.desc      Verify formatTimeValue(23, 9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0075 begin');
      await delayTick();
      expect(formatTimeValue(23, 9)).assertEqual('23:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0075 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7600
     * @tc.name      testTimeGrid0076
     * @tc.desc      Verify formatTimeValue(23, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0076 begin');
      await delayTick();
      expect(formatTimeValue(23, 10)).assertEqual('23:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0076 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7700
     * @tc.name      testTimeGrid0077
     * @tc.desc      Verify formatTimeValue(23, 59).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0077 begin');
      await delayTick();
      expect(formatTimeValue(23, 59)).assertEqual('23:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0077 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7800
     * @tc.name      testTimeGrid0078
     * @tc.desc      Verify formatTimeValue(24, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0078 begin');
      await delayTick();
      expect(formatTimeValue(24, 0)).assertEqual('24:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0078 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_7900
     * @tc.name      testTimeGrid0079
     * @tc.desc      Verify formatTimeValue(24, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0079 begin');
      await delayTick();
      expect(formatTimeValue(24, 1)).assertEqual('24:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0079 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP2_8000
     * @tc.name      testTimeGrid0080
     * @tc.desc      Verify formatTimeValue(24, 9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0080 begin');
      await delayTick();
      expect(formatTimeValue(24, 9)).assertEqual('24:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0080 end');
    })

  })
}
