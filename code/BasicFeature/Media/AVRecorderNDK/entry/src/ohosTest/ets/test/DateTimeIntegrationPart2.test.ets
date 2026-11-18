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

export default function DateTimeIntegrationPart2Test(): void {
  describe('DateTimeIntegrationPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTINTP2_9100
     * @tc.name      testCompose0091
     * @tc.desc      Verify dateTime(2440) matches fill(40) + ":" + fill(40).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0091 begin');
      expect(dateTime(2440)).assertEqual(util.fill(40) + ':' + util.fill(40));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0091 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP2_9200
     * @tc.name      testCompose0092
     * @tc.desc      Verify dateTime(2507) matches fill(41) + ":" + fill(47).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0092 begin');
      expect(dateTime(2507)).assertEqual(util.fill(41) + ':' + util.fill(47));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0092 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP2_9300
     * @tc.name      testCompose0093
     * @tc.desc      Verify dateTime(2574) matches fill(42) + ":" + fill(54).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0093 begin');
      expect(dateTime(2574)).assertEqual(util.fill(42) + ':' + util.fill(54));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0093 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP2_9400
     * @tc.name      testCompose0094
     * @tc.desc      Verify dateTime(2581) matches fill(43) + ":" + fill(1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0094 begin');
      expect(dateTime(2581)).assertEqual(util.fill(43) + ':' + util.fill(1));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0094 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP2_9500
     * @tc.name      testCompose0095
     * @tc.desc      Verify dateTime(2648) matches fill(44) + ":" + fill(8).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0095 begin');
      expect(dateTime(2648)).assertEqual(util.fill(44) + ':' + util.fill(8));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0095 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP2_9600
     * @tc.name      testCompose0096
     * @tc.desc      Verify dateTime(2715) matches fill(45) + ":" + fill(15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0096 begin');
      expect(dateTime(2715)).assertEqual(util.fill(45) + ':' + util.fill(15));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0096 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP2_9700
     * @tc.name      testCompose0097
     * @tc.desc      Verify dateTime(2782) matches fill(46) + ":" + fill(22).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0097 begin');
      expect(dateTime(2782)).assertEqual(util.fill(46) + ':' + util.fill(22));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0097 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP2_9800
     * @tc.name      testCompose0098
     * @tc.desc      Verify dateTime(2849) matches fill(47) + ":" + fill(29).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0098 begin');
      expect(dateTime(2849)).assertEqual(util.fill(47) + ':' + util.fill(29));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0098 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP2_9900
     * @tc.name      testCompose0099
     * @tc.desc      Verify dateTime(2916) matches fill(48) + ":" + fill(36).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0099 begin');
      expect(dateTime(2916)).assertEqual(util.fill(48) + ':' + util.fill(36));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0099 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP2_ONE_0100
     * @tc.name      testCompose0100
     * @tc.desc      Verify dateTime(2983) matches fill(49) + ":" + fill(43).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0100 begin');
      expect(dateTime(2983)).assertEqual(util.fill(49) + ':' + util.fill(43));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0100 end');
    })

  })
}
