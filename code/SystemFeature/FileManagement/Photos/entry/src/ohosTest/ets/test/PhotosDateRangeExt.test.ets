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

const TAG = '[Sample_PhotosDateRangeExtTest]';
const DOMAIN = 0xF811;

export default function PhotosDateRangeExtTest(): void {
  describe('PhotosDateRangeExtTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0001
     * @tc.name      testPhotosDateSameDayExt0001
     * @tc.desc      Compares extended same-day sample 1. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0001 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0002
     * @tc.name      testPhotosDateSameDayExt0002
     * @tc.desc      Compares extended same-day sample 1. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0002 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 1, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0003
     * @tc.name      testPhotosDateSameDayExt0003
     * @tc.desc      Compares extended same-day sample 1. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0003 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 2, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0003 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0004
     * @tc.name      testPhotosDateSameDayExt0004
     * @tc.desc      Compares extended same-day sample 2. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0004 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 2, 0, 0, 0).getTime(), new Date(2023, 1, 2, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0005
     * @tc.name      testPhotosDateSameDayExt0005
     * @tc.desc      Compares extended same-day sample 2. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0005 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 2, 0, 0, 0).getTime(), new Date(2023, 1, 2, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0006
     * @tc.name      testPhotosDateSameDayExt0006
     * @tc.desc      Compares extended same-day sample 2. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0006 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 2, 0, 0, 0).getTime(), new Date(2023, 1, 3, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0006 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0007
     * @tc.name      testPhotosDateSameDayExt0007
     * @tc.desc      Compares extended same-day sample 3. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0007 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 3, 0, 0, 0).getTime(), new Date(2024, 2, 3, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0008
     * @tc.name      testPhotosDateSameDayExt0008
     * @tc.desc      Compares extended same-day sample 3. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0008 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 3, 0, 0, 0).getTime(), new Date(2024, 2, 3, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0009
     * @tc.name      testPhotosDateSameDayExt0009
     * @tc.desc      Compares extended same-day sample 3. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0009 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 3, 0, 0, 0).getTime(), new Date(2024, 2, 4, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0009 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0010
     * @tc.name      testPhotosDateSameDayExt0010
     * @tc.desc      Compares extended same-day sample 4. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0010 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 4, 0, 0, 0).getTime(), new Date(2023, 3, 4, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0011
     * @tc.name      testPhotosDateSameDayExt0011
     * @tc.desc      Compares extended same-day sample 4. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0011 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 4, 0, 0, 0).getTime(), new Date(2023, 3, 4, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0012
     * @tc.name      testPhotosDateSameDayExt0012
     * @tc.desc      Compares extended same-day sample 4. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0012 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 4, 0, 0, 0).getTime(), new Date(2023, 3, 5, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0012 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0013
     * @tc.name      testPhotosDateSameDayExt0013
     * @tc.desc      Compares extended same-day sample 5. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0013 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 5, 0, 0, 0).getTime(), new Date(2024, 4, 5, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0014
     * @tc.name      testPhotosDateSameDayExt0014
     * @tc.desc      Compares extended same-day sample 5. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0014 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 5, 0, 0, 0).getTime(), new Date(2024, 4, 5, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0015
     * @tc.name      testPhotosDateSameDayExt0015
     * @tc.desc      Compares extended same-day sample 5. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0015 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 5, 0, 0, 0).getTime(), new Date(2024, 4, 6, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0016
     * @tc.name      testPhotosDateSameDayExt0016
     * @tc.desc      Compares extended same-day sample 6. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0016 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 6, 0, 0, 0).getTime(), new Date(2023, 5, 6, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0017
     * @tc.name      testPhotosDateSameDayExt0017
     * @tc.desc      Compares extended same-day sample 6. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0017 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 6, 0, 0, 0).getTime(), new Date(2023, 5, 6, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0018
     * @tc.name      testPhotosDateSameDayExt0018
     * @tc.desc      Compares extended same-day sample 6. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0018 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 6, 0, 0, 0).getTime(), new Date(2023, 5, 7, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0018 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0019
     * @tc.name      testPhotosDateSameDayExt0019
     * @tc.desc      Compares extended same-day sample 7. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0019 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 7, 0, 0, 0).getTime(), new Date(2024, 6, 7, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0020
     * @tc.name      testPhotosDateSameDayExt0020
     * @tc.desc      Compares extended same-day sample 7. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0020 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 7, 0, 0, 0).getTime(), new Date(2024, 6, 7, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0021
     * @tc.name      testPhotosDateSameDayExt0021
     * @tc.desc      Compares extended same-day sample 7. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0021 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 7, 0, 0, 0).getTime(), new Date(2024, 6, 8, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0021 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0022
     * @tc.name      testPhotosDateSameDayExt0022
     * @tc.desc      Compares extended same-day sample 8. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0022 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 8, 0, 0, 0).getTime(), new Date(2023, 7, 8, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0023
     * @tc.name      testPhotosDateSameDayExt0023
     * @tc.desc      Compares extended same-day sample 8. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0023 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 8, 0, 0, 0).getTime(), new Date(2023, 7, 8, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0024
     * @tc.name      testPhotosDateSameDayExt0024
     * @tc.desc      Compares extended same-day sample 8. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0024 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 8, 0, 0, 0).getTime(), new Date(2023, 7, 9, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0024 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0025
     * @tc.name      testPhotosDateSameDayExt0025
     * @tc.desc      Compares extended same-day sample 9. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0025 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 9, 0, 0, 0).getTime(), new Date(2024, 8, 9, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0026
     * @tc.name      testPhotosDateSameDayExt0026
     * @tc.desc      Compares extended same-day sample 9. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0026 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 9, 0, 0, 0).getTime(), new Date(2024, 8, 9, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0027
     * @tc.name      testPhotosDateSameDayExt0027
     * @tc.desc      Compares extended same-day sample 9. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0027 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 9, 0, 0, 0).getTime(), new Date(2024, 8, 10, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0027 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0028
     * @tc.name      testPhotosDateSameDayExt0028
     * @tc.desc      Compares extended same-day sample 10. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0028 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 10, 0, 0, 0).getTime(), new Date(2023, 9, 10, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0029
     * @tc.name      testPhotosDateSameDayExt0029
     * @tc.desc      Compares extended same-day sample 10. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0029 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 10, 0, 0, 0).getTime(), new Date(2023, 9, 10, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0030
     * @tc.name      testPhotosDateSameDayExt0030
     * @tc.desc      Compares extended same-day sample 10. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0030 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 10, 0, 0, 0).getTime(), new Date(2023, 9, 11, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0031
     * @tc.name      testPhotosDateSameDayExt0031
     * @tc.desc      Compares extended same-day sample 11. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0031 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 11, 0, 0, 0).getTime(), new Date(2024, 10, 11, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0032
     * @tc.name      testPhotosDateSameDayExt0032
     * @tc.desc      Compares extended same-day sample 11. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0032 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 11, 0, 0, 0).getTime(), new Date(2024, 10, 11, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0033
     * @tc.name      testPhotosDateSameDayExt0033
     * @tc.desc      Compares extended same-day sample 11. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0033 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 11, 0, 0, 0).getTime(), new Date(2024, 10, 12, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0033 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0034
     * @tc.name      testPhotosDateSameDayExt0034
     * @tc.desc      Compares extended same-day sample 12. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0034 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 12, 0, 0, 0).getTime(), new Date(2023, 11, 12, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0035
     * @tc.name      testPhotosDateSameDayExt0035
     * @tc.desc      Compares extended same-day sample 12. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0035 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 12, 0, 0, 0).getTime(), new Date(2023, 11, 12, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0036
     * @tc.name      testPhotosDateSameDayExt0036
     * @tc.desc      Compares extended same-day sample 12. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0036 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 12, 0, 0, 0).getTime(), new Date(2023, 11, 13, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0036 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0037
     * @tc.name      testPhotosDateSameDayExt0037
     * @tc.desc      Compares extended same-day sample 13. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0037 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 13, 0, 0, 0).getTime(), new Date(2024, 0, 13, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0038
     * @tc.name      testPhotosDateSameDayExt0038
     * @tc.desc      Compares extended same-day sample 13. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0038 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 13, 0, 0, 0).getTime(), new Date(2024, 0, 13, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0039
     * @tc.name      testPhotosDateSameDayExt0039
     * @tc.desc      Compares extended same-day sample 13. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0039 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 13, 0, 0, 0).getTime(), new Date(2024, 0, 14, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0039 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0040
     * @tc.name      testPhotosDateSameDayExt0040
     * @tc.desc      Compares extended same-day sample 14. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0040 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 14, 0, 0, 0).getTime(), new Date(2023, 1, 14, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0041
     * @tc.name      testPhotosDateSameDayExt0041
     * @tc.desc      Compares extended same-day sample 14. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0041 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 14, 0, 0, 0).getTime(), new Date(2023, 1, 14, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0042
     * @tc.name      testPhotosDateSameDayExt0042
     * @tc.desc      Compares extended same-day sample 14. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0042 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 14, 0, 0, 0).getTime(), new Date(2023, 1, 15, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0042 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0043
     * @tc.name      testPhotosDateSameDayExt0043
     * @tc.desc      Compares extended same-day sample 15. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0043 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 15, 0, 0, 0).getTime(), new Date(2024, 2, 15, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0044
     * @tc.name      testPhotosDateSameDayExt0044
     * @tc.desc      Compares extended same-day sample 15. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0044 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 15, 0, 0, 0).getTime(), new Date(2024, 2, 15, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0045
     * @tc.name      testPhotosDateSameDayExt0045
     * @tc.desc      Compares extended same-day sample 15. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0045 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 15, 0, 0, 0).getTime(), new Date(2024, 2, 16, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0046
     * @tc.name      testPhotosDateSameDayExt0046
     * @tc.desc      Compares extended same-day sample 16. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0046 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 16, 0, 0, 0).getTime(), new Date(2023, 3, 16, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0047
     * @tc.name      testPhotosDateSameDayExt0047
     * @tc.desc      Compares extended same-day sample 16. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0047 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 16, 0, 0, 0).getTime(), new Date(2023, 3, 16, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0048
     * @tc.name      testPhotosDateSameDayExt0048
     * @tc.desc      Compares extended same-day sample 16. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0048 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 16, 0, 0, 0).getTime(), new Date(2023, 3, 17, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0048 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0049
     * @tc.name      testPhotosDateSameDayExt0049
     * @tc.desc      Compares extended same-day sample 17. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0049 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 17, 0, 0, 0).getTime(), new Date(2024, 4, 17, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0050
     * @tc.name      testPhotosDateSameDayExt0050
     * @tc.desc      Compares extended same-day sample 17. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0050 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 17, 0, 0, 0).getTime(), new Date(2024, 4, 17, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0051
     * @tc.name      testPhotosDateSameDayExt0051
     * @tc.desc      Compares extended same-day sample 17. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0051 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 17, 0, 0, 0).getTime(), new Date(2024, 4, 18, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0051 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0052
     * @tc.name      testPhotosDateSameDayExt0052
     * @tc.desc      Compares extended same-day sample 18. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0052 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 18, 0, 0, 0).getTime(), new Date(2023, 5, 18, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0053
     * @tc.name      testPhotosDateSameDayExt0053
     * @tc.desc      Compares extended same-day sample 18. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0053 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 18, 0, 0, 0).getTime(), new Date(2023, 5, 18, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0054
     * @tc.name      testPhotosDateSameDayExt0054
     * @tc.desc      Compares extended same-day sample 18. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0054 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 18, 0, 0, 0).getTime(), new Date(2023, 5, 19, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0054 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0055
     * @tc.name      testPhotosDateSameDayExt0055
     * @tc.desc      Compares extended same-day sample 19. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0055 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 19, 0, 0, 0).getTime(), new Date(2024, 6, 19, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0056
     * @tc.name      testPhotosDateSameDayExt0056
     * @tc.desc      Compares extended same-day sample 19. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0056 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 19, 0, 0, 0).getTime(), new Date(2024, 6, 19, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0057
     * @tc.name      testPhotosDateSameDayExt0057
     * @tc.desc      Compares extended same-day sample 19. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0057 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 19, 0, 0, 0).getTime(), new Date(2024, 6, 20, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0057 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0058
     * @tc.name      testPhotosDateSameDayExt0058
     * @tc.desc      Compares extended same-day sample 20. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0058 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 20, 0, 0, 0).getTime(), new Date(2023, 7, 20, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0059
     * @tc.name      testPhotosDateSameDayExt0059
     * @tc.desc      Compares extended same-day sample 20. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0059 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 20, 0, 0, 0).getTime(), new Date(2023, 7, 20, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0060
     * @tc.name      testPhotosDateSameDayExt0060
     * @tc.desc      Compares extended same-day sample 20. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0060 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 20, 0, 0, 0).getTime(), new Date(2023, 7, 21, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0061
     * @tc.name      testPhotosDateSameDayExt0061
     * @tc.desc      Compares extended same-day sample 21. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0061 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 21, 0, 0, 0).getTime(), new Date(2024, 8, 21, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0062
     * @tc.name      testPhotosDateSameDayExt0062
     * @tc.desc      Compares extended same-day sample 21. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0062 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 21, 0, 0, 0).getTime(), new Date(2024, 8, 21, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0063
     * @tc.name      testPhotosDateSameDayExt0063
     * @tc.desc      Compares extended same-day sample 21. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0063 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 21, 0, 0, 0).getTime(), new Date(2024, 8, 22, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0063 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0064
     * @tc.name      testPhotosDateSameDayExt0064
     * @tc.desc      Compares extended same-day sample 22. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0064 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 22, 0, 0, 0).getTime(), new Date(2023, 9, 22, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0065
     * @tc.name      testPhotosDateSameDayExt0065
     * @tc.desc      Compares extended same-day sample 22. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0065 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 22, 0, 0, 0).getTime(), new Date(2023, 9, 22, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0066
     * @tc.name      testPhotosDateSameDayExt0066
     * @tc.desc      Compares extended same-day sample 22. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0066 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 22, 0, 0, 0).getTime(), new Date(2023, 9, 23, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0066 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0067
     * @tc.name      testPhotosDateSameDayExt0067
     * @tc.desc      Compares extended same-day sample 23. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0067 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 23, 0, 0, 0).getTime(), new Date(2024, 10, 23, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0068
     * @tc.name      testPhotosDateSameDayExt0068
     * @tc.desc      Compares extended same-day sample 23. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0068 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 23, 0, 0, 0).getTime(), new Date(2024, 10, 23, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0069
     * @tc.name      testPhotosDateSameDayExt0069
     * @tc.desc      Compares extended same-day sample 23. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0069 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 23, 0, 0, 0).getTime(), new Date(2024, 10, 24, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0069 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0070
     * @tc.name      testPhotosDateSameDayExt0070
     * @tc.desc      Compares extended same-day sample 24. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0070 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 24, 0, 0, 0).getTime(), new Date(2023, 11, 24, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0071
     * @tc.name      testPhotosDateSameDayExt0071
     * @tc.desc      Compares extended same-day sample 24. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0071 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 24, 0, 0, 0).getTime(), new Date(2023, 11, 24, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0072
     * @tc.name      testPhotosDateSameDayExt0072
     * @tc.desc      Compares extended same-day sample 24. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0072 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 24, 0, 0, 0).getTime(), new Date(2023, 11, 25, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0072 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0073
     * @tc.name      testPhotosDateSameDayExt0073
     * @tc.desc      Compares extended same-day sample 25. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0073 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 25, 0, 0, 0).getTime(), new Date(2024, 0, 25, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0074
     * @tc.name      testPhotosDateSameDayExt0074
     * @tc.desc      Compares extended same-day sample 25. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0074 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 25, 0, 0, 0).getTime(), new Date(2024, 0, 25, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0075
     * @tc.name      testPhotosDateSameDayExt0075
     * @tc.desc      Compares extended same-day sample 25. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0075 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 25, 0, 0, 0).getTime(), new Date(2024, 0, 26, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0075 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0076
     * @tc.name      testPhotosDateSameDayExt0076
     * @tc.desc      Compares extended same-day sample 26. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0076 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 26, 0, 0, 0).getTime(), new Date(2023, 1, 26, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0077
     * @tc.name      testPhotosDateSameDayExt0077
     * @tc.desc      Compares extended same-day sample 26. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0077 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 26, 0, 0, 0).getTime(), new Date(2023, 1, 26, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0078
     * @tc.name      testPhotosDateSameDayExt0078
     * @tc.desc      Compares extended same-day sample 26. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0078 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 26, 0, 0, 0).getTime(), new Date(2023, 1, 27, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0078 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0079
     * @tc.name      testPhotosDateSameDayExt0079
     * @tc.desc      Compares extended same-day sample 27. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0079 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 27, 0, 0, 0).getTime(), new Date(2024, 2, 27, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0080
     * @tc.name      testPhotosDateSameDayExt0080
     * @tc.desc      Compares extended same-day sample 27. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0080 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 27, 0, 0, 0).getTime(), new Date(2024, 2, 27, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0081
     * @tc.name      testPhotosDateSameDayExt0081
     * @tc.desc      Compares extended same-day sample 27. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0081 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 27, 0, 0, 0).getTime(), new Date(2024, 2, 28, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0081 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0082
     * @tc.name      testPhotosDateSameDayExt0082
     * @tc.desc      Compares extended same-day sample 28. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0082 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 1, 0, 0, 0).getTime(), new Date(2023, 3, 1, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0083
     * @tc.name      testPhotosDateSameDayExt0083
     * @tc.desc      Compares extended same-day sample 28. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0083 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 1, 0, 0, 0).getTime(), new Date(2023, 3, 1, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0084
     * @tc.name      testPhotosDateSameDayExt0084
     * @tc.desc      Compares extended same-day sample 28. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0084 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 1, 0, 0, 0).getTime(), new Date(2023, 3, 2, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0084 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0085
     * @tc.name      testPhotosDateSameDayExt0085
     * @tc.desc      Compares extended same-day sample 29. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0085 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 2, 0, 0, 0).getTime(), new Date(2024, 4, 2, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0086
     * @tc.name      testPhotosDateSameDayExt0086
     * @tc.desc      Compares extended same-day sample 29. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0086 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 2, 0, 0, 0).getTime(), new Date(2024, 4, 2, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0087
     * @tc.name      testPhotosDateSameDayExt0087
     * @tc.desc      Compares extended same-day sample 29. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0087 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 2, 0, 0, 0).getTime(), new Date(2024, 4, 3, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0087 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0088
     * @tc.name      testPhotosDateSameDayExt0088
     * @tc.desc      Compares extended same-day sample 30. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0088 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 3, 0, 0, 0).getTime(), new Date(2023, 5, 3, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0089
     * @tc.name      testPhotosDateSameDayExt0089
     * @tc.desc      Compares extended same-day sample 30. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0089 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 3, 0, 0, 0).getTime(), new Date(2023, 5, 3, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0090
     * @tc.name      testPhotosDateSameDayExt0090
     * @tc.desc      Compares extended same-day sample 30. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0090 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 3, 0, 0, 0).getTime(), new Date(2023, 5, 4, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0090 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0091
     * @tc.name      testPhotosDateSameDayExt0091
     * @tc.desc      Compares extended same-day sample 31. case 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0091 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 4, 0, 0, 0).getTime(), new Date(2024, 6, 4, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0092
     * @tc.name      testPhotosDateSameDayExt0092
     * @tc.desc      Compares extended same-day sample 31. case 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0092 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 4, 0, 0, 0).getTime(), new Date(2024, 6, 4, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0093
     * @tc.name      testPhotosDateSameDayExt0093
     * @tc.desc      Compares extended same-day sample 31. case 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0093 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 4, 0, 0, 0).getTime(), new Date(2024, 6, 5, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0093 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0094
     * @tc.name      testPhotosDateSameDayExt0094
     * @tc.desc      Compares extended same-day sample 32. case 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0094 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 5, 0, 0, 0).getTime(), new Date(2023, 7, 5, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0095
     * @tc.name      testPhotosDateSameDayExt0095
     * @tc.desc      Compares extended same-day sample 32. case 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0095 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 5, 0, 0, 0).getTime(), new Date(2023, 7, 5, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0096
     * @tc.name      testPhotosDateSameDayExt0096
     * @tc.desc      Compares extended same-day sample 32. case 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0096 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 5, 0, 0, 0).getTime(), new Date(2023, 7, 6, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0096 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0097
     * @tc.name      testPhotosDateSameDayExt0097
     * @tc.desc      Compares extended same-day sample 33. case 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0097 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 6, 0, 0, 0).getTime(), new Date(2024, 8, 6, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0098
     * @tc.name      testPhotosDateSameDayExt0098
     * @tc.desc      Compares extended same-day sample 33. case 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0098 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 6, 0, 0, 0).getTime(), new Date(2024, 8, 6, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0099
     * @tc.name      testPhotosDateSameDayExt0099
     * @tc.desc      Compares extended same-day sample 33. case 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0099 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 6, 0, 0, 0).getTime(), new Date(2024, 8, 7, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0099 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0100
     * @tc.name      testPhotosDateSameDayExt0100
     * @tc.desc      Compares extended same-day sample 34. case 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0100 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 7, 0, 0, 0).getTime(), new Date(2023, 9, 7, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0101
     * @tc.name      testPhotosDateSameDayExt0101
     * @tc.desc      Compares extended same-day sample 34. case 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0101 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 7, 0, 0, 0).getTime(), new Date(2023, 9, 7, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0102
     * @tc.name      testPhotosDateSameDayExt0102
     * @tc.desc      Compares extended same-day sample 34. case 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0102 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 7, 0, 0, 0).getTime(), new Date(2023, 9, 8, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0102 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0103
     * @tc.name      testPhotosDateSameDayExt0103
     * @tc.desc      Compares extended same-day sample 35. case 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0103 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 8, 0, 0, 0).getTime(), new Date(2024, 10, 8, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0104
     * @tc.name      testPhotosDateSameDayExt0104
     * @tc.desc      Compares extended same-day sample 35. case 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0104 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 8, 0, 0, 0).getTime(), new Date(2024, 10, 8, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0105
     * @tc.name      testPhotosDateSameDayExt0105
     * @tc.desc      Compares extended same-day sample 35. case 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0105 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 8, 0, 0, 0).getTime(), new Date(2024, 10, 9, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0105 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0106
     * @tc.name      testPhotosDateSameDayExt0106
     * @tc.desc      Compares extended same-day sample 36. case 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0106 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 9, 0, 0, 0).getTime(), new Date(2023, 11, 9, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0107
     * @tc.name      testPhotosDateSameDayExt0107
     * @tc.desc      Compares extended same-day sample 36. case 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0107 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 9, 0, 0, 0).getTime(), new Date(2023, 11, 9, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0108
     * @tc.name      testPhotosDateSameDayExt0108
     * @tc.desc      Compares extended same-day sample 36. case 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0108 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 9, 0, 0, 0).getTime(), new Date(2023, 11, 10, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0108 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0109
     * @tc.name      testPhotosDateSameDayExt0109
     * @tc.desc      Compares extended same-day sample 37. case 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0109 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 10, 0, 0, 0).getTime(), new Date(2024, 0, 10, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0110
     * @tc.name      testPhotosDateSameDayExt0110
     * @tc.desc      Compares extended same-day sample 37. case 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0110 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 10, 0, 0, 0).getTime(), new Date(2024, 0, 10, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0111
     * @tc.name      testPhotosDateSameDayExt0111
     * @tc.desc      Compares extended same-day sample 37. case 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0111 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 10, 0, 0, 0).getTime(), new Date(2024, 0, 11, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0111 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0112
     * @tc.name      testPhotosDateSameDayExt0112
     * @tc.desc      Compares extended same-day sample 38. case 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0112 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 11, 0, 0, 0).getTime(), new Date(2023, 1, 11, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0113
     * @tc.name      testPhotosDateSameDayExt0113
     * @tc.desc      Compares extended same-day sample 38. case 113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0113 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 11, 0, 0, 0).getTime(), new Date(2023, 1, 11, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0114
     * @tc.name      testPhotosDateSameDayExt0114
     * @tc.desc      Compares extended same-day sample 38. case 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0114 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 11, 0, 0, 0).getTime(), new Date(2023, 1, 12, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0114 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0115
     * @tc.name      testPhotosDateSameDayExt0115
     * @tc.desc      Compares extended same-day sample 39. case 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0115 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 12, 0, 0, 0).getTime(), new Date(2024, 2, 12, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0116
     * @tc.name      testPhotosDateSameDayExt0116
     * @tc.desc      Compares extended same-day sample 39. case 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0116 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 12, 0, 0, 0).getTime(), new Date(2024, 2, 12, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0117
     * @tc.name      testPhotosDateSameDayExt0117
     * @tc.desc      Compares extended same-day sample 39. case 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0117 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 12, 0, 0, 0).getTime(), new Date(2024, 2, 13, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0117 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0118
     * @tc.name      testPhotosDateSameDayExt0118
     * @tc.desc      Compares extended same-day sample 40. case 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0118 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 13, 0, 0, 0).getTime(), new Date(2023, 3, 13, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0119
     * @tc.name      testPhotosDateSameDayExt0119
     * @tc.desc      Compares extended same-day sample 40. case 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0119 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 13, 0, 0, 0).getTime(), new Date(2023, 3, 13, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0120
     * @tc.name      testPhotosDateSameDayExt0120
     * @tc.desc      Compares extended same-day sample 40. case 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0120 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 13, 0, 0, 0).getTime(), new Date(2023, 3, 14, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0120 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0121
     * @tc.name      testPhotosDateSameDayExt0121
     * @tc.desc      Compares extended same-day sample 41. case 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0121 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 14, 0, 0, 0).getTime(), new Date(2024, 4, 14, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0122
     * @tc.name      testPhotosDateSameDayExt0122
     * @tc.desc      Compares extended same-day sample 41. case 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0122 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 14, 0, 0, 0).getTime(), new Date(2024, 4, 14, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0123
     * @tc.name      testPhotosDateSameDayExt0123
     * @tc.desc      Compares extended same-day sample 41. case 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0123 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 14, 0, 0, 0).getTime(), new Date(2024, 4, 15, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0123 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0124
     * @tc.name      testPhotosDateSameDayExt0124
     * @tc.desc      Compares extended same-day sample 42. case 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0124 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 15, 0, 0, 0).getTime(), new Date(2023, 5, 15, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0125
     * @tc.name      testPhotosDateSameDayExt0125
     * @tc.desc      Compares extended same-day sample 42. case 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0125 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 15, 0, 0, 0).getTime(), new Date(2023, 5, 15, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0126
     * @tc.name      testPhotosDateSameDayExt0126
     * @tc.desc      Compares extended same-day sample 42. case 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0126 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 15, 0, 0, 0).getTime(), new Date(2023, 5, 16, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0126 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0127
     * @tc.name      testPhotosDateSameDayExt0127
     * @tc.desc      Compares extended same-day sample 43. case 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0127 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 16, 0, 0, 0).getTime(), new Date(2024, 6, 16, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0128
     * @tc.name      testPhotosDateSameDayExt0128
     * @tc.desc      Compares extended same-day sample 43. case 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0128 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 16, 0, 0, 0).getTime(), new Date(2024, 6, 16, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0129
     * @tc.name      testPhotosDateSameDayExt0129
     * @tc.desc      Compares extended same-day sample 43. case 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0129 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 16, 0, 0, 0).getTime(), new Date(2024, 6, 17, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0129 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0130
     * @tc.name      testPhotosDateSameDayExt0130
     * @tc.desc      Compares extended same-day sample 44. case 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0130 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 17, 0, 0, 0).getTime(), new Date(2023, 7, 17, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0131
     * @tc.name      testPhotosDateSameDayExt0131
     * @tc.desc      Compares extended same-day sample 44. case 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0131 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 17, 0, 0, 0).getTime(), new Date(2023, 7, 17, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0132
     * @tc.name      testPhotosDateSameDayExt0132
     * @tc.desc      Compares extended same-day sample 44. case 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0132 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 17, 0, 0, 0).getTime(), new Date(2023, 7, 18, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0132 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0133
     * @tc.name      testPhotosDateSameDayExt0133
     * @tc.desc      Compares extended same-day sample 45. case 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0133 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 18, 0, 0, 0).getTime(), new Date(2024, 8, 18, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0134
     * @tc.name      testPhotosDateSameDayExt0134
     * @tc.desc      Compares extended same-day sample 45. case 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0134 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 18, 0, 0, 0).getTime(), new Date(2024, 8, 18, 23, 59, 59).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0135
     * @tc.name      testPhotosDateSameDayExt0135
     * @tc.desc      Compares extended same-day sample 45. case 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0135 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 18, 0, 0, 0).getTime(), new Date(2024, 8, 19, 0, 0, 0).getTime())).assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0135 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0136
     * @tc.name      testPhotosDateSameDayExt0136
     * @tc.desc      Compares extended same-day sample 46. case 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0136 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 19, 0, 0, 0).getTime(), new Date(2023, 9, 19, 0, 0, 0).getTime())).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0137
     * @tc.name      testPhotosDateSameDayExt0137
