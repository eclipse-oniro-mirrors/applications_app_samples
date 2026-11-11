/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { DateUtil } from '../../../main/ets/utils/DateUtil';

const TAG = '[Sample_PhotosDateDurationMatrixTest]';
const DOMAIN = 0xF811;

export default function PhotosDateDurationMatrixTest(): void {
  describe('PhotosDateDurationMatrixTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0001
     * @tc.name      testPhotosDateDurationMatrix0001
     * @tc.desc      Formats duration matrix sample 1. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0001 begin');
      expect(DateUtil.getFormattedDuration(1)).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0002
     * @tc.name      testPhotosDateDurationMatrix0002
     * @tc.desc      Formats duration matrix sample 1. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0002 begin');
      expect(DateUtil.getFormattedDuration(59999)).assertEqual('00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0003
     * @tc.name      testPhotosDateDurationMatrix0003
     * @tc.desc      Formats duration matrix sample 1. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0003 begin');
      expect(DateUtil.getFormattedDuration(60000)).assertEqual('01:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0003 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0004
     * @tc.name      testPhotosDateDurationMatrix0004
     * @tc.desc      Formats duration matrix sample 2. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0004 begin');
      expect(DateUtil.getFormattedDuration(45001)).assertEqual('00:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0005
     * @tc.name      testPhotosDateDurationMatrix0005
     * @tc.desc      Formats duration matrix sample 2. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0005 begin');
      expect(DateUtil.getFormattedDuration(104999)).assertEqual('01:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0006
     * @tc.name      testPhotosDateDurationMatrix0006
     * @tc.desc      Formats duration matrix sample 2. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0006 begin');
      expect(DateUtil.getFormattedDuration(105000)).assertEqual('01:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0006 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0007
     * @tc.name      testPhotosDateDurationMatrix0007
     * @tc.desc      Formats duration matrix sample 3. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0007 begin');
      expect(DateUtil.getFormattedDuration(90001)).assertEqual('01:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0008
     * @tc.name      testPhotosDateDurationMatrix0008
     * @tc.desc      Formats duration matrix sample 3. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0008 begin');
      expect(DateUtil.getFormattedDuration(149999)).assertEqual('02:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0009
     * @tc.name      testPhotosDateDurationMatrix0009
     * @tc.desc      Formats duration matrix sample 3. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0009 begin');
      expect(DateUtil.getFormattedDuration(150000)).assertEqual('02:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0009 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0010
     * @tc.name      testPhotosDateDurationMatrix0010
     * @tc.desc      Formats duration matrix sample 4. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0010 begin');
      expect(DateUtil.getFormattedDuration(135001)).assertEqual('02:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0011
     * @tc.name      testPhotosDateDurationMatrix0011
     * @tc.desc      Formats duration matrix sample 4. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0011 begin');
      expect(DateUtil.getFormattedDuration(194999)).assertEqual('03:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0012
     * @tc.name      testPhotosDateDurationMatrix0012
     * @tc.desc      Formats duration matrix sample 4. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0012 begin');
      expect(DateUtil.getFormattedDuration(195000)).assertEqual('03:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0012 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0013
     * @tc.name      testPhotosDateDurationMatrix0013
     * @tc.desc      Formats duration matrix sample 5. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0013 begin');
      expect(DateUtil.getFormattedDuration(180001)).assertEqual('03:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0014
     * @tc.name      testPhotosDateDurationMatrix0014
     * @tc.desc      Formats duration matrix sample 5. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0014 begin');
      expect(DateUtil.getFormattedDuration(239999)).assertEqual('03:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0015
     * @tc.name      testPhotosDateDurationMatrix0015
     * @tc.desc      Formats duration matrix sample 5. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0015 begin');
      expect(DateUtil.getFormattedDuration(240000)).assertEqual('04:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0016
     * @tc.name      testPhotosDateDurationMatrix0016
     * @tc.desc      Formats duration matrix sample 6. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0016 begin');
      expect(DateUtil.getFormattedDuration(225001)).assertEqual('03:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0017
     * @tc.name      testPhotosDateDurationMatrix0017
     * @tc.desc      Formats duration matrix sample 6. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0017 begin');
      expect(DateUtil.getFormattedDuration(284999)).assertEqual('04:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0018
     * @tc.name      testPhotosDateDurationMatrix0018
     * @tc.desc      Formats duration matrix sample 6. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0018 begin');
      expect(DateUtil.getFormattedDuration(285000)).assertEqual('04:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0018 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0019
     * @tc.name      testPhotosDateDurationMatrix0019
     * @tc.desc      Formats duration matrix sample 7. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0019 begin');
      expect(DateUtil.getFormattedDuration(270001)).assertEqual('04:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0020
     * @tc.name      testPhotosDateDurationMatrix0020
     * @tc.desc      Formats duration matrix sample 7. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0020 begin');
      expect(DateUtil.getFormattedDuration(329999)).assertEqual('05:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0021
     * @tc.name      testPhotosDateDurationMatrix0021
     * @tc.desc      Formats duration matrix sample 7. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0021 begin');
      expect(DateUtil.getFormattedDuration(330000)).assertEqual('05:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0021 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0022
     * @tc.name      testPhotosDateDurationMatrix0022
     * @tc.desc      Formats duration matrix sample 8. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0022 begin');
      expect(DateUtil.getFormattedDuration(315001)).assertEqual('05:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0023
     * @tc.name      testPhotosDateDurationMatrix0023
     * @tc.desc      Formats duration matrix sample 8. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0023 begin');
      expect(DateUtil.getFormattedDuration(374999)).assertEqual('06:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0024
     * @tc.name      testPhotosDateDurationMatrix0024
     * @tc.desc      Formats duration matrix sample 8. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0024 begin');
      expect(DateUtil.getFormattedDuration(375000)).assertEqual('06:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0024 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0025
     * @tc.name      testPhotosDateDurationMatrix0025
     * @tc.desc      Formats duration matrix sample 9. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0025 begin');
      expect(DateUtil.getFormattedDuration(360001)).assertEqual('06:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0026
     * @tc.name      testPhotosDateDurationMatrix0026
     * @tc.desc      Formats duration matrix sample 9. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0026 begin');
      expect(DateUtil.getFormattedDuration(419999)).assertEqual('06:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0027
     * @tc.name      testPhotosDateDurationMatrix0027
     * @tc.desc      Formats duration matrix sample 9. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0027 begin');
      expect(DateUtil.getFormattedDuration(420000)).assertEqual('07:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0027 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0028
     * @tc.name      testPhotosDateDurationMatrix0028
     * @tc.desc      Formats duration matrix sample 10. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0028 begin');
      expect(DateUtil.getFormattedDuration(405001)).assertEqual('06:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0029
     * @tc.name      testPhotosDateDurationMatrix0029
     * @tc.desc      Formats duration matrix sample 10. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0029 begin');
      expect(DateUtil.getFormattedDuration(464999)).assertEqual('07:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0030
     * @tc.name      testPhotosDateDurationMatrix0030
     * @tc.desc      Formats duration matrix sample 10. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0030 begin');
      expect(DateUtil.getFormattedDuration(465000)).assertEqual('07:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0031
     * @tc.name      testPhotosDateDurationMatrix0031
     * @tc.desc      Formats duration matrix sample 11. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0031 begin');
      expect(DateUtil.getFormattedDuration(450001)).assertEqual('07:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0032
     * @tc.name      testPhotosDateDurationMatrix0032
     * @tc.desc      Formats duration matrix sample 11. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0032 begin');
      expect(DateUtil.getFormattedDuration(509999)).assertEqual('08:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0033
     * @tc.name      testPhotosDateDurationMatrix0033
     * @tc.desc      Formats duration matrix sample 11. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0033 begin');
      expect(DateUtil.getFormattedDuration(510000)).assertEqual('08:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0033 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0034
     * @tc.name      testPhotosDateDurationMatrix0034
     * @tc.desc      Formats duration matrix sample 12. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0034 begin');
      expect(DateUtil.getFormattedDuration(495001)).assertEqual('08:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0035
     * @tc.name      testPhotosDateDurationMatrix0035
     * @tc.desc      Formats duration matrix sample 12. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0035 begin');
      expect(DateUtil.getFormattedDuration(554999)).assertEqual('09:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0036
     * @tc.name      testPhotosDateDurationMatrix0036
     * @tc.desc      Formats duration matrix sample 12. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0036 begin');
      expect(DateUtil.getFormattedDuration(555000)).assertEqual('09:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0036 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0037
     * @tc.name      testPhotosDateDurationMatrix0037
     * @tc.desc      Formats duration matrix sample 13. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0037 begin');
      expect(DateUtil.getFormattedDuration(540001)).assertEqual('09:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0038
     * @tc.name      testPhotosDateDurationMatrix0038
     * @tc.desc      Formats duration matrix sample 13. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0038 begin');
      expect(DateUtil.getFormattedDuration(599999)).assertEqual('09:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0039
     * @tc.name      testPhotosDateDurationMatrix0039
     * @tc.desc      Formats duration matrix sample 13. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0039 begin');
      expect(DateUtil.getFormattedDuration(600000)).assertEqual('10:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0039 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0040
     * @tc.name      testPhotosDateDurationMatrix0040
     * @tc.desc      Formats duration matrix sample 14. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0040 begin');
      expect(DateUtil.getFormattedDuration(585001)).assertEqual('09:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0041
     * @tc.name      testPhotosDateDurationMatrix0041
     * @tc.desc      Formats duration matrix sample 14. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0041 begin');
      expect(DateUtil.getFormattedDuration(644999)).assertEqual('10:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0042
     * @tc.name      testPhotosDateDurationMatrix0042
     * @tc.desc      Formats duration matrix sample 14. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0042 begin');
      expect(DateUtil.getFormattedDuration(645000)).assertEqual('10:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0042 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0043
     * @tc.name      testPhotosDateDurationMatrix0043
     * @tc.desc      Formats duration matrix sample 15. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0043 begin');
      expect(DateUtil.getFormattedDuration(630001)).assertEqual('10:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0044
     * @tc.name      testPhotosDateDurationMatrix0044
     * @tc.desc      Formats duration matrix sample 15. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0044 begin');
      expect(DateUtil.getFormattedDuration(689999)).assertEqual('11:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0045
     * @tc.name      testPhotosDateDurationMatrix0045
     * @tc.desc      Formats duration matrix sample 15. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0045 begin');
      expect(DateUtil.getFormattedDuration(690000)).assertEqual('11:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0046
     * @tc.name      testPhotosDateDurationMatrix0046
     * @tc.desc      Formats duration matrix sample 16. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0046 begin');
      expect(DateUtil.getFormattedDuration(675001)).assertEqual('11:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0047
     * @tc.name      testPhotosDateDurationMatrix0047
     * @tc.desc      Formats duration matrix sample 16. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0047 begin');
      expect(DateUtil.getFormattedDuration(734999)).assertEqual('12:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0048
     * @tc.name      testPhotosDateDurationMatrix0048
     * @tc.desc      Formats duration matrix sample 16. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0048 begin');
      expect(DateUtil.getFormattedDuration(735000)).assertEqual('12:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0048 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0049
     * @tc.name      testPhotosDateDurationMatrix0049
     * @tc.desc      Formats duration matrix sample 17. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0049 begin');
      expect(DateUtil.getFormattedDuration(720001)).assertEqual('12:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0050
     * @tc.name      testPhotosDateDurationMatrix0050
     * @tc.desc      Formats duration matrix sample 17. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0050 begin');
      expect(DateUtil.getFormattedDuration(779999)).assertEqual('12:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0051
     * @tc.name      testPhotosDateDurationMatrix0051
     * @tc.desc      Formats duration matrix sample 17. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0051 begin');
      expect(DateUtil.getFormattedDuration(780000)).assertEqual('13:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0051 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0052
     * @tc.name      testPhotosDateDurationMatrix0052
     * @tc.desc      Formats duration matrix sample 18. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0052 begin');
      expect(DateUtil.getFormattedDuration(765001)).assertEqual('12:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0053
     * @tc.name      testPhotosDateDurationMatrix0053
     * @tc.desc      Formats duration matrix sample 18. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0053 begin');
      expect(DateUtil.getFormattedDuration(824999)).assertEqual('13:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0054
     * @tc.name      testPhotosDateDurationMatrix0054
     * @tc.desc      Formats duration matrix sample 18. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0054 begin');
      expect(DateUtil.getFormattedDuration(825000)).assertEqual('13:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0054 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0055
     * @tc.name      testPhotosDateDurationMatrix0055
     * @tc.desc      Formats duration matrix sample 19. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0055 begin');
      expect(DateUtil.getFormattedDuration(810001)).assertEqual('13:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0056
     * @tc.name      testPhotosDateDurationMatrix0056
     * @tc.desc      Formats duration matrix sample 19. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0056 begin');
      expect(DateUtil.getFormattedDuration(869999)).assertEqual('14:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0057
     * @tc.name      testPhotosDateDurationMatrix0057
     * @tc.desc      Formats duration matrix sample 19. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0057 begin');
      expect(DateUtil.getFormattedDuration(870000)).assertEqual('14:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0057 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0058
     * @tc.name      testPhotosDateDurationMatrix0058
     * @tc.desc      Formats duration matrix sample 20. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0058 begin');
      expect(DateUtil.getFormattedDuration(855001)).assertEqual('14:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0059
     * @tc.name      testPhotosDateDurationMatrix0059
     * @tc.desc      Formats duration matrix sample 20. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0059 begin');
      expect(DateUtil.getFormattedDuration(914999)).assertEqual('15:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0060
     * @tc.name      testPhotosDateDurationMatrix0060
     * @tc.desc      Formats duration matrix sample 20. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0060 begin');
      expect(DateUtil.getFormattedDuration(915000)).assertEqual('15:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0061
     * @tc.name      testPhotosDateDurationMatrix0061
     * @tc.desc      Formats duration matrix sample 21. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0061 begin');
      expect(DateUtil.getFormattedDuration(900001)).assertEqual('15:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0062
     * @tc.name      testPhotosDateDurationMatrix0062
     * @tc.desc      Formats duration matrix sample 21. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0062 begin');
      expect(DateUtil.getFormattedDuration(959999)).assertEqual('15:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0063
     * @tc.name      testPhotosDateDurationMatrix0063
     * @tc.desc      Formats duration matrix sample 21. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0063 begin');
      expect(DateUtil.getFormattedDuration(960000)).assertEqual('16:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0063 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0064
     * @tc.name      testPhotosDateDurationMatrix0064
     * @tc.desc      Formats duration matrix sample 22. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0064 begin');
      expect(DateUtil.getFormattedDuration(945001)).assertEqual('15:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0065
     * @tc.name      testPhotosDateDurationMatrix0065
     * @tc.desc      Formats duration matrix sample 22. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0065 begin');
      expect(DateUtil.getFormattedDuration(1004999)).assertEqual('16:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0066
     * @tc.name      testPhotosDateDurationMatrix0066
     * @tc.desc      Formats duration matrix sample 22. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0066 begin');
      expect(DateUtil.getFormattedDuration(1005000)).assertEqual('16:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0066 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0067
     * @tc.name      testPhotosDateDurationMatrix0067
     * @tc.desc      Formats duration matrix sample 23. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0067 begin');
      expect(DateUtil.getFormattedDuration(990001)).assertEqual('16:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0068
     * @tc.name      testPhotosDateDurationMatrix0068
     * @tc.desc      Formats duration matrix sample 23. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0068 begin');
      expect(DateUtil.getFormattedDuration(1049999)).assertEqual('17:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0069
     * @tc.name      testPhotosDateDurationMatrix0069
     * @tc.desc      Formats duration matrix sample 23. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0069 begin');
      expect(DateUtil.getFormattedDuration(1050000)).assertEqual('17:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0069 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0070
     * @tc.name      testPhotosDateDurationMatrix0070
     * @tc.desc      Formats duration matrix sample 24. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0070 begin');
      expect(DateUtil.getFormattedDuration(1035001)).assertEqual('17:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0071
     * @tc.name      testPhotosDateDurationMatrix0071
     * @tc.desc      Formats duration matrix sample 24. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0071 begin');
      expect(DateUtil.getFormattedDuration(1094999)).assertEqual('18:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0072
     * @tc.name      testPhotosDateDurationMatrix0072
     * @tc.desc      Formats duration matrix sample 24. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0072 begin');
      expect(DateUtil.getFormattedDuration(1095000)).assertEqual('18:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0072 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0073
     * @tc.name      testPhotosDateDurationMatrix0073
     * @tc.desc      Formats duration matrix sample 25. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0073 begin');
      expect(DateUtil.getFormattedDuration(1080001)).assertEqual('18:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0074
     * @tc.name      testPhotosDateDurationMatrix0074
     * @tc.desc      Formats duration matrix sample 25. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0074 begin');
      expect(DateUtil.getFormattedDuration(1139999)).assertEqual('18:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0075
     * @tc.name      testPhotosDateDurationMatrix0075
     * @tc.desc      Formats duration matrix sample 25. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0075 begin');
      expect(DateUtil.getFormattedDuration(1140000)).assertEqual('19:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0075 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0076
     * @tc.name      testPhotosDateDurationMatrix0076
     * @tc.desc      Formats duration matrix sample 26. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0076 begin');
      expect(DateUtil.getFormattedDuration(1125001)).assertEqual('18:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0077
     * @tc.name      testPhotosDateDurationMatrix0077
     * @tc.desc      Formats duration matrix sample 26. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0077 begin');
      expect(DateUtil.getFormattedDuration(1184999)).assertEqual('19:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0078
     * @tc.name      testPhotosDateDurationMatrix0078
     * @tc.desc      Formats duration matrix sample 26. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0078 begin');
      expect(DateUtil.getFormattedDuration(1185000)).assertEqual('19:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0078 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0079
     * @tc.name      testPhotosDateDurationMatrix0079
     * @tc.desc      Formats duration matrix sample 27. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0079 begin');
      expect(DateUtil.getFormattedDuration(1170001)).assertEqual('19:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0080
     * @tc.name      testPhotosDateDurationMatrix0080
     * @tc.desc      Formats duration matrix sample 27. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0080 begin');
      expect(DateUtil.getFormattedDuration(1229999)).assertEqual('20:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0081
     * @tc.name      testPhotosDateDurationMatrix0081
     * @tc.desc      Formats duration matrix sample 27. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0081 begin');
      expect(DateUtil.getFormattedDuration(1230000)).assertEqual('20:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0081 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0082
     * @tc.name      testPhotosDateDurationMatrix0082
     * @tc.desc      Formats duration matrix sample 28. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0082 begin');
      expect(DateUtil.getFormattedDuration(1215001)).assertEqual('20:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0083
     * @tc.name      testPhotosDateDurationMatrix0083
     * @tc.desc      Formats duration matrix sample 28. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0083 begin');
      expect(DateUtil.getFormattedDuration(1274999)).assertEqual('21:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0084
     * @tc.name      testPhotosDateDurationMatrix0084
     * @tc.desc      Formats duration matrix sample 28. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0084 begin');
      expect(DateUtil.getFormattedDuration(1275000)).assertEqual('21:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0084 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0085
     * @tc.name      testPhotosDateDurationMatrix0085
     * @tc.desc      Formats duration matrix sample 29. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0085 begin');
      expect(DateUtil.getFormattedDuration(1260001)).assertEqual('21:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0086
     * @tc.name      testPhotosDateDurationMatrix0086
     * @tc.desc      Formats duration matrix sample 29. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0086 begin');
      expect(DateUtil.getFormattedDuration(1319999)).assertEqual('21:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0087
     * @tc.name      testPhotosDateDurationMatrix0087
     * @tc.desc      Formats duration matrix sample 29. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0087 begin');
      expect(DateUtil.getFormattedDuration(1320000)).assertEqual('22:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0087 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0088
     * @tc.name      testPhotosDateDurationMatrix0088
     * @tc.desc      Formats duration matrix sample 30. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0088 begin');
      expect(DateUtil.getFormattedDuration(1305001)).assertEqual('21:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0089
     * @tc.name      testPhotosDateDurationMatrix0089
     * @tc.desc      Formats duration matrix sample 30. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0089 begin');
      expect(DateUtil.getFormattedDuration(1364999)).assertEqual('22:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0090
     * @tc.name      testPhotosDateDurationMatrix0090
     * @tc.desc      Formats duration matrix sample 30. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0090 begin');
      expect(DateUtil.getFormattedDuration(1365000)).assertEqual('22:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0090 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0091
     * @tc.name      testPhotosDateDurationMatrix0091
     * @tc.desc      Formats duration matrix sample 31. case 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0091 begin');
      expect(DateUtil.getFormattedDuration(1350001)).assertEqual('22:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0092
     * @tc.name      testPhotosDateDurationMatrix0092
     * @tc.desc      Formats duration matrix sample 31. case 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0092 begin');
      expect(DateUtil.getFormattedDuration(1409999)).assertEqual('23:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0093
     * @tc.name      testPhotosDateDurationMatrix0093
     * @tc.desc      Formats duration matrix sample 31. case 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0093 begin');
      expect(DateUtil.getFormattedDuration(1410000)).assertEqual('23:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0093 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0094
     * @tc.name      testPhotosDateDurationMatrix0094
     * @tc.desc      Formats duration matrix sample 32. case 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0094 begin');
      expect(DateUtil.getFormattedDuration(1395001)).assertEqual('23:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0095
     * @tc.name      testPhotosDateDurationMatrix0095
     * @tc.desc      Formats duration matrix sample 32. case 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0095 begin');
      expect(DateUtil.getFormattedDuration(1454999)).assertEqual('24:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0096
     * @tc.name      testPhotosDateDurationMatrix0096
     * @tc.desc      Formats duration matrix sample 32. case 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0096 begin');
      expect(DateUtil.getFormattedDuration(1455000)).assertEqual('24:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0096 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0097
     * @tc.name      testPhotosDateDurationMatrix0097
     * @tc.desc      Formats duration matrix sample 33. case 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0097 begin');
      expect(DateUtil.getFormattedDuration(1440001)).assertEqual('24:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0098
     * @tc.name      testPhotosDateDurationMatrix0098
     * @tc.desc      Formats duration matrix sample 33. case 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0098 begin');
      expect(DateUtil.getFormattedDuration(1499999)).assertEqual('24:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0099
     * @tc.name      testPhotosDateDurationMatrix0099
     * @tc.desc      Formats duration matrix sample 33. case 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0099 begin');
      expect(DateUtil.getFormattedDuration(1500000)).assertEqual('25:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0099 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0100
     * @tc.name      testPhotosDateDurationMatrix0100
     * @tc.desc      Formats duration matrix sample 34. case 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0100 begin');
      expect(DateUtil.getFormattedDuration(1485001)).assertEqual('24:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0101
     * @tc.name      testPhotosDateDurationMatrix0101
     * @tc.desc      Formats duration matrix sample 34. case 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0101 begin');
      expect(DateUtil.getFormattedDuration(1544999)).assertEqual('25:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0102
     * @tc.name      testPhotosDateDurationMatrix0102
     * @tc.desc      Formats duration matrix sample 34. case 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0102 begin');
      expect(DateUtil.getFormattedDuration(1545000)).assertEqual('25:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0102 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0103
     * @tc.name      testPhotosDateDurationMatrix0103
     * @tc.desc      Formats duration matrix sample 35. case 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0103 begin');
      expect(DateUtil.getFormattedDuration(1530001)).assertEqual('25:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0104
     * @tc.name      testPhotosDateDurationMatrix0104
     * @tc.desc      Formats duration matrix sample 35. case 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0104 begin');
      expect(DateUtil.getFormattedDuration(1589999)).assertEqual('26:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0105
     * @tc.name      testPhotosDateDurationMatrix0105
     * @tc.desc      Formats duration matrix sample 35. case 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0105 begin');
      expect(DateUtil.getFormattedDuration(1590000)).assertEqual('26:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0105 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0106
     * @tc.name      testPhotosDateDurationMatrix0106
     * @tc.desc      Formats duration matrix sample 36. case 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0106 begin');
      expect(DateUtil.getFormattedDuration(1575001)).assertEqual('26:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0107
     * @tc.name      testPhotosDateDurationMatrix0107
     * @tc.desc      Formats duration matrix sample 36. case 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0107 begin');
      expect(DateUtil.getFormattedDuration(1634999)).assertEqual('27:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0108
     * @tc.name      testPhotosDateDurationMatrix0108
     * @tc.desc      Formats duration matrix sample 36. case 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0108 begin');
      expect(DateUtil.getFormattedDuration(1635000)).assertEqual('27:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0108 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0109
     * @tc.name      testPhotosDateDurationMatrix0109
     * @tc.desc      Formats duration matrix sample 37. case 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0109 begin');
      expect(DateUtil.getFormattedDuration(1620001)).assertEqual('27:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0110
     * @tc.name      testPhotosDateDurationMatrix0110
     * @tc.desc      Formats duration matrix sample 37. case 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0110 begin');
      expect(DateUtil.getFormattedDuration(1679999)).assertEqual('27:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0111
     * @tc.name      testPhotosDateDurationMatrix0111
     * @tc.desc      Formats duration matrix sample 37. case 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0111 begin');
      expect(DateUtil.getFormattedDuration(1680000)).assertEqual('28:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0111 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0112
     * @tc.name      testPhotosDateDurationMatrix0112
     * @tc.desc      Formats duration matrix sample 38. case 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0112 begin');
      expect(DateUtil.getFormattedDuration(1665001)).assertEqual('27:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0113
     * @tc.name      testPhotosDateDurationMatrix0113
     * @tc.desc      Formats duration matrix sample 38. case 113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0113 begin');
      expect(DateUtil.getFormattedDuration(1724999)).assertEqual('28:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0114
     * @tc.name      testPhotosDateDurationMatrix0114
     * @tc.desc      Formats duration matrix sample 38. case 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0114 begin');
      expect(DateUtil.getFormattedDuration(1725000)).assertEqual('28:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0114 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0115
     * @tc.name      testPhotosDateDurationMatrix0115
     * @tc.desc      Formats duration matrix sample 39. case 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0115 begin');
      expect(DateUtil.getFormattedDuration(1710001)).assertEqual('28:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0116
     * @tc.name      testPhotosDateDurationMatrix0116
     * @tc.desc      Formats duration matrix sample 39. case 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0116 begin');
      expect(DateUtil.getFormattedDuration(1769999)).assertEqual('29:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0117
     * @tc.name      testPhotosDateDurationMatrix0117
     * @tc.desc      Formats duration matrix sample 39. case 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0117 begin');
      expect(DateUtil.getFormattedDuration(1770000)).assertEqual('29:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0117 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0118
     * @tc.name      testPhotosDateDurationMatrix0118
     * @tc.desc      Formats duration matrix sample 40. case 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0118 begin');
      expect(DateUtil.getFormattedDuration(1755001)).assertEqual('29:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0119
     * @tc.name      testPhotosDateDurationMatrix0119
     * @tc.desc      Formats duration matrix sample 40. case 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0119 begin');
      expect(DateUtil.getFormattedDuration(1814999)).assertEqual('30:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0120
     * @tc.name      testPhotosDateDurationMatrix0120
     * @tc.desc      Formats duration matrix sample 40. case 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0120 begin');
      expect(DateUtil.getFormattedDuration(1815000)).assertEqual('30:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0120 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0121
     * @tc.name      testPhotosDateDurationMatrix0121
     * @tc.desc      Formats duration matrix sample 41. case 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0121 begin');
      expect(DateUtil.getFormattedDuration(1800001)).assertEqual('30:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0122
     * @tc.name      testPhotosDateDurationMatrix0122
     * @tc.desc      Formats duration matrix sample 41. case 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0122 begin');
      expect(DateUtil.getFormattedDuration(1859999)).assertEqual('30:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0123
     * @tc.name      testPhotosDateDurationMatrix0123
     * @tc.desc      Formats duration matrix sample 41. case 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0123 begin');
      expect(DateUtil.getFormattedDuration(1860000)).assertEqual('31:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0123 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0124
     * @tc.name      testPhotosDateDurationMatrix0124
     * @tc.desc      Formats duration matrix sample 42. case 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0124 begin');
      expect(DateUtil.getFormattedDuration(1845001)).assertEqual('30:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0125
     * @tc.name      testPhotosDateDurationMatrix0125
     * @tc.desc      Formats duration matrix sample 42. case 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0125 begin');
      expect(DateUtil.getFormattedDuration(1904999)).assertEqual('31:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0126
     * @tc.name      testPhotosDateDurationMatrix0126
     * @tc.desc      Formats duration matrix sample 42. case 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0126 begin');
      expect(DateUtil.getFormattedDuration(1905000)).assertEqual('31:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0126 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0127
     * @tc.name      testPhotosDateDurationMatrix0127
     * @tc.desc      Formats duration matrix sample 43. case 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0127 begin');
      expect(DateUtil.getFormattedDuration(1890001)).assertEqual('31:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0128
     * @tc.name      testPhotosDateDurationMatrix0128
     * @tc.desc      Formats duration matrix sample 43. case 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0128 begin');
      expect(DateUtil.getFormattedDuration(1949999)).assertEqual('32:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0129
     * @tc.name      testPhotosDateDurationMatrix0129
     * @tc.desc      Formats duration matrix sample 43. case 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0129 begin');
      expect(DateUtil.getFormattedDuration(1950000)).assertEqual('32:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0129 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0130
     * @tc.name      testPhotosDateDurationMatrix0130
     * @tc.desc      Formats duration matrix sample 44. case 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0130 begin');
      expect(DateUtil.getFormattedDuration(1935001)).assertEqual('32:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0131
     * @tc.name      testPhotosDateDurationMatrix0131
     * @tc.desc      Formats duration matrix sample 44. case 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0131 begin');
      expect(DateUtil.getFormattedDuration(1994999)).assertEqual('33:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0132
     * @tc.name      testPhotosDateDurationMatrix0132
     * @tc.desc      Formats duration matrix sample 44. case 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0132 begin');
      expect(DateUtil.getFormattedDuration(1995000)).assertEqual('33:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0132 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0133
     * @tc.name      testPhotosDateDurationMatrix0133
     * @tc.desc      Formats duration matrix sample 45. case 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0133 begin');
      expect(DateUtil.getFormattedDuration(1980001)).assertEqual('33:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0134
     * @tc.name      testPhotosDateDurationMatrix0134
     * @tc.desc      Formats duration matrix sample 45. case 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0134 begin');
      expect(DateUtil.getFormattedDuration(2039999)).assertEqual('33:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0135
     * @tc.name      testPhotosDateDurationMatrix0135
     * @tc.desc      Formats duration matrix sample 45. case 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0135 begin');
      expect(DateUtil.getFormattedDuration(2040000)).assertEqual('34:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0135 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0136
     * @tc.name      testPhotosDateDurationMatrix0136
     * @tc.desc      Formats duration matrix sample 46. case 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0136 begin');
      expect(DateUtil.getFormattedDuration(2025001)).assertEqual('33:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0137
     * @tc.name      testPhotosDateDurationMatrix0137
     * @tc.desc      Formats duration matrix sample 46. case 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0137 begin');
      expect(DateUtil.getFormattedDuration(2084999)).assertEqual('34:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0138
     * @tc.name      testPhotosDateDurationMatrix0138
     * @tc.desc      Formats duration matrix sample 46. case 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0138 begin');
      expect(DateUtil.getFormattedDuration(2085000)).assertEqual('34:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0138 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0139
     * @tc.name      testPhotosDateDurationMatrix0139
     * @tc.desc      Formats duration matrix sample 47. case 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0139 begin');
      expect(DateUtil.getFormattedDuration(2070001)).assertEqual('34:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0140
     * @tc.name      testPhotosDateDurationMatrix0140
     * @tc.desc      Formats duration matrix sample 47. case 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0140 begin');
      expect(DateUtil.getFormattedDuration(2129999)).assertEqual('35:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0140 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0141
     * @tc.name      testPhotosDateDurationMatrix0141
     * @tc.desc      Formats duration matrix sample 47. case 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0141 begin');
      expect(DateUtil.getFormattedDuration(2130000)).assertEqual('35:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0141 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0142
     * @tc.name      testPhotosDateDurationMatrix0142
     * @tc.desc      Formats duration matrix sample 48. case 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0142 begin');
      expect(DateUtil.getFormattedDuration(2115001)).assertEqual('35:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0143
     * @tc.name      testPhotosDateDurationMatrix0143
     * @tc.desc      Formats duration matrix sample 48. case 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0143 begin');
      expect(DateUtil.getFormattedDuration(2174999)).assertEqual('36:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0144
     * @tc.name      testPhotosDateDurationMatrix0144
     * @tc.desc      Formats duration matrix sample 48. case 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0144 begin');
      expect(DateUtil.getFormattedDuration(2175000)).assertEqual('36:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0144 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0145
     * @tc.name      testPhotosDateDurationMatrix0145
     * @tc.desc      Formats duration matrix sample 49. case 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0145 begin');
      expect(DateUtil.getFormattedDuration(2160001)).assertEqual('36:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0146
     * @tc.name      testPhotosDateDurationMatrix0146
     * @tc.desc      Formats duration matrix sample 49. case 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0146 begin');
      expect(DateUtil.getFormattedDuration(2219999)).assertEqual('36:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0147
     * @tc.name      testPhotosDateDurationMatrix0147
     * @tc.desc      Formats duration matrix sample 49. case 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0147 begin');
      expect(DateUtil.getFormattedDuration(2220000)).assertEqual('37:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0147 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0148
     * @tc.name      testPhotosDateDurationMatrix0148
     * @tc.desc      Formats duration matrix sample 50. case 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0148 begin');
      expect(DateUtil.getFormattedDuration(2205001)).assertEqual('36:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0149
     * @tc.name      testPhotosDateDurationMatrix0149
     * @tc.desc      Formats duration matrix sample 50. case 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0149 begin');
      expect(DateUtil.getFormattedDuration(2264999)).assertEqual('37:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0150
     * @tc.name      testPhotosDateDurationMatrix0150
     * @tc.desc      Formats duration matrix sample 50. case 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0150 begin');
      expect(DateUtil.getFormattedDuration(2265000)).assertEqual('37:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0150 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0151
     * @tc.name      testPhotosDateDurationMatrix0151
     * @tc.desc      Formats duration matrix sample 51. case 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0151 begin');
      expect(DateUtil.getFormattedDuration(2250001)).assertEqual('37:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0152
     * @tc.name      testPhotosDateDurationMatrix0152
     * @tc.desc      Formats duration matrix sample 51. case 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0152 begin');
      expect(DateUtil.getFormattedDuration(2309999)).assertEqual('38:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0153
     * @tc.name      testPhotosDateDurationMatrix0153
     * @tc.desc      Formats duration matrix sample 51. case 153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0153 begin');
      expect(DateUtil.getFormattedDuration(2310000)).assertEqual('38:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0153 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0154
     * @tc.name      testPhotosDateDurationMatrix0154
     * @tc.desc      Formats duration matrix sample 52. case 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0154 begin');
      expect(DateUtil.getFormattedDuration(2295001)).assertEqual('38:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0155
     * @tc.name      testPhotosDateDurationMatrix0155
     * @tc.desc      Formats duration matrix sample 52. case 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0155 begin');
      expect(DateUtil.getFormattedDuration(2354999)).assertEqual('39:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0155 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0156
     * @tc.name      testPhotosDateDurationMatrix0156
     * @tc.desc      Formats duration matrix sample 52. case 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0156 begin');
      expect(DateUtil.getFormattedDuration(2355000)).assertEqual('39:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0156 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0157
     * @tc.name      testPhotosDateDurationMatrix0157
     * @tc.desc      Formats duration matrix sample 53. case 157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0157 begin');
      expect(DateUtil.getFormattedDuration(2340001)).assertEqual('39:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0158
     * @tc.name      testPhotosDateDurationMatrix0158
     * @tc.desc      Formats duration matrix sample 53. case 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0158 begin');
      expect(DateUtil.getFormattedDuration(2399999)).assertEqual('39:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0159
     * @tc.name      testPhotosDateDurationMatrix0159
     * @tc.desc      Formats duration matrix sample 53. case 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0159 begin');
      expect(DateUtil.getFormattedDuration(2400000)).assertEqual('40:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0159 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0160
     * @tc.name      testPhotosDateDurationMatrix0160
     * @tc.desc      Formats duration matrix sample 54. case 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0160 begin');
      expect(DateUtil.getFormattedDuration(2385001)).assertEqual('39:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0160 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0161
     * @tc.name      testPhotosDateDurationMatrix0161
     * @tc.desc      Formats duration matrix sample 54. case 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0161 begin');
      expect(DateUtil.getFormattedDuration(2444999)).assertEqual('40:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0162
     * @tc.name      testPhotosDateDurationMatrix0162
     * @tc.desc      Formats duration matrix sample 54. case 162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0162 begin');
      expect(DateUtil.getFormattedDuration(2445000)).assertEqual('40:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0162 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0163
     * @tc.name      testPhotosDateDurationMatrix0163
     * @tc.desc      Formats duration matrix sample 55. case 163
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0163 begin');
      expect(DateUtil.getFormattedDuration(2430001)).assertEqual('40:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0164
     * @tc.name      testPhotosDateDurationMatrix0164
     * @tc.desc      Formats duration matrix sample 55. case 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0164 begin');
      expect(DateUtil.getFormattedDuration(2489999)).assertEqual('41:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0165
     * @tc.name      testPhotosDateDurationMatrix0165
     * @tc.desc      Formats duration matrix sample 55. case 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0165 begin');
      expect(DateUtil.getFormattedDuration(2490000)).assertEqual('41:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0165 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0166
     * @tc.name      testPhotosDateDurationMatrix0166
     * @tc.desc      Formats duration matrix sample 56. case 166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0166 begin');
      expect(DateUtil.getFormattedDuration(2475001)).assertEqual('41:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0167
     * @tc.name      testPhotosDateDurationMatrix0167
     * @tc.desc      Formats duration matrix sample 56. case 167
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0167 begin');
      expect(DateUtil.getFormattedDuration(2534999)).assertEqual('42:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0168
     * @tc.name      testPhotosDateDurationMatrix0168
     * @tc.desc      Formats duration matrix sample 56. case 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0168 begin');
      expect(DateUtil.getFormattedDuration(2535000)).assertEqual('42:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0168 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0169
     * @tc.name      testPhotosDateDurationMatrix0169
     * @tc.desc      Formats duration matrix sample 57. case 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0169 begin');
      expect(DateUtil.getFormattedDuration(2520001)).assertEqual('42:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0170
     * @tc.name      testPhotosDateDurationMatrix0170
     * @tc.desc      Formats duration matrix sample 57. case 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0170 begin');
      expect(DateUtil.getFormattedDuration(2579999)).assertEqual('42:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0170 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0171
     * @tc.name      testPhotosDateDurationMatrix0171
     * @tc.desc      Formats duration matrix sample 57. case 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0171 begin');
      expect(DateUtil.getFormattedDuration(2580000)).assertEqual('43:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0171 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0172
     * @tc.name      testPhotosDateDurationMatrix0172
     * @tc.desc      Formats duration matrix sample 58. case 172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0172 begin');
      expect(DateUtil.getFormattedDuration(2565001)).assertEqual('42:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0173
     * @tc.name      testPhotosDateDurationMatrix0173
     * @tc.desc      Formats duration matrix sample 58. case 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0173 begin');
      expect(DateUtil.getFormattedDuration(2624999)).assertEqual('43:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0174
     * @tc.name      testPhotosDateDurationMatrix0174
     * @tc.desc      Formats duration matrix sample 58. case 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0174 begin');
      expect(DateUtil.getFormattedDuration(2625000)).assertEqual('43:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0174 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0175
     * @tc.name      testPhotosDateDurationMatrix0175
     * @tc.desc      Formats duration matrix sample 59. case 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0175 begin');
      expect(DateUtil.getFormattedDuration(2610001)).assertEqual('43:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0175 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0176
     * @tc.name      testPhotosDateDurationMatrix0176
     * @tc.desc      Formats duration matrix sample 59. case 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0176 begin');
      expect(DateUtil.getFormattedDuration(2669999)).assertEqual('44:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0177
     * @tc.name      testPhotosDateDurationMatrix0177
     * @tc.desc      Formats duration matrix sample 59. case 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0177 begin');
      expect(DateUtil.getFormattedDuration(2670000)).assertEqual('44:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0177 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0178
     * @tc.name      testPhotosDateDurationMatrix0178
     * @tc.desc      Formats duration matrix sample 60. case 178
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0178 begin');
      expect(DateUtil.getFormattedDuration(2655001)).assertEqual('44:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0179
     * @tc.name      testPhotosDateDurationMatrix0179
     * @tc.desc      Formats duration matrix sample 60. case 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0179 begin');
      expect(DateUtil.getFormattedDuration(2714999)).assertEqual('45:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0180
     * @tc.name      testPhotosDateDurationMatrix0180
     * @tc.desc      Formats duration matrix sample 60. case 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0180 begin');
      expect(DateUtil.getFormattedDuration(2715000)).assertEqual('45:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0180 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0181
     * @tc.name      testPhotosDateDurationMatrix0181
     * @tc.desc      Formats duration matrix sample 61. case 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0181 begin');
      expect(DateUtil.getFormattedDuration(2700001)).assertEqual('45:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0181 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0182
     * @tc.name      testPhotosDateDurationMatrix0182
     * @tc.desc      Formats duration matrix sample 61. case 182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0182 begin');
      expect(DateUtil.getFormattedDuration(2759999)).assertEqual('45:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0182 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0183
     * @tc.name      testPhotosDateDurationMatrix0183
     * @tc.desc      Formats duration matrix sample 61. case 183
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0183 begin');
      expect(DateUtil.getFormattedDuration(2760000)).assertEqual('46:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0183 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0184
     * @tc.name      testPhotosDateDurationMatrix0184
     * @tc.desc      Formats duration matrix sample 62. case 184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0184 begin');
      expect(DateUtil.getFormattedDuration(2745001)).assertEqual('45:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0184 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0185
     * @tc.name      testPhotosDateDurationMatrix0185
     * @tc.desc      Formats duration matrix sample 62. case 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0185 begin');
      expect(DateUtil.getFormattedDuration(2804999)).assertEqual('46:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0185 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0186
     * @tc.name      testPhotosDateDurationMatrix0186
     * @tc.desc      Formats duration matrix sample 62. case 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0186 begin');
      expect(DateUtil.getFormattedDuration(2805000)).assertEqual('46:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0186 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0187
     * @tc.name      testPhotosDateDurationMatrix0187
     * @tc.desc      Formats duration matrix sample 63. case 187
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0187 begin');
      expect(DateUtil.getFormattedDuration(2790001)).assertEqual('46:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0187 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0188
     * @tc.name      testPhotosDateDurationMatrix0188
     * @tc.desc      Formats duration matrix sample 63. case 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0188 begin');
      expect(DateUtil.getFormattedDuration(2849999)).assertEqual('47:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0188 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0189
     * @tc.name      testPhotosDateDurationMatrix0189
     * @tc.desc      Formats duration matrix sample 63. case 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0189 begin');
      expect(DateUtil.getFormattedDuration(2850000)).assertEqual('47:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0189 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0190
     * @tc.name      testPhotosDateDurationMatrix0190
     * @tc.desc      Formats duration matrix sample 64. case 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0190 begin');
      expect(DateUtil.getFormattedDuration(2835001)).assertEqual('47:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0190 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0191
     * @tc.name      testPhotosDateDurationMatrix0191
     * @tc.desc      Formats duration matrix sample 64. case 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0191 begin');
      expect(DateUtil.getFormattedDuration(2894999)).assertEqual('48:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0191 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0192
     * @tc.name      testPhotosDateDurationMatrix0192
     * @tc.desc      Formats duration matrix sample 64. case 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0192 begin');
      expect(DateUtil.getFormattedDuration(2895000)).assertEqual('48:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0192 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0193
     * @tc.name      testPhotosDateDurationMatrix0193
     * @tc.desc      Formats duration matrix sample 65. case 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0193 begin');
      expect(DateUtil.getFormattedDuration(2880001)).assertEqual('48:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0193 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0194
     * @tc.name      testPhotosDateDurationMatrix0194
     * @tc.desc      Formats duration matrix sample 65. case 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0194 begin');
      expect(DateUtil.getFormattedDuration(2939999)).assertEqual('48:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0194 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0195
     * @tc.name      testPhotosDateDurationMatrix0195
     * @tc.desc      Formats duration matrix sample 65. case 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0195 begin');
      expect(DateUtil.getFormattedDuration(2940000)).assertEqual('49:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0195 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0196
     * @tc.name      testPhotosDateDurationMatrix0196
     * @tc.desc      Formats duration matrix sample 66. case 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0196 begin');
      expect(DateUtil.getFormattedDuration(2925001)).assertEqual('48:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0196 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0197
     * @tc.name      testPhotosDateDurationMatrix0197
     * @tc.desc      Formats duration matrix sample 66. case 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0197 begin');
      expect(DateUtil.getFormattedDuration(2984999)).assertEqual('49:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0197 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0198
     * @tc.name      testPhotosDateDurationMatrix0198
     * @tc.desc      Formats duration matrix sample 66. case 198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0198 begin');
      expect(DateUtil.getFormattedDuration(2985000)).assertEqual('49:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0198 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0199
     * @tc.name      testPhotosDateDurationMatrix0199
     * @tc.desc      Formats duration matrix sample 67. case 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0199 begin');
      expect(DateUtil.getFormattedDuration(2970001)).assertEqual('49:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0199 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0200
     * @tc.name      testPhotosDateDurationMatrix0200
     * @tc.desc      Formats duration matrix sample 67. case 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0200 begin');
      expect(DateUtil.getFormattedDuration(3029999)).assertEqual('50:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0200 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0201
     * @tc.name      testPhotosDateDurationMatrix0201
     * @tc.desc      Formats duration matrix sample 67. case 201
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0201 begin');
      expect(DateUtil.getFormattedDuration(3030000)).assertEqual('50:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0201 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0202
     * @tc.name      testPhotosDateDurationMatrix0202
     * @tc.desc      Formats duration matrix sample 68. case 202
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0202 begin');
      expect(DateUtil.getFormattedDuration(3015001)).assertEqual('50:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0202 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0203
     * @tc.name      testPhotosDateDurationMatrix0203
     * @tc.desc      Formats duration matrix sample 68. case 203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0203 begin');
      expect(DateUtil.getFormattedDuration(3074999)).assertEqual('51:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0203 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0204
     * @tc.name      testPhotosDateDurationMatrix0204
     * @tc.desc      Formats duration matrix sample 68. case 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0204 begin');
      expect(DateUtil.getFormattedDuration(3075000)).assertEqual('51:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0204 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0205
     * @tc.name      testPhotosDateDurationMatrix0205
     * @tc.desc      Formats duration matrix sample 69. case 205
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0205 begin');
      expect(DateUtil.getFormattedDuration(3060001)).assertEqual('51:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0205 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0206
     * @tc.name      testPhotosDateDurationMatrix0206
     * @tc.desc      Formats duration matrix sample 69. case 206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0206 begin');
      expect(DateUtil.getFormattedDuration(3119999)).assertEqual('51:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0206 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0207
     * @tc.name      testPhotosDateDurationMatrix0207
     * @tc.desc      Formats duration matrix sample 69. case 207
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0207 begin');
      expect(DateUtil.getFormattedDuration(3120000)).assertEqual('52:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0207 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0208
     * @tc.name      testPhotosDateDurationMatrix0208
     * @tc.desc      Formats duration matrix sample 70. case 208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0208 begin');
      expect(DateUtil.getFormattedDuration(3105001)).assertEqual('51:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0208 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0209
     * @tc.name      testPhotosDateDurationMatrix0209
     * @tc.desc      Formats duration matrix sample 70. case 209
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0209 begin');
      expect(DateUtil.getFormattedDuration(3164999)).assertEqual('52:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0209 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0210
     * @tc.name      testPhotosDateDurationMatrix0210
     * @tc.desc      Formats duration matrix sample 70. case 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0210 begin');
      expect(DateUtil.getFormattedDuration(3165000)).assertEqual('52:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0210 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0211
     * @tc.name      testPhotosDateDurationMatrix0211
     * @tc.desc      Formats duration matrix sample 71. case 211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0211 begin');
      expect(DateUtil.getFormattedDuration(3150001)).assertEqual('52:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0211 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0212
     * @tc.name      testPhotosDateDurationMatrix0212
     * @tc.desc      Formats duration matrix sample 71. case 212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0212 begin');
      expect(DateUtil.getFormattedDuration(3209999)).assertEqual('53:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0212 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0213
     * @tc.name      testPhotosDateDurationMatrix0213
     * @tc.desc      Formats duration matrix sample 71. case 213
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0213 begin');
      expect(DateUtil.getFormattedDuration(3210000)).assertEqual('53:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0213 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0214
     * @tc.name      testPhotosDateDurationMatrix0214
     * @tc.desc      Formats duration matrix sample 72. case 214
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0214 begin');
      expect(DateUtil.getFormattedDuration(3195001)).assertEqual('53:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0214 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0215
     * @tc.name      testPhotosDateDurationMatrix0215
     * @tc.desc      Formats duration matrix sample 72. case 215
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0215 begin');
      expect(DateUtil.getFormattedDuration(3254999)).assertEqual('54:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0215 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0216
     * @tc.name      testPhotosDateDurationMatrix0216
     * @tc.desc      Formats duration matrix sample 72. case 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0216 begin');
      expect(DateUtil.getFormattedDuration(3255000)).assertEqual('54:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0216 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0217
     * @tc.name      testPhotosDateDurationMatrix0217
     * @tc.desc      Formats duration matrix sample 73. case 217
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0217 begin');
      expect(DateUtil.getFormattedDuration(3240001)).assertEqual('54:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0217 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0218
     * @tc.name      testPhotosDateDurationMatrix0218
     * @tc.desc      Formats duration matrix sample 73. case 218
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0218 begin');
      expect(DateUtil.getFormattedDuration(3299999)).assertEqual('54:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0218 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0219
     * @tc.name      testPhotosDateDurationMatrix0219
     * @tc.desc      Formats duration matrix sample 73. case 219
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0219 begin');
      expect(DateUtil.getFormattedDuration(3300000)).assertEqual('55:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0219 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0220
     * @tc.name      testPhotosDateDurationMatrix0220
     * @tc.desc      Formats duration matrix sample 74. case 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0220 begin');
      expect(DateUtil.getFormattedDuration(3285001)).assertEqual('54:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0220 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0221
     * @tc.name      testPhotosDateDurationMatrix0221
     * @tc.desc      Formats duration matrix sample 74. case 221
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0221 begin');
      expect(DateUtil.getFormattedDuration(3344999)).assertEqual('55:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0221 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0222
     * @tc.name      testPhotosDateDurationMatrix0222
     * @tc.desc      Formats duration matrix sample 74. case 222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0222 begin');
      expect(DateUtil.getFormattedDuration(3345000)).assertEqual('55:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0222 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0223
     * @tc.name      testPhotosDateDurationMatrix0223
     * @tc.desc      Formats duration matrix sample 75. case 223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0223 begin');
      expect(DateUtil.getFormattedDuration(3330001)).assertEqual('55:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0223 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0224
     * @tc.name      testPhotosDateDurationMatrix0224
     * @tc.desc      Formats duration matrix sample 75. case 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0224 begin');
      expect(DateUtil.getFormattedDuration(3389999)).assertEqual('56:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0224 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0225
     * @tc.name      testPhotosDateDurationMatrix0225
     * @tc.desc      Formats duration matrix sample 75. case 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0225 begin');
      expect(DateUtil.getFormattedDuration(3390000)).assertEqual('56:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0225 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0226
     * @tc.name      testPhotosDateDurationMatrix0226
     * @tc.desc      Formats duration matrix sample 76. case 226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0226 begin');
      expect(DateUtil.getFormattedDuration(3375001)).assertEqual('56:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0226 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0227
     * @tc.name      testPhotosDateDurationMatrix0227
     * @tc.desc      Formats duration matrix sample 76. case 227
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0227 begin');
      expect(DateUtil.getFormattedDuration(3434999)).assertEqual('57:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0227 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0228
     * @tc.name      testPhotosDateDurationMatrix0228
     * @tc.desc      Formats duration matrix sample 76. case 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0228 begin');
      expect(DateUtil.getFormattedDuration(3435000)).assertEqual('57:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0228 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0229
     * @tc.name      testPhotosDateDurationMatrix0229
     * @tc.desc      Formats duration matrix sample 77. case 229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0229 begin');
      expect(DateUtil.getFormattedDuration(3420001)).assertEqual('57:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0229 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0230
     * @tc.name      testPhotosDateDurationMatrix0230
     * @tc.desc      Formats duration matrix sample 77. case 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0230 begin');
      expect(DateUtil.getFormattedDuration(3479999)).assertEqual('57:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0230 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0231
     * @tc.name      testPhotosDateDurationMatrix0231
     * @tc.desc      Formats duration matrix sample 77. case 231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0231 begin');
      expect(DateUtil.getFormattedDuration(3480000)).assertEqual('58:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0231 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0232
     * @tc.name      testPhotosDateDurationMatrix0232
     * @tc.desc      Formats duration matrix sample 78. case 232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0232 begin');
      expect(DateUtil.getFormattedDuration(3465001)).assertEqual('57:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0232 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0233
     * @tc.name      testPhotosDateDurationMatrix0233
     * @tc.desc      Formats duration matrix sample 78. case 233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0233 begin');
      expect(DateUtil.getFormattedDuration(3524999)).assertEqual('58:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0233 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0234
     * @tc.name      testPhotosDateDurationMatrix0234
     * @tc.desc      Formats duration matrix sample 78. case 234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0234 begin');
      expect(DateUtil.getFormattedDuration(3525000)).assertEqual('58:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0234 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0235
     * @tc.name      testPhotosDateDurationMatrix0235
     * @tc.desc      Formats duration matrix sample 79. case 235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0235 begin');
      expect(DateUtil.getFormattedDuration(3510001)).assertEqual('58:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0235 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0236
     * @tc.name      testPhotosDateDurationMatrix0236
     * @tc.desc      Formats duration matrix sample 79. case 236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0236 begin');
      expect(DateUtil.getFormattedDuration(3569999)).assertEqual('59:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0236 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0237
     * @tc.name      testPhotosDateDurationMatrix0237
     * @tc.desc      Formats duration matrix sample 79. case 237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0237 begin');
      expect(DateUtil.getFormattedDuration(3570000)).assertEqual('59:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0237 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0238
     * @tc.name      testPhotosDateDurationMatrix0238
     * @tc.desc      Formats duration matrix sample 80. case 238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0238 begin');
      expect(DateUtil.getFormattedDuration(3555001)).assertEqual('59:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0238 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0239
     * @tc.name      testPhotosDateDurationMatrix0239
     * @tc.desc      Formats duration matrix sample 80. case 239
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0239 begin');
      expect(DateUtil.getFormattedDuration(3614999)).assertEqual('1:00:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0239 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0240
     * @tc.name      testPhotosDateDurationMatrix0240
     * @tc.desc      Formats duration matrix sample 80. case 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0240 begin');
      expect(DateUtil.getFormattedDuration(3615000)).assertEqual('1:00:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0240 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0241
     * @tc.name      testPhotosDateDurationMatrix0241
     * @tc.desc      Formats duration matrix sample 81. case 241
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0241 begin');
      expect(DateUtil.getFormattedDuration(3600001)).assertEqual('1:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0241 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0242
     * @tc.name      testPhotosDateDurationMatrix0242
     * @tc.desc      Formats duration matrix sample 81. case 242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0242 begin');
      expect(DateUtil.getFormattedDuration(3659999)).assertEqual('1:00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0242 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0243
     * @tc.name      testPhotosDateDurationMatrix0243
     * @tc.desc      Formats duration matrix sample 81. case 243
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0243 begin');
      expect(DateUtil.getFormattedDuration(3660000)).assertEqual('1:01:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0243 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0244
     * @tc.name      testPhotosDateDurationMatrix0244
     * @tc.desc      Formats duration matrix sample 82. case 244
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0244 begin');
      expect(DateUtil.getFormattedDuration(3645001)).assertEqual('1:00:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0244 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0245
     * @tc.name      testPhotosDateDurationMatrix0245
     * @tc.desc      Formats duration matrix sample 82. case 245
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0245 begin');
      expect(DateUtil.getFormattedDuration(3704999)).assertEqual('1:01:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0245 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0246
     * @tc.name      testPhotosDateDurationMatrix0246
     * @tc.desc      Formats duration matrix sample 82. case 246
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0246 begin');
      expect(DateUtil.getFormattedDuration(3705000)).assertEqual('1:01:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0246 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0247
     * @tc.name      testPhotosDateDurationMatrix0247
     * @tc.desc      Formats duration matrix sample 83. case 247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0247 begin');
      expect(DateUtil.getFormattedDuration(3690001)).assertEqual('1:01:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0247 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0248
     * @tc.name      testPhotosDateDurationMatrix0248
     * @tc.desc      Formats duration matrix sample 83. case 248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0248 begin');
      expect(DateUtil.getFormattedDuration(3749999)).assertEqual('1:02:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0248 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0249
     * @tc.name      testPhotosDateDurationMatrix0249
     * @tc.desc      Formats duration matrix sample 83. case 249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0249 begin');
      expect(DateUtil.getFormattedDuration(3750000)).assertEqual('1:02:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0249 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0250
     * @tc.name      testPhotosDateDurationMatrix0250
     * @tc.desc      Formats duration matrix sample 84. case 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0250 begin');
      expect(DateUtil.getFormattedDuration(3735001)).assertEqual('1:02:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0250 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0251
     * @tc.name      testPhotosDateDurationMatrix0251
     * @tc.desc      Formats duration matrix sample 84. case 251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0251 begin');
      expect(DateUtil.getFormattedDuration(3794999)).assertEqual('1:03:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0251 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0252
     * @tc.name      testPhotosDateDurationMatrix0252
     * @tc.desc      Formats duration matrix sample 84. case 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0252 begin');
      expect(DateUtil.getFormattedDuration(3795000)).assertEqual('1:03:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0252 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0253
     * @tc.name      testPhotosDateDurationMatrix0253
     * @tc.desc      Formats duration matrix sample 85. case 253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0253 begin');
      expect(DateUtil.getFormattedDuration(3780001)).assertEqual('1:03:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0253 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0254
     * @tc.name      testPhotosDateDurationMatrix0254
     * @tc.desc      Formats duration matrix sample 85. case 254
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0254 begin');
      expect(DateUtil.getFormattedDuration(3839999)).assertEqual('1:03:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0254 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0255
     * @tc.name      testPhotosDateDurationMatrix0255
     * @tc.desc      Formats duration matrix sample 85. case 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0255 begin');
      expect(DateUtil.getFormattedDuration(3840000)).assertEqual('1:04:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0255 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0256
     * @tc.name      testPhotosDateDurationMatrix0256
     * @tc.desc      Formats duration matrix sample 86. case 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0256 begin');
      expect(DateUtil.getFormattedDuration(3825001)).assertEqual('1:03:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0256 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0257
     * @tc.name      testPhotosDateDurationMatrix0257
     * @tc.desc      Formats duration matrix sample 86. case 257
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0257 begin');
      expect(DateUtil.getFormattedDuration(3884999)).assertEqual('1:04:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0257 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0258
     * @tc.name      testPhotosDateDurationMatrix0258
     * @tc.desc      Formats duration matrix sample 86. case 258
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0258 begin');
      expect(DateUtil.getFormattedDuration(3885000)).assertEqual('1:04:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0258 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0259
     * @tc.name      testPhotosDateDurationMatrix0259
     * @tc.desc      Formats duration matrix sample 87. case 259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0259 begin');
      expect(DateUtil.getFormattedDuration(3870001)).assertEqual('1:04:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0259 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0260
     * @tc.name      testPhotosDateDurationMatrix0260
     * @tc.desc      Formats duration matrix sample 87. case 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0260 begin');
      expect(DateUtil.getFormattedDuration(3929999)).assertEqual('1:05:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0260 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0261
     * @tc.name      testPhotosDateDurationMatrix0261
     * @tc.desc      Formats duration matrix sample 87. case 261
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0261 begin');
      expect(DateUtil.getFormattedDuration(3930000)).assertEqual('1:05:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0261 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0262
     * @tc.name      testPhotosDateDurationMatrix0262
     * @tc.desc      Formats duration matrix sample 88. case 262
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0262 begin');
      expect(DateUtil.getFormattedDuration(3915001)).assertEqual('1:05:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0262 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0263
     * @tc.name      testPhotosDateDurationMatrix0263
     * @tc.desc      Formats duration matrix sample 88. case 263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0263 begin');
      expect(DateUtil.getFormattedDuration(3974999)).assertEqual('1:06:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0263 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0264
     * @tc.name      testPhotosDateDurationMatrix0264
     * @tc.desc      Formats duration matrix sample 88. case 264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0264 begin');
      expect(DateUtil.getFormattedDuration(3975000)).assertEqual('1:06:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0264 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0265
     * @tc.name      testPhotosDateDurationMatrix0265
     * @tc.desc      Formats duration matrix sample 89. case 265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0265 begin');
      expect(DateUtil.getFormattedDuration(3960001)).assertEqual('1:06:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0265 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0266
     * @tc.name      testPhotosDateDurationMatrix0266
     * @tc.desc      Formats duration matrix sample 89. case 266
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0266 begin');
      expect(DateUtil.getFormattedDuration(4019999)).assertEqual('1:06:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0266 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0267
     * @tc.name      testPhotosDateDurationMatrix0267
     * @tc.desc      Formats duration matrix sample 89. case 267
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0267 begin');
      expect(DateUtil.getFormattedDuration(4020000)).assertEqual('1:07:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0267 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0268
     * @tc.name      testPhotosDateDurationMatrix0268
     * @tc.desc      Formats duration matrix sample 90. case 268
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0268 begin');
      expect(DateUtil.getFormattedDuration(4005001)).assertEqual('1:06:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0268 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0269
     * @tc.name      testPhotosDateDurationMatrix0269
     * @tc.desc      Formats duration matrix sample 90. case 269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0269 begin');
      expect(DateUtil.getFormattedDuration(4064999)).assertEqual('1:07:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0269 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0270
     * @tc.name      testPhotosDateDurationMatrix0270
     * @tc.desc      Formats duration matrix sample 90. case 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0270 begin');
      expect(DateUtil.getFormattedDuration(4065000)).assertEqual('1:07:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0270 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0271
     * @tc.name      testPhotosDateDurationMatrix0271
     * @tc.desc      Formats duration matrix sample 91. case 271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0271 begin');
      expect(DateUtil.getFormattedDuration(4050001)).assertEqual('1:07:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0271 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0272
     * @tc.name      testPhotosDateDurationMatrix0272
     * @tc.desc      Formats duration matrix sample 91. case 272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0272 begin');
      expect(DateUtil.getFormattedDuration(4109999)).assertEqual('1:08:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0272 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0273
     * @tc.name      testPhotosDateDurationMatrix0273
     * @tc.desc      Formats duration matrix sample 91. case 273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0273 begin');
      expect(DateUtil.getFormattedDuration(4110000)).assertEqual('1:08:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0273 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0274
     * @tc.name      testPhotosDateDurationMatrix0274
     * @tc.desc      Formats duration matrix sample 92. case 274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0274 begin');
      expect(DateUtil.getFormattedDuration(4095001)).assertEqual('1:08:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0274 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0275
     * @tc.name      testPhotosDateDurationMatrix0275
     * @tc.desc      Formats duration matrix sample 92. case 275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0275 begin');
      expect(DateUtil.getFormattedDuration(4154999)).assertEqual('1:09:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0275 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0276
     * @tc.name      testPhotosDateDurationMatrix0276
     * @tc.desc      Formats duration matrix sample 92. case 276
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0276 begin');
      expect(DateUtil.getFormattedDuration(4155000)).assertEqual('1:09:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0276 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0277
     * @tc.name      testPhotosDateDurationMatrix0277
     * @tc.desc      Formats duration matrix sample 93. case 277
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0277 begin');
      expect(DateUtil.getFormattedDuration(4140001)).assertEqual('1:09:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0277 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0278
     * @tc.name      testPhotosDateDurationMatrix0278
     * @tc.desc      Formats duration matrix sample 93. case 278
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0278 begin');
      expect(DateUtil.getFormattedDuration(4199999)).assertEqual('1:09:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0278 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0279
     * @tc.name      testPhotosDateDurationMatrix0279
     * @tc.desc      Formats duration matrix sample 93. case 279
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0279 begin');
      expect(DateUtil.getFormattedDuration(4200000)).assertEqual('1:10:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0279 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0280
     * @tc.name      testPhotosDateDurationMatrix0280
     * @tc.desc      Formats duration matrix sample 94. case 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0280 begin');
      expect(DateUtil.getFormattedDuration(4185001)).assertEqual('1:09:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0280 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0281
     * @tc.name      testPhotosDateDurationMatrix0281
     * @tc.desc      Formats duration matrix sample 94. case 281
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0281 begin');
      expect(DateUtil.getFormattedDuration(4244999)).assertEqual('1:10:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0281 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0282
     * @tc.name      testPhotosDateDurationMatrix0282
     * @tc.desc      Formats duration matrix sample 94. case 282
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0282 begin');
      expect(DateUtil.getFormattedDuration(4245000)).assertEqual('1:10:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0282 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0283
     * @tc.name      testPhotosDateDurationMatrix0283
     * @tc.desc      Formats duration matrix sample 95. case 283
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0283 begin');
      expect(DateUtil.getFormattedDuration(4230001)).assertEqual('1:10:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0283 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0284
     * @tc.name      testPhotosDateDurationMatrix0284
     * @tc.desc      Formats duration matrix sample 95. case 284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0284 begin');
      expect(DateUtil.getFormattedDuration(4289999)).assertEqual('1:11:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0284 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0285
     * @tc.name      testPhotosDateDurationMatrix0285
     * @tc.desc      Formats duration matrix sample 95. case 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0285 begin');
      expect(DateUtil.getFormattedDuration(4290000)).assertEqual('1:11:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0285 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0286
     * @tc.name      testPhotosDateDurationMatrix0286
     * @tc.desc      Formats duration matrix sample 96. case 286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0286 begin');
      expect(DateUtil.getFormattedDuration(4275001)).assertEqual('1:11:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0286 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0287
     * @tc.name      testPhotosDateDurationMatrix0287
     * @tc.desc      Formats duration matrix sample 96. case 287
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0287 begin');
      expect(DateUtil.getFormattedDuration(4334999)).assertEqual('1:12:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0287 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0288
     * @tc.name      testPhotosDateDurationMatrix0288
     * @tc.desc      Formats duration matrix sample 96. case 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0288 begin');
      expect(DateUtil.getFormattedDuration(4335000)).assertEqual('1:12:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0288 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0289
     * @tc.name      testPhotosDateDurationMatrix0289
     * @tc.desc      Formats duration matrix sample 97. case 289
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0289 begin');
      expect(DateUtil.getFormattedDuration(4320001)).assertEqual('1:12:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0289 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0290
     * @tc.name      testPhotosDateDurationMatrix0290
     * @tc.desc      Formats duration matrix sample 97. case 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0290 begin');
      expect(DateUtil.getFormattedDuration(4379999)).assertEqual('1:12:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0290 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0291
     * @tc.name      testPhotosDateDurationMatrix0291
     * @tc.desc      Formats duration matrix sample 97. case 291
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0291 begin');
      expect(DateUtil.getFormattedDuration(4380000)).assertEqual('1:13:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0291 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0292
     * @tc.name      testPhotosDateDurationMatrix0292
     * @tc.desc      Formats duration matrix sample 98. case 292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0292 begin');
      expect(DateUtil.getFormattedDuration(4365001)).assertEqual('1:12:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0292 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0293
     * @tc.name      testPhotosDateDurationMatrix0293
     * @tc.desc      Formats duration matrix sample 98. case 293
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0293 begin');
      expect(DateUtil.getFormattedDuration(4424999)).assertEqual('1:13:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0293 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0294
     * @tc.name      testPhotosDateDurationMatrix0294
     * @tc.desc      Formats duration matrix sample 98. case 294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0294 begin');
      expect(DateUtil.getFormattedDuration(4425000)).assertEqual('1:13:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0294 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0295
     * @tc.name      testPhotosDateDurationMatrix0295
     * @tc.desc      Formats duration matrix sample 99. case 295
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0295 begin');
      expect(DateUtil.getFormattedDuration(4410001)).assertEqual('1:13:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0295 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0296
     * @tc.name      testPhotosDateDurationMatrix0296
     * @tc.desc      Formats duration matrix sample 99. case 296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0296 begin');
      expect(DateUtil.getFormattedDuration(4469999)).assertEqual('1:14:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0296 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0297
     * @tc.name      testPhotosDateDurationMatrix0297
     * @tc.desc      Formats duration matrix sample 99. case 297
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0297 begin');
      expect(DateUtil.getFormattedDuration(4470000)).assertEqual('1:14:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0297 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0298
     * @tc.name      testPhotosDateDurationMatrix0298
     * @tc.desc      Formats duration matrix sample 100. case 298
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0298 begin');
      expect(DateUtil.getFormattedDuration(4455001)).assertEqual('1:14:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0298 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0299
     * @tc.name      testPhotosDateDurationMatrix0299
     * @tc.desc      Formats duration matrix sample 100. case 299
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0299 begin');
      expect(DateUtil.getFormattedDuration(4514999)).assertEqual('1:15:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0299 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0300
     * @tc.name      testPhotosDateDurationMatrix0300
     * @tc.desc      Formats duration matrix sample 100. case 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0300 begin');
      expect(DateUtil.getFormattedDuration(4515000)).assertEqual('1:15:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0300 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0301
     * @tc.name      testPhotosDateDurationMatrix0301
     * @tc.desc      Formats duration matrix sample 101. case 301
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0301 begin');
      expect(DateUtil.getFormattedDuration(4500001)).assertEqual('1:15:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0301 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0302
     * @tc.name      testPhotosDateDurationMatrix0302
     * @tc.desc      Formats duration matrix sample 101. case 302
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0302 begin');
      expect(DateUtil.getFormattedDuration(4559999)).assertEqual('1:15:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0302 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0303
     * @tc.name      testPhotosDateDurationMatrix0303
     * @tc.desc      Formats duration matrix sample 101. case 303
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0303 begin');
      expect(DateUtil.getFormattedDuration(4560000)).assertEqual('1:16:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0303 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0304
     * @tc.name      testPhotosDateDurationMatrix0304
     * @tc.desc      Formats duration matrix sample 102. case 304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0304 begin');
      expect(DateUtil.getFormattedDuration(4545001)).assertEqual('1:15:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0304 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0305
     * @tc.name      testPhotosDateDurationMatrix0305
     * @tc.desc      Formats duration matrix sample 102. case 305
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0305 begin');
      expect(DateUtil.getFormattedDuration(4604999)).assertEqual('1:16:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0305 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0306
     * @tc.name      testPhotosDateDurationMatrix0306
     * @tc.desc      Formats duration matrix sample 102. case 306
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0306 begin');
      expect(DateUtil.getFormattedDuration(4605000)).assertEqual('1:16:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0306 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0307
     * @tc.name      testPhotosDateDurationMatrix0307
     * @tc.desc      Formats duration matrix sample 103. case 307
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0307 begin');
      expect(DateUtil.getFormattedDuration(4590001)).assertEqual('1:16:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0307 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0308
     * @tc.name      testPhotosDateDurationMatrix0308
     * @tc.desc      Formats duration matrix sample 103. case 308
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0308 begin');
      expect(DateUtil.getFormattedDuration(4649999)).assertEqual('1:17:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0308 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0309
     * @tc.name      testPhotosDateDurationMatrix0309
     * @tc.desc      Formats duration matrix sample 103. case 309
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0309 begin');
      expect(DateUtil.getFormattedDuration(4650000)).assertEqual('1:17:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0309 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0310
     * @tc.name      testPhotosDateDurationMatrix0310
     * @tc.desc      Formats duration matrix sample 104. case 310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0310 begin');
      expect(DateUtil.getFormattedDuration(4635001)).assertEqual('1:17:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0310 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0311
     * @tc.name      testPhotosDateDurationMatrix0311
     * @tc.desc      Formats duration matrix sample 104. case 311
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0311 begin');
      expect(DateUtil.getFormattedDuration(4694999)).assertEqual('1:18:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0311 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0312
     * @tc.name      testPhotosDateDurationMatrix0312
     * @tc.desc      Formats duration matrix sample 104. case 312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0312 begin');
      expect(DateUtil.getFormattedDuration(4695000)).assertEqual('1:18:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0312 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0313
     * @tc.name      testPhotosDateDurationMatrix0313
     * @tc.desc      Formats duration matrix sample 105. case 313
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0313 begin');
      expect(DateUtil.getFormattedDuration(4680001)).assertEqual('1:18:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0313 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0314
     * @tc.name      testPhotosDateDurationMatrix0314
     * @tc.desc      Formats duration matrix sample 105. case 314
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0314 begin');
      expect(DateUtil.getFormattedDuration(4739999)).assertEqual('1:18:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0314 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0315
     * @tc.name      testPhotosDateDurationMatrix0315
     * @tc.desc      Formats duration matrix sample 105. case 315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0315 begin');
      expect(DateUtil.getFormattedDuration(4740000)).assertEqual('1:19:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0315 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0316
     * @tc.name      testPhotosDateDurationMatrix0316
     * @tc.desc      Formats duration matrix sample 106. case 316
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0316 begin');
      expect(DateUtil.getFormattedDuration(4725001)).assertEqual('1:18:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0316 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0317
     * @tc.name      testPhotosDateDurationMatrix0317
     * @tc.desc      Formats duration matrix sample 106. case 317
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0317 begin');
      expect(DateUtil.getFormattedDuration(4784999)).assertEqual('1:19:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0317 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0318
     * @tc.name      testPhotosDateDurationMatrix0318
     * @tc.desc      Formats duration matrix sample 106. case 318
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0318 begin');
      expect(DateUtil.getFormattedDuration(4785000)).assertEqual('1:19:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0318 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0319
     * @tc.name      testPhotosDateDurationMatrix0319
     * @tc.desc      Formats duration matrix sample 107. case 319
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0319 begin');
      expect(DateUtil.getFormattedDuration(4770001)).assertEqual('1:19:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0319 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0320
     * @tc.name      testPhotosDateDurationMatrix0320
     * @tc.desc      Formats duration matrix sample 107. case 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0320 begin');
      expect(DateUtil.getFormattedDuration(4829999)).assertEqual('1:20:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0320 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0321
     * @tc.name      testPhotosDateDurationMatrix0321
     * @tc.desc      Formats duration matrix sample 107. case 321
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0321 begin');
      expect(DateUtil.getFormattedDuration(4830000)).assertEqual('1:20:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0321 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0322
     * @tc.name      testPhotosDateDurationMatrix0322
     * @tc.desc      Formats duration matrix sample 108. case 322
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0322 begin');
      expect(DateUtil.getFormattedDuration(4815001)).assertEqual('1:20:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0322 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0323
     * @tc.name      testPhotosDateDurationMatrix0323
     * @tc.desc      Formats duration matrix sample 108. case 323
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0323 begin');
      expect(DateUtil.getFormattedDuration(4874999)).assertEqual('1:21:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0323 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0324
     * @tc.name      testPhotosDateDurationMatrix0324
     * @tc.desc      Formats duration matrix sample 108. case 324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0324 begin');
      expect(DateUtil.getFormattedDuration(4875000)).assertEqual('1:21:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0324 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0325
     * @tc.name      testPhotosDateDurationMatrix0325
     * @tc.desc      Formats duration matrix sample 109. case 325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0325 begin');
      expect(DateUtil.getFormattedDuration(4860001)).assertEqual('1:21:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0325 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0326
     * @tc.name      testPhotosDateDurationMatrix0326
     * @tc.desc      Formats duration matrix sample 109. case 326
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0326 begin');
      expect(DateUtil.getFormattedDuration(4919999)).assertEqual('1:21:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0326 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0327
     * @tc.name      testPhotosDateDurationMatrix0327
     * @tc.desc      Formats duration matrix sample 109. case 327
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0327 begin');
      expect(DateUtil.getFormattedDuration(4920000)).assertEqual('1:22:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0327 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0328
     * @tc.name      testPhotosDateDurationMatrix0328
     * @tc.desc      Formats duration matrix sample 110. case 328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0328 begin');
      expect(DateUtil.getFormattedDuration(4905001)).assertEqual('1:21:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0328 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0329
     * @tc.name      testPhotosDateDurationMatrix0329
     * @tc.desc      Formats duration matrix sample 110. case 329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0329 begin');
      expect(DateUtil.getFormattedDuration(4964999)).assertEqual('1:22:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0329 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0330
     * @tc.name      testPhotosDateDurationMatrix0330
     * @tc.desc      Formats duration matrix sample 110. case 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0330 begin');
      expect(DateUtil.getFormattedDuration(4965000)).assertEqual('1:22:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0330 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0331
     * @tc.name      testPhotosDateDurationMatrix0331
     * @tc.desc      Formats duration matrix sample 111. case 331
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0331 begin');
      expect(DateUtil.getFormattedDuration(4950001)).assertEqual('1:22:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0331 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0332
     * @tc.name      testPhotosDateDurationMatrix0332
     * @tc.desc      Formats duration matrix sample 111. case 332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0332 begin');
      expect(DateUtil.getFormattedDuration(5009999)).assertEqual('1:23:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0332 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0333
     * @tc.name      testPhotosDateDurationMatrix0333
     * @tc.desc      Formats duration matrix sample 111. case 333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0333 begin');
      expect(DateUtil.getFormattedDuration(5010000)).assertEqual('1:23:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0333 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0334
     * @tc.name      testPhotosDateDurationMatrix0334
     * @tc.desc      Formats duration matrix sample 112. case 334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0334 begin');
      expect(DateUtil.getFormattedDuration(4995001)).assertEqual('1:23:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0334 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0335
     * @tc.name      testPhotosDateDurationMatrix0335
     * @tc.desc      Formats duration matrix sample 112. case 335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0335 begin');
      expect(DateUtil.getFormattedDuration(5054999)).assertEqual('1:24:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0335 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0336
     * @tc.name      testPhotosDateDurationMatrix0336
     * @tc.desc      Formats duration matrix sample 112. case 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0336 begin');
      expect(DateUtil.getFormattedDuration(5055000)).assertEqual('1:24:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0336 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0337
     * @tc.name      testPhotosDateDurationMatrix0337
     * @tc.desc      Formats duration matrix sample 113. case 337
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0337 begin');
      expect(DateUtil.getFormattedDuration(5040001)).assertEqual('1:24:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0337 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0338
     * @tc.name      testPhotosDateDurationMatrix0338
     * @tc.desc      Formats duration matrix sample 113. case 338
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0338 begin');
      expect(DateUtil.getFormattedDuration(5099999)).assertEqual('1:24:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0338 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0339
     * @tc.name      testPhotosDateDurationMatrix0339
     * @tc.desc      Formats duration matrix sample 113. case 339
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0339 begin');
      expect(DateUtil.getFormattedDuration(5100000)).assertEqual('1:25:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0339 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0340
     * @tc.name      testPhotosDateDurationMatrix0340
     * @tc.desc      Formats duration matrix sample 114. case 340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0340 begin');
      expect(DateUtil.getFormattedDuration(5085001)).assertEqual('1:24:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0340 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0341
     * @tc.name      testPhotosDateDurationMatrix0341
     * @tc.desc      Formats duration matrix sample 114. case 341
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0341 begin');
      expect(DateUtil.getFormattedDuration(5144999)).assertEqual('1:25:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0341 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0342
     * @tc.name      testPhotosDateDurationMatrix0342
     * @tc.desc      Formats duration matrix sample 114. case 342
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0342 begin');
      expect(DateUtil.getFormattedDuration(5145000)).assertEqual('1:25:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0342 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0343
     * @tc.name      testPhotosDateDurationMatrix0343
     * @tc.desc      Formats duration matrix sample 115. case 343
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0343 begin');
      expect(DateUtil.getFormattedDuration(5130001)).assertEqual('1:25:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0343 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0344
     * @tc.name      testPhotosDateDurationMatrix0344
     * @tc.desc      Formats duration matrix sample 115. case 344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0344 begin');
      expect(DateUtil.getFormattedDuration(5189999)).assertEqual('1:26:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0344 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0345
     * @tc.name      testPhotosDateDurationMatrix0345
     * @tc.desc      Formats duration matrix sample 115. case 345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0345 begin');
      expect(DateUtil.getFormattedDuration(5190000)).assertEqual('1:26:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0345 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0346
     * @tc.name      testPhotosDateDurationMatrix0346
     * @tc.desc      Formats duration matrix sample 116. case 346
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0346 begin');
      expect(DateUtil.getFormattedDuration(5175001)).assertEqual('1:26:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0346 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0347
     * @tc.name      testPhotosDateDurationMatrix0347
     * @tc.desc      Formats duration matrix sample 116. case 347
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0347 begin');
      expect(DateUtil.getFormattedDuration(5234999)).assertEqual('1:27:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0347 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0348
     * @tc.name      testPhotosDateDurationMatrix0348
     * @tc.desc      Formats duration matrix sample 116. case 348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0348 begin');
      expect(DateUtil.getFormattedDuration(5235000)).assertEqual('1:27:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0348 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0349
     * @tc.name      testPhotosDateDurationMatrix0349
     * @tc.desc      Formats duration matrix sample 117. case 349
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0349 begin');
      expect(DateUtil.getFormattedDuration(5220001)).assertEqual('1:27:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0349 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0350
     * @tc.name      testPhotosDateDurationMatrix0350
     * @tc.desc      Formats duration matrix sample 117. case 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0350 begin');
      expect(DateUtil.getFormattedDuration(5279999)).assertEqual('1:27:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0350 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0351
     * @tc.name      testPhotosDateDurationMatrix0351
     * @tc.desc      Formats duration matrix sample 117. case 351
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0351 begin');
      expect(DateUtil.getFormattedDuration(5280000)).assertEqual('1:28:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0351 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0352
     * @tc.name      testPhotosDateDurationMatrix0352
     * @tc.desc      Formats duration matrix sample 118. case 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0352 begin');
      expect(DateUtil.getFormattedDuration(5265001)).assertEqual('1:27:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0352 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0353
     * @tc.name      testPhotosDateDurationMatrix0353
     * @tc.desc      Formats duration matrix sample 118. case 353
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0353 begin');
      expect(DateUtil.getFormattedDuration(5324999)).assertEqual('1:28:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0353 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0354
     * @tc.name      testPhotosDateDurationMatrix0354
     * @tc.desc      Formats duration matrix sample 118. case 354
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0354 begin');
      expect(DateUtil.getFormattedDuration(5325000)).assertEqual('1:28:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0354 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0355
     * @tc.name      testPhotosDateDurationMatrix0355
     * @tc.desc      Formats duration matrix sample 119. case 355
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0355 begin');
      expect(DateUtil.getFormattedDuration(5310001)).assertEqual('1:28:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0355 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0356
     * @tc.name      testPhotosDateDurationMatrix0356
     * @tc.desc      Formats duration matrix sample 119. case 356
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0356 begin');
      expect(DateUtil.getFormattedDuration(5369999)).assertEqual('1:29:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0356 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0357
     * @tc.name      testPhotosDateDurationMatrix0357
     * @tc.desc      Formats duration matrix sample 119. case 357
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0357 begin');
      expect(DateUtil.getFormattedDuration(5370000)).assertEqual('1:29:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0357 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0358
     * @tc.name      testPhotosDateDurationMatrix0358
     * @tc.desc      Formats duration matrix sample 120. case 358
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0358 begin');
      expect(DateUtil.getFormattedDuration(5355001)).assertEqual('1:29:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0358 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0359
     * @tc.name      testPhotosDateDurationMatrix0359
     * @tc.desc      Formats duration matrix sample 120. case 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0359 begin');
      expect(DateUtil.getFormattedDuration(5414999)).assertEqual('1:30:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0359 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0360
     * @tc.name      testPhotosDateDurationMatrix0360
     * @tc.desc      Formats duration matrix sample 120. case 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationMatrix0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0360 begin');
      expect(DateUtil.getFormattedDuration(5415000)).assertEqual('1:30:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0360 end');
    })

  })
}
