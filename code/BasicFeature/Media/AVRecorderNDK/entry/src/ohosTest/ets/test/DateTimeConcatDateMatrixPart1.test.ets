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

export default function DateTimeConcatDateMatrixPart1Test(): void {
  describe('DateTimeConcatDateMatrixPart1', () => {

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_0100
     * @tc.name      testConcatDate0001
     * @tc.desc      Verify date composition 2024-1-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0001 begin');
      expect(util.concatDate(2024, 1, 10)).assertEqual('2024110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_0200
     * @tc.name      testConcatDate0002
     * @tc.desc      Verify date composition 2024-1-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0002 begin');
      expect(util.concatDate(2024, 1, 11)).assertEqual('2024111');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_0300
     * @tc.name      testConcatDate0003
     * @tc.desc      Verify date composition 2024-1-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0003 begin');
      expect(util.concatDate(2024, 1, 15)).assertEqual('2024115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_0400
     * @tc.name      testConcatDate0004
     * @tc.desc      Verify date composition 2024-1-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0004 begin');
      expect(util.concatDate(2024, 1, 20)).assertEqual('2024120');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_0500
     * @tc.name      testConcatDate0005
     * @tc.desc      Verify date composition 2024-1-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0005 begin');
      expect(util.concatDate(2024, 1, 25)).assertEqual('2024125');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_0600
     * @tc.name      testConcatDate0006
     * @tc.desc      Verify date composition 2024-1-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0006 begin');
      expect(util.concatDate(2024, 1, 28)).assertEqual('2024128');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_0700
     * @tc.name      testConcatDate0007
     * @tc.desc      Verify date composition 2024-1-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0007 begin');
      expect(util.concatDate(2024, 1, 29)).assertEqual('2024129');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_0800
     * @tc.name      testConcatDate0008
     * @tc.desc      Verify date composition 2024-1-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0008 begin');
      expect(util.concatDate(2024, 1, 30)).assertEqual('2024130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_0900
     * @tc.name      testConcatDate0009
     * @tc.desc      Verify date composition 2024-1-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0009 begin');
      expect(util.concatDate(2024, 1, 31)).assertEqual('2024131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1000
     * @tc.name      testConcatDate0010
     * @tc.desc      Verify date composition 2024-2-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0010 begin');
      expect(util.concatDate(2024, 2, 10)).assertEqual('2024210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1100
     * @tc.name      testConcatDate0011
     * @tc.desc      Verify date composition 2024-2-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0011 begin');
      expect(util.concatDate(2024, 2, 11)).assertEqual('2024211');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1200
     * @tc.name      testConcatDate0012
     * @tc.desc      Verify date composition 2024-2-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0012 begin');
      expect(util.concatDate(2024, 2, 15)).assertEqual('2024215');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1300
     * @tc.name      testConcatDate0013
     * @tc.desc      Verify date composition 2024-2-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0013 begin');
      expect(util.concatDate(2024, 2, 20)).assertEqual('2024220');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0013 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1400
     * @tc.name      testConcatDate0014
     * @tc.desc      Verify date composition 2024-2-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0014 begin');
      expect(util.concatDate(2024, 2, 25)).assertEqual('2024225');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0014 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1500
     * @tc.name      testConcatDate0015
     * @tc.desc      Verify date composition 2024-2-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0015 begin');
      expect(util.concatDate(2024, 2, 28)).assertEqual('2024228');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0015 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1600
     * @tc.name      testConcatDate0016
     * @tc.desc      Verify date composition 2024-2-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0016 begin');
      expect(util.concatDate(2024, 2, 29)).assertEqual('2024229');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0016 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1700
     * @tc.name      testConcatDate0017
     * @tc.desc      Verify date composition 2024-2-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0017 begin');
      expect(util.concatDate(2024, 2, 30)).assertEqual('2024230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0017 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1800
     * @tc.name      testConcatDate0018
     * @tc.desc      Verify date composition 2024-2-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0018 begin');
      expect(util.concatDate(2024, 2, 31)).assertEqual('2024231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0018 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_1900
     * @tc.name      testConcatDate0019
     * @tc.desc      Verify date composition 2024-3-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0019 begin');
      expect(util.concatDate(2024, 3, 10)).assertEqual('2024310');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0019 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2000
     * @tc.name      testConcatDate0020
     * @tc.desc      Verify date composition 2024-3-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0020 begin');
      expect(util.concatDate(2024, 3, 11)).assertEqual('2024311');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0020 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2100
     * @tc.name      testConcatDate0021
     * @tc.desc      Verify date composition 2024-3-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0021 begin');
      expect(util.concatDate(2024, 3, 15)).assertEqual('2024315');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0021 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2200
     * @tc.name      testConcatDate0022
     * @tc.desc      Verify date composition 2024-3-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0022 begin');
      expect(util.concatDate(2024, 3, 20)).assertEqual('2024320');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0022 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2300
     * @tc.name      testConcatDate0023
     * @tc.desc      Verify date composition 2024-3-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0023 begin');
      expect(util.concatDate(2024, 3, 25)).assertEqual('2024325');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0023 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2400
     * @tc.name      testConcatDate0024
     * @tc.desc      Verify date composition 2024-3-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0024 begin');
      expect(util.concatDate(2024, 3, 28)).assertEqual('2024328');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0024 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2500
     * @tc.name      testConcatDate0025
     * @tc.desc      Verify date composition 2024-3-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0025 begin');
      expect(util.concatDate(2024, 3, 29)).assertEqual('2024329');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0025 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2600
     * @tc.name      testConcatDate0026
     * @tc.desc      Verify date composition 2024-3-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0026 begin');
      expect(util.concatDate(2024, 3, 30)).assertEqual('2024330');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0026 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2700
     * @tc.name      testConcatDate0027
     * @tc.desc      Verify date composition 2024-3-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0027 begin');
      expect(util.concatDate(2024, 3, 31)).assertEqual('2024331');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0027 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2800
     * @tc.name      testConcatDate0028
     * @tc.desc      Verify date composition 2024-4-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0028 begin');
      expect(util.concatDate(2024, 4, 10)).assertEqual('2024410');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0028 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_2900
     * @tc.name      testConcatDate0029
     * @tc.desc      Verify date composition 2024-4-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0029 begin');
      expect(util.concatDate(2024, 4, 11)).assertEqual('2024411');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0029 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3000
     * @tc.name      testConcatDate0030
     * @tc.desc      Verify date composition 2024-4-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0030 begin');
      expect(util.concatDate(2024, 4, 15)).assertEqual('2024415');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0030 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3100
     * @tc.name      testConcatDate0031
     * @tc.desc      Verify date composition 2024-4-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0031 begin');
      expect(util.concatDate(2024, 4, 20)).assertEqual('2024420');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0031 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3200
     * @tc.name      testConcatDate0032
     * @tc.desc      Verify date composition 2024-4-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0032 begin');
      expect(util.concatDate(2024, 4, 25)).assertEqual('2024425');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0032 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3300
     * @tc.name      testConcatDate0033
     * @tc.desc      Verify date composition 2024-4-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0033 begin');
      expect(util.concatDate(2024, 4, 28)).assertEqual('2024428');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0033 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3400
     * @tc.name      testConcatDate0034
     * @tc.desc      Verify date composition 2024-4-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0034 begin');
      expect(util.concatDate(2024, 4, 29)).assertEqual('2024429');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0034 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3500
     * @tc.name      testConcatDate0035
     * @tc.desc      Verify date composition 2024-4-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0035 begin');
      expect(util.concatDate(2024, 4, 30)).assertEqual('2024430');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0035 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3600
     * @tc.name      testConcatDate0036
     * @tc.desc      Verify date composition 2024-4-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0036 begin');
      expect(util.concatDate(2024, 4, 31)).assertEqual('2024431');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0036 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3700
     * @tc.name      testConcatDate0037
     * @tc.desc      Verify date composition 2024-5-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0037 begin');
      expect(util.concatDate(2024, 5, 10)).assertEqual('2024510');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0037 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3800
     * @tc.name      testConcatDate0038
     * @tc.desc      Verify date composition 2024-5-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0038 begin');
      expect(util.concatDate(2024, 5, 11)).assertEqual('2024511');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0038 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_3900
     * @tc.name      testConcatDate0039
     * @tc.desc      Verify date composition 2024-5-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0039 begin');
      expect(util.concatDate(2024, 5, 15)).assertEqual('2024515');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0039 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4000
     * @tc.name      testConcatDate0040
     * @tc.desc      Verify date composition 2024-5-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0040 begin');
      expect(util.concatDate(2024, 5, 20)).assertEqual('2024520');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0040 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4100
     * @tc.name      testConcatDate0041
     * @tc.desc      Verify date composition 2024-5-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0041 begin');
      expect(util.concatDate(2024, 5, 25)).assertEqual('2024525');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0041 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4200
     * @tc.name      testConcatDate0042
     * @tc.desc      Verify date composition 2024-5-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0042 begin');
      expect(util.concatDate(2024, 5, 28)).assertEqual('2024528');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0042 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4300
     * @tc.name      testConcatDate0043
     * @tc.desc      Verify date composition 2024-5-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0043 begin');
      expect(util.concatDate(2024, 5, 29)).assertEqual('2024529');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0043 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4400
     * @tc.name      testConcatDate0044
     * @tc.desc      Verify date composition 2024-5-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0044 begin');
      expect(util.concatDate(2024, 5, 30)).assertEqual('2024530');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0044 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4500
     * @tc.name      testConcatDate0045
     * @tc.desc      Verify date composition 2024-5-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0045 begin');
      expect(util.concatDate(2024, 5, 31)).assertEqual('2024531');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0045 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4600
     * @tc.name      testConcatDate0046
     * @tc.desc      Verify date composition 2024-6-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0046 begin');
      expect(util.concatDate(2024, 6, 10)).assertEqual('2024610');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0046 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4700
     * @tc.name      testConcatDate0047
     * @tc.desc      Verify date composition 2024-6-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0047 begin');
      expect(util.concatDate(2024, 6, 11)).assertEqual('2024611');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0047 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4800
     * @tc.name      testConcatDate0048
     * @tc.desc      Verify date composition 2024-6-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0048 begin');
      expect(util.concatDate(2024, 6, 15)).assertEqual('2024615');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0048 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_4900
     * @tc.name      testConcatDate0049
     * @tc.desc      Verify date composition 2024-6-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0049 begin');
      expect(util.concatDate(2024, 6, 20)).assertEqual('2024620');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0049 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5000
     * @tc.name      testConcatDate0050
     * @tc.desc      Verify date composition 2024-6-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0050 begin');
      expect(util.concatDate(2024, 6, 25)).assertEqual('2024625');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0050 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5100
     * @tc.name      testConcatDate0051
     * @tc.desc      Verify date composition 2024-6-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0051 begin');
      expect(util.concatDate(2024, 6, 28)).assertEqual('2024628');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0051 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5200
     * @tc.name      testConcatDate0052
     * @tc.desc      Verify date composition 2024-6-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0052 begin');
      expect(util.concatDate(2024, 6, 29)).assertEqual('2024629');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0052 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5300
     * @tc.name      testConcatDate0053
     * @tc.desc      Verify date composition 2024-6-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0053 begin');
      expect(util.concatDate(2024, 6, 30)).assertEqual('2024630');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0053 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5400
     * @tc.name      testConcatDate0054
     * @tc.desc      Verify date composition 2024-6-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0054 begin');
      expect(util.concatDate(2024, 6, 31)).assertEqual('2024631');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0054 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5500
     * @tc.name      testConcatDate0055
     * @tc.desc      Verify date composition 2024-7-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0055 begin');
      expect(util.concatDate(2024, 7, 10)).assertEqual('2024710');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0055 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5600
     * @tc.name      testConcatDate0056
     * @tc.desc      Verify date composition 2024-7-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0056 begin');
      expect(util.concatDate(2024, 7, 11)).assertEqual('2024711');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0056 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5700
     * @tc.name      testConcatDate0057
     * @tc.desc      Verify date composition 2024-7-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0057 begin');
      expect(util.concatDate(2024, 7, 15)).assertEqual('2024715');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0057 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5800
     * @tc.name      testConcatDate0058
     * @tc.desc      Verify date composition 2024-7-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0058 begin');
      expect(util.concatDate(2024, 7, 20)).assertEqual('2024720');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0058 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_5900
     * @tc.name      testConcatDate0059
     * @tc.desc      Verify date composition 2024-7-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0059 begin');
      expect(util.concatDate(2024, 7, 25)).assertEqual('2024725');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0059 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6000
     * @tc.name      testConcatDate0060
     * @tc.desc      Verify date composition 2024-7-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0060 begin');
      expect(util.concatDate(2024, 7, 28)).assertEqual('2024728');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0060 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6100
     * @tc.name      testConcatDate0061
     * @tc.desc      Verify date composition 2024-7-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0061 begin');
      expect(util.concatDate(2024, 7, 29)).assertEqual('2024729');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0061 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6200
     * @tc.name      testConcatDate0062
     * @tc.desc      Verify date composition 2024-7-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0062 begin');
      expect(util.concatDate(2024, 7, 30)).assertEqual('2024730');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0062 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6300
     * @tc.name      testConcatDate0063
     * @tc.desc      Verify date composition 2024-7-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0063 begin');
      expect(util.concatDate(2024, 7, 31)).assertEqual('2024731');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0063 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6400
     * @tc.name      testConcatDate0064
     * @tc.desc      Verify date composition 2024-8-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0064 begin');
      expect(util.concatDate(2024, 8, 10)).assertEqual('2024810');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0064 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6500
     * @tc.name      testConcatDate0065
     * @tc.desc      Verify date composition 2024-8-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0065 begin');
      expect(util.concatDate(2024, 8, 11)).assertEqual('2024811');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0065 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6600
     * @tc.name      testConcatDate0066
     * @tc.desc      Verify date composition 2024-8-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0066 begin');
      expect(util.concatDate(2024, 8, 15)).assertEqual('2024815');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0066 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6700
     * @tc.name      testConcatDate0067
     * @tc.desc      Verify date composition 2024-8-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0067 begin');
      expect(util.concatDate(2024, 8, 20)).assertEqual('2024820');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0067 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6800
     * @tc.name      testConcatDate0068
     * @tc.desc      Verify date composition 2024-8-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0068 begin');
      expect(util.concatDate(2024, 8, 25)).assertEqual('2024825');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0068 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_6900
     * @tc.name      testConcatDate0069
     * @tc.desc      Verify date composition 2024-8-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0069 begin');
      expect(util.concatDate(2024, 8, 28)).assertEqual('2024828');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0069 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7000
     * @tc.name      testConcatDate0070
     * @tc.desc      Verify date composition 2024-8-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0070 begin');
      expect(util.concatDate(2024, 8, 29)).assertEqual('2024829');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0070 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7100
     * @tc.name      testConcatDate0071
     * @tc.desc      Verify date composition 2024-8-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0071 begin');
      expect(util.concatDate(2024, 8, 30)).assertEqual('2024830');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0071 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7200
     * @tc.name      testConcatDate0072
     * @tc.desc      Verify date composition 2024-8-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0072 begin');
      expect(util.concatDate(2024, 8, 31)).assertEqual('2024831');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0072 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7300
     * @tc.name      testConcatDate0073
     * @tc.desc      Verify date composition 2024-9-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0073 begin');
      expect(util.concatDate(2024, 9, 10)).assertEqual('2024910');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0073 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7400
     * @tc.name      testConcatDate0074
     * @tc.desc      Verify date composition 2024-9-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0074 begin');
      expect(util.concatDate(2024, 9, 11)).assertEqual('2024911');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0074 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7500
     * @tc.name      testConcatDate0075
     * @tc.desc      Verify date composition 2024-9-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0075 begin');
      expect(util.concatDate(2024, 9, 15)).assertEqual('2024915');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0075 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7600
     * @tc.name      testConcatDate0076
     * @tc.desc      Verify date composition 2024-9-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0076 begin');
      expect(util.concatDate(2024, 9, 20)).assertEqual('2024920');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0076 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7700
     * @tc.name      testConcatDate0077
     * @tc.desc      Verify date composition 2024-9-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0077 begin');
      expect(util.concatDate(2024, 9, 25)).assertEqual('2024925');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0077 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7800
     * @tc.name      testConcatDate0078
     * @tc.desc      Verify date composition 2024-9-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0078 begin');
      expect(util.concatDate(2024, 9, 28)).assertEqual('2024928');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0078 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_7900
     * @tc.name      testConcatDate0079
     * @tc.desc      Verify date composition 2024-9-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0079 begin');
      expect(util.concatDate(2024, 9, 29)).assertEqual('2024929');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0079 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8000
     * @tc.name      testConcatDate0080
     * @tc.desc      Verify date composition 2024-9-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0080 begin');
      expect(util.concatDate(2024, 9, 30)).assertEqual('2024930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0080 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8100
     * @tc.name      testConcatDate0081
     * @tc.desc      Verify date composition 2024-9-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0081 begin');
      expect(util.concatDate(2024, 9, 31)).assertEqual('2024931');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0081 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8200
     * @tc.name      testConcatDate0082
     * @tc.desc      Verify date composition 2024-10-10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0082 begin');
      expect(util.concatDate(2024, 10, 10)).assertEqual('20241010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0082 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8300
     * @tc.name      testConcatDate0083
     * @tc.desc      Verify date composition 2024-10-11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0083 begin');
      expect(util.concatDate(2024, 10, 11)).assertEqual('20241011');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0083 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8400
     * @tc.name      testConcatDate0084
     * @tc.desc      Verify date composition 2024-10-15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0084 begin');
      expect(util.concatDate(2024, 10, 15)).assertEqual('20241015');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0084 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8500
     * @tc.name      testConcatDate0085
     * @tc.desc      Verify date composition 2024-10-20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0085 begin');
      expect(util.concatDate(2024, 10, 20)).assertEqual('20241020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0085 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8600
     * @tc.name      testConcatDate0086
     * @tc.desc      Verify date composition 2024-10-25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0086 begin');
      expect(util.concatDate(2024, 10, 25)).assertEqual('20241025');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0086 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8700
     * @tc.name      testConcatDate0087
     * @tc.desc      Verify date composition 2024-10-28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0087 begin');
      expect(util.concatDate(2024, 10, 28)).assertEqual('20241028');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0087 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8800
     * @tc.name      testConcatDate0088
     * @tc.desc      Verify date composition 2024-10-29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0088 begin');
      expect(util.concatDate(2024, 10, 29)).assertEqual('20241029');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0088 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_8900
     * @tc.name      testConcatDate0089
     * @tc.desc      Verify date composition 2024-10-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0089 begin');
      expect(util.concatDate(2024, 10, 30)).assertEqual('20241030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0089 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTDATEP1_9000
     * @tc.name      testConcatDate0090
     * @tc.desc      Verify date composition 2024-10-31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0090 begin');
      expect(util.concatDate(2024, 10, 31)).assertEqual('20241031');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0090 end');
    })

  })
}
