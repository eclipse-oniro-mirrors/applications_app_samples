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
import Logger from '../../../main/ets/utils/Logger';

const util: DateTimeUtil = new DateTimeUtil();

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVRecorder]';

export default function DateTimePerfPart1Test(): void {
  describe('DateTimePerfPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTPERFP1_0100
     * @tc.name      testFillPerf10k0001
     * @tc.desc      Verify 10k fill calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillPerf10k0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillPerf10k0001 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        util.fill(i % 10);
      }
      expect(Date.now() - start < 2000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillPerf10k0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_0200
     * @tc.name      testFillPerf100k0002
     * @tc.desc      Verify 100k fill calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillPerf100k0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillPerf100k0002 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        util.fill(i % 10);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillPerf100k0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_0300
     * @tc.name      testFillAverage0003
     * @tc.desc      Verify the average fill call cost stays below one millisecond.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillAverage0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillAverage0003 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        util.fill(i % 10);
      }
      expect((Date.now() - start) / 100000 < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillAverage0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_0400
     * @tc.name      testDatePerf10k0004
     * @tc.desc      Verify 10k concatDate calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDatePerf10k0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDatePerf10k0004 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        util.concatDate(2026, (i % 12) + 1, (i % 28) + 1);
      }
      expect(Date.now() - start < 2000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDatePerf10k0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_0500
     * @tc.name      testDatePerf100k0005
     * @tc.desc      Verify 100k concatDate calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDatePerf100k0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDatePerf100k0005 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        util.concatDate(2026, (i % 12) + 1, (i % 28) + 1);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDatePerf100k0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_0600
     * @tc.name      testTimePerf10k0006
     * @tc.desc      Verify 10k concatTime calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimePerf10k0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimePerf10k0006 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        util.concatTime(i % 24, i % 60, i % 60);
      }
      expect(Date.now() - start < 2000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimePerf10k0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_0700
     * @tc.name      testTimePerf100k0007
     * @tc.desc      Verify 100k concatTime calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimePerf100k0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimePerf100k0007 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        util.concatTime(i % 24, i % 60, i % 60);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimePerf100k0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_0800
     * @tc.name      testCountPerf10k0008
     * @tc.desc      Verify 10k dateTime calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountPerf10k0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountPerf10k0008 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        dateTime(i);
      }
      expect(Date.now() - start < 2000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountPerf10k0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_0900
     * @tc.name      testCountPerf100k0009
     * @tc.desc      Verify 100k dateTime calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountPerf100k0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountPerf100k0009 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        dateTime(i);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountPerf100k0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_1000
     * @tc.name      testNowTimePerf0010
     * @tc.desc      Verify 10k getTime calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNowTimePerf0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNowTimePerf0010 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        util.getTime();
      }
      expect(Date.now() - start < 5000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNowTimePerf0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_1100
     * @tc.name      testNowDatePerf0011
     * @tc.desc      Verify 10k getDate calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNowDatePerf0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNowDatePerf0011 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        util.getDate();
      }
      expect(Date.now() - start < 5000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNowDatePerf0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_1200
     * @tc.name      testLoggerPerf0012
     * @tc.desc      Verify 5000 logger calls stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerPerf0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerPerf0012 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 5000; i++) {
        Logger.info('PERF', 'message');
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerPerf0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTPERFP1_1300
     * @tc.name      testInstancePerf0013
     * @tc.desc      Verify 100k DateTimeUtil constructions stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInstancePerf0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstancePerf0013 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        const item: DateTimeUtil = new DateTimeUtil();
        item.fill(1);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstancePerf0013 end');
    })

  })
}
