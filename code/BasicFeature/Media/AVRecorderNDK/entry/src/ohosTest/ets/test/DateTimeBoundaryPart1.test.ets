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
import { hilog } from '@kit.PerformanceAnalysisKit';
import DateTimeUtil, { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const util: DateTimeUtil = new DateTimeUtil();

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVRecorder]';

export default function DateTimeBoundaryPart1Test(): void {
  describe('DateTimeBoundaryPart1', () => {

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_0100
     * @tc.name      testFillEdge0001
     * @tc.desc      Verify fill keeps the documented edge output for input -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0001 begin');
      expect(util.fill(-1)).assertEqual('0-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_0200
     * @tc.name      testFillEdge0002
     * @tc.desc      Verify fill keeps the documented edge output for input -9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0002 begin');
      expect(util.fill(-9)).assertEqual('0-9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_0300
     * @tc.name      testFillEdge0003
     * @tc.desc      Verify fill keeps the documented edge output for input -10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0003 begin');
      expect(util.fill(-10)).assertEqual('0-10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_0400
     * @tc.name      testFillEdge0004
     * @tc.desc      Verify fill keeps the documented edge output for input 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0004 begin');
      expect(util.fill(9)).assertEqual('09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_0500
     * @tc.name      testFillEdge0005
     * @tc.desc      Verify fill keeps the documented edge output for input 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0005 begin');
      expect(util.fill(10)).assertEqual('10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_0600
     * @tc.name      testFillEdge0006
     * @tc.desc      Verify fill keeps the documented edge output for input 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0006 begin');
      expect(util.fill(1.5)).assertEqual('01.5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_0700
     * @tc.name      testFillEdge0007
     * @tc.desc      Verify fill keeps the documented edge output for input 9.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0007 begin');
      expect(util.fill(9.9)).assertEqual('9.9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_0800
     * @tc.name      testFillEdge0008
     * @tc.desc      Verify fill keeps the documented edge output for input 10.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0008 begin');
      expect(util.fill(10.5)).assertEqual('10.5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_0900
     * @tc.name      testFillEdge0009
     * @tc.desc      Verify fill keeps the documented edge output for input 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0009 begin');
      expect(util.fill(100)).assertEqual('100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1000
     * @tc.name      testFillEdge0010
     * @tc.desc      Verify fill keeps the documented edge output for input 999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0010 begin');
      expect(util.fill(999)).assertEqual('999');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1100
     * @tc.name      testFillEdge0011
     * @tc.desc      Verify fill keeps the documented edge output for input 1000000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0011 begin');
      expect(util.fill(1000000)).assertEqual('1000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1200
     * @tc.name      testFillEdge0012
     * @tc.desc      Verify fill keeps the documented edge output for input 9.99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0012 begin');
      expect(util.fill(9.99)).assertEqual('9.99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1300
     * @tc.name      testFillEdge0013
     * @tc.desc      Verify fill keeps the documented edge output for input 10.01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0013 begin');
      expect(util.fill(10.01)).assertEqual('10.01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0013 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1400
     * @tc.name      testFillEdge0014
     * @tc.desc      Verify fill keeps the documented edge output for input 1.23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0014 begin');
      expect(util.fill(1.23)).assertEqual('01.23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0014 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1500
     * @tc.name      testFillEdge0015
     * @tc.desc      Verify fill keeps the documented edge output for input 0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0015 begin');
      expect(util.fill(0.1)).assertEqual('00.1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0015 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1600
     * @tc.name      testFillEdge0016
     * @tc.desc      Verify fill keeps the documented edge output for input 1000000000000000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0016 begin');
      expect(util.fill(1000000000000000)).assertEqual('1000000000000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillEdge0016 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1700
     * @tc.name      testFillNaN0017
     * @tc.desc      Verify fill handles NaN without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillNaN0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillNaN0017 begin');
      expect(util.fill(NaN)).assertEqual('0NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillNaN0017 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1800
     * @tc.name      testFillInfinity0018
     * @tc.desc      Verify fill handles Infinity without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillInfinity0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillInfinity0018 begin');
      expect(util.fill(Infinity)).assertEqual('Infinity');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillInfinity0018 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_1900
     * @tc.name      testFillNegInfinity0019
     * @tc.desc      Verify fill handles -Infinity without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillNegInfinity0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillNegInfinity0019 begin');
      expect(util.fill(-Infinity)).assertEqual('0-Infinity');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillNegInfinity0019 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2000
     * @tc.name      testDateEdge0020
     * @tc.desc      Verify date composition accepts unusual values 0-0-0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0020 begin');
      expect(util.concatDate(0, 0, 0)).assertEqual('000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0020 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2100
     * @tc.name      testDateEdge0021
     * @tc.desc      Verify date composition accepts unusual values -1-5-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0021 begin');
      expect(util.concatDate(-1, 5, 10)).assertEqual('-1510');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0021 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2200
     * @tc.name      testDateEdge0022
     * @tc.desc      Verify date composition accepts unusual values 2026--1-0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0022 begin');
      expect(util.concatDate(2026, -1, 0)).assertEqual('2026-10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0022 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2300
     * @tc.name      testDateEdge0023
     * @tc.desc      Verify date composition accepts unusual values 1.5-2.5-3.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0023 begin');
      expect(util.concatDate(1.5, 2.5, 3.5)).assertEqual('1.52.53.5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0023 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2400
     * @tc.name      testDateEdge0024
     * @tc.desc      Verify date composition accepts unusual values 2026-12-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0024 begin');
      expect(util.concatDate(2026, 12, 31)).assertEqual('20261231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0024 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2500
     * @tc.name      testDateEdge0025
     * @tc.desc      Verify date composition accepts unusual values 2026-1-1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0025 begin');
      expect(util.concatDate(2026, 1, 1)).assertEqual('202611');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0025 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2600
     * @tc.name      testDateEdge0026
     * @tc.desc      Verify date composition accepts unusual values 0-12-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0026 begin');
      expect(util.concatDate(0, 12, 31)).assertEqual('01231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0026 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2700
     * @tc.name      testDateEdge0027
     * @tc.desc      Verify date composition accepts unusual values 1999-9-9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0027 begin');
      expect(util.concatDate(1999, 9, 9)).assertEqual('199999');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0027 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2800
     * @tc.name      testDateEdge0028
     * @tc.desc      Verify date composition accepts unusual values 2000-10-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0028 begin');
      expect(util.concatDate(2000, 10, 10)).assertEqual('20001010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0028 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_2900
     * @tc.name      testDateEdge0029
     * @tc.desc      Verify date composition accepts unusual values 2024-2-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0029 begin');
      expect(util.concatDate(2024, 2, 29)).assertEqual('2024229');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0029 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3000
     * @tc.name      testDateEdge0030
     * @tc.desc      Verify date composition accepts unusual values 2023-2-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0030 begin');
      expect(util.concatDate(2023, 2, 28)).assertEqual('2023228');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0030 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3100
     * @tc.name      testDateEdge0031
     * @tc.desc      Verify date composition accepts unusual values -2026-1-1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0031 begin');
      expect(util.concatDate(-2026, 1, 1)).assertEqual('-202611');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0031 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3200
     * @tc.name      testDateEdge0032
     * @tc.desc      Verify date composition accepts unusual values 2026-0-1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0032 begin');
      expect(util.concatDate(2026, 0, 1)).assertEqual('202601');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0032 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3300
     * @tc.name      testDateEdge0033
     * @tc.desc      Verify date composition accepts unusual values 2026-13-1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0033 begin');
      expect(util.concatDate(2026, 13, 1)).assertEqual('2026131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0033 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3400
     * @tc.name      testDateEdge0034
     * @tc.desc      Verify date composition accepts unusual values 1000-100-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0034 begin');
      expect(util.concatDate(1000, 100, 10)).assertEqual('100010010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0034 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3500
     * @tc.name      testDateEdge0035
     * @tc.desc      Verify date composition accepts unusual values 0-0-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateEdge0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0035 begin');
      expect(util.concatDate(0, 0, 31)).assertEqual('0031');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateEdge0035 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3600
     * @tc.name      testDateNaN0036
     * @tc.desc      Verify date composition handles NaN without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateNaN0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateNaN0036 begin');
      expect(util.concatDate(NaN, 1, 1)).assertEqual('NaN11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateNaN0036 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3700
     * @tc.name      testDateInfinity0037
     * @tc.desc      Verify date composition handles Infinity without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateInfinity0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateInfinity0037 begin');
      expect(util.concatDate(Infinity, 1, 1)).assertEqual('Infinity11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateInfinity0037 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3800
     * @tc.name      testTimeEdge0038
     * @tc.desc      Verify time composition accepts unusual values -1:-1:-1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0038 begin');
      expect(util.concatTime(-1, -1, -1)).assertEqual('0-10-10-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0038 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_3900
     * @tc.name      testTimeEdge0039
     * @tc.desc      Verify time composition accepts unusual values 1.5:2.5:3.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0039 begin');
      expect(util.concatTime(1.5, 2.5, 3.5)).assertEqual('01.502.503.5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0039 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4000
     * @tc.name      testTimeEdge0040
     * @tc.desc      Verify time composition accepts unusual values 23:59:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0040 begin');
      expect(util.concatTime(23, 59, 59)).assertEqual('235959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0040 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4100
     * @tc.name      testTimeEdge0041
     * @tc.desc      Verify time composition accepts unusual values 0:0:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0041 begin');
      expect(util.concatTime(0, 0, 0)).assertEqual('000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0041 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4200
     * @tc.name      testTimeEdge0042
     * @tc.desc      Verify time composition accepts unusual values 9:9:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0042 begin');
      expect(util.concatTime(9, 9, 9)).assertEqual('090909');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0042 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4300
     * @tc.name      testTimeEdge0043
     * @tc.desc      Verify time composition accepts unusual values 10:10:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0043 begin');
      expect(util.concatTime(10, 10, 10)).assertEqual('101010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0043 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4400
     * @tc.name      testTimeEdge0044
     * @tc.desc      Verify time composition accepts unusual values 0:0:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0044 begin');
      expect(util.concatTime(0, 0, 9)).assertEqual('000009');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0044 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4500
     * @tc.name      testTimeEdge0045
     * @tc.desc      Verify time composition accepts unusual values 0:9:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0045 begin');
      expect(util.concatTime(0, 9, 0)).assertEqual('000900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0045 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4600
     * @tc.name      testTimeEdge0046
     * @tc.desc      Verify time composition accepts unusual values 9:0:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0046 begin');
      expect(util.concatTime(9, 0, 0)).assertEqual('090000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0046 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4700
     * @tc.name      testTimeEdge0047
     * @tc.desc      Verify time composition accepts unusual values 12:0:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0047 begin');
      expect(util.concatTime(12, 0, 0)).assertEqual('120000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0047 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4800
     * @tc.name      testTimeEdge0048
     * @tc.desc      Verify time composition accepts unusual values 0:12:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0048 begin');
      expect(util.concatTime(0, 12, 0)).assertEqual('001200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0048 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_4900
     * @tc.name      testTimeEdge0049
     * @tc.desc      Verify time composition accepts unusual values 0:0:12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0049 begin');
      expect(util.concatTime(0, 0, 12)).assertEqual('000012');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0049 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5000
     * @tc.name      testTimeEdge0050
     * @tc.desc      Verify time composition accepts unusual values 5:6:7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0050 begin');
      expect(util.concatTime(5, 6, 7)).assertEqual('050607');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0050 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5100
     * @tc.name      testTimeEdge0051
     * @tc.desc      Verify time composition accepts unusual values 15:16:17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0051 begin');
      expect(util.concatTime(15, 16, 17)).assertEqual('151617');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0051 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5200
     * @tc.name      testTimeEdge0052
     * @tc.desc      Verify time composition accepts unusual values 59:59:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0052 begin');
      expect(util.concatTime(59, 59, 0)).assertEqual('595900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0052 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5300
     * @tc.name      testTimeEdge0053
     * @tc.desc      Verify time composition accepts unusual values 0:59:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0053 begin');
      expect(util.concatTime(0, 59, 59)).assertEqual('005959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0053 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5400
     * @tc.name      testTimeEdge0054
     * @tc.desc      Verify time composition accepts unusual values 59:0:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0054 begin');
      expect(util.concatTime(59, 0, 59)).assertEqual('590059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0054 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5500
     * @tc.name      testTimeEdge0055
     * @tc.desc      Verify time composition accepts unusual values 1:2:3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeEdge0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0055 begin');
      expect(util.concatTime(1, 2, 3)).assertEqual('010203');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeEdge0055 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5600
     * @tc.name      testTimeNaN0056
     * @tc.desc      Verify time composition handles NaN without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeNaN0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeNaN0056 begin');
      expect(util.concatTime(NaN, 1, 1)).assertEqual('0NaN0101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeNaN0056 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5700
     * @tc.name      testTimeInfinity0057
     * @tc.desc      Verify time composition handles Infinity without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeInfinity0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeInfinity0057 begin');
      expect(util.concatTime(Infinity, 0, 0)).assertEqual('Infinity0000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeInfinity0057 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5800
     * @tc.name      testCountEdge0058
     * @tc.desc      Verify countdown text for boundary input -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0058 begin');
      expect(dateTime(-1)).assertEqual('0-1:0-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0058 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_5900
     * @tc.name      testCountEdge0059
     * @tc.desc      Verify countdown text for boundary input -61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0059 begin');
      expect(dateTime(-61)).assertEqual('0-2:0-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0059 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6000
     * @tc.name      testCountEdge0060
     * @tc.desc      Verify countdown text for boundary input 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0060 begin');
      expect(dateTime(1.5)).assertEqual('00:01.5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0060 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6100
     * @tc.name      testCountEdge0061
     * @tc.desc      Verify countdown text for boundary input 59.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0061 begin');
      expect(dateTime(59.9)).assertEqual('00:59.9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0061 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6200
     * @tc.name      testCountEdge0062
     * @tc.desc      Verify countdown text for boundary input 3600.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0062 begin');
      expect(dateTime(3600.5)).assertEqual('00:00.5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0062 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6300
     * @tc.name      testCountEdge0063
     * @tc.desc      Verify countdown text for boundary input 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0063 begin');
      expect(dateTime(0)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0063 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6400
     * @tc.name      testCountEdge0064
     * @tc.desc      Verify countdown text for boundary input 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0064 begin');
      expect(dateTime(59)).assertEqual('00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0064 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6500
     * @tc.name      testCountEdge0065
     * @tc.desc      Verify countdown text for boundary input 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0065 begin');
      expect(dateTime(60)).assertEqual('01:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0065 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6600
     * @tc.name      testCountEdge0066
     * @tc.desc      Verify countdown text for boundary input 3599.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0066 begin');
      expect(dateTime(3599)).assertEqual('59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0066 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6700
     * @tc.name      testCountEdge0067
     * @tc.desc      Verify countdown text for boundary input 3600.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0067 begin');
      expect(dateTime(3600)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0067 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6800
     * @tc.name      testCountEdge0068
     * @tc.desc      Verify countdown text for boundary input 7200.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0068 begin');
      expect(dateTime(7200)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0068 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_6900
     * @tc.name      testCountEdge0069
     * @tc.desc      Verify countdown text for boundary input 86399.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0069 begin');
      expect(dateTime(86399)).assertEqual('59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0069 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_7000
     * @tc.name      testCountEdge0070
     * @tc.desc      Verify countdown text for boundary input 86400.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0070 begin');
      expect(dateTime(86400)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0070 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_7100
     * @tc.name      testCountEdge0071
     * @tc.desc      Verify countdown text for boundary input 3599.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0071 begin');
      expect(dateTime(3599.5)).assertEqual('59:59.5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0071 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_7200
     * @tc.name      testCountEdge0072
     * @tc.desc      Verify countdown text for boundary input 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0072 begin');
      expect(dateTime(0.5)).assertEqual('00:00.5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0072 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_7300
     * @tc.name      testCountEdge0073
     * @tc.desc      Verify countdown text for boundary input 1000000000000.0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0073 begin');
      expect(dateTime(1000000000000.0)).assertEqual('46:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0073 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_7400
     * @tc.name      testCountEdge0074
     * @tc.desc      Verify countdown text for boundary input 123456789.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountEdge0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0074 begin');
      expect(dateTime(123456789)).assertEqual('33:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountEdge0074 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_7500
     * @tc.name      testCountNaN0075
     * @tc.desc      Verify countdown handles NaN without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountNaN0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountNaN0075 begin');
      expect(dateTime(NaN)).assertEqual('NaN:NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountNaN0075 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTBOUNDP1_7600
     * @tc.name      testCountInfinity0076
     * @tc.desc      Verify countdown handles Infinity without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountInfinity0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountInfinity0076 begin');
      expect(dateTime(Infinity)).assertEqual('NaN:NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountInfinity0076 end');
    })

  })
}
