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

export default function DialogValueExtraGridMatrixPart2Test(): void {
  describe('DialogValueExtraGridMatrixPart2', () => {

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_4100
     * @tc.name      testDateExtra0041
     * @tc.desc      Verify formatDateValue 2012-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0041 begin');
      await delayTick();
      const d: Date = new Date(2012, 9, 15);
      expect(formatDateValue(d)).assertEqual('2012-10-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0041 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_4200
     * @tc.name      testDateExtra0042
     * @tc.desc      Verify formatDateValue 2012-10-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0042 begin');
      await delayTick();
      const d: Date = new Date(2012, 9, 28);
      expect(formatDateValue(d)).assertEqual('2012-10-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0042 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_4300
     * @tc.name      testDateExtra0043
     * @tc.desc      Verify formatDateValue 2012-12-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0043 begin');
      await delayTick();
      const d: Date = new Date(2012, 11, 1);
      expect(formatDateValue(d)).assertEqual('2012-12-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0043 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_4400
     * @tc.name      testDateExtra0044
     * @tc.desc      Verify formatDateValue 2012-12-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0044 begin');
      await delayTick();
      const d: Date = new Date(2012, 11, 15);
      expect(formatDateValue(d)).assertEqual('2012-12-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0044 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_4500
     * @tc.name      testDateExtra0045
     * @tc.desc      Verify formatDateValue 2012-12-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0045 begin');
      await delayTick();
      const d: Date = new Date(2012, 11, 28);
      expect(formatDateValue(d)).assertEqual('2012-12-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0045 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_4600
     * @tc.name      testDateExtra0046
     * @tc.desc      Verify formatDateValue 2025-01-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0046 begin');
      await delayTick();
      const d: Date = new Date(2025, 0, 1);
      expect(formatDateValue(d)).assertEqual('2025-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0046 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_4700
     * @tc.name      testDateExtra0047
     * @tc.desc      Verify formatDateValue 2025-01-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0047 begin');
      await delayTick();
      const d: Date = new Date(2025, 0, 15);
      expect(formatDateValue(d)).assertEqual('2025-01-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0047 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_4800
     * @tc.name      testDateExtra0048
     * @tc.desc      Verify formatDateValue 2025-01-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0048 begin');
      await delayTick();
      const d: Date = new Date(2025, 0, 28);
      expect(formatDateValue(d)).assertEqual('2025-01-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0048 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_4900
     * @tc.name      testDateExtra0049
     * @tc.desc      Verify formatDateValue 2025-02-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0049 begin');
      await delayTick();
      const d: Date = new Date(2025, 1, 1);
      expect(formatDateValue(d)).assertEqual('2025-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0049 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5000
     * @tc.name      testDateExtra0050
     * @tc.desc      Verify formatDateValue 2025-02-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0050 begin');
      await delayTick();
      const d: Date = new Date(2025, 1, 15);
      expect(formatDateValue(d)).assertEqual('2025-02-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0050 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5100
     * @tc.name      testDateExtra0051
     * @tc.desc      Verify formatDateValue 2025-02-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0051 begin');
      await delayTick();
      const d: Date = new Date(2025, 1, 28);
      expect(formatDateValue(d)).assertEqual('2025-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0051 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5200
     * @tc.name      testDateExtra0052
     * @tc.desc      Verify formatDateValue 2025-06-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0052 begin');
      await delayTick();
      const d: Date = new Date(2025, 5, 1);
      expect(formatDateValue(d)).assertEqual('2025-06-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0052 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5300
     * @tc.name      testDateExtra0053
     * @tc.desc      Verify formatDateValue 2025-06-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0053 begin');
      await delayTick();
      const d: Date = new Date(2025, 5, 15);
      expect(formatDateValue(d)).assertEqual('2025-06-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0053 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5400
     * @tc.name      testDateExtra0054
     * @tc.desc      Verify formatDateValue 2025-06-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0054 begin');
      await delayTick();
      const d: Date = new Date(2025, 5, 28);
      expect(formatDateValue(d)).assertEqual('2025-06-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0054 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5500
     * @tc.name      testDateExtra0055
     * @tc.desc      Verify formatDateValue 2025-10-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0055 begin');
      await delayTick();
      const d: Date = new Date(2025, 9, 1);
      expect(formatDateValue(d)).assertEqual('2025-10-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0055 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5600
     * @tc.name      testDateExtra0056
     * @tc.desc      Verify formatDateValue 2025-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0056 begin');
      await delayTick();
      const d: Date = new Date(2025, 9, 15);
      expect(formatDateValue(d)).assertEqual('2025-10-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0056 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5700
     * @tc.name      testDateExtra0057
     * @tc.desc      Verify formatDateValue 2025-10-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0057 begin');
      await delayTick();
      const d: Date = new Date(2025, 9, 28);
      expect(formatDateValue(d)).assertEqual('2025-10-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0057 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5800
     * @tc.name      testDateExtra0058
     * @tc.desc      Verify formatDateValue 2025-12-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0058 begin');
      await delayTick();
      const d: Date = new Date(2025, 11, 1);
      expect(formatDateValue(d)).assertEqual('2025-12-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0058 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_5900
     * @tc.name      testDateExtra0059
     * @tc.desc      Verify formatDateValue 2025-12-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0059 begin');
      await delayTick();
      const d: Date = new Date(2025, 11, 15);
      expect(formatDateValue(d)).assertEqual('2025-12-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0059 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6000
     * @tc.name      testDateExtra0060
     * @tc.desc      Verify formatDateValue 2025-12-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0060 begin');
      await delayTick();
      const d: Date = new Date(2025, 11, 28);
      expect(formatDateValue(d)).assertEqual('2025-12-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0060 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6100
     * @tc.name      testDateExtra0061
     * @tc.desc      Verify formatDateValue 2030-01-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0061 begin');
      await delayTick();
      const d: Date = new Date(2030, 0, 1);
      expect(formatDateValue(d)).assertEqual('2030-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0061 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6200
     * @tc.name      testDateExtra0062
     * @tc.desc      Verify formatDateValue 2030-01-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0062 begin');
      await delayTick();
      const d: Date = new Date(2030, 0, 15);
      expect(formatDateValue(d)).assertEqual('2030-01-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0062 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6300
     * @tc.name      testDateExtra0063
     * @tc.desc      Verify formatDateValue 2030-01-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0063 begin');
      await delayTick();
      const d: Date = new Date(2030, 0, 28);
      expect(formatDateValue(d)).assertEqual('2030-01-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0063 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6400
     * @tc.name      testDateExtra0064
     * @tc.desc      Verify formatDateValue 2030-02-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0064 begin');
      await delayTick();
      const d: Date = new Date(2030, 1, 1);
      expect(formatDateValue(d)).assertEqual('2030-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0064 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6500
     * @tc.name      testDateExtra0065
     * @tc.desc      Verify formatDateValue 2030-02-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0065 begin');
      await delayTick();
      const d: Date = new Date(2030, 1, 15);
      expect(formatDateValue(d)).assertEqual('2030-02-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0065 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6600
     * @tc.name      testDateExtra0066
     * @tc.desc      Verify formatDateValue 2030-02-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0066 begin');
      await delayTick();
      const d: Date = new Date(2030, 1, 28);
      expect(formatDateValue(d)).assertEqual('2030-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0066 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6700
     * @tc.name      testDateExtra0067
     * @tc.desc      Verify formatDateValue 2030-06-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0067 begin');
      await delayTick();
      const d: Date = new Date(2030, 5, 1);
      expect(formatDateValue(d)).assertEqual('2030-06-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0067 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6800
     * @tc.name      testDateExtra0068
     * @tc.desc      Verify formatDateValue 2030-06-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0068 begin');
      await delayTick();
      const d: Date = new Date(2030, 5, 15);
      expect(formatDateValue(d)).assertEqual('2030-06-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0068 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_6900
     * @tc.name      testDateExtra0069
     * @tc.desc      Verify formatDateValue 2030-06-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0069 begin');
      await delayTick();
      const d: Date = new Date(2030, 5, 28);
      expect(formatDateValue(d)).assertEqual('2030-06-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0069 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7000
     * @tc.name      testDateExtra0070
     * @tc.desc      Verify formatDateValue 2030-10-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0070 begin');
      await delayTick();
      const d: Date = new Date(2030, 9, 1);
      expect(formatDateValue(d)).assertEqual('2030-10-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0070 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7100
     * @tc.name      testDateExtra0071
     * @tc.desc      Verify formatDateValue 2030-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0071 begin');
      await delayTick();
      const d: Date = new Date(2030, 9, 15);
      expect(formatDateValue(d)).assertEqual('2030-10-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0071 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7200
     * @tc.name      testDateExtra0072
     * @tc.desc      Verify formatDateValue 2030-10-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0072 begin');
      await delayTick();
      const d: Date = new Date(2030, 9, 28);
      expect(formatDateValue(d)).assertEqual('2030-10-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0072 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7300
     * @tc.name      testDateExtra0073
     * @tc.desc      Verify formatDateValue 2030-12-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0073 begin');
      await delayTick();
      const d: Date = new Date(2030, 11, 1);
      expect(formatDateValue(d)).assertEqual('2030-12-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0073 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7400
     * @tc.name      testDateExtra0074
     * @tc.desc      Verify formatDateValue 2030-12-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0074 begin');
      await delayTick();
      const d: Date = new Date(2030, 11, 15);
      expect(formatDateValue(d)).assertEqual('2030-12-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0074 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7500
     * @tc.name      testDateExtra0075
     * @tc.desc      Verify formatDateValue 2030-12-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0075 begin');
      await delayTick();
      const d: Date = new Date(2030, 11, 28);
      expect(formatDateValue(d)).assertEqual('2030-12-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0075 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7600
     * @tc.name      testDateExtra0076
     * @tc.desc      Verify formatDateValue 2040-01-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0076 begin');
      await delayTick();
      const d: Date = new Date(2040, 0, 1);
      expect(formatDateValue(d)).assertEqual('2040-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0076 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7700
     * @tc.name      testDateExtra0077
     * @tc.desc      Verify formatDateValue 2040-01-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0077 begin');
      await delayTick();
      const d: Date = new Date(2040, 0, 15);
      expect(formatDateValue(d)).assertEqual('2040-01-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0077 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7800
     * @tc.name      testDateExtra0078
     * @tc.desc      Verify formatDateValue 2040-01-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0078 begin');
      await delayTick();
      const d: Date = new Date(2040, 0, 28);
      expect(formatDateValue(d)).assertEqual('2040-01-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0078 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_7900
     * @tc.name      testDateExtra0079
     * @tc.desc      Verify formatDateValue 2040-02-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0079 begin');
      await delayTick();
      const d: Date = new Date(2040, 1, 1);
      expect(formatDateValue(d)).assertEqual('2040-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0079 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP2_8000
     * @tc.name      testDateExtra0080
     * @tc.desc      Verify formatDateValue 2040-02-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0080 begin');
      await delayTick();
      const d: Date = new Date(2040, 1, 15);
      expect(formatDateValue(d)).assertEqual('2040-02-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0080 end');
    })

  })
}
