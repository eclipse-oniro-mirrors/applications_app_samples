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

const TAG = '[Sample_PhotosDateRangeMatrixTest]';
const DOMAIN = 0xF811;

export default function PhotosDateRangeMatrixTest(): void {
  describe('PhotosDateRangeMatrixTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0001
     * @tc.name      testPhotosDateSameDayMatrix0001
     * @tc.desc      Compares same-day boundary sample 1. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0001 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0002
     * @tc.name      testPhotosDateSameDayMatrix0002
     * @tc.desc      Compares same-day boundary sample 1. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0002 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 1, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0003
     * @tc.name      testPhotosDateSameDayMatrix0003
     * @tc.desc      Compares same-day boundary sample 1. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0003 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 2, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0003 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0004
     * @tc.name      testPhotosDateSameDayMatrix0004
     * @tc.desc      Compares same-day boundary sample 2. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0004 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 2, 0, 0, 0).getTime(), new Date(2024, 1, 2, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0005
     * @tc.name      testPhotosDateSameDayMatrix0005
     * @tc.desc      Compares same-day boundary sample 2. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0005 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 2, 0, 0, 0).getTime(), new Date(2024, 1, 2, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0006
     * @tc.name      testPhotosDateSameDayMatrix0006
     * @tc.desc      Compares same-day boundary sample 2. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0006 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 2, 0, 0, 0).getTime(), new Date(2024, 1, 3, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0006 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0007
     * @tc.name      testPhotosDateSameDayMatrix0007
     * @tc.desc      Compares same-day boundary sample 3. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0007 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 3, 0, 0, 0).getTime(), new Date(2024, 2, 3, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0008
     * @tc.name      testPhotosDateSameDayMatrix0008
     * @tc.desc      Compares same-day boundary sample 3. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0008 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 3, 0, 0, 0).getTime(), new Date(2024, 2, 3, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0009
     * @tc.name      testPhotosDateSameDayMatrix0009
     * @tc.desc      Compares same-day boundary sample 3. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0009 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 3, 0, 0, 0).getTime(), new Date(2024, 2, 4, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0009 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0010
     * @tc.name      testPhotosDateSameDayMatrix0010
     * @tc.desc      Compares same-day boundary sample 4. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0010 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 4, 0, 0, 0).getTime(), new Date(2024, 3, 4, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0011
     * @tc.name      testPhotosDateSameDayMatrix0011
     * @tc.desc      Compares same-day boundary sample 4. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0011 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 4, 0, 0, 0).getTime(), new Date(2024, 3, 4, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0012
     * @tc.name      testPhotosDateSameDayMatrix0012
     * @tc.desc      Compares same-day boundary sample 4. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0012 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 4, 0, 0, 0).getTime(), new Date(2024, 3, 5, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0012 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0013
     * @tc.name      testPhotosDateSameDayMatrix0013
     * @tc.desc      Compares same-day boundary sample 5. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0013 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 5, 0, 0, 0).getTime(), new Date(2024, 4, 5, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0014
     * @tc.name      testPhotosDateSameDayMatrix0014
     * @tc.desc      Compares same-day boundary sample 5. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0014 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 5, 0, 0, 0).getTime(), new Date(2024, 4, 5, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0015
     * @tc.name      testPhotosDateSameDayMatrix0015
     * @tc.desc      Compares same-day boundary sample 5. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0015 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 5, 0, 0, 0).getTime(), new Date(2024, 4, 6, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0016
     * @tc.name      testPhotosDateSameDayMatrix0016
     * @tc.desc      Compares same-day boundary sample 6. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0016 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 5, 6, 0, 0, 0).getTime(), new Date(2024, 5, 6, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0017
     * @tc.name      testPhotosDateSameDayMatrix0017
     * @tc.desc      Compares same-day boundary sample 6. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0017 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 5, 6, 0, 0, 0).getTime(), new Date(2024, 5, 6, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0018
     * @tc.name      testPhotosDateSameDayMatrix0018
     * @tc.desc      Compares same-day boundary sample 6. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0018 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 5, 6, 0, 0, 0).getTime(), new Date(2024, 5, 7, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0018 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0019
     * @tc.name      testPhotosDateSameDayMatrix0019
     * @tc.desc      Compares same-day boundary sample 7. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0019 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 7, 0, 0, 0).getTime(), new Date(2024, 6, 7, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0020
     * @tc.name      testPhotosDateSameDayMatrix0020
     * @tc.desc      Compares same-day boundary sample 7. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0020 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 7, 0, 0, 0).getTime(), new Date(2024, 6, 7, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0021
     * @tc.name      testPhotosDateSameDayMatrix0021
     * @tc.desc      Compares same-day boundary sample 7. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0021 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 7, 0, 0, 0).getTime(), new Date(2024, 6, 8, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0021 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0022
     * @tc.name      testPhotosDateSameDayMatrix0022
     * @tc.desc      Compares same-day boundary sample 8. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0022 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 7, 8, 0, 0, 0).getTime(), new Date(2024, 7, 8, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0023
     * @tc.name      testPhotosDateSameDayMatrix0023
     * @tc.desc      Compares same-day boundary sample 8. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0023 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 7, 8, 0, 0, 0).getTime(), new Date(2024, 7, 8, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0024
     * @tc.name      testPhotosDateSameDayMatrix0024
     * @tc.desc      Compares same-day boundary sample 8. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0024 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 7, 8, 0, 0, 0).getTime(), new Date(2024, 7, 9, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0024 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0025
     * @tc.name      testPhotosDateSameDayMatrix0025
     * @tc.desc      Compares same-day boundary sample 9. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0025 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 9, 0, 0, 0).getTime(), new Date(2024, 8, 9, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0026
     * @tc.name      testPhotosDateSameDayMatrix0026
     * @tc.desc      Compares same-day boundary sample 9. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0026 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 9, 0, 0, 0).getTime(), new Date(2024, 8, 9, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0027
     * @tc.name      testPhotosDateSameDayMatrix0027
     * @tc.desc      Compares same-day boundary sample 9. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0027 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 9, 0, 0, 0).getTime(), new Date(2024, 8, 10, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0027 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0028
     * @tc.name      testPhotosDateSameDayMatrix0028
     * @tc.desc      Compares same-day boundary sample 10. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0028 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 9, 10, 0, 0, 0).getTime(), new Date(2024, 9, 10, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0029
     * @tc.name      testPhotosDateSameDayMatrix0029
     * @tc.desc      Compares same-day boundary sample 10. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0029 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 9, 10, 0, 0, 0).getTime(), new Date(2024, 9, 10, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0030
     * @tc.name      testPhotosDateSameDayMatrix0030
     * @tc.desc      Compares same-day boundary sample 10. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0030 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 9, 10, 0, 0, 0).getTime(), new Date(2024, 9, 11, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0031
     * @tc.name      testPhotosDateSameDayMatrix0031
     * @tc.desc      Compares same-day boundary sample 11. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0031 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 11, 0, 0, 0).getTime(), new Date(2024, 10, 11, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0032
     * @tc.name      testPhotosDateSameDayMatrix0032
     * @tc.desc      Compares same-day boundary sample 11. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0032 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 11, 0, 0, 0).getTime(), new Date(2024, 10, 11, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0033
     * @tc.name      testPhotosDateSameDayMatrix0033
     * @tc.desc      Compares same-day boundary sample 11. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0033 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 11, 0, 0, 0).getTime(), new Date(2024, 10, 12, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0033 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0034
     * @tc.name      testPhotosDateSameDayMatrix0034
     * @tc.desc      Compares same-day boundary sample 12. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0034 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 11, 12, 0, 0, 0).getTime(), new Date(2024, 11, 12, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0035
     * @tc.name      testPhotosDateSameDayMatrix0035
     * @tc.desc      Compares same-day boundary sample 12. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0035 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 11, 12, 0, 0, 0).getTime(), new Date(2024, 11, 12, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0036
     * @tc.name      testPhotosDateSameDayMatrix0036
     * @tc.desc      Compares same-day boundary sample 12. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0036 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 11, 12, 0, 0, 0).getTime(), new Date(2024, 11, 13, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0036 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0037
     * @tc.name      testPhotosDateSameDayMatrix0037
     * @tc.desc      Compares same-day boundary sample 13. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0037 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 13, 0, 0, 0).getTime(), new Date(2024, 0, 13, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0038
     * @tc.name      testPhotosDateSameDayMatrix0038
     * @tc.desc      Compares same-day boundary sample 13. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0038 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 13, 0, 0, 0).getTime(), new Date(2024, 0, 13, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0039
     * @tc.name      testPhotosDateSameDayMatrix0039
     * @tc.desc      Compares same-day boundary sample 13. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0039 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 13, 0, 0, 0).getTime(), new Date(2024, 0, 14, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0039 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0040
     * @tc.name      testPhotosDateSameDayMatrix0040
     * @tc.desc      Compares same-day boundary sample 14. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0040 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 14, 0, 0, 0).getTime(), new Date(2024, 1, 14, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0041
     * @tc.name      testPhotosDateSameDayMatrix0041
     * @tc.desc      Compares same-day boundary sample 14. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0041 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 14, 0, 0, 0).getTime(), new Date(2024, 1, 14, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0042
     * @tc.name      testPhotosDateSameDayMatrix0042
     * @tc.desc      Compares same-day boundary sample 14. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0042 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 14, 0, 0, 0).getTime(), new Date(2024, 1, 15, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0042 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0043
     * @tc.name      testPhotosDateSameDayMatrix0043
     * @tc.desc      Compares same-day boundary sample 15. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0043 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 15, 0, 0, 0).getTime(), new Date(2024, 2, 15, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0044
     * @tc.name      testPhotosDateSameDayMatrix0044
     * @tc.desc      Compares same-day boundary sample 15. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0044 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 15, 0, 0, 0).getTime(), new Date(2024, 2, 15, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0045
     * @tc.name      testPhotosDateSameDayMatrix0045
     * @tc.desc      Compares same-day boundary sample 15. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0045 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 15, 0, 0, 0).getTime(), new Date(2024, 2, 16, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0046
     * @tc.name      testPhotosDateSameDayMatrix0046
     * @tc.desc      Compares same-day boundary sample 16. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0046 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 16, 0, 0, 0).getTime(), new Date(2024, 3, 16, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0047
     * @tc.name      testPhotosDateSameDayMatrix0047
     * @tc.desc      Compares same-day boundary sample 16. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0047 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 16, 0, 0, 0).getTime(), new Date(2024, 3, 16, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0048
     * @tc.name      testPhotosDateSameDayMatrix0048
     * @tc.desc      Compares same-day boundary sample 16. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0048 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 16, 0, 0, 0).getTime(), new Date(2024, 3, 17, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0048 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0049
     * @tc.name      testPhotosDateSameDayMatrix0049
     * @tc.desc      Compares same-day boundary sample 17. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0049 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 17, 0, 0, 0).getTime(), new Date(2024, 4, 17, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0050
     * @tc.name      testPhotosDateSameDayMatrix0050
     * @tc.desc      Compares same-day boundary sample 17. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0050 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 17, 0, 0, 0).getTime(), new Date(2024, 4, 17, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0051
     * @tc.name      testPhotosDateSameDayMatrix0051
     * @tc.desc      Compares same-day boundary sample 17. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0051 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 17, 0, 0, 0).getTime(), new Date(2024, 4, 18, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0051 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0052
     * @tc.name      testPhotosDateSameDayMatrix0052
     * @tc.desc      Compares same-day boundary sample 18. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0052 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 5, 18, 0, 0, 0).getTime(), new Date(2024, 5, 18, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0053
     * @tc.name      testPhotosDateSameDayMatrix0053
     * @tc.desc      Compares same-day boundary sample 18. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0053 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 5, 18, 0, 0, 0).getTime(), new Date(2024, 5, 18, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0054
     * @tc.name      testPhotosDateSameDayMatrix0054
     * @tc.desc      Compares same-day boundary sample 18. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0054 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 5, 18, 0, 0, 0).getTime(), new Date(2024, 5, 19, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0054 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0055
     * @tc.name      testPhotosDateSameDayMatrix0055
     * @tc.desc      Compares same-day boundary sample 19. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0055 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 19, 0, 0, 0).getTime(), new Date(2024, 6, 19, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0056
     * @tc.name      testPhotosDateSameDayMatrix0056
     * @tc.desc      Compares same-day boundary sample 19. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0056 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 19, 0, 0, 0).getTime(), new Date(2024, 6, 19, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0057
     * @tc.name      testPhotosDateSameDayMatrix0057
     * @tc.desc      Compares same-day boundary sample 19. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0057 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 19, 0, 0, 0).getTime(), new Date(2024, 6, 20, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0057 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0058
     * @tc.name      testPhotosDateSameDayMatrix0058
     * @tc.desc      Compares same-day boundary sample 20. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0058 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 7, 20, 0, 0, 0).getTime(), new Date(2024, 7, 20, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0059
     * @tc.name      testPhotosDateSameDayMatrix0059
     * @tc.desc      Compares same-day boundary sample 20. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0059 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 7, 20, 0, 0, 0).getTime(), new Date(2024, 7, 20, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0060
     * @tc.name      testPhotosDateSameDayMatrix0060
     * @tc.desc      Compares same-day boundary sample 20. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0060 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 7, 20, 0, 0, 0).getTime(), new Date(2024, 7, 21, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0061
     * @tc.name      testPhotosDateSameDayMatrix0061
     * @tc.desc      Compares same-day boundary sample 21. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0061 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 21, 0, 0, 0).getTime(), new Date(2024, 8, 21, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0062
     * @tc.name      testPhotosDateSameDayMatrix0062
     * @tc.desc      Compares same-day boundary sample 21. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0062 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 21, 0, 0, 0).getTime(), new Date(2024, 8, 21, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0063
     * @tc.name      testPhotosDateSameDayMatrix0063
     * @tc.desc      Compares same-day boundary sample 21. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0063 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 21, 0, 0, 0).getTime(), new Date(2024, 8, 22, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0063 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0064
     * @tc.name      testPhotosDateSameDayMatrix0064
     * @tc.desc      Compares same-day boundary sample 22. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0064 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 9, 22, 0, 0, 0).getTime(), new Date(2024, 9, 22, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0065
     * @tc.name      testPhotosDateSameDayMatrix0065
     * @tc.desc      Compares same-day boundary sample 22. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0065 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 9, 22, 0, 0, 0).getTime(), new Date(2024, 9, 22, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0066
     * @tc.name      testPhotosDateSameDayMatrix0066
     * @tc.desc      Compares same-day boundary sample 22. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0066 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 9, 22, 0, 0, 0).getTime(), new Date(2024, 9, 23, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0066 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0067
     * @tc.name      testPhotosDateSameDayMatrix0067
     * @tc.desc      Compares same-day boundary sample 23. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0067 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 23, 0, 0, 0).getTime(), new Date(2024, 10, 23, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0068
     * @tc.name      testPhotosDateSameDayMatrix0068
     * @tc.desc      Compares same-day boundary sample 23. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0068 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 23, 0, 0, 0).getTime(), new Date(2024, 10, 23, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0069
     * @tc.name      testPhotosDateSameDayMatrix0069
     * @tc.desc      Compares same-day boundary sample 23. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0069 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 23, 0, 0, 0).getTime(), new Date(2024, 10, 24, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0069 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0070
     * @tc.name      testPhotosDateSameDayMatrix0070
     * @tc.desc      Compares same-day boundary sample 24. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0070 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 11, 24, 0, 0, 0).getTime(), new Date(2024, 11, 24, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0071
     * @tc.name      testPhotosDateSameDayMatrix0071
     * @tc.desc      Compares same-day boundary sample 24. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0071 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 11, 24, 0, 0, 0).getTime(), new Date(2024, 11, 24, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0072
     * @tc.name      testPhotosDateSameDayMatrix0072
     * @tc.desc      Compares same-day boundary sample 24. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0072 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 11, 24, 0, 0, 0).getTime(), new Date(2024, 11, 25, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0072 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0073
     * @tc.name      testPhotosDateSameDayMatrix0073
     * @tc.desc      Compares same-day boundary sample 25. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0073 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 25, 0, 0, 0).getTime(), new Date(2024, 0, 25, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0074
     * @tc.name      testPhotosDateSameDayMatrix0074
     * @tc.desc      Compares same-day boundary sample 25. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0074 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 25, 0, 0, 0).getTime(), new Date(2024, 0, 25, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0075
     * @tc.name      testPhotosDateSameDayMatrix0075
     * @tc.desc      Compares same-day boundary sample 25. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0075 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 25, 0, 0, 0).getTime(), new Date(2024, 0, 26, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0075 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0076
     * @tc.name      testPhotosDateSameDayMatrix0076
     * @tc.desc      Compares same-day boundary sample 26. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0076 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 26, 0, 0, 0).getTime(), new Date(2024, 1, 26, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0077
     * @tc.name      testPhotosDateSameDayMatrix0077
     * @tc.desc      Compares same-day boundary sample 26. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0077 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 26, 0, 0, 0).getTime(), new Date(2024, 1, 26, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0078
     * @tc.name      testPhotosDateSameDayMatrix0078
     * @tc.desc      Compares same-day boundary sample 26. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0078 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 26, 0, 0, 0).getTime(), new Date(2024, 1, 27, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0078 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0079
     * @tc.name      testPhotosDateSameDayMatrix0079
     * @tc.desc      Compares same-day boundary sample 27. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0079 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 27, 0, 0, 0).getTime(), new Date(2024, 2, 27, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0080
     * @tc.name      testPhotosDateSameDayMatrix0080
     * @tc.desc      Compares same-day boundary sample 27. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0080 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 27, 0, 0, 0).getTime(), new Date(2024, 2, 27, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0081
     * @tc.name      testPhotosDateSameDayMatrix0081
     * @tc.desc      Compares same-day boundary sample 27. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0081 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 27, 0, 0, 0).getTime(), new Date(2024, 2, 28, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0081 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0082
     * @tc.name      testPhotosDateSameDayMatrix0082
     * @tc.desc      Compares same-day boundary sample 28. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0082 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 28, 0, 0, 0).getTime(), new Date(2024, 3, 28, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0083
     * @tc.name      testPhotosDateSameDayMatrix0083
     * @tc.desc      Compares same-day boundary sample 28. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0083 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 28, 0, 0, 0).getTime(), new Date(2024, 3, 28, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0084
     * @tc.name      testPhotosDateSameDayMatrix0084
     * @tc.desc      Compares same-day boundary sample 28. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0084 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 28, 0, 0, 0).getTime(), new Date(2024, 3, 29, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0084 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0085
     * @tc.name      testPhotosDateSameDayMatrix0085
     * @tc.desc      Compares same-day boundary sample 29. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0085 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 1, 0, 0, 0).getTime(), new Date(2024, 4, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0086
     * @tc.name      testPhotosDateSameDayMatrix0086
     * @tc.desc      Compares same-day boundary sample 29. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0086 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 1, 0, 0, 0).getTime(), new Date(2024, 4, 1, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0087
     * @tc.name      testPhotosDateSameDayMatrix0087
     * @tc.desc      Compares same-day boundary sample 29. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0087 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 1, 0, 0, 0).getTime(), new Date(2024, 4, 2, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0087 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0088
     * @tc.name      testPhotosDateSameDayMatrix0088
     * @tc.desc      Compares same-day boundary sample 30. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0088 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 5, 2, 0, 0, 0).getTime(), new Date(2024, 5, 2, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0089
     * @tc.name      testPhotosDateSameDayMatrix0089
     * @tc.desc      Compares same-day boundary sample 30. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0089 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 5, 2, 0, 0, 0).getTime(), new Date(2024, 5, 2, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0090
     * @tc.name      testPhotosDateSameDayMatrix0090
     * @tc.desc      Compares same-day boundary sample 30. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0090 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 5, 2, 0, 0, 0).getTime(), new Date(2024, 5, 3, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0090 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0091
     * @tc.name      testPhotosDateSameDayMatrix0091
     * @tc.desc      Compares same-day boundary sample 31. case 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0091 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 3, 0, 0, 0).getTime(), new Date(2024, 6, 3, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0092
     * @tc.name      testPhotosDateSameDayMatrix0092
     * @tc.desc      Compares same-day boundary sample 31. case 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0092 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 3, 0, 0, 0).getTime(), new Date(2024, 6, 3, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0093
     * @tc.name      testPhotosDateSameDayMatrix0093
     * @tc.desc      Compares same-day boundary sample 31. case 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0093 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 3, 0, 0, 0).getTime(), new Date(2024, 6, 4, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0093 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0094
     * @tc.name      testPhotosDateSameDayMatrix0094
     * @tc.desc      Compares same-day boundary sample 32. case 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0094 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 7, 4, 0, 0, 0).getTime(), new Date(2024, 7, 4, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0095
     * @tc.name      testPhotosDateSameDayMatrix0095
     * @tc.desc      Compares same-day boundary sample 32. case 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0095 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 7, 4, 0, 0, 0).getTime(), new Date(2024, 7, 4, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0096
     * @tc.name      testPhotosDateSameDayMatrix0096
     * @tc.desc      Compares same-day boundary sample 32. case 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0096 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 7, 4, 0, 0, 0).getTime(), new Date(2024, 7, 5, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0096 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0097
     * @tc.name      testPhotosDateSameDayMatrix0097
     * @tc.desc      Compares same-day boundary sample 33. case 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0097 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 5, 0, 0, 0).getTime(), new Date(2024, 8, 5, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0098
     * @tc.name      testPhotosDateSameDayMatrix0098
     * @tc.desc      Compares same-day boundary sample 33. case 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0098 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 5, 0, 0, 0).getTime(), new Date(2024, 8, 5, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0099
     * @tc.name      testPhotosDateSameDayMatrix0099
     * @tc.desc      Compares same-day boundary sample 33. case 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0099 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 5, 0, 0, 0).getTime(), new Date(2024, 8, 6, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0099 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0100
     * @tc.name      testPhotosDateSameDayMatrix0100
     * @tc.desc      Compares same-day boundary sample 34. case 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0100 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 9, 6, 0, 0, 0).getTime(), new Date(2024, 9, 6, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0101
     * @tc.name      testPhotosDateSameDayMatrix0101
     * @tc.desc      Compares same-day boundary sample 34. case 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0101 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 9, 6, 0, 0, 0).getTime(), new Date(2024, 9, 6, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0102
     * @tc.name      testPhotosDateSameDayMatrix0102
     * @tc.desc      Compares same-day boundary sample 34. case 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0102 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 9, 6, 0, 0, 0).getTime(), new Date(2024, 9, 7, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0102 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0103
     * @tc.name      testPhotosDateSameDayMatrix0103
     * @tc.desc      Compares same-day boundary sample 35. case 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0103 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 7, 0, 0, 0).getTime(), new Date(2024, 10, 7, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0104
     * @tc.name      testPhotosDateSameDayMatrix0104
     * @tc.desc      Compares same-day boundary sample 35. case 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0104 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 7, 0, 0, 0).getTime(), new Date(2024, 10, 7, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0105
     * @tc.name      testPhotosDateSameDayMatrix0105
     * @tc.desc      Compares same-day boundary sample 35. case 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0105 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 7, 0, 0, 0).getTime(), new Date(2024, 10, 8, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0105 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0106
     * @tc.name      testPhotosDateSameDayMatrix0106
     * @tc.desc      Compares same-day boundary sample 36. case 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0106 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 11, 8, 0, 0, 0).getTime(), new Date(2024, 11, 8, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0107
     * @tc.name      testPhotosDateSameDayMatrix0107
     * @tc.desc      Compares same-day boundary sample 36. case 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0107 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 11, 8, 0, 0, 0).getTime(), new Date(2024, 11, 8, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0108
     * @tc.name      testPhotosDateSameDayMatrix0108
     * @tc.desc      Compares same-day boundary sample 36. case 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0108 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 11, 8, 0, 0, 0).getTime(), new Date(2024, 11, 9, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0108 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0109
     * @tc.name      testPhotosDateSameDayMatrix0109
     * @tc.desc      Compares same-day boundary sample 37. case 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0109 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 9, 0, 0, 0).getTime(), new Date(2024, 0, 9, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0110
     * @tc.name      testPhotosDateSameDayMatrix0110
     * @tc.desc      Compares same-day boundary sample 37. case 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0110 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 9, 0, 0, 0).getTime(), new Date(2024, 0, 9, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0111
     * @tc.name      testPhotosDateSameDayMatrix0111
     * @tc.desc      Compares same-day boundary sample 37. case 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0111 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 9, 0, 0, 0).getTime(), new Date(2024, 0, 10, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0111 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0112
     * @tc.name      testPhotosDateSameDayMatrix0112
     * @tc.desc      Compares same-day boundary sample 38. case 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0112 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 10, 0, 0, 0).getTime(), new Date(2024, 1, 10, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0113
     * @tc.name      testPhotosDateSameDayMatrix0113
     * @tc.desc      Compares same-day boundary sample 38. case 113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0113 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 10, 0, 0, 0).getTime(), new Date(2024, 1, 10, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0114
     * @tc.name      testPhotosDateSameDayMatrix0114
     * @tc.desc      Compares same-day boundary sample 38. case 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0114 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 1, 10, 0, 0, 0).getTime(), new Date(2024, 1, 11, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0114 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0115
     * @tc.name      testPhotosDateSameDayMatrix0115
     * @tc.desc      Compares same-day boundary sample 39. case 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0115 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 11, 0, 0, 0).getTime(), new Date(2024, 2, 11, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0116
     * @tc.name      testPhotosDateSameDayMatrix0116
     * @tc.desc      Compares same-day boundary sample 39. case 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0116 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 11, 0, 0, 0).getTime(), new Date(2024, 2, 11, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0117
     * @tc.name      testPhotosDateSameDayMatrix0117
     * @tc.desc      Compares same-day boundary sample 39. case 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0117 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 11, 0, 0, 0).getTime(), new Date(2024, 2, 12, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0117 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0118
     * @tc.name      testPhotosDateSameDayMatrix0118
     * @tc.desc      Compares same-day boundary sample 40. case 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0118 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 12, 0, 0, 0).getTime(), new Date(2024, 3, 12, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0119
     * @tc.name      testPhotosDateSameDayMatrix0119
     * @tc.desc      Compares same-day boundary sample 40. case 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0119 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 12, 0, 0, 0).getTime(), new Date(2024, 3, 12, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_0120
     * @tc.name      testPhotosDateSameDayMatrix0120
     * @tc.desc      Compares same-day boundary sample 40. case 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0120 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 3, 12, 0, 0, 0).getTime(), new Date(2024, 3, 13, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayMatrix0120 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0001
     * @tc.name      testPhotosDateSameYearMatrix0001
     * @tc.desc      Compares same-year boundary sample 2000. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0001 begin');
      expect(DateUtil.isTheSameYear(new Date(2000, 0, 1, 0, 0, 0).getTime(), new Date(2000, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0002
     * @tc.name      testPhotosDateSameYearMatrix0002
     * @tc.desc      Compares same-year boundary sample 2000. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0002 begin');
      expect(DateUtil.isTheSameYear(new Date(2000, 0, 1, 0, 0, 0).getTime(), new Date(2000, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0003
     * @tc.name      testPhotosDateSameYearMatrix0003
     * @tc.desc      Compares same-year boundary sample 2000. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0003 begin');
      expect(DateUtil.isTheSameYear(new Date(2000, 11, 31, 23, 59, 59).getTime(), new Date(2001, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0003 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0004
     * @tc.name      testPhotosDateSameYearMatrix0004
     * @tc.desc      Compares same-year boundary sample 2001. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0004 begin');
      expect(DateUtil.isTheSameYear(new Date(2001, 0, 1, 0, 0, 0).getTime(), new Date(2001, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0005
     * @tc.name      testPhotosDateSameYearMatrix0005
     * @tc.desc      Compares same-year boundary sample 2001. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0005 begin');
      expect(DateUtil.isTheSameYear(new Date(2001, 0, 1, 0, 0, 0).getTime(), new Date(2001, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0006
     * @tc.name      testPhotosDateSameYearMatrix0006
     * @tc.desc      Compares same-year boundary sample 2001. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0006 begin');
      expect(DateUtil.isTheSameYear(new Date(2001, 11, 31, 23, 59, 59).getTime(), new Date(2002, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0006 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0007
     * @tc.name      testPhotosDateSameYearMatrix0007
     * @tc.desc      Compares same-year boundary sample 2002. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0007 begin');
      expect(DateUtil.isTheSameYear(new Date(2002, 0, 1, 0, 0, 0).getTime(), new Date(2002, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0008
     * @tc.name      testPhotosDateSameYearMatrix0008
     * @tc.desc      Compares same-year boundary sample 2002. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0008 begin');
      expect(DateUtil.isTheSameYear(new Date(2002, 0, 1, 0, 0, 0).getTime(), new Date(2002, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0009
     * @tc.name      testPhotosDateSameYearMatrix0009
     * @tc.desc      Compares same-year boundary sample 2002. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0009 begin');
      expect(DateUtil.isTheSameYear(new Date(2002, 11, 31, 23, 59, 59).getTime(), new Date(2003, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0009 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0010
     * @tc.name      testPhotosDateSameYearMatrix0010
     * @tc.desc      Compares same-year boundary sample 2003. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0010 begin');
      expect(DateUtil.isTheSameYear(new Date(2003, 0, 1, 0, 0, 0).getTime(), new Date(2003, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0011
     * @tc.name      testPhotosDateSameYearMatrix0011
     * @tc.desc      Compares same-year boundary sample 2003. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0011 begin');
      expect(DateUtil.isTheSameYear(new Date(2003, 0, 1, 0, 0, 0).getTime(), new Date(2003, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0012
     * @tc.name      testPhotosDateSameYearMatrix0012
     * @tc.desc      Compares same-year boundary sample 2003. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0012 begin');
      expect(DateUtil.isTheSameYear(new Date(2003, 11, 31, 23, 59, 59).getTime(), new Date(2004, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0012 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0013
     * @tc.name      testPhotosDateSameYearMatrix0013
     * @tc.desc      Compares same-year boundary sample 2004. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0013 begin');
      expect(DateUtil.isTheSameYear(new Date(2004, 0, 1, 0, 0, 0).getTime(), new Date(2004, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0014
     * @tc.name      testPhotosDateSameYearMatrix0014
     * @tc.desc      Compares same-year boundary sample 2004. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0014 begin');
      expect(DateUtil.isTheSameYear(new Date(2004, 0, 1, 0, 0, 0).getTime(), new Date(2004, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0015
     * @tc.name      testPhotosDateSameYearMatrix0015
     * @tc.desc      Compares same-year boundary sample 2004. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0015 begin');
      expect(DateUtil.isTheSameYear(new Date(2004, 11, 31, 23, 59, 59).getTime(), new Date(2005, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0016
     * @tc.name      testPhotosDateSameYearMatrix0016
     * @tc.desc      Compares same-year boundary sample 2005. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0016 begin');
      expect(DateUtil.isTheSameYear(new Date(2005, 0, 1, 0, 0, 0).getTime(), new Date(2005, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0017
     * @tc.name      testPhotosDateSameYearMatrix0017
     * @tc.desc      Compares same-year boundary sample 2005. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0017 begin');
      expect(DateUtil.isTheSameYear(new Date(2005, 0, 1, 0, 0, 0).getTime(), new Date(2005, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0018
     * @tc.name      testPhotosDateSameYearMatrix0018
     * @tc.desc      Compares same-year boundary sample 2005. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0018 begin');
      expect(DateUtil.isTheSameYear(new Date(2005, 11, 31, 23, 59, 59).getTime(), new Date(2006, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0018 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0019
     * @tc.name      testPhotosDateSameYearMatrix0019
     * @tc.desc      Compares same-year boundary sample 2006. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0019 begin');
      expect(DateUtil.isTheSameYear(new Date(2006, 0, 1, 0, 0, 0).getTime(), new Date(2006, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0020
     * @tc.name      testPhotosDateSameYearMatrix0020
     * @tc.desc      Compares same-year boundary sample 2006. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0020 begin');
      expect(DateUtil.isTheSameYear(new Date(2006, 0, 1, 0, 0, 0).getTime(), new Date(2006, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0021
     * @tc.name      testPhotosDateSameYearMatrix0021
     * @tc.desc      Compares same-year boundary sample 2006. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0021 begin');
      expect(DateUtil.isTheSameYear(new Date(2006, 11, 31, 23, 59, 59).getTime(), new Date(2007, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0021 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0022
     * @tc.name      testPhotosDateSameYearMatrix0022
     * @tc.desc      Compares same-year boundary sample 2007. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0022 begin');
      expect(DateUtil.isTheSameYear(new Date(2007, 0, 1, 0, 0, 0).getTime(), new Date(2007, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0023
     * @tc.name      testPhotosDateSameYearMatrix0023
     * @tc.desc      Compares same-year boundary sample 2007. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0023 begin');
      expect(DateUtil.isTheSameYear(new Date(2007, 0, 1, 0, 0, 0).getTime(), new Date(2007, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0024
     * @tc.name      testPhotosDateSameYearMatrix0024
     * @tc.desc      Compares same-year boundary sample 2007. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0024 begin');
      expect(DateUtil.isTheSameYear(new Date(2007, 11, 31, 23, 59, 59).getTime(), new Date(2008, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0024 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0025
     * @tc.name      testPhotosDateSameYearMatrix0025
     * @tc.desc      Compares same-year boundary sample 2008. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0025 begin');
      expect(DateUtil.isTheSameYear(new Date(2008, 0, 1, 0, 0, 0).getTime(), new Date(2008, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0026
     * @tc.name      testPhotosDateSameYearMatrix0026
     * @tc.desc      Compares same-year boundary sample 2008. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0026 begin');
      expect(DateUtil.isTheSameYear(new Date(2008, 0, 1, 0, 0, 0).getTime(), new Date(2008, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0027
     * @tc.name      testPhotosDateSameYearMatrix0027
     * @tc.desc      Compares same-year boundary sample 2008. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0027 begin');
      expect(DateUtil.isTheSameYear(new Date(2008, 11, 31, 23, 59, 59).getTime(), new Date(2009, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0027 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0028
     * @tc.name      testPhotosDateSameYearMatrix0028
     * @tc.desc      Compares same-year boundary sample 2009. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0028 begin');
      expect(DateUtil.isTheSameYear(new Date(2009, 0, 1, 0, 0, 0).getTime(), new Date(2009, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0029
     * @tc.name      testPhotosDateSameYearMatrix0029
     * @tc.desc      Compares same-year boundary sample 2009. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0029 begin');
      expect(DateUtil.isTheSameYear(new Date(2009, 0, 1, 0, 0, 0).getTime(), new Date(2009, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0030
     * @tc.name      testPhotosDateSameYearMatrix0030
     * @tc.desc      Compares same-year boundary sample 2009. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0030 begin');
      expect(DateUtil.isTheSameYear(new Date(2009, 11, 31, 23, 59, 59).getTime(), new Date(2010, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0031
     * @tc.name      testPhotosDateSameYearMatrix0031
     * @tc.desc      Compares same-year boundary sample 2010. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0031 begin');
      expect(DateUtil.isTheSameYear(new Date(2010, 0, 1, 0, 0, 0).getTime(), new Date(2010, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0032
     * @tc.name      testPhotosDateSameYearMatrix0032
     * @tc.desc      Compares same-year boundary sample 2010. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0032 begin');
      expect(DateUtil.isTheSameYear(new Date(2010, 0, 1, 0, 0, 0).getTime(), new Date(2010, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0033
     * @tc.name      testPhotosDateSameYearMatrix0033
     * @tc.desc      Compares same-year boundary sample 2010. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0033 begin');
      expect(DateUtil.isTheSameYear(new Date(2010, 11, 31, 23, 59, 59).getTime(), new Date(2011, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0033 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0034
     * @tc.name      testPhotosDateSameYearMatrix0034
     * @tc.desc      Compares same-year boundary sample 2011. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0034 begin');
      expect(DateUtil.isTheSameYear(new Date(2011, 0, 1, 0, 0, 0).getTime(), new Date(2011, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0035
     * @tc.name      testPhotosDateSameYearMatrix0035
     * @tc.desc      Compares same-year boundary sample 2011. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0035 begin');
      expect(DateUtil.isTheSameYear(new Date(2011, 0, 1, 0, 0, 0).getTime(), new Date(2011, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0036
     * @tc.name      testPhotosDateSameYearMatrix0036
     * @tc.desc      Compares same-year boundary sample 2011. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0036 begin');
      expect(DateUtil.isTheSameYear(new Date(2011, 11, 31, 23, 59, 59).getTime(), new Date(2012, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0036 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0037
     * @tc.name      testPhotosDateSameYearMatrix0037
     * @tc.desc      Compares same-year boundary sample 2012. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0037 begin');
      expect(DateUtil.isTheSameYear(new Date(2012, 0, 1, 0, 0, 0).getTime(), new Date(2012, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0038
     * @tc.name      testPhotosDateSameYearMatrix0038
     * @tc.desc      Compares same-year boundary sample 2012. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0038 begin');
      expect(DateUtil.isTheSameYear(new Date(2012, 0, 1, 0, 0, 0).getTime(), new Date(2012, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0039
     * @tc.name      testPhotosDateSameYearMatrix0039
     * @tc.desc      Compares same-year boundary sample 2012. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0039 begin');
      expect(DateUtil.isTheSameYear(new Date(2012, 11, 31, 23, 59, 59).getTime(), new Date(2013, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0039 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0040
     * @tc.name      testPhotosDateSameYearMatrix0040
     * @tc.desc      Compares same-year boundary sample 2013. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0040 begin');
      expect(DateUtil.isTheSameYear(new Date(2013, 0, 1, 0, 0, 0).getTime(), new Date(2013, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0041
     * @tc.name      testPhotosDateSameYearMatrix0041
     * @tc.desc      Compares same-year boundary sample 2013. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0041 begin');
      expect(DateUtil.isTheSameYear(new Date(2013, 0, 1, 0, 0, 0).getTime(), new Date(2013, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0042
     * @tc.name      testPhotosDateSameYearMatrix0042
     * @tc.desc      Compares same-year boundary sample 2013. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0042 begin');
      expect(DateUtil.isTheSameYear(new Date(2013, 11, 31, 23, 59, 59).getTime(), new Date(2014, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0042 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0043
     * @tc.name      testPhotosDateSameYearMatrix0043
     * @tc.desc      Compares same-year boundary sample 2014. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0043 begin');
      expect(DateUtil.isTheSameYear(new Date(2014, 0, 1, 0, 0, 0).getTime(), new Date(2014, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0044
     * @tc.name      testPhotosDateSameYearMatrix0044
     * @tc.desc      Compares same-year boundary sample 2014. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0044 begin');
      expect(DateUtil.isTheSameYear(new Date(2014, 0, 1, 0, 0, 0).getTime(), new Date(2014, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0045
     * @tc.name      testPhotosDateSameYearMatrix0045
     * @tc.desc      Compares same-year boundary sample 2014. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0045 begin');
      expect(DateUtil.isTheSameYear(new Date(2014, 11, 31, 23, 59, 59).getTime(), new Date(2015, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0046
     * @tc.name      testPhotosDateSameYearMatrix0046
     * @tc.desc      Compares same-year boundary sample 2015. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0046 begin');
      expect(DateUtil.isTheSameYear(new Date(2015, 0, 1, 0, 0, 0).getTime(), new Date(2015, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0047
     * @tc.name      testPhotosDateSameYearMatrix0047
     * @tc.desc      Compares same-year boundary sample 2015. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0047 begin');
      expect(DateUtil.isTheSameYear(new Date(2015, 0, 1, 0, 0, 0).getTime(), new Date(2015, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0048
     * @tc.name      testPhotosDateSameYearMatrix0048
     * @tc.desc      Compares same-year boundary sample 2015. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0048 begin');
      expect(DateUtil.isTheSameYear(new Date(2015, 11, 31, 23, 59, 59).getTime(), new Date(2016, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0048 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0049
     * @tc.name      testPhotosDateSameYearMatrix0049
     * @tc.desc      Compares same-year boundary sample 2016. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0049 begin');
      expect(DateUtil.isTheSameYear(new Date(2016, 0, 1, 0, 0, 0).getTime(), new Date(2016, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0050
     * @tc.name      testPhotosDateSameYearMatrix0050
     * @tc.desc      Compares same-year boundary sample 2016. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0050 begin');
      expect(DateUtil.isTheSameYear(new Date(2016, 0, 1, 0, 0, 0).getTime(), new Date(2016, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0051
     * @tc.name      testPhotosDateSameYearMatrix0051
     * @tc.desc      Compares same-year boundary sample 2016. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0051 begin');
      expect(DateUtil.isTheSameYear(new Date(2016, 11, 31, 23, 59, 59).getTime(), new Date(2017, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0051 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0052
     * @tc.name      testPhotosDateSameYearMatrix0052
     * @tc.desc      Compares same-year boundary sample 2017. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0052 begin');
      expect(DateUtil.isTheSameYear(new Date(2017, 0, 1, 0, 0, 0).getTime(), new Date(2017, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0053
     * @tc.name      testPhotosDateSameYearMatrix0053
     * @tc.desc      Compares same-year boundary sample 2017. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0053 begin');
      expect(DateUtil.isTheSameYear(new Date(2017, 0, 1, 0, 0, 0).getTime(), new Date(2017, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0054
     * @tc.name      testPhotosDateSameYearMatrix0054
     * @tc.desc      Compares same-year boundary sample 2017. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0054 begin');
      expect(DateUtil.isTheSameYear(new Date(2017, 11, 31, 23, 59, 59).getTime(), new Date(2018, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0054 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0055
     * @tc.name      testPhotosDateSameYearMatrix0055
     * @tc.desc      Compares same-year boundary sample 2018. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0055 begin');
      expect(DateUtil.isTheSameYear(new Date(2018, 0, 1, 0, 0, 0).getTime(), new Date(2018, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0056
     * @tc.name      testPhotosDateSameYearMatrix0056
     * @tc.desc      Compares same-year boundary sample 2018. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0056 begin');
      expect(DateUtil.isTheSameYear(new Date(2018, 0, 1, 0, 0, 0).getTime(), new Date(2018, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0057
     * @tc.name      testPhotosDateSameYearMatrix0057
     * @tc.desc      Compares same-year boundary sample 2018. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0057 begin');
      expect(DateUtil.isTheSameYear(new Date(2018, 11, 31, 23, 59, 59).getTime(), new Date(2019, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0057 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0058
     * @tc.name      testPhotosDateSameYearMatrix0058
     * @tc.desc      Compares same-year boundary sample 2019. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0058 begin');
      expect(DateUtil.isTheSameYear(new Date(2019, 0, 1, 0, 0, 0).getTime(), new Date(2019, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0059
     * @tc.name      testPhotosDateSameYearMatrix0059
     * @tc.desc      Compares same-year boundary sample 2019. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0059 begin');
      expect(DateUtil.isTheSameYear(new Date(2019, 0, 1, 0, 0, 0).getTime(), new Date(2019, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0060
     * @tc.name      testPhotosDateSameYearMatrix0060
     * @tc.desc      Compares same-year boundary sample 2019. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0060 begin');
      expect(DateUtil.isTheSameYear(new Date(2019, 11, 31, 23, 59, 59).getTime(), new Date(2020, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0061
     * @tc.name      testPhotosDateSameYearMatrix0061
     * @tc.desc      Compares same-year boundary sample 2020. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0061 begin');
      expect(DateUtil.isTheSameYear(new Date(2020, 0, 1, 0, 0, 0).getTime(), new Date(2020, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0062
     * @tc.name      testPhotosDateSameYearMatrix0062
     * @tc.desc      Compares same-year boundary sample 2020. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0062 begin');
      expect(DateUtil.isTheSameYear(new Date(2020, 0, 1, 0, 0, 0).getTime(), new Date(2020, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0063
     * @tc.name      testPhotosDateSameYearMatrix0063
     * @tc.desc      Compares same-year boundary sample 2020. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0063 begin');
      expect(DateUtil.isTheSameYear(new Date(2020, 11, 31, 23, 59, 59).getTime(), new Date(2021, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0063 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0064
     * @tc.name      testPhotosDateSameYearMatrix0064
     * @tc.desc      Compares same-year boundary sample 2021. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0064 begin');
      expect(DateUtil.isTheSameYear(new Date(2021, 0, 1, 0, 0, 0).getTime(), new Date(2021, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0065
     * @tc.name      testPhotosDateSameYearMatrix0065
     * @tc.desc      Compares same-year boundary sample 2021. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0065 begin');
      expect(DateUtil.isTheSameYear(new Date(2021, 0, 1, 0, 0, 0).getTime(), new Date(2021, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0066
     * @tc.name      testPhotosDateSameYearMatrix0066
     * @tc.desc      Compares same-year boundary sample 2021. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0066 begin');
      expect(DateUtil.isTheSameYear(new Date(2021, 11, 31, 23, 59, 59).getTime(), new Date(2022, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0066 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0067
     * @tc.name      testPhotosDateSameYearMatrix0067
     * @tc.desc      Compares same-year boundary sample 2022. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0067 begin');
      expect(DateUtil.isTheSameYear(new Date(2022, 0, 1, 0, 0, 0).getTime(), new Date(2022, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0068
     * @tc.name      testPhotosDateSameYearMatrix0068
     * @tc.desc      Compares same-year boundary sample 2022. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0068 begin');
      expect(DateUtil.isTheSameYear(new Date(2022, 0, 1, 0, 0, 0).getTime(), new Date(2022, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0069
     * @tc.name      testPhotosDateSameYearMatrix0069
     * @tc.desc      Compares same-year boundary sample 2022. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0069 begin');
      expect(DateUtil.isTheSameYear(new Date(2022, 11, 31, 23, 59, 59).getTime(), new Date(2023, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0069 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0070
     * @tc.name      testPhotosDateSameYearMatrix0070
     * @tc.desc      Compares same-year boundary sample 2023. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0070 begin');
      expect(DateUtil.isTheSameYear(new Date(2023, 0, 1, 0, 0, 0).getTime(), new Date(2023, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0071
     * @tc.name      testPhotosDateSameYearMatrix0071
     * @tc.desc      Compares same-year boundary sample 2023. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0071 begin');
      expect(DateUtil.isTheSameYear(new Date(2023, 0, 1, 0, 0, 0).getTime(), new Date(2023, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0072
     * @tc.name      testPhotosDateSameYearMatrix0072
     * @tc.desc      Compares same-year boundary sample 2023. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0072 begin');
      expect(DateUtil.isTheSameYear(new Date(2023, 11, 31, 23, 59, 59).getTime(), new Date(2024, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0072 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0073
     * @tc.name      testPhotosDateSameYearMatrix0073
     * @tc.desc      Compares same-year boundary sample 2024. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0073 begin');
      expect(DateUtil.isTheSameYear(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0074
     * @tc.name      testPhotosDateSameYearMatrix0074
     * @tc.desc      Compares same-year boundary sample 2024. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0074 begin');
      expect(DateUtil.isTheSameYear(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0075
     * @tc.name      testPhotosDateSameYearMatrix0075
     * @tc.desc      Compares same-year boundary sample 2024. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0075 begin');
      expect(DateUtil.isTheSameYear(new Date(2024, 11, 31, 23, 59, 59).getTime(), new Date(2025, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0075 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0076
     * @tc.name      testPhotosDateSameYearMatrix0076
     * @tc.desc      Compares same-year boundary sample 2025. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0076 begin');
      expect(DateUtil.isTheSameYear(new Date(2025, 0, 1, 0, 0, 0).getTime(), new Date(2025, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0077
     * @tc.name      testPhotosDateSameYearMatrix0077
     * @tc.desc      Compares same-year boundary sample 2025. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0077 begin');
      expect(DateUtil.isTheSameYear(new Date(2025, 0, 1, 0, 0, 0).getTime(), new Date(2025, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0078
     * @tc.name      testPhotosDateSameYearMatrix0078
     * @tc.desc      Compares same-year boundary sample 2025. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0078 begin');
      expect(DateUtil.isTheSameYear(new Date(2025, 11, 31, 23, 59, 59).getTime(), new Date(2026, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0078 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0079
     * @tc.name      testPhotosDateSameYearMatrix0079
     * @tc.desc      Compares same-year boundary sample 2026. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0079 begin');
      expect(DateUtil.isTheSameYear(new Date(2026, 0, 1, 0, 0, 0).getTime(), new Date(2026, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0080
     * @tc.name      testPhotosDateSameYearMatrix0080
     * @tc.desc      Compares same-year boundary sample 2026. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0080 begin');
      expect(DateUtil.isTheSameYear(new Date(2026, 0, 1, 0, 0, 0).getTime(), new Date(2026, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0081
     * @tc.name      testPhotosDateSameYearMatrix0081
     * @tc.desc      Compares same-year boundary sample 2026. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0081 begin');
      expect(DateUtil.isTheSameYear(new Date(2026, 11, 31, 23, 59, 59).getTime(), new Date(2027, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0081 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0082
     * @tc.name      testPhotosDateSameYearMatrix0082
     * @tc.desc      Compares same-year boundary sample 2027. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0082 begin');
      expect(DateUtil.isTheSameYear(new Date(2027, 0, 1, 0, 0, 0).getTime(), new Date(2027, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0083
     * @tc.name      testPhotosDateSameYearMatrix0083
     * @tc.desc      Compares same-year boundary sample 2027. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0083 begin');
      expect(DateUtil.isTheSameYear(new Date(2027, 0, 1, 0, 0, 0).getTime(), new Date(2027, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0084
     * @tc.name      testPhotosDateSameYearMatrix0084
     * @tc.desc      Compares same-year boundary sample 2027. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0084 begin');
      expect(DateUtil.isTheSameYear(new Date(2027, 11, 31, 23, 59, 59).getTime(), new Date(2028, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0084 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0085
     * @tc.name      testPhotosDateSameYearMatrix0085
     * @tc.desc      Compares same-year boundary sample 2028. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0085 begin');
      expect(DateUtil.isTheSameYear(new Date(2028, 0, 1, 0, 0, 0).getTime(), new Date(2028, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0086
     * @tc.name      testPhotosDateSameYearMatrix0086
     * @tc.desc      Compares same-year boundary sample 2028. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0086 begin');
      expect(DateUtil.isTheSameYear(new Date(2028, 0, 1, 0, 0, 0).getTime(), new Date(2028, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0087
     * @tc.name      testPhotosDateSameYearMatrix0087
     * @tc.desc      Compares same-year boundary sample 2028. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0087 begin');
      expect(DateUtil.isTheSameYear(new Date(2028, 11, 31, 23, 59, 59).getTime(), new Date(2029, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0087 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0088
     * @tc.name      testPhotosDateSameYearMatrix0088
     * @tc.desc      Compares same-year boundary sample 2029. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0088 begin');
      expect(DateUtil.isTheSameYear(new Date(2029, 0, 1, 0, 0, 0).getTime(), new Date(2029, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0089
     * @tc.name      testPhotosDateSameYearMatrix0089
     * @tc.desc      Compares same-year boundary sample 2029. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0089 begin');
      expect(DateUtil.isTheSameYear(new Date(2029, 0, 1, 0, 0, 0).getTime(), new Date(2029, 11, 31, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_0090
     * @tc.name      testPhotosDateSameYearMatrix0090
     * @tc.desc      Compares same-year boundary sample 2029. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0090 begin');
      expect(DateUtil.isTheSameYear(new Date(2029, 11, 31, 23, 59, 59).getTime(), new Date(2030, 0, 1, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearMatrix0090 end');
    })

  })
}
