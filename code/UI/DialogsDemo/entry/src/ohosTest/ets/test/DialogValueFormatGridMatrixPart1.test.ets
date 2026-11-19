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

export default function DialogValueFormatGridMatrixPart1Test(): void {
  describe('DialogValueFormatGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_0100
     * @tc.name      testDateGrid0001
     * @tc.desc      Verify formatDateValue(1970-01-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0001 begin');
      await delayTick();
      const d: Date = new Date(1970, 0, 1);
      expect(formatDateValue(d)).assertEqual('1970-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_0200
     * @tc.name      testDateGrid0002
     * @tc.desc      Verify formatDateValue(1999-12-31).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0002 begin');
      await delayTick();
      const d: Date = new Date(1999, 11, 31);
      expect(formatDateValue(d)).assertEqual('1999-12-31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_0300
     * @tc.name      testDateGrid0003
     * @tc.desc      Verify formatDateValue(2000-02-29).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0003 begin');
      await delayTick();
      const d: Date = new Date(2000, 1, 29);
      expect(formatDateValue(d)).assertEqual('2000-02-29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_0400
     * @tc.name      testDateGrid0004
     * @tc.desc      Verify formatDateValue(2001-01-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0004 begin');
      await delayTick();
      const d: Date = new Date(2001, 0, 1);
      expect(formatDateValue(d)).assertEqual('2001-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_0500
     * @tc.name      testDateGrid0005
     * @tc.desc      Verify formatDateValue(2023-05-30).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0005 begin');
      await delayTick();
      const d: Date = new Date(2023, 4, 30);
      expect(formatDateValue(d)).assertEqual('2023-05-30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_0600
     * @tc.name      testDateGrid0006
     * @tc.desc      Verify formatDateValue(2024-02-29).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0006 begin');
      await delayTick();
      const d: Date = new Date(2024, 1, 29);
      expect(formatDateValue(d)).assertEqual('2024-02-29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_0700
     * @tc.name      testDateGrid0007
     * @tc.desc      Verify formatDateValue(2024-12-31).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0007 begin');
      await delayTick();
      const d: Date = new Date(2024, 11, 31);
      expect(formatDateValue(d)).assertEqual('2024-12-31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_0800
     * @tc.name      testDateGrid0008
     * @tc.desc      Verify formatDateValue(2025-03-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0008 begin');
      await delayTick();
      const d: Date = new Date(2025, 2, 1);
      expect(formatDateValue(d)).assertEqual('2025-03-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_0900
     * @tc.name      testDateGrid0009
     * @tc.desc      Verify formatDateValue(2026-07-18).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0009 begin');
      await delayTick();
      const d: Date = new Date(2026, 6, 18);
      expect(formatDateValue(d)).assertEqual('2026-07-18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1000
     * @tc.name      testDateGrid0010
     * @tc.desc      Verify formatDateValue(2030-10-10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0010 begin');
      await delayTick();
      const d: Date = new Date(2030, 9, 10);
      expect(formatDateValue(d)).assertEqual('2030-10-10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1100
     * @tc.name      testDateGrid0011
     * @tc.desc      Verify formatDateValue(2100-01-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0011 begin');
      await delayTick();
      const d: Date = new Date(2100, 0, 1);
      expect(formatDateValue(d)).assertEqual('2100-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1200
     * @tc.name      testDateGrid0012
     * @tc.desc      Verify formatDateValue(2024-01-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0012 begin');
      await delayTick();
      const d: Date = new Date(2024, 0, 1);
      expect(formatDateValue(d)).assertEqual('2024-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1300
     * @tc.name      testDateGrid0013
     * @tc.desc      Verify formatDateValue(2024-01-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0013 begin');
      await delayTick();
      const d: Date = new Date(2024, 0, 15);
      expect(formatDateValue(d)).assertEqual('2024-01-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1400
     * @tc.name      testDateGrid0014
     * @tc.desc      Verify formatDateValue(2024-01-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0014 begin');
      await delayTick();
      const d: Date = new Date(2024, 0, 28);
      expect(formatDateValue(d)).assertEqual('2024-01-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1500
     * @tc.name      testDateGrid0015
     * @tc.desc      Verify formatDateValue(2024-02-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0015 begin');
      await delayTick();
      const d: Date = new Date(2024, 1, 1);
      expect(formatDateValue(d)).assertEqual('2024-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0015 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1600
     * @tc.name      testDateGrid0016
     * @tc.desc      Verify formatDateValue(2024-02-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0016 begin');
      await delayTick();
      const d: Date = new Date(2024, 1, 15);
      expect(formatDateValue(d)).assertEqual('2024-02-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0016 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1700
     * @tc.name      testDateGrid0017
     * @tc.desc      Verify formatDateValue(2024-02-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0017 begin');
      await delayTick();
      const d: Date = new Date(2024, 1, 28);
      expect(formatDateValue(d)).assertEqual('2024-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0017 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1800
     * @tc.name      testDateGrid0018
     * @tc.desc      Verify formatDateValue(2024-03-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0018 begin');
      await delayTick();
      const d: Date = new Date(2024, 2, 1);
      expect(formatDateValue(d)).assertEqual('2024-03-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0018 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_1900
     * @tc.name      testDateGrid0019
     * @tc.desc      Verify formatDateValue(2024-03-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0019 begin');
      await delayTick();
      const d: Date = new Date(2024, 2, 15);
      expect(formatDateValue(d)).assertEqual('2024-03-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0019 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2000
     * @tc.name      testDateGrid0020
     * @tc.desc      Verify formatDateValue(2024-03-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0020 begin');
      await delayTick();
      const d: Date = new Date(2024, 2, 28);
      expect(formatDateValue(d)).assertEqual('2024-03-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0020 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2100
     * @tc.name      testDateGrid0021
     * @tc.desc      Verify formatDateValue(2024-04-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0021 begin');
      await delayTick();
      const d: Date = new Date(2024, 3, 1);
      expect(formatDateValue(d)).assertEqual('2024-04-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0021 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2200
     * @tc.name      testDateGrid0022
     * @tc.desc      Verify formatDateValue(2024-04-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0022 begin');
      await delayTick();
      const d: Date = new Date(2024, 3, 15);
      expect(formatDateValue(d)).assertEqual('2024-04-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0022 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2300
     * @tc.name      testDateGrid0023
     * @tc.desc      Verify formatDateValue(2024-04-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0023 begin');
      await delayTick();
      const d: Date = new Date(2024, 3, 28);
      expect(formatDateValue(d)).assertEqual('2024-04-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0023 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2400
     * @tc.name      testDateGrid0024
     * @tc.desc      Verify formatDateValue(2024-05-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0024 begin');
      await delayTick();
      const d: Date = new Date(2024, 4, 1);
      expect(formatDateValue(d)).assertEqual('2024-05-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0024 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2500
     * @tc.name      testDateGrid0025
     * @tc.desc      Verify formatDateValue(2024-05-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0025 begin');
      await delayTick();
      const d: Date = new Date(2024, 4, 15);
      expect(formatDateValue(d)).assertEqual('2024-05-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0025 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2600
     * @tc.name      testDateGrid0026
     * @tc.desc      Verify formatDateValue(2024-05-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0026 begin');
      await delayTick();
      const d: Date = new Date(2024, 4, 28);
      expect(formatDateValue(d)).assertEqual('2024-05-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0026 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2700
     * @tc.name      testDateGrid0027
     * @tc.desc      Verify formatDateValue(2024-06-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0027 begin');
      await delayTick();
      const d: Date = new Date(2024, 5, 1);
      expect(formatDateValue(d)).assertEqual('2024-06-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0027 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2800
     * @tc.name      testDateGrid0028
     * @tc.desc      Verify formatDateValue(2024-06-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0028 begin');
      await delayTick();
      const d: Date = new Date(2024, 5, 15);
      expect(formatDateValue(d)).assertEqual('2024-06-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0028 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_2900
     * @tc.name      testDateGrid0029
     * @tc.desc      Verify formatDateValue(2024-06-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0029 begin');
      await delayTick();
      const d: Date = new Date(2024, 5, 28);
      expect(formatDateValue(d)).assertEqual('2024-06-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0029 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3000
     * @tc.name      testDateGrid0030
     * @tc.desc      Verify formatDateValue(2024-07-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0030 begin');
      await delayTick();
      const d: Date = new Date(2024, 6, 1);
      expect(formatDateValue(d)).assertEqual('2024-07-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0030 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3100
     * @tc.name      testDateGrid0031
     * @tc.desc      Verify formatDateValue(2024-07-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0031 begin');
      await delayTick();
      const d: Date = new Date(2024, 6, 15);
      expect(formatDateValue(d)).assertEqual('2024-07-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0031 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3200
     * @tc.name      testDateGrid0032
     * @tc.desc      Verify formatDateValue(2024-07-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0032 begin');
      await delayTick();
      const d: Date = new Date(2024, 6, 28);
      expect(formatDateValue(d)).assertEqual('2024-07-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0032 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3300
     * @tc.name      testDateGrid0033
     * @tc.desc      Verify formatDateValue(2024-08-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0033 begin');
      await delayTick();
      const d: Date = new Date(2024, 7, 1);
      expect(formatDateValue(d)).assertEqual('2024-08-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0033 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3400
     * @tc.name      testDateGrid0034
     * @tc.desc      Verify formatDateValue(2024-08-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0034 begin');
      await delayTick();
      const d: Date = new Date(2024, 7, 15);
      expect(formatDateValue(d)).assertEqual('2024-08-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0034 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3500
     * @tc.name      testDateGrid0035
     * @tc.desc      Verify formatDateValue(2024-08-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0035 begin');
      await delayTick();
      const d: Date = new Date(2024, 7, 28);
      expect(formatDateValue(d)).assertEqual('2024-08-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0035 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3600
     * @tc.name      testDateGrid0036
     * @tc.desc      Verify formatDateValue(2024-09-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0036 begin');
      await delayTick();
      const d: Date = new Date(2024, 8, 1);
      expect(formatDateValue(d)).assertEqual('2024-09-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0036 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3700
     * @tc.name      testDateGrid0037
     * @tc.desc      Verify formatDateValue(2024-09-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0037 begin');
      await delayTick();
      const d: Date = new Date(2024, 8, 15);
      expect(formatDateValue(d)).assertEqual('2024-09-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0037 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3800
     * @tc.name      testDateGrid0038
     * @tc.desc      Verify formatDateValue(2024-09-28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0038 begin');
      await delayTick();
      const d: Date = new Date(2024, 8, 28);
      expect(formatDateValue(d)).assertEqual('2024-09-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0038 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_3900
     * @tc.name      testDateGrid0039
     * @tc.desc      Verify formatDateValue(2024-10-01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0039 begin');
      await delayTick();
      const d: Date = new Date(2024, 9, 1);
      expect(formatDateValue(d)).assertEqual('2024-10-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0039 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP1_4000
     * @tc.name      testDateGrid0040
     * @tc.desc      Verify formatDateValue(2024-10-15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0040 begin');
      await delayTick();
      const d: Date = new Date(2024, 9, 15);
      expect(formatDateValue(d)).assertEqual('2024-10-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateGrid0040 end');
    })

  })
}
