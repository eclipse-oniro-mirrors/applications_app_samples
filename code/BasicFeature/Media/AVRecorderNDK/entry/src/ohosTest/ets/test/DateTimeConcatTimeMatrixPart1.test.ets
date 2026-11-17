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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import DateTimeUtil, { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const util: DateTimeUtil = new DateTimeUtil();

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVRecorder]';

export default function DateTimeConcatTimeMatrixPart1Test(): void {
  describe('DateTimeConcatTimeMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_0100
     * @tc.name      testConcatTime0001
     * @tc.desc      Verify time composition 0:0:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0001 begin');
      expect(util.concatTime(0, 0, 0)).assertEqual('000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_0200
     * @tc.name      testConcatTime0002
     * @tc.desc      Verify time composition 0:0:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0002 begin');
      expect(util.concatTime(0, 0, 1)).assertEqual('000001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_0300
     * @tc.name      testConcatTime0003
     * @tc.desc      Verify time composition 0:0:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0003 begin');
      expect(util.concatTime(0, 0, 5)).assertEqual('000005');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_0400
     * @tc.name      testConcatTime0004
     * @tc.desc      Verify time composition 0:0:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0004 begin');
      expect(util.concatTime(0, 0, 9)).assertEqual('000009');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_0500
     * @tc.name      testConcatTime0005
     * @tc.desc      Verify time composition 0:0:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0005 begin');
      expect(util.concatTime(0, 0, 10)).assertEqual('000010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_0600
     * @tc.name      testConcatTime0006
     * @tc.desc      Verify time composition 0:0:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0006 begin');
      expect(util.concatTime(0, 0, 30)).assertEqual('000030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_0700
     * @tc.name      testConcatTime0007
     * @tc.desc      Verify time composition 0:0:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0007 begin');
      expect(util.concatTime(0, 0, 59)).assertEqual('000059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_0800
     * @tc.name      testConcatTime0008
     * @tc.desc      Verify time composition 0:1:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0008 begin');
      expect(util.concatTime(0, 1, 0)).assertEqual('000100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_0900
     * @tc.name      testConcatTime0009
     * @tc.desc      Verify time composition 0:1:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0009 begin');
      expect(util.concatTime(0, 1, 1)).assertEqual('000101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1000
     * @tc.name      testConcatTime0010
     * @tc.desc      Verify time composition 0:1:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0010 begin');
      expect(util.concatTime(0, 1, 5)).assertEqual('000105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1100
     * @tc.name      testConcatTime0011
     * @tc.desc      Verify time composition 0:1:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0011 begin');
      expect(util.concatTime(0, 1, 9)).assertEqual('000109');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1200
     * @tc.name      testConcatTime0012
     * @tc.desc      Verify time composition 0:1:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0012 begin');
      expect(util.concatTime(0, 1, 10)).assertEqual('000110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1300
     * @tc.name      testConcatTime0013
     * @tc.desc      Verify time composition 0:1:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0013 begin');
      expect(util.concatTime(0, 1, 30)).assertEqual('000130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0013 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1400
     * @tc.name      testConcatTime0014
     * @tc.desc      Verify time composition 0:1:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0014 begin');
      expect(util.concatTime(0, 1, 59)).assertEqual('000159');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0014 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1500
     * @tc.name      testConcatTime0015
     * @tc.desc      Verify time composition 0:2:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0015 begin');
      expect(util.concatTime(0, 2, 0)).assertEqual('000200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0015 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1600
     * @tc.name      testConcatTime0016
     * @tc.desc      Verify time composition 0:2:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0016 begin');
      expect(util.concatTime(0, 2, 1)).assertEqual('000201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0016 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1700
     * @tc.name      testConcatTime0017
     * @tc.desc      Verify time composition 0:2:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0017 begin');
      expect(util.concatTime(0, 2, 5)).assertEqual('000205');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0017 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1800
     * @tc.name      testConcatTime0018
     * @tc.desc      Verify time composition 0:2:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0018 begin');
      expect(util.concatTime(0, 2, 9)).assertEqual('000209');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0018 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_1900
     * @tc.name      testConcatTime0019
     * @tc.desc      Verify time composition 0:2:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0019 begin');
      expect(util.concatTime(0, 2, 10)).assertEqual('000210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0019 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2000
     * @tc.name      testConcatTime0020
     * @tc.desc      Verify time composition 0:2:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0020 begin');
      expect(util.concatTime(0, 2, 30)).assertEqual('000230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0020 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2100
     * @tc.name      testConcatTime0021
     * @tc.desc      Verify time composition 0:2:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0021 begin');
      expect(util.concatTime(0, 2, 59)).assertEqual('000259');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0021 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2200
     * @tc.name      testConcatTime0022
     * @tc.desc      Verify time composition 0:3:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0022 begin');
      expect(util.concatTime(0, 3, 0)).assertEqual('000300');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0022 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2300
     * @tc.name      testConcatTime0023
     * @tc.desc      Verify time composition 0:3:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0023 begin');
      expect(util.concatTime(0, 3, 1)).assertEqual('000301');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0023 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2400
     * @tc.name      testConcatTime0024
     * @tc.desc      Verify time composition 0:3:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0024 begin');
      expect(util.concatTime(0, 3, 5)).assertEqual('000305');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0024 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2500
     * @tc.name      testConcatTime0025
     * @tc.desc      Verify time composition 0:3:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0025 begin');
      expect(util.concatTime(0, 3, 9)).assertEqual('000309');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0025 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2600
     * @tc.name      testConcatTime0026
     * @tc.desc      Verify time composition 0:3:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0026 begin');
      expect(util.concatTime(0, 3, 10)).assertEqual('000310');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0026 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2700
     * @tc.name      testConcatTime0027
     * @tc.desc      Verify time composition 0:3:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0027 begin');
      expect(util.concatTime(0, 3, 30)).assertEqual('000330');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0027 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2800
     * @tc.name      testConcatTime0028
     * @tc.desc      Verify time composition 0:3:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0028 begin');
      expect(util.concatTime(0, 3, 59)).assertEqual('000359');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0028 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_2900
     * @tc.name      testConcatTime0029
     * @tc.desc      Verify time composition 0:4:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0029 begin');
      expect(util.concatTime(0, 4, 0)).assertEqual('000400');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0029 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3000
     * @tc.name      testConcatTime0030
     * @tc.desc      Verify time composition 0:4:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0030 begin');
      expect(util.concatTime(0, 4, 1)).assertEqual('000401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0030 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3100
     * @tc.name      testConcatTime0031
     * @tc.desc      Verify time composition 0:4:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0031 begin');
      expect(util.concatTime(0, 4, 5)).assertEqual('000405');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0031 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3200
     * @tc.name      testConcatTime0032
     * @tc.desc      Verify time composition 0:4:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0032 begin');
      expect(util.concatTime(0, 4, 9)).assertEqual('000409');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0032 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3300
     * @tc.name      testConcatTime0033
     * @tc.desc      Verify time composition 0:4:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0033 begin');
      expect(util.concatTime(0, 4, 10)).assertEqual('000410');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0033 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3400
     * @tc.name      testConcatTime0034
     * @tc.desc      Verify time composition 0:4:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0034 begin');
      expect(util.concatTime(0, 4, 30)).assertEqual('000430');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0034 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3500
     * @tc.name      testConcatTime0035
     * @tc.desc      Verify time composition 0:4:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0035 begin');
      expect(util.concatTime(0, 4, 59)).assertEqual('000459');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0035 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3600
     * @tc.name      testConcatTime0036
     * @tc.desc      Verify time composition 0:5:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0036 begin');
      expect(util.concatTime(0, 5, 0)).assertEqual('000500');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0036 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3700
     * @tc.name      testConcatTime0037
     * @tc.desc      Verify time composition 0:5:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0037 begin');
      expect(util.concatTime(0, 5, 1)).assertEqual('000501');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0037 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3800
     * @tc.name      testConcatTime0038
     * @tc.desc      Verify time composition 0:5:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0038 begin');
      expect(util.concatTime(0, 5, 5)).assertEqual('000505');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0038 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_3900
     * @tc.name      testConcatTime0039
     * @tc.desc      Verify time composition 0:5:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0039 begin');
      expect(util.concatTime(0, 5, 9)).assertEqual('000509');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0039 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4000
     * @tc.name      testConcatTime0040
     * @tc.desc      Verify time composition 0:5:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0040 begin');
      expect(util.concatTime(0, 5, 10)).assertEqual('000510');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0040 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4100
     * @tc.name      testConcatTime0041
     * @tc.desc      Verify time composition 0:5:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0041 begin');
      expect(util.concatTime(0, 5, 30)).assertEqual('000530');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0041 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4200
     * @tc.name      testConcatTime0042
     * @tc.desc      Verify time composition 0:5:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0042 begin');
      expect(util.concatTime(0, 5, 59)).assertEqual('000559');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0042 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4300
     * @tc.name      testConcatTime0043
     * @tc.desc      Verify time composition 0:6:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0043 begin');
      expect(util.concatTime(0, 6, 0)).assertEqual('000600');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0043 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4400
     * @tc.name      testConcatTime0044
     * @tc.desc      Verify time composition 0:6:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0044 begin');
      expect(util.concatTime(0, 6, 1)).assertEqual('000601');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0044 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4500
     * @tc.name      testConcatTime0045
     * @tc.desc      Verify time composition 0:6:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0045 begin');
      expect(util.concatTime(0, 6, 5)).assertEqual('000605');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0045 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4600
     * @tc.name      testConcatTime0046
     * @tc.desc      Verify time composition 0:6:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0046 begin');
      expect(util.concatTime(0, 6, 9)).assertEqual('000609');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0046 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4700
     * @tc.name      testConcatTime0047
     * @tc.desc      Verify time composition 0:6:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0047 begin');
      expect(util.concatTime(0, 6, 10)).assertEqual('000610');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0047 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4800
     * @tc.name      testConcatTime0048
     * @tc.desc      Verify time composition 0:6:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0048 begin');
      expect(util.concatTime(0, 6, 30)).assertEqual('000630');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0048 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_4900
     * @tc.name      testConcatTime0049
     * @tc.desc      Verify time composition 0:6:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0049 begin');
      expect(util.concatTime(0, 6, 59)).assertEqual('000659');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0049 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5000
     * @tc.name      testConcatTime0050
     * @tc.desc      Verify time composition 0:7:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0050 begin');
      expect(util.concatTime(0, 7, 0)).assertEqual('000700');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0050 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5100
     * @tc.name      testConcatTime0051
     * @tc.desc      Verify time composition 0:7:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0051 begin');
      expect(util.concatTime(0, 7, 1)).assertEqual('000701');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0051 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5200
     * @tc.name      testConcatTime0052
     * @tc.desc      Verify time composition 0:7:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0052 begin');
      expect(util.concatTime(0, 7, 5)).assertEqual('000705');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0052 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5300
     * @tc.name      testConcatTime0053
     * @tc.desc      Verify time composition 0:7:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0053 begin');
      expect(util.concatTime(0, 7, 9)).assertEqual('000709');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0053 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5400
     * @tc.name      testConcatTime0054
     * @tc.desc      Verify time composition 0:7:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0054 begin');
      expect(util.concatTime(0, 7, 10)).assertEqual('000710');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0054 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5500
     * @tc.name      testConcatTime0055
     * @tc.desc      Verify time composition 0:7:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0055 begin');
      expect(util.concatTime(0, 7, 30)).assertEqual('000730');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0055 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5600
     * @tc.name      testConcatTime0056
     * @tc.desc      Verify time composition 0:7:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0056 begin');
      expect(util.concatTime(0, 7, 59)).assertEqual('000759');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0056 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5700
     * @tc.name      testConcatTime0057
     * @tc.desc      Verify time composition 0:8:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0057 begin');
      expect(util.concatTime(0, 8, 0)).assertEqual('000800');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0057 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5800
     * @tc.name      testConcatTime0058
     * @tc.desc      Verify time composition 0:8:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0058 begin');
      expect(util.concatTime(0, 8, 1)).assertEqual('000801');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0058 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_5900
     * @tc.name      testConcatTime0059
     * @tc.desc      Verify time composition 0:8:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0059 begin');
      expect(util.concatTime(0, 8, 5)).assertEqual('000805');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0059 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6000
     * @tc.name      testConcatTime0060
     * @tc.desc      Verify time composition 0:8:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0060 begin');
      expect(util.concatTime(0, 8, 9)).assertEqual('000809');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0060 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6100
     * @tc.name      testConcatTime0061
     * @tc.desc      Verify time composition 0:8:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0061 begin');
      expect(util.concatTime(0, 8, 10)).assertEqual('000810');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0061 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6200
     * @tc.name      testConcatTime0062
     * @tc.desc      Verify time composition 0:8:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0062 begin');
      expect(util.concatTime(0, 8, 30)).assertEqual('000830');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0062 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6300
     * @tc.name      testConcatTime0063
     * @tc.desc      Verify time composition 0:8:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0063 begin');
      expect(util.concatTime(0, 8, 59)).assertEqual('000859');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0063 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6400
     * @tc.name      testConcatTime0064
     * @tc.desc      Verify time composition 0:9:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0064 begin');
      expect(util.concatTime(0, 9, 0)).assertEqual('000900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0064 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6500
     * @tc.name      testConcatTime0065
     * @tc.desc      Verify time composition 0:9:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0065 begin');
      expect(util.concatTime(0, 9, 1)).assertEqual('000901');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0065 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6600
     * @tc.name      testConcatTime0066
     * @tc.desc      Verify time composition 0:9:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0066 begin');
      expect(util.concatTime(0, 9, 5)).assertEqual('000905');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0066 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6700
     * @tc.name      testConcatTime0067
     * @tc.desc      Verify time composition 0:9:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0067 begin');
      expect(util.concatTime(0, 9, 9)).assertEqual('000909');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0067 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6800
     * @tc.name      testConcatTime0068
     * @tc.desc      Verify time composition 0:9:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0068 begin');
      expect(util.concatTime(0, 9, 10)).assertEqual('000910');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0068 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_6900
     * @tc.name      testConcatTime0069
     * @tc.desc      Verify time composition 0:9:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0069 begin');
      expect(util.concatTime(0, 9, 30)).assertEqual('000930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0069 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7000
     * @tc.name      testConcatTime0070
     * @tc.desc      Verify time composition 0:9:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0070 begin');
      expect(util.concatTime(0, 9, 59)).assertEqual('000959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0070 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7100
     * @tc.name      testConcatTime0071
     * @tc.desc      Verify time composition 0:10:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0071 begin');
      expect(util.concatTime(0, 10, 0)).assertEqual('001000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0071 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7200
     * @tc.name      testConcatTime0072
     * @tc.desc      Verify time composition 0:10:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0072 begin');
      expect(util.concatTime(0, 10, 1)).assertEqual('001001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0072 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7300
     * @tc.name      testConcatTime0073
     * @tc.desc      Verify time composition 0:10:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0073 begin');
      expect(util.concatTime(0, 10, 5)).assertEqual('001005');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0073 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7400
     * @tc.name      testConcatTime0074
     * @tc.desc      Verify time composition 0:10:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0074 begin');
      expect(util.concatTime(0, 10, 9)).assertEqual('001009');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0074 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7500
     * @tc.name      testConcatTime0075
     * @tc.desc      Verify time composition 0:10:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0075 begin');
      expect(util.concatTime(0, 10, 10)).assertEqual('001010');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0075 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7600
     * @tc.name      testConcatTime0076
     * @tc.desc      Verify time composition 0:10:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0076 begin');
      expect(util.concatTime(0, 10, 30)).assertEqual('001030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0076 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7700
     * @tc.name      testConcatTime0077
     * @tc.desc      Verify time composition 0:10:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0077 begin');
      expect(util.concatTime(0, 10, 59)).assertEqual('001059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0077 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7800
     * @tc.name      testConcatTime0078
     * @tc.desc      Verify time composition 0:11:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0078 begin');
      expect(util.concatTime(0, 11, 0)).assertEqual('001100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0078 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_7900
     * @tc.name      testConcatTime0079
     * @tc.desc      Verify time composition 0:11:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0079 begin');
      expect(util.concatTime(0, 11, 1)).assertEqual('001101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0079 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8000
     * @tc.name      testConcatTime0080
     * @tc.desc      Verify time composition 0:11:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0080 begin');
      expect(util.concatTime(0, 11, 5)).assertEqual('001105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0080 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8100
     * @tc.name      testConcatTime0081
     * @tc.desc      Verify time composition 0:11:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0081 begin');
      expect(util.concatTime(0, 11, 9)).assertEqual('001109');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0081 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8200
     * @tc.name      testConcatTime0082
     * @tc.desc      Verify time composition 0:11:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0082 begin');
      expect(util.concatTime(0, 11, 10)).assertEqual('001110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0082 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8300
     * @tc.name      testConcatTime0083
     * @tc.desc      Verify time composition 0:11:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0083 begin');
      expect(util.concatTime(0, 11, 30)).assertEqual('001130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0083 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8400
     * @tc.name      testConcatTime0084
     * @tc.desc      Verify time composition 0:11:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0084 begin');
      expect(util.concatTime(0, 11, 59)).assertEqual('001159');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0084 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8500
     * @tc.name      testConcatTime0085
     * @tc.desc      Verify time composition 0:12:0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0085 begin');
      expect(util.concatTime(0, 12, 0)).assertEqual('001200');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0085 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8600
     * @tc.name      testConcatTime0086
     * @tc.desc      Verify time composition 0:12:1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0086 begin');
      expect(util.concatTime(0, 12, 1)).assertEqual('001201');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0086 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8700
     * @tc.name      testConcatTime0087
     * @tc.desc      Verify time composition 0:12:5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0087 begin');
      expect(util.concatTime(0, 12, 5)).assertEqual('001205');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0087 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8800
     * @tc.name      testConcatTime0088
     * @tc.desc      Verify time composition 0:12:9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0088 begin');
      expect(util.concatTime(0, 12, 9)).assertEqual('001209');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0088 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_8900
     * @tc.name      testConcatTime0089
     * @tc.desc      Verify time composition 0:12:10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0089 begin');
      expect(util.concatTime(0, 12, 10)).assertEqual('001210');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0089 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTTIMEP1_9000
     * @tc.name      testConcatTime0090
     * @tc.desc      Verify time composition 0:12:30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0090 begin');
      expect(util.concatTime(0, 12, 30)).assertEqual('001230');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatTime0090 end');
    })

  })
}
