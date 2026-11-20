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

export default function DialogValueExtraGridMatrixPart1Test(): void {
  describe('DialogValueExtraGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_0100
     * @tc.name      testDateExtra0001
     * @tc.desc      Verify formatDateValue 2000-01-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0001 begin');
      await delayTick();
      const d: Date = new Date(2000, 0, 1);
      expect(formatDateValue(d)).assertEqual('2000-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_0200
     * @tc.name      testDateExtra0002
     * @tc.desc      Verify formatDateValue 2000-01-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0002 begin');
      await delayTick();
      const d: Date = new Date(2000, 0, 15);
      expect(formatDateValue(d)).assertEqual('2000-01-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_0300
     * @tc.name      testDateExtra0003
     * @tc.desc      Verify formatDateValue 2000-01-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0003 begin');
      await delayTick();
      const d: Date = new Date(2000, 0, 28);
      expect(formatDateValue(d)).assertEqual('2000-01-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_0400
     * @tc.name      testDateExtra0004
     * @tc.desc      Verify formatDateValue 2000-02-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0004 begin');
      await delayTick();
      const d: Date = new Date(2000, 1, 1);
      expect(formatDateValue(d)).assertEqual('2000-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_0500
     * @tc.name      testDateExtra0005
     * @tc.desc      Verify formatDateValue 2000-02-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0005 begin');
      await delayTick();
      const d: Date = new Date(2000, 1, 15);
      expect(formatDateValue(d)).assertEqual('2000-02-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_0600
     * @tc.name      testDateExtra0006
     * @tc.desc      Verify formatDateValue 2000-02-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0006 begin');
      await delayTick();
      const d: Date = new Date(2000, 1, 28);
      expect(formatDateValue(d)).assertEqual('2000-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_0700
     * @tc.name      testDateExtra0007
     * @tc.desc      Verify formatDateValue 2000-06-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0007 begin');
      await delayTick();
      const d: Date = new Date(2000, 5, 1);
      expect(formatDateValue(d)).assertEqual('2000-06-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_0800
     * @tc.name      testDateExtra0008
     * @tc.desc      Verify formatDateValue 2000-06-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0008 begin');
      await delayTick();
      const d: Date = new Date(2000, 5, 15);
      expect(formatDateValue(d)).assertEqual('2000-06-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_0900
     * @tc.name      testDateExtra0009
     * @tc.desc      Verify formatDateValue 2000-06-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0009 begin');
      await delayTick();
      const d: Date = new Date(2000, 5, 28);
      expect(formatDateValue(d)).assertEqual('2000-06-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1000
     * @tc.name      testDateExtra0010
     * @tc.desc      Verify formatDateValue 2000-10-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0010 begin');
      await delayTick();
      const d: Date = new Date(2000, 9, 1);
      expect(formatDateValue(d)).assertEqual('2000-10-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1100
     * @tc.name      testDateExtra0011
     * @tc.desc      Verify formatDateValue 2000-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0011 begin');
      await delayTick();
      const d: Date = new Date(2000, 9, 15);
      expect(formatDateValue(d)).assertEqual('2000-10-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1200
     * @tc.name      testDateExtra0012
     * @tc.desc      Verify formatDateValue 2000-10-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0012 begin');
      await delayTick();
      const d: Date = new Date(2000, 9, 28);
      expect(formatDateValue(d)).assertEqual('2000-10-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1300
     * @tc.name      testDateExtra0013
     * @tc.desc      Verify formatDateValue 2000-12-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0013 begin');
      await delayTick();
      const d: Date = new Date(2000, 11, 1);
      expect(formatDateValue(d)).assertEqual('2000-12-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1400
     * @tc.name      testDateExtra0014
     * @tc.desc      Verify formatDateValue 2000-12-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0014 begin');
      await delayTick();
      const d: Date = new Date(2000, 11, 15);
      expect(formatDateValue(d)).assertEqual('2000-12-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1500
     * @tc.name      testDateExtra0015
     * @tc.desc      Verify formatDateValue 2000-12-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0015 begin');
      await delayTick();
      const d: Date = new Date(2000, 11, 28);
      expect(formatDateValue(d)).assertEqual('2000-12-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0015 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1600
     * @tc.name      testDateExtra0016
     * @tc.desc      Verify formatDateValue 2004-01-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0016 begin');
      await delayTick();
      const d: Date = new Date(2004, 0, 1);
      expect(formatDateValue(d)).assertEqual('2004-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0016 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1700
     * @tc.name      testDateExtra0017
     * @tc.desc      Verify formatDateValue 2004-01-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0017 begin');
      await delayTick();
      const d: Date = new Date(2004, 0, 15);
      expect(formatDateValue(d)).assertEqual('2004-01-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0017 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1800
     * @tc.name      testDateExtra0018
     * @tc.desc      Verify formatDateValue 2004-01-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0018 begin');
      await delayTick();
      const d: Date = new Date(2004, 0, 28);
      expect(formatDateValue(d)).assertEqual('2004-01-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0018 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_1900
     * @tc.name      testDateExtra0019
     * @tc.desc      Verify formatDateValue 2004-02-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0019 begin');
      await delayTick();
      const d: Date = new Date(2004, 1, 1);
      expect(formatDateValue(d)).assertEqual('2004-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0019 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2000
     * @tc.name      testDateExtra0020
     * @tc.desc      Verify formatDateValue 2004-02-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0020 begin');
      await delayTick();
      const d: Date = new Date(2004, 1, 15);
      expect(formatDateValue(d)).assertEqual('2004-02-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0020 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2100
     * @tc.name      testDateExtra0021
     * @tc.desc      Verify formatDateValue 2004-02-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0021 begin');
      await delayTick();
      const d: Date = new Date(2004, 1, 28);
      expect(formatDateValue(d)).assertEqual('2004-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0021 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2200
     * @tc.name      testDateExtra0022
     * @tc.desc      Verify formatDateValue 2004-06-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0022 begin');
      await delayTick();
      const d: Date = new Date(2004, 5, 1);
      expect(formatDateValue(d)).assertEqual('2004-06-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0022 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2300
     * @tc.name      testDateExtra0023
     * @tc.desc      Verify formatDateValue 2004-06-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0023 begin');
      await delayTick();
      const d: Date = new Date(2004, 5, 15);
      expect(formatDateValue(d)).assertEqual('2004-06-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0023 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2400
     * @tc.name      testDateExtra0024
     * @tc.desc      Verify formatDateValue 2004-06-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0024 begin');
      await delayTick();
      const d: Date = new Date(2004, 5, 28);
      expect(formatDateValue(d)).assertEqual('2004-06-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0024 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2500
     * @tc.name      testDateExtra0025
     * @tc.desc      Verify formatDateValue 2004-10-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0025 begin');
      await delayTick();
      const d: Date = new Date(2004, 9, 1);
      expect(formatDateValue(d)).assertEqual('2004-10-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0025 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2600
     * @tc.name      testDateExtra0026
     * @tc.desc      Verify formatDateValue 2004-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0026 begin');
      await delayTick();
      const d: Date = new Date(2004, 9, 15);
      expect(formatDateValue(d)).assertEqual('2004-10-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0026 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2700
     * @tc.name      testDateExtra0027
     * @tc.desc      Verify formatDateValue 2004-10-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0027 begin');
      await delayTick();
      const d: Date = new Date(2004, 9, 28);
      expect(formatDateValue(d)).assertEqual('2004-10-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0027 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2800
     * @tc.name      testDateExtra0028
     * @tc.desc      Verify formatDateValue 2004-12-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0028 begin');
      await delayTick();
      const d: Date = new Date(2004, 11, 1);
      expect(formatDateValue(d)).assertEqual('2004-12-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0028 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_2900
     * @tc.name      testDateExtra0029
     * @tc.desc      Verify formatDateValue 2004-12-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0029 begin');
      await delayTick();
      const d: Date = new Date(2004, 11, 15);
      expect(formatDateValue(d)).assertEqual('2004-12-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0029 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3000
     * @tc.name      testDateExtra0030
     * @tc.desc      Verify formatDateValue 2004-12-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0030 begin');
      await delayTick();
      const d: Date = new Date(2004, 11, 28);
      expect(formatDateValue(d)).assertEqual('2004-12-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0030 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3100
     * @tc.name      testDateExtra0031
     * @tc.desc      Verify formatDateValue 2012-01-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0031 begin');
      await delayTick();
      const d: Date = new Date(2012, 0, 1);
      expect(formatDateValue(d)).assertEqual('2012-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0031 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3200
     * @tc.name      testDateExtra0032
     * @tc.desc      Verify formatDateValue 2012-01-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0032 begin');
      await delayTick();
      const d: Date = new Date(2012, 0, 15);
      expect(formatDateValue(d)).assertEqual('2012-01-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0032 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3300
     * @tc.name      testDateExtra0033
     * @tc.desc      Verify formatDateValue 2012-01-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0033 begin');
      await delayTick();
      const d: Date = new Date(2012, 0, 28);
      expect(formatDateValue(d)).assertEqual('2012-01-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0033 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3400
     * @tc.name      testDateExtra0034
     * @tc.desc      Verify formatDateValue 2012-02-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0034 begin');
      await delayTick();
      const d: Date = new Date(2012, 1, 1);
      expect(formatDateValue(d)).assertEqual('2012-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0034 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3500
     * @tc.name      testDateExtra0035
     * @tc.desc      Verify formatDateValue 2012-02-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0035 begin');
      await delayTick();
      const d: Date = new Date(2012, 1, 15);
      expect(formatDateValue(d)).assertEqual('2012-02-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0035 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3600
     * @tc.name      testDateExtra0036
     * @tc.desc      Verify formatDateValue 2012-02-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0036 begin');
      await delayTick();
      const d: Date = new Date(2012, 1, 28);
      expect(formatDateValue(d)).assertEqual('2012-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0036 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3700
     * @tc.name      testDateExtra0037
     * @tc.desc      Verify formatDateValue 2012-06-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0037 begin');
      await delayTick();
      const d: Date = new Date(2012, 5, 1);
      expect(formatDateValue(d)).assertEqual('2012-06-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0037 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3800
     * @tc.name      testDateExtra0038
     * @tc.desc      Verify formatDateValue 2012-06-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0038 begin');
      await delayTick();
      const d: Date = new Date(2012, 5, 15);
      expect(formatDateValue(d)).assertEqual('2012-06-15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0038 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_3900
     * @tc.name      testDateExtra0039
     * @tc.desc      Verify formatDateValue 2012-06-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0039 begin');
      await delayTick();
      const d: Date = new Date(2012, 5, 28);
      expect(formatDateValue(d)).assertEqual('2012-06-28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0039 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVXP1_4000
     * @tc.name      testDateExtra0040
     * @tc.desc      Verify formatDateValue 2012-10-01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateExtra0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0040 begin');
      await delayTick();
      const d: Date = new Date(2012, 9, 1);
      expect(formatDateValue(d)).assertEqual('2012-10-01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateExtra0040 end');
    })

  })
}
