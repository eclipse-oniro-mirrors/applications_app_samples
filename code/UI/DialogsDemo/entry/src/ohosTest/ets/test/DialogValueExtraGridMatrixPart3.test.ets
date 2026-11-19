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

export default function DialogValueExtraGridMatrixPart3Test(): void {
  describe('DialogValueExtraGridMatrixPart3', () => {

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_8100
     * @tc.name      testDateExtra0081
     * @tc.desc      Verify formatDateValue 2040-02-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0081 begin');
      await delayTick();
      const d: Date = new Date(2040, 1, 28);
      expect(formatDateValue(d)).assertEqual('2040-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0081 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_8200
     * @tc.name      testDateExtra0082
     * @tc.desc      Verify formatDateValue 2040-06-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0082 begin');
      await delayTick();
      const d: Date = new Date(2040, 5, 1);
      expect(formatDateValue(d)).assertEqual('2040-06-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0082 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_8300
     * @tc.name      testDateExtra0083
     * @tc.desc      Verify formatDateValue 2040-06-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0083 begin');
      await delayTick();
      const d: Date = new Date(2040, 5, 15);
      expect(formatDateValue(d)).assertEqual('2040-06-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0083 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_8400
     * @tc.name      testDateExtra0084
     * @tc.desc      Verify formatDateValue 2040-06-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0084 begin');
      await delayTick();
      const d: Date = new Date(2040, 5, 28);
      expect(formatDateValue(d)).assertEqual('2040-06-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0084 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_8500
     * @tc.name      testDateExtra0085
     * @tc.desc      Verify formatDateValue 2040-10-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0085 begin');
      await delayTick();
      const d: Date = new Date(2040, 9, 1);
      expect(formatDateValue(d)).assertEqual('2040-10-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0085 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_8600
     * @tc.name      testDateExtra0086
     * @tc.desc      Verify formatDateValue 2040-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0086 begin');
      await delayTick();
      const d: Date = new Date(2040, 9, 15);
      expect(formatDateValue(d)).assertEqual('2040-10-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0086 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_8700
     * @tc.name      testDateExtra0087
     * @tc.desc      Verify formatDateValue 2040-10-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0087 begin');
      await delayTick();
      const d: Date = new Date(2040, 9, 28);
      expect(formatDateValue(d)).assertEqual('2040-10-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0087 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_8800
     * @tc.name      testDateExtra0088
     * @tc.desc      Verify formatDateValue 2040-12-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0088 begin');
      await delayTick();
      const d: Date = new Date(2040, 11, 1);
      expect(formatDateValue(d)).assertEqual('2040-12-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0088 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_8900
     * @tc.name      testDateExtra0089
     * @tc.desc      Verify formatDateValue 2040-12-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0089 begin');
      await delayTick();
      const d: Date = new Date(2040, 11, 15);
      expect(formatDateValue(d)).assertEqual('2040-12-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0089 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9000
     * @tc.name      testDateExtra0090
     * @tc.desc      Verify formatDateValue 2040-12-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0090 begin');
      await delayTick();
      const d: Date = new Date(2040, 11, 28);
      expect(formatDateValue(d)).assertEqual('2040-12-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0090 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9100
     * @tc.name      testDateExtra0091
     * @tc.desc      Verify formatDateValue 2100-01-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0091 begin');
      await delayTick();
      const d: Date = new Date(2100, 0, 15);
      expect(formatDateValue(d)).assertEqual('2100-01-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0091 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9200
     * @tc.name      testDateExtra0092
     * @tc.desc      Verify formatDateValue 2100-01-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0092 begin');
      await delayTick();
      const d: Date = new Date(2100, 0, 28);
      expect(formatDateValue(d)).assertEqual('2100-01-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0092 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9300
     * @tc.name      testDateExtra0093
     * @tc.desc      Verify formatDateValue 2100-02-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0093 begin');
      await delayTick();
      const d: Date = new Date(2100, 1, 1);
      expect(formatDateValue(d)).assertEqual('2100-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0093 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9400
     * @tc.name      testDateExtra0094
     * @tc.desc      Verify formatDateValue 2100-02-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0094 begin');
      await delayTick();
      const d: Date = new Date(2100, 1, 15);
      expect(formatDateValue(d)).assertEqual('2100-02-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0094 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9500
     * @tc.name      testDateExtra0095
     * @tc.desc      Verify formatDateValue 2100-02-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0095 begin');
      await delayTick();
      const d: Date = new Date(2100, 1, 28);
      expect(formatDateValue(d)).assertEqual('2100-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0095 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9600
     * @tc.name      testDateExtra0096
     * @tc.desc      Verify formatDateValue 2100-06-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0096 begin');
      await delayTick();
      const d: Date = new Date(2100, 5, 1);
      expect(formatDateValue(d)).assertEqual('2100-06-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0096 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9700
     * @tc.name      testDateExtra0097
     * @tc.desc      Verify formatDateValue 2100-06-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0097 begin');
      await delayTick();
      const d: Date = new Date(2100, 5, 15);
      expect(formatDateValue(d)).assertEqual('2100-06-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0097 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9800
     * @tc.name      testDateExtra0098
     * @tc.desc      Verify formatDateValue 2100-06-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0098 begin');
      await delayTick();
      const d: Date = new Date(2100, 5, 28);
      expect(formatDateValue(d)).assertEqual('2100-06-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0098 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_9900
     * @tc.name      testDateExtra0099
     * @tc.desc      Verify formatDateValue 2100-10-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0099 begin');
      await delayTick();
      const d: Date = new Date(2100, 9, 1);
      expect(formatDateValue(d)).assertEqual('2100-10-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0099 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10000
     * @tc.name      testDateExtra0100
     * @tc.desc      Verify formatDateValue 2100-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0100 begin');
      await delayTick();
      const d: Date = new Date(2100, 9, 15);
      expect(formatDateValue(d)).assertEqual('2100-10-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0100 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10100
     * @tc.name      testDateExtra0101
     * @tc.desc      Verify formatDateValue 2100-10-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0101 begin');
      await delayTick();
      const d: Date = new Date(2100, 9, 28);
      expect(formatDateValue(d)).assertEqual('2100-10-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0101 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10200
     * @tc.name      testDateExtra0102
     * @tc.desc      Verify formatDateValue 2100-12-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0102 begin');
      await delayTick();
      const d: Date = new Date(2100, 11, 1);
      expect(formatDateValue(d)).assertEqual('2100-12-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0102 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10300
     * @tc.name      testDateExtra0103
     * @tc.desc      Verify formatDateValue 2100-12-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0103 begin');
      await delayTick();
      const d: Date = new Date(2100, 11, 15);
      expect(formatDateValue(d)).assertEqual('2100-12-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0103 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10400
     * @tc.name      testDateExtra0104
     * @tc.desc      Verify formatDateValue 2100-12-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0104 begin');
      await delayTick();
      const d: Date = new Date(2100, 11, 28);
      expect(formatDateValue(d)).assertEqual('2100-12-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0104 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10500
     * @tc.name      testTimeExtra0105
     * @tc.desc      Verify formatTimeValue 0-2:00.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0105 begin');
      await delayTick();
      expect(formatTimeValue(-2, 0)).assertEqual('0-2:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0105 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10600
     * @tc.name      testTimeExtra0106
     * @tc.desc      Verify formatTimeValue 0-2:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0106 begin');
      await delayTick();
      expect(formatTimeValue(-2, 5)).assertEqual('0-2:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0106 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10700
     * @tc.name      testTimeExtra0107
     * @tc.desc      Verify formatTimeValue 0-2:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0107 begin');
      await delayTick();
      expect(formatTimeValue(-2, 10)).assertEqual('0-2:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0107 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10800
     * @tc.name      testTimeExtra0108
     * @tc.desc      Verify formatTimeValue 0-2:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0108 begin');
      await delayTick();
      expect(formatTimeValue(-2, 30)).assertEqual('0-2:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0108 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_10900
     * @tc.name      testTimeExtra0109
     * @tc.desc      Verify formatTimeValue 0-2:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0109 begin');
      await delayTick();
      expect(formatTimeValue(-2, 59)).assertEqual('0-2:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0109 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11000
     * @tc.name      testTimeExtra0110
     * @tc.desc      Verify formatTimeValue 0-1:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0110 begin');
      await delayTick();
      expect(formatTimeValue(-1, 5)).assertEqual('0-1:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0110 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11100
     * @tc.name      testTimeExtra0111
     * @tc.desc      Verify formatTimeValue 0-1:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0111 begin');
      await delayTick();
      expect(formatTimeValue(-1, 30)).assertEqual('0-1:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0111 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11200
     * @tc.name      testTimeExtra0112
     * @tc.desc      Verify formatTimeValue 00:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0112 begin');
      await delayTick();
      expect(formatTimeValue(0, 5)).assertEqual('00:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0112 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11300
     * @tc.name      testTimeExtra0113
     * @tc.desc      Verify formatTimeValue 00:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0113 begin');
      await delayTick();
      expect(formatTimeValue(0, 30)).assertEqual('00:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0113 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11400
     * @tc.name      testTimeExtra0114
     * @tc.desc      Verify formatTimeValue 05:00.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0114 begin');
      await delayTick();
      expect(formatTimeValue(5, 0)).assertEqual('05:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0114 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11500
     * @tc.name      testTimeExtra0115
     * @tc.desc      Verify formatTimeValue 05:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0115 begin');
      await delayTick();
      expect(formatTimeValue(5, 5)).assertEqual('05:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0115 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11600
     * @tc.name      testTimeExtra0116
     * @tc.desc      Verify formatTimeValue 05:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0116 begin');
      await delayTick();
      expect(formatTimeValue(5, 10)).assertEqual('05:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0116 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11700
     * @tc.name      testTimeExtra0117
     * @tc.desc      Verify formatTimeValue 05:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0117 begin');
      await delayTick();
      expect(formatTimeValue(5, 30)).assertEqual('05:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0117 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11800
     * @tc.name      testTimeExtra0118
     * @tc.desc      Verify formatTimeValue 05:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0118 begin');
      await delayTick();
      expect(formatTimeValue(5, 59)).assertEqual('05:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0118 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_11900
     * @tc.name      testTimeExtra0119
     * @tc.desc      Verify formatTimeValue 09:05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0119 begin');
      await delayTick();
      expect(formatTimeValue(9, 5)).assertEqual('09:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0119 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP3_12000
     * @tc.name      testTimeExtra0120
     * @tc.desc      Verify formatTimeValue 09:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeExtra0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0120 begin');
      await delayTick();
      expect(formatTimeValue(9, 30)).assertEqual('09:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeExtra0120 end');
    })

  })
}
