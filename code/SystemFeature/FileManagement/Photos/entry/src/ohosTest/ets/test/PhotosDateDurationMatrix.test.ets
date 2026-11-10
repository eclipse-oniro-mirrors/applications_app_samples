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
import HiLog from '@ohos.hilog';
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0001 begin');
      expect(DateUtil.getFormattedDuration(1)).assertEqual('00:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0001 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0002 begin');
      expect(DateUtil.getFormattedDuration(59999)).assertEqual('00:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0002 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0003 begin');
      expect(DateUtil.getFormattedDuration(60000)).assertEqual('01:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0003 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0004 begin');
      expect(DateUtil.getFormattedDuration(45001)).assertEqual('00:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0004 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0005 begin');
      expect(DateUtil.getFormattedDuration(104999)).assertEqual('01:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0005 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0006 begin');
      expect(DateUtil.getFormattedDuration(105000)).assertEqual('01:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0006 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0007 begin');
      expect(DateUtil.getFormattedDuration(90001)).assertEqual('01:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0007 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0008 begin');
      expect(DateUtil.getFormattedDuration(149999)).assertEqual('02:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0008 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0009 begin');
      expect(DateUtil.getFormattedDuration(150000)).assertEqual('02:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0009 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0010 begin');
      expect(DateUtil.getFormattedDuration(135001)).assertEqual('02:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0010 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0011 begin');
      expect(DateUtil.getFormattedDuration(194999)).assertEqual('03:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0011 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0012 begin');
      expect(DateUtil.getFormattedDuration(195000)).assertEqual('03:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0012 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0013 begin');
      expect(DateUtil.getFormattedDuration(180001)).assertEqual('03:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0013 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0014 begin');
      expect(DateUtil.getFormattedDuration(239999)).assertEqual('03:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0014 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0015 begin');
      expect(DateUtil.getFormattedDuration(240000)).assertEqual('04:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0015 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0016 begin');
      expect(DateUtil.getFormattedDuration(225001)).assertEqual('03:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0016 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0017 begin');
      expect(DateUtil.getFormattedDuration(284999)).assertEqual('04:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0017 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0018 begin');
      expect(DateUtil.getFormattedDuration(285000)).assertEqual('04:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0018 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0019 begin');
      expect(DateUtil.getFormattedDuration(270001)).assertEqual('04:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0019 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0020 begin');
      expect(DateUtil.getFormattedDuration(329999)).assertEqual('05:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0020 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0021 begin');
      expect(DateUtil.getFormattedDuration(330000)).assertEqual('05:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0021 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0022 begin');
      expect(DateUtil.getFormattedDuration(315001)).assertEqual('05:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0022 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0023 begin');
      expect(DateUtil.getFormattedDuration(374999)).assertEqual('06:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0023 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0024 begin');
      expect(DateUtil.getFormattedDuration(375000)).assertEqual('06:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0024 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0025 begin');
      expect(DateUtil.getFormattedDuration(360001)).assertEqual('06:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0025 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0026 begin');
      expect(DateUtil.getFormattedDuration(419999)).assertEqual('06:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0026 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0027 begin');
      expect(DateUtil.getFormattedDuration(420000)).assertEqual('07:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0027 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0028 begin');
      expect(DateUtil.getFormattedDuration(405001)).assertEqual('06:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0028 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0029 begin');
      expect(DateUtil.getFormattedDuration(464999)).assertEqual('07:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0029 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0030 begin');
      expect(DateUtil.getFormattedDuration(465000)).assertEqual('07:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0030 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0031 begin');
      expect(DateUtil.getFormattedDuration(450001)).assertEqual('07:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0031 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0032 begin');
      expect(DateUtil.getFormattedDuration(509999)).assertEqual('08:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0032 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0033 begin');
      expect(DateUtil.getFormattedDuration(510000)).assertEqual('08:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0033 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0034 begin');
      expect(DateUtil.getFormattedDuration(495001)).assertEqual('08:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0034 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0035 begin');
      expect(DateUtil.getFormattedDuration(554999)).assertEqual('09:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0035 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0036 begin');
      expect(DateUtil.getFormattedDuration(555000)).assertEqual('09:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0036 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0037 begin');
      expect(DateUtil.getFormattedDuration(540001)).assertEqual('09:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0037 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0038 begin');
      expect(DateUtil.getFormattedDuration(599999)).assertEqual('09:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0038 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0039 begin');
      expect(DateUtil.getFormattedDuration(600000)).assertEqual('10:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0039 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0040 begin');
      expect(DateUtil.getFormattedDuration(585001)).assertEqual('09:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0040 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0041 begin');
      expect(DateUtil.getFormattedDuration(644999)).assertEqual('10:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0041 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0042 begin');
      expect(DateUtil.getFormattedDuration(645000)).assertEqual('10:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0042 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0043 begin');
      expect(DateUtil.getFormattedDuration(630001)).assertEqual('10:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0043 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0044 begin');
      expect(DateUtil.getFormattedDuration(689999)).assertEqual('11:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0044 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0045 begin');
      expect(DateUtil.getFormattedDuration(690000)).assertEqual('11:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0045 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0046 begin');
      expect(DateUtil.getFormattedDuration(675001)).assertEqual('11:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0046 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0047 begin');
      expect(DateUtil.getFormattedDuration(734999)).assertEqual('12:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0047 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0048 begin');
      expect(DateUtil.getFormattedDuration(735000)).assertEqual('12:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0048 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0049 begin');
      expect(DateUtil.getFormattedDuration(720001)).assertEqual('12:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0049 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0050 begin');
      expect(DateUtil.getFormattedDuration(779999)).assertEqual('12:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0050 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0051 begin');
      expect(DateUtil.getFormattedDuration(780000)).assertEqual('13:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0051 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0052 begin');
      expect(DateUtil.getFormattedDuration(765001)).assertEqual('12:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0052 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0053 begin');
      expect(DateUtil.getFormattedDuration(824999)).assertEqual('13:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0053 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0054 begin');
      expect(DateUtil.getFormattedDuration(825000)).assertEqual('13:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0054 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0055 begin');
      expect(DateUtil.getFormattedDuration(810001)).assertEqual('13:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0055 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0056 begin');
      expect(DateUtil.getFormattedDuration(869999)).assertEqual('14:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0056 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0057 begin');
      expect(DateUtil.getFormattedDuration(870000)).assertEqual('14:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0057 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0058 begin');
      expect(DateUtil.getFormattedDuration(855001)).assertEqual('14:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0058 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0059 begin');
      expect(DateUtil.getFormattedDuration(914999)).assertEqual('15:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0059 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0060 begin');
      expect(DateUtil.getFormattedDuration(915000)).assertEqual('15:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0060 end');
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
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0061 begin');
      expect(DateUtil.getFormattedDuration(900001)).assertEqual('15:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationMatrix0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_0062
     * @tc.name      testPhotosDateDurationMatrix0062
